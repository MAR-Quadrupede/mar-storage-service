--
-- PostgreSQL database dump
--


-- Dumped from database version 17.11 (0bfbbeb)
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public."Session" DROP CONSTRAINT IF EXISTS "Session_userId_fkey";
DROP INDEX IF EXISTS public."User_username_key";
DROP INDEX IF EXISTS public."SystemSetting_key_key";
DROP INDEX IF EXISTS public."Session_token_key";
ALTER TABLE IF EXISTS ONLY public._prisma_migrations DROP CONSTRAINT IF EXISTS _prisma_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public."VideoStream" DROP CONSTRAINT IF EXISTS "VideoStream_pkey";
ALTER TABLE IF EXISTS ONLY public."User" DROP CONSTRAINT IF EXISTS "User_pkey";
ALTER TABLE IF EXISTS ONLY public."SystemSetting" DROP CONSTRAINT IF EXISTS "SystemSetting_pkey";
ALTER TABLE IF EXISTS ONLY public."Session" DROP CONSTRAINT IF EXISTS "Session_pkey";
ALTER TABLE IF EXISTS ONLY public."SensorReading" DROP CONSTRAINT IF EXISTS "SensorReading_pkey";
ALTER TABLE IF EXISTS ONLY public."RoverState" DROP CONSTRAINT IF EXISTS "RoverState_pkey";
ALTER TABLE IF EXISTS ONLY public."Command" DROP CONSTRAINT IF EXISTS "Command_pkey";
DROP TABLE IF EXISTS public._prisma_migrations;
DROP TABLE IF EXISTS public."VideoStream";
DROP TABLE IF EXISTS public."User";
DROP TABLE IF EXISTS public."SystemSetting";
DROP TABLE IF EXISTS public."Session";
DROP TABLE IF EXISTS public."SensorReading";
DROP TABLE IF EXISTS public."RoverState";
DROP TABLE IF EXISTS public."Command";
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: mar_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO mar_user;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: mar_user
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Command; Type: TABLE; Schema: public; Owner: mar_user
--

CREATE TABLE public."Command" (
    id text NOT NULL,
    command text NOT NULL,
    speed double precision,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "userId" text
);


ALTER TABLE public."Command" OWNER TO mar_user;

--
-- Name: RoverState; Type: TABLE; Schema: public; Owner: mar_user
--

CREATE TABLE public."RoverState" (
    id text NOT NULL,
    "batteryLevel" double precision NOT NULL,
    "positionLat" double precision NOT NULL,
    "positionLon" double precision NOT NULL,
    connectivity text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."RoverState" OWNER TO mar_user;

--
-- Name: SensorReading; Type: TABLE; Schema: public; Owner: mar_user
--

CREATE TABLE public."SensorReading" (
    id text NOT NULL,
    "distanceMeters" double precision NOT NULL,
    "lidarPoints" integer NOT NULL,
    "radarContacts" integer NOT NULL,
    temperature double precision NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."SensorReading" OWNER TO mar_user;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: mar_user
--

CREATE TABLE public."Session" (
    id text NOT NULL,
    token text NOT NULL,
    "userId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Session" OWNER TO mar_user;

--
-- Name: SystemSetting; Type: TABLE; Schema: public; Owner: mar_user
--

CREATE TABLE public."SystemSetting" (
    id text NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SystemSetting" OWNER TO mar_user;

--
-- Name: User; Type: TABLE; Schema: public; Owner: mar_user
--

CREATE TABLE public."User" (
    id text NOT NULL,
    username text NOT NULL,
    "passwordHash" text NOT NULL,
    "isAdmin" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."User" OWNER TO mar_user;

--
-- Name: VideoStream; Type: TABLE; Schema: public; Owner: mar_user
--

CREATE TABLE public."VideoStream" (
    id text NOT NULL,
    name text NOT NULL,
    url text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."VideoStream" OWNER TO mar_user;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: mar_user
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO mar_user;

--
-- Data for Name: Command; Type: TABLE DATA; Schema: public; Owner: mar_user
--

COPY public."Command" (id, command, speed, "createdAt", "userId") FROM stdin;
cmm28dzhi0001jqbeek0afbfi	rotate-left	0.35	2026-02-25 16:10:43.302	\N
cmm28dz6t0000jqbekb0khiuo	rotate-right	0.35	2026-02-25 16:10:42.918	\N
cmm28dzt40002jqbep2ncfkha	rotate-right	0.35	2026-02-25 16:10:43.72	\N
cmm28hb9200001172ocgkhbet	forward	0	2026-02-25 16:13:18.518	\N
cmm28hbsq00011172glsl86wc	left	0	2026-02-25 16:13:18.626	\N
cmm28hbxs000211728slijkng	back	0	2026-02-25 16:13:19.408	\N
cmm28hbzm00031172kewtyxth	rotate-right	0	2026-02-25 16:13:19.474	\N
cmm28hc1j00041172q0q559d0	right	0	2026-02-25 16:13:19.544	\N
cmm28hchv00051172yhzdg7dt	rotate-left	0	2026-02-25 16:13:19.566	\N
cmm28j6p400061172hsyb4rip	rotate-right	0.5	2026-02-25 16:14:45.834	\N
cmm28j6px0000ycijecfq6aur	rotate-right	0.5	2026-02-25 16:14:45.861	\N
cmmw7c53f0000gijpx8zt8yn6	rotate-right	0.35	2026-03-18 15:34:22.923	\N
cmmw7c5qt0001gijpmnrhgv5t	back	0.35	2026-03-18 15:34:23.765	\N
cmmw7c6dr0002gijpxyyivjo7	right	0.35	2026-03-18 15:34:24.591	\N
cmmw7c77a0003gijpwpby4w12	rotate-left	0.35	2026-03-18 15:34:25.654	\N
0dd5e20e-6c9f-43cf-8f8e-a14456bc2d49	FORWARD	50	2026-05-20 15:48:02.057	\N
e1b1ade9-f32b-49d3-b3c4-c890e587a4f8	BACKWARD	50	2026-05-20 15:48:04.797	\N
d4459e71-fa69-451d-8850-c584d5656d62	BACKWARD	50	2026-05-20 15:48:07.007	\N
b1fb5cb1-5ffb-4265-85d2-528dbd1b68f2	LEFT	50	2026-05-20 15:48:08.177	\N
46dcafda-556e-4739-b13a-ef7a07e17f3a	BACKWARD	50	2026-05-20 15:48:09.166	\N
5778cfa1-62e2-462b-860d-abd52b223793	RIGHT	50	2026-05-20 15:48:10.084	\N
49dbf45c-3b94-4b46-89f8-1fa6ff51fde3	STOP	\N	2026-05-20 15:48:10.734	\N
87aad40f-060e-4ae1-9737-146cf24d5938	EMERGENCY_STOP	\N	2026-05-20 15:48:14.047	\N
4a4fc5b8-05d5-416c-ae03-ad0a0ded01e8	STOP	\N	2026-05-20 15:48:29.195	\N
cmv8kuf7u0000pcam535xus7q	FORWARD	65	2026-10-14 20:43:23.658	\N
cmv8kzv9i0000zswoncvbhkqc	EMERGENCY_STOP	\N	2026-10-14 20:47:37.734	\N
cmv8ludmv0000u8eyazelptlc	FORWARD	65	2026-10-14 21:11:21.195	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmv8lw1rz0001u8eybw4s7t2m	CMD:FORWARD	50	2026-10-14 21:12:39.168	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmv8lw2a30002u8eynnidfpon	CMD:TURN_L	50	2026-10-14 21:12:39.819	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmv8lw3ek0003u8ey22950zcj	CMD:TURN_R	50	2026-10-14 21:12:41.277	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmv8lw3sy0004u8eyq12yfguw	CMD:BACKWARD	50	2026-10-14 21:12:41.795	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmv8lw53w0005u8eyht6lwjqv	CMD:TROT	50	2026-10-14 21:12:43.484	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwqoq600003wyhjz6m0ypd	CMD:FORWARD	50	2026-10-29 18:59:34.446	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwqrgo00013wyh0e8umik2	CMD:FORWARD	50	2026-10-29 18:59:37.991	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwqs5y00023wyhxkdjqxz1	CMD:FORWARD	50	2026-10-29 18:59:38.903	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwqu1h00033wyh7pnfklh7	CMD:SIT	50	2026-10-29 18:59:41.333	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwquq300043wyh7f73kcvj	CMD:STAND	50	2026-10-29 18:59:42.19	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwqvnq00053wyh12lpwr8g	CMD:TROT	50	2026-10-29 18:59:43.428	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwr0az00063wyheg63jb63	CMD:FORWARD	50	2026-10-29 18:59:49.451	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwr6kj00073wyh8a9yxr1i	CMD:FORWARD	50	2026-10-29 18:59:57.571	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwr6of00083wyhjov273mo	CMD:FORWARD	50	2026-10-29 18:59:57.711	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwr6ss00093wyhu0w5wg2l	CMD:FORWARD	50	2026-10-29 18:59:57.868	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwr6y9000a3wyh559kpgfy	CMD:FORWARD	50	2026-10-29 18:59:58.065	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvtwr72i000b3wyhfnteplmm	CMD:FORWARD	50	2026-10-29 18:59:58.219	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy2slt1000014ihif0y3hum	CMD:FORWARD	50	2026-11-01 17:00:06.374	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy2so82000114ihylla3os5	CMD:FORWARD	50	2026-11-01 17:00:09.507	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy37z0h000214ihdjdmx9kj	CMD:GAIT_WALK	50	2026-11-01 17:12:03.329	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy37zdk000314ih4t8yn1db	CMD:GAIT_TROT	50	2026-11-01 17:12:03.8	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy37zt8000414ih743n4zen	CMD:GAIT_STAND	50	2026-11-01 17:12:04.364	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy3805u000514ihqzafyt6b	CMD:GAIT_TROT	50	2026-11-01 17:12:04.819	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy380mh000614ihhnqjcw65	CMD:GAIT_WALK	50	2026-11-01 17:12:05.417	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy3811i000714ih10jggdmd	CMD:GAIT_STAND	50	2026-11-01 17:12:05.932	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
cmvy381rk000814ihjyf2p3wb	CMD:GAIT_WALK	50	2026-11-01 17:12:06.897	94b1d8c0-603e-416f-9e39-d81ac8f0ce13
\.


--
-- Data for Name: RoverState; Type: TABLE DATA; Schema: public; Owner: mar_user
--

COPY public."RoverState" (id, "batteryLevel", "positionLat", "positionLon", connectivity, "createdAt") FROM stdin;
\.


--
-- Data for Name: SensorReading; Type: TABLE DATA; Schema: public; Owner: mar_user
--

COPY public."SensorReading" (id, "distanceMeters", "lidarPoints", "radarContacts", temperature, "createdAt") FROM stdin;
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: mar_user
--

COPY public."Session" (id, token, "userId", "createdAt", "expiresAt") FROM stdin;
\.


--
-- Data for Name: SystemSetting; Type: TABLE DATA; Schema: public; Owner: mar_user
--

COPY public."SystemSetting" (id, key, value, "updatedAt") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: mar_user
--

COPY public."User" (id, username, "passwordHash", "isAdmin", "createdAt") FROM stdin;
94b1d8c0-603e-416f-9e39-d81ac8f0ce13	admin	$2a$10$wT8m9Qz9UuF9Z1X2Y3Z4AO7H6uY6aB5c4d3e2f1g0h9i8j7k6l5m.	t	2026-05-20 14:29:43.056
\.


--
-- Data for Name: VideoStream; Type: TABLE DATA; Schema: public; Owner: mar_user
--

COPY public."VideoStream" (id, name, url, active, "createdAt") FROM stdin;
656c1a17-fb10-4882-bb75-6fff1c636361	Left	/api/video/left	t	2026-05-20 15:39:25.212
c6669806-6af3-457a-a02c-9c473fa90365	Right	/api/video/right	t	2026-05-20 15:39:53.048
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: mar_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
d1552720-30cc-4992-b5e1-f852377997af	54a0b77322968102e5f27271ed38cc418429b5bb8c62686b4e17cf8b04daf4ca	2025-12-19 21:28:49.078638+00	20251219212848_switch_to_username_and_admin	\N	\N	2025-12-19 21:28:48.882791+00	1
\.


--
-- Name: Command Command_pkey; Type: CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public."Command"
    ADD CONSTRAINT "Command_pkey" PRIMARY KEY (id);


--
-- Name: RoverState RoverState_pkey; Type: CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public."RoverState"
    ADD CONSTRAINT "RoverState_pkey" PRIMARY KEY (id);


--
-- Name: SensorReading SensorReading_pkey; Type: CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public."SensorReading"
    ADD CONSTRAINT "SensorReading_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: SystemSetting SystemSetting_pkey; Type: CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public."SystemSetting"
    ADD CONSTRAINT "SystemSetting_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: VideoStream VideoStream_pkey; Type: CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public."VideoStream"
    ADD CONSTRAINT "VideoStream_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Session_token_key; Type: INDEX; Schema: public; Owner: mar_user
--

CREATE UNIQUE INDEX "Session_token_key" ON public."Session" USING btree (token);


--
-- Name: SystemSetting_key_key; Type: INDEX; Schema: public; Owner: mar_user
--

CREATE UNIQUE INDEX "SystemSetting_key_key" ON public."SystemSetting" USING btree (key);


--
-- Name: User_username_key; Type: INDEX; Schema: public; Owner: mar_user
--

CREATE UNIQUE INDEX "User_username_key" ON public."User" USING btree (username);


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mar_user
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: mar_user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

