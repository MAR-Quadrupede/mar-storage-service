# M.A.R. Storage Service (`mar-storage-service`)

**Local On-Edge Persistence & Object Storage Stack for M.A.R. (Multi-legged Autonomous Robot)**  
Deployato direttamente on-edge su Raspberry Pi 5 all'interno del cluster Kubernetes K3s (namespace `mar-system`).

---

## 1. Architettura & Componenti

Questo microservizio raggruppa e orchestra i tre motori di persistenza locali necessari al robot, eliminando qualsiasi dipendenza da cloud esterni o server remoti:

| Componente | Motore & Versione | Porta Interna | Ruolo nel Sistema M.A.R. |
| :--- | :--- | :--- | :--- |
| **PostgreSQL** | `postgres:17-alpine` | `5432` | Database relazionale primario per utenti, sessioni, stream video, log comandi FSM e impostazioni di sistema. Pre-caricato con tutti i dati migrati dai DB storici. |
| **Redis** | `redis:7-alpine` | `6379` | Cache in-memory e message broker ad alta frequenza per lock di controllo operatore, rate-limiting e stati FSM. |
| **MinIO S3** | `alpine/minio:latest-release` | `9000` (API) / `9001` (Web Console) | Object Storage S3 compatibile per snapshot ad alta risoluzione delle telecamere stereo, pointcloud LiDAR e pesi neurali YOLO. |

---

## 2. Dettagli di Connessione Interna (K3s DNS)

Tutti i microservizi M.A.R. all'interno del cluster comunicano tramite CoreDNS:

### 2.1 PostgreSQL
- **Host**: `mar-postgres` (oppure `mar-postgres.mar-system.svc.cluster.local`)
- **Porta**: `5432`
- **Database**: `mar_db` (DB secondario: `authelia_db`)
- **Utente**: `mar_user`
- **Password**: Gestita tramite Kubernetes Secret (`mar-storage-secrets`) o variabile d'ambiente `.env` (`POSTGRES_PASSWORD`).
- **Connection String**:
  ```text
  postgresql://mar_user:<POSTGRES_PASSWORD>@mar-postgres:5432/mar_db?sslmode=disable
  ```

### 2.2 Redis
- **Host**: `mar-redis` (oppure `mar-redis.mar-system.svc.cluster.local`)
- **Porta**: `6379`
- **URL di Connessione**:
  ```text
  redis://mar-redis:6379
  ```

### 2.3 MinIO S3
- **S3 API Endpoint**: `http://mar-s3:9000` (alias `http://mar-minio:9000`)
- **Console Web Endpoint**: `http://mar-s3:9001` (esposto anche via NodePort `30901` e reverse proxy SSO `https://mar-s3.gianlucamorello.it`)
- **Root User / Access Key**: `mar_admin` (o valore configurato in `MINIO_ROOT_USER`)
- **Root Password / Secret Key**: Gestita tramite Kubernetes Secret (`mar-storage-secrets`) o variabile d'ambiente `.env` (`MINIO_ROOT_PASSWORD`).
- **Default Bucket**: `mar-storage`

---

## 3. Persistenza su Disco Fisico (RPi 5)

I dati dei container persistono su filesystem locale in `/var/lib/mar-data/`:
- `/var/lib/mar-data/postgres`: Directory `PGDATA` di PostgreSQL 17.
- `/var/lib/mar-data/redis`: Snapshot RDB e journal append-only AOF di Redis.
- `/var/lib/mar-data/minio`: Bucket e oggetti S3 di MinIO.

---

## 4. CI/CD On-Edge

Il repository è agganciato al runner self-hosted GitHub Actions attivo su Raspberry Pi 5 (`rpi5-mar-storage-service`). Ogni commit sul branch `main` applica i manifest dichiarativi ed effettua il rollout a zero downtime.
