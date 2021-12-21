--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)
-- Dumped by pg_dump version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    category character varying NOT NULL,
    instructor_id integer NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    url character varying NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lessons_id_seq OWNER TO postgres;

--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    id integer NOT NULL,
    title character varying NOT NULL,
    url character varying
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materials_id_seq OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: threads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.threads (
    id integer NOT NULL,
    text character varying NOT NULL,
    date character varying NOT NULL,
    "time" character varying NOT NULL,
    "userId" integer NOT NULL,
    "courseId" integer NOT NULL,
    "parentId" integer
);


ALTER TABLE public.threads OWNER TO postgres;

--
-- Name: threads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.threads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.threads_id_seq OWNER TO postgres;

--
-- Name: threads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.threads_id_seq OWNED BY public.threads.id;


--
-- Name: typeorm_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typeorm_metadata (
    type character varying NOT NULL,
    database character varying,
    schema character varying,
    "table" character varying,
    name character varying,
    value text
);


ALTER TABLE public.typeorm_metadata OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password character varying NOT NULL,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    "birthDate" date NOT NULL,
    email character varying NOT NULL,
    role character varying DEFAULT 'learner'::character varying NOT NULL,
    avatar character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_enrolled_courses_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_enrolled_courses_courses (
    "usersId" integer NOT NULL,
    "coursesId" integer NOT NULL
);


ALTER TABLE public.users_enrolled_courses_courses OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- Name: materials id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: threads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads ALTER COLUMN id SET DEFAULT nextval('public.threads_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, title, description, category, instructor_id) FROM stdin;
1	string	string	string	2
2	string	string	string	1
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons (id, title, description, url, course_id) FROM stdin;
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, title, url) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- Data for Name: threads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.threads (id, text, date, "time", "userId", "courseId", "parentId") FROM stdin;
1	thread	2021-12-17	10:27	1	1	\N
2	thread	2021-12-17	10:27	1	1	\N
3	thread	2021-12-17	10:27	1	1	\N
4	thread	2021-12-17	10:27	1	1	\N
5	thread	2021-12-17	10:27	1	1	\N
10	reply	2020-12-18	05:40	1	1	1
\.


--
-- Data for Name: typeorm_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typeorm_metadata (type, database, schema, "table", name, value) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, password, "firstName", "lastName", "birthDate", email, role, avatar) FROM stdin;
3	$2a$10$QzwkvhTAY78BITRxcgqkxO.5Ly08sd8f2FSV7DnhwVn..1WlB4n1W	string	string	2021-12-17	instructor@instructor.com	instructor	\N
2	$2a$10$CHe9jzJBDrOdSEPaUTjg9eXiK5ASIin.waWyfX1q.17R2AFnyMaIi	string	string	2021-12-17	learner@learner.com	instructor	\N
4	$2a$10$NYNs.3MxhdENgMgOZqBLIufjfxfJtL0rUgqAEIkEAl90PsuzUFpae	string	string	2021-12-18	a@a.com	admin	\N
5	$2a$10$YZR3QCdcGdwWykLn6bUZuOJ9jLaOOn7xbmVq.BjrGe5pnD7rDtgia	string	string	2021-12-18	b@b.com	admin	\N
1	$2a$10$Q.jg.aKxrLBbs3y0WsGnauR3/K9.L.8aXXLUMtWXya0q2Qq6CIJqK	string	string	2021-12-17	admin@admin.com	admin	localhost:3000/api/files/Untitled-0bd8.png
\.


--
-- Data for Name: users_enrolled_courses_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_enrolled_courses_courses ("usersId", "coursesId") FROM stdin;
2	1
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 2, true);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_id_seq', 1, false);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- Name: threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.threads_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: materials PK_2fd1a93ecb222a28bef28663fa0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT "PK_2fd1a93ecb222a28bef28663fa0" PRIMARY KEY (id);


--
-- Name: courses PK_3f70a487cc718ad8eda4e6d58c9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "PK_3f70a487cc718ad8eda4e6d58c9" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: lessons PK_9b9a8d455cac672d262d7275730; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT "PK_9b9a8d455cac672d262d7275730" PRIMARY KEY (id);


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: threads PK_d8a74804c34fc3900502cd27275; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT "PK_d8a74804c34fc3900502cd27275" PRIMARY KEY (id);


--
-- Name: users_enrolled_courses_courses PK_e3d32fea11d21d8f989c9f09a4f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_enrolled_courses_courses
    ADD CONSTRAINT "PK_e3d32fea11d21d8f989c9f09a4f" PRIMARY KEY ("usersId", "coursesId");


--
-- Name: users UQ_97672ac88f789774dd47f7c8be3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_97672ac88f789774dd47f7c8be3" UNIQUE (email);


--
-- Name: IDX_0f7205cda4e64d225dab1abe22; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_0f7205cda4e64d225dab1abe22" ON public.users_enrolled_courses_courses USING btree ("usersId");


--
-- Name: IDX_2355d163861f052a74acb4db15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_2355d163861f052a74acb4db15" ON public.users_enrolled_courses_courses USING btree ("coursesId");


--
-- Name: IDX_ace513fa30d485cfd25c11a9e4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ace513fa30d485cfd25c11a9e4" ON public.users USING btree (role);


--
-- Name: users_enrolled_courses_courses FK_0f7205cda4e64d225dab1abe222; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_enrolled_courses_courses
    ADD CONSTRAINT "FK_0f7205cda4e64d225dab1abe222" FOREIGN KEY ("usersId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_enrolled_courses_courses FK_2355d163861f052a74acb4db15b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_enrolled_courses_courses
    ADD CONSTRAINT "FK_2355d163861f052a74acb4db15b" FOREIGN KEY ("coursesId") REFERENCES public.courses(id);


--
-- Name: threads FK_256dd2e4946d6768c5583caa072; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT "FK_256dd2e4946d6768c5583caa072" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: lessons FK_3c4e299cf8ed04093935e2e22fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT "FK_3c4e299cf8ed04093935e2e22fe" FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: courses FK_4fdc83dd6b261101401ec259342; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "FK_4fdc83dd6b261101401ec259342" FOREIGN KEY (instructor_id) REFERENCES public.users(id);


--
-- Name: threads FK_8030648b2ab58cc11c6ec443d85; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT "FK_8030648b2ab58cc11c6ec443d85" FOREIGN KEY ("parentId") REFERENCES public.threads(id);


--
-- Name: threads FK_926417be2e56242487daddaeade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT "FK_926417be2e56242487daddaeade" FOREIGN KEY ("courseId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

