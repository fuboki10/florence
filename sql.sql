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
    url character varying,
    "courseId" integer NOT NULL
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
    avatar character varying DEFAULT 'http://localhost:3000/api/files/default.png'::character varying
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
1	Direct Program Architect	International	tooling	4
2	Regional Implementation Facilitator	Dynamic	techniques	4
3	Dynamic Mobility Coordinator	Legacy	tooling	8
4	District Configuration Designer	International	testing	6
5	Central Response Producer	Dynamic	languages	7
6	District Communications Specialist	Chief	techniques	3
7	Customer Tactics Strategist	Customer	languages	3
8	District Factors Executive	Human	techniques	3
9	Principal Paradigm Agent	Legacy	languages	9
10	Corporate Operations Supervisor	Senior	frameworks	3
11	Senior Usability Facilitator	Dynamic	frameworks	8
12	Product Division Technician	Product	frameworks	10
13	Chief Web Strategist	Lead	tooling	4
14	Forward Research Consultant	International	tooling	6
15	International Division Strategist	Human	techniques	9
16	National Paradigm Producer	Legacy	techniques	4
17	Chief Data Technician	National	testing	9
18	Investor Directives Producer	Product	techniques	5
19	Future Data Agent	District	testing	9
20	Central Interactions Coordinator	Investor	techniques	9
21	District Interactions Architect	Direct	languages	4
22	Senior Data Liaison	International	languages	1
23	Dynamic Division Architect	Internal	tooling	9
24	Principal Brand Officer	Internal	techniques	8
25	Direct Brand Architect	Principal	languages	1
26	Direct Branding Orchestrator	District	frameworks	10
27	Forward Group Agent	Chief	techniques	2
28	National Functionality Associate	Global	testing	3
29	National Interactions Orchestrator	Customer	testing	4
30	Product Markets Liaison	Central	testing	8
31	Human Research Analyst	Central	tooling	7
32	Senior Metrics Associate	Human	techniques	6
33	Internal Assurance Supervisor	Senior	frameworks	2
34	Forward Functionality Executive	Chief	testing	5
35	Investor Solutions Representative	Customer	techniques	3
36	Dynamic Applications Consultant	Dynamic	languages	6
37	Future Branding Manager	National	languages	3
38	Human Creative Designer	Dynamic	techniques	9
39	Legacy Applications Officer	District	testing	2
40	Senior Accounts Administrator	National	frameworks	1
41	Principal Intranet Technician	Human	tooling	3
42	Senior Metrics Strategist	Customer	frameworks	2
43	Legacy Response Liaison	National	frameworks	2
44	Future Accountability Manager	Regional	languages	9
45	Direct Web Executive	Chief	languages	4
46	Direct Program Administrator	District	techniques	9
47	Customer Division Agent	Corporate	tooling	8
48	National Applications Designer	Investor	techniques	8
49	Regional Solutions Developer	Dynamic	frameworks	9
50	Legacy Accounts Specialist	Dynamic	testing	10
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons (id, title, description, url, course_id) FROM stdin;
1	Product Division Strategist	Internal	https://www.youtube.com/watch?v=PQZhN65vq9E	2
2	Investor Directives Consultant	Customer	https://www.youtube.com/watch?v=PQZhN65vq9E	2
3	Central Directives Director	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	46
4	Future Quality Strategist	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	20
5	National Quality Manager	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	12
6	Global Tactics Specialist	National	https://www.youtube.com/watch?v=PQZhN65vq9E	11
7	Global Research Designer	District	https://www.youtube.com/watch?v=PQZhN65vq9E	7
8	Central Factors Architect	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	31
9	District Paradigm Consultant	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	1
10	Global Program Administrator	Product	https://www.youtube.com/watch?v=PQZhN65vq9E	27
11	Lead Data Engineer	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	3
12	Customer Branding Associate	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	46
13	Customer Configuration Representative	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	10
14	Investor Markets Coordinator	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	10
15	Central Interactions Technician	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	35
16	Customer Paradigm Administrator	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	14
17	Dynamic Creative Architect	International	https://www.youtube.com/watch?v=PQZhN65vq9E	24
18	Direct Solutions Consultant	Forward	https://www.youtube.com/watch?v=PQZhN65vq9E	11
19	Regional Research Executive	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	43
20	Corporate Security Facilitator	Regional	https://www.youtube.com/watch?v=PQZhN65vq9E	11
21	Regional Interactions Developer	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	15
22	Principal Implementation Engineer	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	38
23	Product Metrics Agent	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	29
24	Direct Division Officer	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	17
25	Principal Mobility Engineer	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	30
26	Customer Integration Analyst	District	https://www.youtube.com/watch?v=PQZhN65vq9E	16
27	Senior Marketing Planner	Customer	https://www.youtube.com/watch?v=PQZhN65vq9E	37
28	Global Assurance Designer	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	9
29	Legacy Tactics Designer	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	5
30	International Response Director	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	28
31	Dynamic Research Executive	District	https://www.youtube.com/watch?v=PQZhN65vq9E	20
32	Forward Implementation Director	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	29
33	International Implementation Coordinator	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	43
34	Corporate Interactions Designer	International	https://www.youtube.com/watch?v=PQZhN65vq9E	11
35	Central Data Planner	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	17
36	Central Intranet Engineer	Regional	https://www.youtube.com/watch?v=PQZhN65vq9E	28
37	Direct Data Officer	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	48
38	Regional Intranet Technician	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	16
39	Product Assurance Engineer	Senior	https://www.youtube.com/watch?v=PQZhN65vq9E	30
40	Global Identity Executive	International	https://www.youtube.com/watch?v=PQZhN65vq9E	20
41	Central Markets Producer	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	24
42	Internal Mobility Supervisor	International	https://www.youtube.com/watch?v=PQZhN65vq9E	14
43	Human Infrastructure Administrator	Chief	https://www.youtube.com/watch?v=PQZhN65vq9E	37
44	Product Quality Engineer	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	16
45	District Identity Technician	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	49
46	Senior Functionality Analyst	Direct	https://www.youtube.com/watch?v=PQZhN65vq9E	17
47	Senior Metrics Representative	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	21
48	Principal Branding Architect	Customer	https://www.youtube.com/watch?v=PQZhN65vq9E	4
49	Regional Solutions Coordinator	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	46
50	Senior Directives Planner	Chief	https://www.youtube.com/watch?v=PQZhN65vq9E	22
51	Investor Creative Producer	Forward	https://www.youtube.com/watch?v=PQZhN65vq9E	39
52	Future Brand Assistant	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	27
53	Forward Communications Orchestrator	International	https://www.youtube.com/watch?v=PQZhN65vq9E	8
54	Legacy Research Specialist	Internal	https://www.youtube.com/watch?v=PQZhN65vq9E	23
55	Senior Markets Designer	International	https://www.youtube.com/watch?v=PQZhN65vq9E	19
56	Dynamic Research Facilitator	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	4
57	Corporate Solutions Administrator	Human	https://www.youtube.com/watch?v=PQZhN65vq9E	45
58	Central Applications Agent	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	28
59	Direct Intranet Associate	Regional	https://www.youtube.com/watch?v=PQZhN65vq9E	34
60	Principal Creative Strategist	Senior	https://www.youtube.com/watch?v=PQZhN65vq9E	45
61	Customer Functionality Architect	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	28
62	Future Brand Executive	National	https://www.youtube.com/watch?v=PQZhN65vq9E	15
63	Senior Accountability Coordinator	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	45
64	Global Operations Engineer	District	https://www.youtube.com/watch?v=PQZhN65vq9E	4
65	Legacy Group Technician	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	20
66	Principal Solutions Administrator	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	18
67	Human Creative Analyst	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	38
68	Corporate Security Agent	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	39
69	International Mobility Planner	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	40
70	Senior Functionality Strategist	National	https://www.youtube.com/watch?v=PQZhN65vq9E	30
71	Investor Brand Facilitator	International	https://www.youtube.com/watch?v=PQZhN65vq9E	36
72	Future Implementation Coordinator	Chief	https://www.youtube.com/watch?v=PQZhN65vq9E	34
73	Chief Operations Administrator	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	50
74	Global Markets Coordinator	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	43
75	Senior Program Coordinator	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	42
76	Global Operations Agent	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	36
77	Dynamic Metrics Manager	Regional	https://www.youtube.com/watch?v=PQZhN65vq9E	6
78	Global Factors Executive	Human	https://www.youtube.com/watch?v=PQZhN65vq9E	29
79	Forward Infrastructure Assistant	Product	https://www.youtube.com/watch?v=PQZhN65vq9E	49
80	Internal Tactics Assistant	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	28
81	Dynamic Solutions Planner	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	44
82	Lead Integration Agent	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	42
83	Chief Marketing Officer	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	36
84	Dynamic Factors Facilitator	National	https://www.youtube.com/watch?v=PQZhN65vq9E	25
85	Customer Research Consultant	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	46
86	National Accounts Assistant	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	9
87	Global Optimization Engineer	Internal	https://www.youtube.com/watch?v=PQZhN65vq9E	36
88	Customer Applications Designer	International	https://www.youtube.com/watch?v=PQZhN65vq9E	7
89	Principal Group Engineer	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	36
90	District Solutions Associate	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	47
91	Regional Integration Consultant	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	29
92	Future Intranet Executive	Human	https://www.youtube.com/watch?v=PQZhN65vq9E	25
93	Chief Usability Coordinator	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	46
94	Chief Quality Representative	Human	https://www.youtube.com/watch?v=PQZhN65vq9E	47
95	Senior Accountability Associate	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	21
96	District Usability Designer	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	33
97	Lead Functionality Designer	Direct	https://www.youtube.com/watch?v=PQZhN65vq9E	21
98	Direct Interactions Liaison	Chief	https://www.youtube.com/watch?v=PQZhN65vq9E	37
99	Senior Data Orchestrator	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	20
100	Central Response Manager	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	13
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, title, url, "courseId") FROM stdin;
1	Principal Mobility Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	24
2	Principal Data Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	19
3	Internal Accounts Developer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	2
4	District Infrastructure Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	47
5	Legacy Branding Developer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	12
6	Forward Directives Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	20
7	International Response Associate	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	42
8	Internal Communications Director	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	24
9	Internal Markets Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	33
10	Global Applications Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	32
11	Internal Group Designer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
12	Forward Metrics Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	50
13	Legacy Paradigm Executive	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	31
14	Customer Integration Facilitator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	28
15	Lead Mobility Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	8
16	Human Markets Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	6
17	Future Marketing Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	40
18	District Division Designer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	25
19	Corporate Functionality Representative	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	37
20	Investor Program Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	22
21	Product Factors Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	9
22	Central Optimization Facilitator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
23	Human Metrics Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
24	Dynamic Intranet Orchestrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	39
25	Forward Accounts Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	18
26	Lead Group Analyst	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	7
27	Investor Web Developer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	22
28	Direct Tactics Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	18
29	Dynamic Paradigm Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	27
30	Global Division Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	11
31	Corporate Communications Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	29
32	Dynamic Branding Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	15
33	Investor Web Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	11
34	Regional Web Orchestrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	16
35	Senior Tactics Executive	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
36	Future Mobility Liaison	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	40
37	Product Metrics Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	9
38	District Division Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
39	Chief Mobility Agent	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	22
40	National Solutions Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	46
41	Internal Communications Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	3
42	Internal Web Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	38
43	Forward Paradigm Executive	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
44	Dynamic Optimization Planner	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	46
45	Principal Marketing Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	13
46	Central Markets Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	49
47	Chief Usability Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
48	National Metrics Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	7
49	Corporate Functionality Orchestrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	40
50	Product Usability Facilitator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	40
51	District Functionality Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	39
52	Lead Infrastructure Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	12
53	District Directives Planner	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
54	Corporate Accountability Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	18
55	National Configuration Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
56	District Web Officer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	10
57	Regional Intranet Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	39
58	International Accountability Assistant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
59	Dynamic Operations Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	1
60	Human Response Supervisor	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	43
61	Senior Infrastructure Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	27
62	District Accounts Director	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	13
63	Global Metrics Orchestrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	12
64	Regional Markets Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	18
65	Dynamic Infrastructure Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	48
66	Dynamic Interactions Representative	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	28
67	Senior Metrics Officer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
68	Internal Implementation Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	15
69	Customer Creative Supervisor	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	11
70	Customer Response Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
71	Global Security Officer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	19
72	Legacy Division Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	3
73	Global Solutions Strategist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
74	Dynamic Data Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	13
75	Future Operations Facilitator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	20
76	District Integration Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	45
77	Central Directives Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	5
78	Product Quality Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	44
79	Senior Data Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
80	Human Accountability Designer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	25
81	Investor Integration Liaison	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	23
82	Global Configuration Executive	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	6
83	Regional Accountability Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	42
84	National Branding Director	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
85	Product Mobility Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
86	Senior Program Designer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
87	Corporate Response Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	45
88	Internal Response Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	44
89	Customer Group Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	7
90	Future Metrics Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	8
91	Regional Communications Agent	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
92	Corporate Interactions Developer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	7
93	International Division Supervisor	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	12
94	International Research Supervisor	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
95	Central Quality Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	27
96	International Program Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	8
97	Dynamic Research Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
98	Central Interactions Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	33
99	Senior Solutions Officer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	48
100	Dynamic Optimization Agent	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
\.


--
-- Data for Name: threads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.threads (id, text, date, "time", "userId", "courseId", "parentId") FROM stdin;
1	Underpass Borders Practical modular Computers Cotton hacking Buckinghamshire Infrastructure asymmetric	2020-12-30T04:55:22.076+02:00	09:23	1	41	\N
2	Central African Republic Shirt AI azure Accountability yellow Division Cambridgeshire circuit THX	2021-06-11T23:08:05.582+02:00	03:03	2	31	\N
3	THX turquoise Chair application Direct Mouse Rial Omani Organized Practical Berkshire	2021-09-09T04:14:56.619+02:00	09:22	6	36	\N
4	Electronics conglomeration Dalasi Virginia Garden white Computers magenta Research Movies	2021-07-12T05:58:51.848+02:00	15:42	6	10	\N
5	Taka Future Research Shirt Rhode Island Auto Loan Account Bridge De-engineered Slovenia Legacy	2021-05-26T05:39:52.841+02:00	23:13	2	26	\N
6	Direct Bedfordshire online grey system engine Clothing Bahraini Dinar schemas wireless Fresh	2021-07-09T11:18:35.730+02:00	19:20	4	14	\N
7	Road extend Product Investment Account Architect Chief Soft Bahrain RAM Cotton	2021-04-22T11:12:19.951+02:00	22:09	9	17	\N
8	Licensed Steel Soap Global Swaziland HTTP Intranet violet Administrator budgetary management payment bluetooth	2021-02-24T08:25:43.458+02:00	15:58	10	15	\N
9	hacking calculating Shirt Officer frame payment Grocery Granite Licensed Devolved	2021-05-13T14:10:50.148+02:00	02:26	7	31	\N
10	Investment Account Distributed Keyboard Secured Checking Account Forks Re-engineered International Arizona secured line	2021-07-16T20:15:36.219+02:00	00:36	10	3	\N
11	Kansas Accounts national Small Frozen Chicken experiences Strategist Money Market Account Kids Awesome Rubber Keyboard gold	2021-04-26T10:40:27.055+02:00	00:16	10	19	\N
12	Sports XML Egyptian Pound Idaho New Taiwan Dollar Western Sahara fault-tolerant infrastructures models methodology	2021-08-01T14:02:05.775+02:00	23:53	1	16	\N
13	Auto Loan Account North Dakota Paradigm emulation mesh Mountain Home Loan Account Bulgaria Pants Gorgeous	2021-02-07T00:15:31.801+02:00	07:42	6	10	\N
14	Refined Motorway Analyst implement indigo Games Quality-focused infomediaries strategic hacking	2021-04-13T03:31:39.181+02:00	07:50	5	4	\N
15	Buckinghamshire HDD blue Drive Spurs Investment Account Washington ivory RSS salmon	2021-11-18T01:16:25.158+02:00	20:16	7	2	\N
16	capacitor North Korean Won Streamlined content-based Ergonomic Metal Sausages transmitting Papua New Guinea enhance interface e-business	2021-09-15T17:45:44.958+02:00	13:45	6	44	\N
17	Senior Codes specifically reserved for testing purposes Rustic Wooden Pants Electronics Antigua and Barbuda Facilitator New Israeli Sheqel invoice Money Market Account Soap	2021-10-27T22:39:38.117+02:00	05:29	9	43	\N
18	Division Chair Forward Toys envisioneer Generic Wooden Shoes Avon evolve Liaison port	2021-04-21T20:19:55.193+02:00	06:14	6	44	\N
19	Legacy bi-directional Belize 24/7 Alabama Self-enabling International online synthesizing Home	2021-08-04T20:57:43.964+02:00	12:15	9	11	\N
20	Centralized Bedfordshire invoice Inverse Innovative Small Frozen Towels matrix online withdrawal Walks	2021-12-01T12:29:23.654+02:00	01:54	8	47	\N
21	Kids zero tolerance strategize Licensed convergence olive generate United States Minor Outlying Islands deposit Technician	2021-09-02T13:48:42.582+02:00	21:27	1	42	\N
22	purple Administrator National Bedfordshire SAS azure 5th generation pixel PNG Movies	2021-05-15T02:09:28.919+02:00	09:08	3	16	\N
23	haptic synthesizing Avon bluetooth best-of-breed Soap zero defect solution USB heuristic	2021-06-04T14:19:33.753+02:00	03:15	1	1	\N
24	Corporate Soap Future-proofed Regional Tuna Implementation payment interface Devolved Manager	2021-04-07T17:40:21.510+02:00	12:24	8	46	\N
25	override TCP Handcrafted Wooden Pants infomediaries parse Optimization Somali Shilling artificial intelligence value-added Turkmenistan	2021-03-03T00:53:33.122+02:00	02:45	3	1	\N
26	dot-com Lead SCSI productivity invoice infrastructures Rubber Data Investment Account maximized	2021-10-14T20:15:09.696+02:00	04:21	9	11	\N
27	Kids copying Landing Rhode Island syndicate Infrastructure holistic integrate Proactive synthesizing	2021-02-20T03:41:55.370+02:00	21:32	9	9	\N
28	program feed Bulgarian Lev auxiliary Tanzanian Shilling knowledge user Credit Card Account solid state COM Shirt	2021-06-15T02:58:58.504+02:00	04:28	8	37	\N
29	Coves Awesome Fresh Shirt Health neural Orchestrator virtual Gorgeous District rich Health	2021-04-23T02:41:19.622+02:00	19:43	8	39	\N
30	Wooden International Ameliorated generating Massachusetts enterprise intangible neutral New Taiwan Dollar Soft	2020-12-29T10:12:36.101+02:00	17:19	6	35	\N
31	schemas THX Bedfordshire deposit Handcrafted Grenada Credit Card Account Buckinghamshire deposit Savings Account	2021-10-22T23:30:52.409+02:00	10:35	7	47	\N
32	transmit systems Chair Hill PNG Global Direct Refined pricing structure synthesizing	2021-07-14T14:21:57.334+02:00	22:33	1	18	\N
33	bypass silver Bedfordshire synthesize Home Loan Account Internal Ouguiya red Checking Account Director	2021-11-28T20:58:11.662+02:00	17:07	2	25	\N
34	parsing Identity utilize Gabon orange Division enable Cheese collaboration array	2021-04-30T21:37:17.700+02:00	22:59	7	29	\N
35	withdrawal hybrid Frozen AI Avon Tasty Soft Cheese Gloves XSS Baby Plastic	2021-11-18T10:24:49.001+02:00	19:49	3	31	\N
36	content Andorra Human Sports info-mediaries Nuevo Sol optimal grey Shoes French Southern Territories	2021-08-21T08:37:57.632+02:00	22:23	2	8	\N
37	compress Gloves Unbranded Frozen Salad invoice multi-tasking Sports Bacon interface Producer interface	2021-03-15T11:35:25.357+02:00	12:51	4	8	\N
38	Tugrik Seychelles Rupee synthesize ubiquitous Soap Shoes content-based JBOD Soft Practical	2021-11-26T18:53:05.128+02:00	07:52	2	20	\N
39	Handcrafted Oregon Aruba object-oriented COM channels Buckinghamshire microchip IB firmware	2021-07-05T01:03:56.730+02:00	03:12	4	17	\N
40	Liaison Buckinghamshire frictionless Paradigm bluetooth Investment Account hybrid Village Handcrafted Rubber Chips zero tolerance	2021-06-19T05:58:15.284+02:00	10:37	7	37	\N
41	Unbranded Metal Mouse neural bus Cambridgeshire Coordinator South Carolina orange synthesizing Plastic Gabon	2021-02-08T18:50:43.533+02:00	01:46	3	38	\N
42	Shirt synergize Salad JSON monitor Investor withdrawal matrix systemic Developer	2021-09-11T05:20:34.808+02:00	07:03	7	45	\N
43	Tasty Ergonomic Soft Hat indigo superstructure Clothing panel Cambridgeshire Oregon Borders Switchable	2021-06-13T11:07:27.834+02:00	19:19	10	28	\N
44	users reinvent Cambridgeshire Integrated matrix Computers Unbranded Cotton Cheese Key Harbor enable	2021-03-01T01:33:27.171+02:00	00:20	4	46	\N
45	withdrawal synergies connect Rand Namibia Dollar synthesize SMS full-range Hawaii Malaysian Ringgit content	2021-06-26T04:19:41.096+02:00	02:24	3	27	\N
46	Granite Checking Account Function-based Utah portals AI Credit Card Account Gorgeous Rubber Fish niches Coordinator	2021-04-04T00:29:02.678+02:00	16:03	1	10	\N
47	Incredible Steel Mouse Fantastic Metal Chair interfaces Factors invoice Tasty Cotton Cheese Jewelery Chicken primary New Israeli Sheqel	2021-12-14T00:21:56.648+02:00	18:29	2	2	\N
48	Gorgeous Tactics Bedfordshire scale Kids web-enabled fuchsia Liaison capacitor Legacy	2021-06-04T09:12:29.905+02:00	06:15	2	12	\N
49	Handcrafted Wooden Ball Rhode Island Maryland optical Glens Factors Investment Account Heard Island and McDonald Islands Aruba optical	2021-03-30T07:44:25.070+02:00	16:14	6	34	\N
50	Soap primary copying drive programming Dynamic Cambridgeshire methodology reboot International	2021-03-20T15:00:51.006+02:00	07:30	8	30	\N
51	migration redundant indigo enterprise national Secured indexing Tuna Customer-focused Ergonomic Cotton Cheese	2021-02-25T02:32:26.496+02:00	11:25	7	46	\N
52	programming indigo Indian Rupee Ngultrum Western Sahara Internal optical projection azure Honduras Practical	2021-11-27T14:42:30.217+02:00	06:11	3	10	\N
53	Alaska deposit modular deposit card auxiliary override Ethiopian Birr Gloves District	2021-11-11T04:21:02.084+02:00	21:39	7	39	\N
54	Soft Leone array Handcrafted Personal Loan Account Handmade Compatible web-readiness Crest Group	2021-05-03T08:49:39.676+02:00	17:39	5	27	\N
55	asymmetric Ethiopia Tuvalu Small black copy Savings Account SQL Function-based Shirt	2021-12-05T02:03:41.878+02:00	12:40	6	2	\N
56	hacking disintermediate invoice Global index bi-directional platforms programming Branding Handcrafted	2021-09-11T12:24:09.230+02:00	18:27	4	37	\N
57	Indiana Designer Tasty analyzing navigating withdrawal quantifying Fantastic Fresh Chicken payment Awesome	2021-12-11T20:52:06.730+02:00	08:06	4	41	\N
58	Angola emulation generating aggregate purple Money Market Account hacking firewall regional Branch	2021-04-06T11:23:38.111+02:00	19:15	1	1	\N
59	salmon Pennsylvania copying Cayman Islands bus quantifying New Mexico Shirt Unbranded Money Market Account	2021-10-09T22:33:12.605+02:00	14:12	9	26	\N
60	connecting plug-and-play Corporate channels scale Guinea-Bissau system Distributed regional Refined Granite Mouse	2021-05-25T08:47:37.260+02:00	15:51	6	3	\N
61	Computer overriding Avon virtual Buckinghamshire Practical Rubber Shoes Highway functionalities Iowa JSON	2021-11-29T18:06:52.300+02:00	18:53	2	15	\N
62	Global Andorra Table Ergonomic Steel Chicken Usability Surinam Dollar Yemeni Rial Ridge invoice deposit	2021-07-18T19:55:10.602+02:00	23:06	6	15	\N
63	capacitor South Georgia and the South Sandwich Islands auxiliary Tactics Kansas systems payment plum Somoni South Africa	2021-11-18T17:17:40.447+02:00	16:48	1	10	\N
64	overriding Fiji Dollar Unbranded Fresh Shoes secured line wireless streamline primary alarm matrix Incredible	2021-05-31T15:23:24.846+02:00	09:22	4	33	\N
65	Mouse Security Borders AI Silver Soap Pizza Outdoors Grocery e-enable	2021-06-02T22:15:23.589+02:00	20:27	5	16	\N
66	Generic back-end Usability virtual bypass Home Legacy Data action-items United States of America	2021-02-27T14:18:49.411+02:00	08:19	9	40	\N
67	sticky AGP holistic sky blue networks Refined Soft Keyboard SQL New Leu pixel generate	2021-12-02T23:07:48.115+02:00	14:16	8	18	\N
68	Savings Account sensor synthesize Designer extensible Steel Arkansas Senior open-source invoice	2021-06-27T20:02:48.699+02:00	15:39	1	13	\N
69	Global Bangladesh Dalasi COM Home brand Security navigating Ouguiya Persistent	2021-12-19T11:27:27.570+02:00	21:18	6	25	\N
70	program port Soap synthesize New Leu Money Market Account Metrics Mobility Money Market Account Technician	2021-10-24T11:37:10.270+02:00	09:39	10	33	\N
71	Intelligent Concrete Bike backing up Rubber Executive payment Factors analyzing Bouvet Island (Bouvetoya) ivory Outdoors	2021-02-12T08:25:39.019+02:00	19:10	4	18	\N
72	Central Applications Investment Account magenta backing up Handmade Metal Salad Berkshire Tuna exuding software	2021-03-02T23:33:06.610+02:00	17:58	7	33	\N
73	middleware wireless XML SAS Computer Gorgeous Graphical User Interface Democratic People's Republic of Korea generating hard drive	2021-06-18T15:15:29.681+02:00	18:32	4	29	\N
74	Soft Agent Grocery Credit Card Account solid state Music input Beauty Handcrafted Salad	2021-05-14T23:46:30.278+02:00	15:03	6	48	\N
75	archive Streamlined Zloty RSS Future Awesome Automotive protocol Future Vermont	2021-05-24T02:51:41.458+02:00	02:26	6	10	\N
76	Industrial Minnesota Codes specifically reserved for testing purposes Movies contingency navigating Overpass ADP methodologies calculate	2021-04-12T07:59:56.655+02:00	14:03	10	24	\N
77	Generic Metal Chicken Automated Knoll Exclusive Uganda plum Metal Director generating Cote d'Ivoire	2021-06-13T09:08:25.436+02:00	01:45	4	48	\N
78	Frozen navigate orchid programming China Czech Koruna Personal Loan Account New York Wyoming generate	2021-10-13T03:08:30.768+02:00	03:49	1	45	\N
79	Gloves lavender indigo Practical Rubber Soap Buckinghamshire Executive Consultant Licensed Plastic Mouse digital generating	2021-03-30T15:13:52.547+02:00	19:44	5	14	\N
80	bypass Rustic Granite Focused XML solutions protocol transmit networks Intelligent Frozen Sausages	2021-04-21T04:12:37.915+02:00	16:39	3	16	\N
81	logistical Garden blue deposit invoice Fantastic Wooden compressing deposit Buckinghamshire	2021-05-29T11:24:00.170+02:00	02:15	3	17	\N
82	transmit Strategist THX world-class Home Loan Account input Direct Up-sized SMTP SQL	2021-07-09T12:46:18.191+02:00	09:23	10	5	\N
83	Chair Refined Directives Response revolutionary Chicken Intelligent Steel Shoes Illinois Fresh AGP	2021-02-07T15:09:26.454+02:00	12:05	5	47	\N
84	web-readiness Grass-roots CFA Franc BEAC XML Unbranded attitude-oriented California seamless sticky SSL	2021-07-26T02:46:25.188+02:00	02:33	8	34	\N
85	parsing panel models Robust backing up Massachusetts navigating Savings Account eco-centric Borders	2021-03-15T04:18:22.223+02:00	18:42	7	50	\N
86	Kiribati North Carolina e-business quantify Configurable Parkway niches Bridge Tennessee Crossing	2021-03-11T10:51:18.622+02:00	18:42	5	7	\N
87	Handmade Frozen Computer Congolese Franc Bedfordshire Texas Creative Practical Cross-group repurpose Associate Pike	2021-12-03T03:16:06.572+02:00	02:50	9	25	\N
88	United Kingdom Sleek Concrete Chips mindshare strategize Checking Account Illinois Croatian Kuna relationships Computers 1080p	2021-06-30T04:56:09.144+02:00	23:33	7	33	\N
89	feed generating Iraqi Dinar Illinois deposit mindshare Down-sized Refined Frozen Towels Auto Loan Account Toys	2021-07-29T10:16:13.835+02:00	00:23	8	5	\N
90	Sausages Small virtual Savings Account withdrawal world-class Principal bricks-and-clicks firewall morph	2021-05-04T19:05:28.450+02:00	00:38	10	31	\N
91	navigate Fresh Uganda Practical Saint Martin enterprise Argentine Peso Kip Pass quantifying	2021-03-30T15:43:42.184+02:00	06:48	9	16	\N
92	override system engine Michigan Streets project Investment Account workforce Security invoice Home Loan Account	2021-11-10T06:20:26.485+02:00	22:49	2	8	\N
93	card Electronics payment Automotive Ergonomic paradigms needs-based Georgia capability Unbranded Steel Fish	2021-03-24T09:30:20.950+02:00	14:45	6	15	\N
94	viral action-items Officer Investment Account Home Incredible Generic Fresh Chips Croatian Kuna Gorgeous Cotton Towels Planner	2020-12-24T09:28:42.160+02:00	21:38	7	15	\N
95	teal virtual Rustic Fresh Keyboard Missouri Generic Frozen Keyboard 3rd generation Rustic Concrete Shoes Practical Iranian Rial Cayman Islands	2021-05-28T17:01:09.257+02:00	18:04	4	45	\N
96	Georgia Refined Rubber Chair Refined client-driven Shirt compressing Dynamic Rustic Plastic Cheese Designer compress	2021-09-10T14:25:33.066+02:00	15:38	1	26	\N
97	New Hampshire sensor turn-key reintermediate Wyoming COM Convertible Marks Supervisor Steel Libyan Dinar	2021-03-08T03:07:55.087+02:00	13:39	8	30	\N
98	Kids cutting-edge Orchestrator copy Norfolk Island Applications Manager Avon card cross-platform	2021-01-20T04:58:34.746+02:00	17:35	4	27	\N
99	Grocery Lead Metal array deposit Avon Corporate Engineer Gold Savings Account	2021-11-13T06:08:59.574+02:00	00:13	7	33	\N
100	Bedfordshire Kids Mauritius Rupee invoice Awesome Concrete Hat XSS expedite quantifying generating navigating	2021-05-22T23:12:57.731+02:00	19:02	1	17	\N
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
1	$2a$10$7lonBTYVdH8oanfdRBYLu.leuYP.ekNzlX8eCeZOC1o.JXuMuLZxu	Ahmed	Walid	1999-10-19	ahmed@walid.com	learner	http://localhost:3000/api/files/default.png
2	$2a$10$AdA4.OIFEMkUS.Fiw2OVDesQzf1ZIk1ePUTPnjcBVi6XFgpev0PKW	Abdelrahman	Tarek	1999-10-19	abdelrahman@tarek.com	admin	http://localhost:3000/api/files/default.png
3	$2a$10$8oDwOysRCiacuesvj3Tch.SN3v0ac/zRm.uFHuNwxRzSsx4JofX4u	Hassan	Mohammed	1999-10-19	hassan@mohammed.com	instructor	http://localhost:3000/api/files/default.png
4	$2a$10$GeCM9pAJ145q5Tz2K1DPNuTi5T7snykQgUxc1OXTSVM46vjl.TdGy	Abdelrahman	Arafat	1999-10-19	abdelrahman@arafat.com	admin	http://localhost:3000/api/files/default.png
5	$2a$10$a0nYmmK3pHhIMxhnsD6oSuokUkREdfJLRBvAmw1ioijk2ffHvwTpW	Janice	Mante	2017-02-09	Waino_Jenkins71@gmail.com	learner	http://localhost:3000/api/files/default.png
6	$2a$10$Wj4JN/pfw2xYC/ZmbXUZ5.BCDmCT0sZW.Gs6oeVHgI.4TEdSebSc6	Yazmin	Gleason	2011-08-23	Quinn9@gmail.com	learner	http://localhost:3000/api/files/default.png
7	$2a$10$rbh4lz7frNrLioYeRSChzeKANJBy1v1aVhCk3s9LHRWlLY9auiERu	Terrence	Schroeder	2007-06-03	Josefa70@gmail.com	instructor	http://localhost:3000/api/files/default.png
8	$2a$10$L.jxYrOFyfEkA4E.K6InjeIKzyzPgxL5q11j573N15xfqEng6cFdi	Shayne	Cummerata	2008-08-30	Fred87@yahoo.com	instructor	http://localhost:3000/api/files/default.png
9	$2a$10$47b1swxJfxKNsjZRCyFqj.1KuhLcCEbb0u15NzkV6mO3BKVxmxBBu	Caleb	Dooley	2020-06-24	Chaim_Keebler@gmail.com	admin	http://localhost:3000/api/files/default.png
10	$2a$10$Vhu7PqAQFelvVNcNLXHp8ucrwS/IEQPvH2GlYwQ5Z2qodJPdU5rXK	Toby	Cummings	2015-02-23	Kavon35@gmail.com	learner	http://localhost:3000/api/files/default.png
11	$2a$10$LT3NDML0iZ4ahsZ065Z9MeloZiriPhNU/2elg4Zc5D1BUeY4.wXW.	Jennings	Franecki	2009-09-15	Joannie.Crooks@yahoo.com	learner	http://localhost:3000/api/files/default.png
12	$2a$10$mAO.GWh9CGUnZvsfbw6XrO65KnhAlnOXlAySyHhIQlPEMcB6i318S	Rosendo	Turcotte	2013-09-03	Cheyenne41@yahoo.com	admin	http://localhost:3000/api/files/default.png
13	$2a$10$9QKrwbnQenwxrurhV/4qh.M5sUQNMSlHgBwesni9E1KuwaJ9g5fxW	Evelyn	Doyle	2015-11-12	Alden_Reichel@gmail.com	instructor	http://localhost:3000/api/files/default.png
14	$2a$10$8/rTOI0kY9.iLo6fI84TtOEEZRCZ1iiSVNEdDpFm1TMucTitl2sz.	Lavern	Dare	2004-10-10	Dan37@gmail.com	admin	http://localhost:3000/api/files/default.png
\.


--
-- Data for Name: users_enrolled_courses_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_enrolled_courses_courses ("usersId", "coursesId") FROM stdin;
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 50, true);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_id_seq', 100, true);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_id_seq', 100, true);


--
-- Name: threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.threads_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


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
    ADD CONSTRAINT "FK_926417be2e56242487daddaeade" FOREIGN KEY ("courseId") REFERENCES public.courses(id);


--
-- Name: materials FK_c4996878dc4dba6c010c7ca7767; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT "FK_c4996878dc4dba6c010c7ca7767" FOREIGN KEY ("courseId") REFERENCES public.courses(id);


--
-- PostgreSQL database dump complete
--

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

--
-- PostgreSQL database dump complete
--

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
    url character varying,
    "courseId" integer NOT NULL
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
    avatar character varying DEFAULT 'http://localhost:3000/api/files/default.png'::character varying
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
1	Direct Program Architect	International	tooling	4
2	Regional Implementation Facilitator	Dynamic	techniques	4
3	Dynamic Mobility Coordinator	Legacy	tooling	8
4	District Configuration Designer	International	testing	6
5	Central Response Producer	Dynamic	languages	7
6	District Communications Specialist	Chief	techniques	3
7	Customer Tactics Strategist	Customer	languages	3
8	District Factors Executive	Human	techniques	3
9	Principal Paradigm Agent	Legacy	languages	9
10	Corporate Operations Supervisor	Senior	frameworks	3
11	Senior Usability Facilitator	Dynamic	frameworks	8
12	Product Division Technician	Product	frameworks	10
13	Chief Web Strategist	Lead	tooling	4
14	Forward Research Consultant	International	tooling	6
15	International Division Strategist	Human	techniques	9
16	National Paradigm Producer	Legacy	techniques	4
17	Chief Data Technician	National	testing	9
18	Investor Directives Producer	Product	techniques	5
19	Future Data Agent	District	testing	9
20	Central Interactions Coordinator	Investor	techniques	9
21	District Interactions Architect	Direct	languages	4
22	Senior Data Liaison	International	languages	1
23	Dynamic Division Architect	Internal	tooling	9
24	Principal Brand Officer	Internal	techniques	8
25	Direct Brand Architect	Principal	languages	1
26	Direct Branding Orchestrator	District	frameworks	10
27	Forward Group Agent	Chief	techniques	2
28	National Functionality Associate	Global	testing	3
29	National Interactions Orchestrator	Customer	testing	4
30	Product Markets Liaison	Central	testing	8
31	Human Research Analyst	Central	tooling	7
32	Senior Metrics Associate	Human	techniques	6
33	Internal Assurance Supervisor	Senior	frameworks	2
34	Forward Functionality Executive	Chief	testing	5
35	Investor Solutions Representative	Customer	techniques	3
36	Dynamic Applications Consultant	Dynamic	languages	6
37	Future Branding Manager	National	languages	3
38	Human Creative Designer	Dynamic	techniques	9
39	Legacy Applications Officer	District	testing	2
40	Senior Accounts Administrator	National	frameworks	1
41	Principal Intranet Technician	Human	tooling	3
42	Senior Metrics Strategist	Customer	frameworks	2
43	Legacy Response Liaison	National	frameworks	2
44	Future Accountability Manager	Regional	languages	9
45	Direct Web Executive	Chief	languages	4
46	Direct Program Administrator	District	techniques	9
47	Customer Division Agent	Corporate	tooling	8
48	National Applications Designer	Investor	techniques	8
49	Regional Solutions Developer	Dynamic	frameworks	9
50	Legacy Accounts Specialist	Dynamic	testing	10
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons (id, title, description, url, course_id) FROM stdin;
1	Product Division Strategist	Internal	https://www.youtube.com/watch?v=PQZhN65vq9E	2
2	Investor Directives Consultant	Customer	https://www.youtube.com/watch?v=PQZhN65vq9E	2
3	Central Directives Director	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	46
4	Future Quality Strategist	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	20
5	National Quality Manager	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	12
6	Global Tactics Specialist	National	https://www.youtube.com/watch?v=PQZhN65vq9E	11
7	Global Research Designer	District	https://www.youtube.com/watch?v=PQZhN65vq9E	7
8	Central Factors Architect	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	31
9	District Paradigm Consultant	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	1
10	Global Program Administrator	Product	https://www.youtube.com/watch?v=PQZhN65vq9E	27
11	Lead Data Engineer	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	3
12	Customer Branding Associate	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	46
13	Customer Configuration Representative	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	10
14	Investor Markets Coordinator	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	10
15	Central Interactions Technician	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	35
16	Customer Paradigm Administrator	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	14
17	Dynamic Creative Architect	International	https://www.youtube.com/watch?v=PQZhN65vq9E	24
18	Direct Solutions Consultant	Forward	https://www.youtube.com/watch?v=PQZhN65vq9E	11
19	Regional Research Executive	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	43
20	Corporate Security Facilitator	Regional	https://www.youtube.com/watch?v=PQZhN65vq9E	11
21	Regional Interactions Developer	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	15
22	Principal Implementation Engineer	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	38
23	Product Metrics Agent	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	29
24	Direct Division Officer	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	17
25	Principal Mobility Engineer	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	30
26	Customer Integration Analyst	District	https://www.youtube.com/watch?v=PQZhN65vq9E	16
27	Senior Marketing Planner	Customer	https://www.youtube.com/watch?v=PQZhN65vq9E	37
28	Global Assurance Designer	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	9
29	Legacy Tactics Designer	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	5
30	International Response Director	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	28
31	Dynamic Research Executive	District	https://www.youtube.com/watch?v=PQZhN65vq9E	20
32	Forward Implementation Director	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	29
33	International Implementation Coordinator	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	43
34	Corporate Interactions Designer	International	https://www.youtube.com/watch?v=PQZhN65vq9E	11
35	Central Data Planner	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	17
36	Central Intranet Engineer	Regional	https://www.youtube.com/watch?v=PQZhN65vq9E	28
37	Direct Data Officer	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	48
38	Regional Intranet Technician	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	16
39	Product Assurance Engineer	Senior	https://www.youtube.com/watch?v=PQZhN65vq9E	30
40	Global Identity Executive	International	https://www.youtube.com/watch?v=PQZhN65vq9E	20
41	Central Markets Producer	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	24
42	Internal Mobility Supervisor	International	https://www.youtube.com/watch?v=PQZhN65vq9E	14
43	Human Infrastructure Administrator	Chief	https://www.youtube.com/watch?v=PQZhN65vq9E	37
44	Product Quality Engineer	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	16
45	District Identity Technician	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	49
46	Senior Functionality Analyst	Direct	https://www.youtube.com/watch?v=PQZhN65vq9E	17
47	Senior Metrics Representative	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	21
48	Principal Branding Architect	Customer	https://www.youtube.com/watch?v=PQZhN65vq9E	4
49	Regional Solutions Coordinator	Investor	https://www.youtube.com/watch?v=PQZhN65vq9E	46
50	Senior Directives Planner	Chief	https://www.youtube.com/watch?v=PQZhN65vq9E	22
51	Investor Creative Producer	Forward	https://www.youtube.com/watch?v=PQZhN65vq9E	39
52	Future Brand Assistant	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	27
53	Forward Communications Orchestrator	International	https://www.youtube.com/watch?v=PQZhN65vq9E	8
54	Legacy Research Specialist	Internal	https://www.youtube.com/watch?v=PQZhN65vq9E	23
55	Senior Markets Designer	International	https://www.youtube.com/watch?v=PQZhN65vq9E	19
56	Dynamic Research Facilitator	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	4
57	Corporate Solutions Administrator	Human	https://www.youtube.com/watch?v=PQZhN65vq9E	45
58	Central Applications Agent	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	28
59	Direct Intranet Associate	Regional	https://www.youtube.com/watch?v=PQZhN65vq9E	34
60	Principal Creative Strategist	Senior	https://www.youtube.com/watch?v=PQZhN65vq9E	45
61	Customer Functionality Architect	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	28
62	Future Brand Executive	National	https://www.youtube.com/watch?v=PQZhN65vq9E	15
63	Senior Accountability Coordinator	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	45
64	Global Operations Engineer	District	https://www.youtube.com/watch?v=PQZhN65vq9E	4
65	Legacy Group Technician	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	20
66	Principal Solutions Administrator	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	18
67	Human Creative Analyst	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	38
68	Corporate Security Agent	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	39
69	International Mobility Planner	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	40
70	Senior Functionality Strategist	National	https://www.youtube.com/watch?v=PQZhN65vq9E	30
71	Investor Brand Facilitator	International	https://www.youtube.com/watch?v=PQZhN65vq9E	36
72	Future Implementation Coordinator	Chief	https://www.youtube.com/watch?v=PQZhN65vq9E	34
73	Chief Operations Administrator	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	50
74	Global Markets Coordinator	Central	https://www.youtube.com/watch?v=PQZhN65vq9E	43
75	Senior Program Coordinator	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	42
76	Global Operations Agent	Principal	https://www.youtube.com/watch?v=PQZhN65vq9E	36
77	Dynamic Metrics Manager	Regional	https://www.youtube.com/watch?v=PQZhN65vq9E	6
78	Global Factors Executive	Human	https://www.youtube.com/watch?v=PQZhN65vq9E	29
79	Forward Infrastructure Assistant	Product	https://www.youtube.com/watch?v=PQZhN65vq9E	49
80	Internal Tactics Assistant	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	28
81	Dynamic Solutions Planner	Lead	https://www.youtube.com/watch?v=PQZhN65vq9E	44
82	Lead Integration Agent	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	42
83	Chief Marketing Officer	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	36
84	Dynamic Factors Facilitator	National	https://www.youtube.com/watch?v=PQZhN65vq9E	25
85	Customer Research Consultant	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	46
86	National Accounts Assistant	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	9
87	Global Optimization Engineer	Internal	https://www.youtube.com/watch?v=PQZhN65vq9E	36
88	Customer Applications Designer	International	https://www.youtube.com/watch?v=PQZhN65vq9E	7
89	Principal Group Engineer	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	36
90	District Solutions Associate	Corporate	https://www.youtube.com/watch?v=PQZhN65vq9E	47
91	Regional Integration Consultant	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	29
92	Future Intranet Executive	Human	https://www.youtube.com/watch?v=PQZhN65vq9E	25
93	Chief Usability Coordinator	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	46
94	Chief Quality Representative	Human	https://www.youtube.com/watch?v=PQZhN65vq9E	47
95	Senior Accountability Associate	Global	https://www.youtube.com/watch?v=PQZhN65vq9E	21
96	District Usability Designer	Dynamic	https://www.youtube.com/watch?v=PQZhN65vq9E	33
97	Lead Functionality Designer	Direct	https://www.youtube.com/watch?v=PQZhN65vq9E	21
98	Direct Interactions Liaison	Chief	https://www.youtube.com/watch?v=PQZhN65vq9E	37
99	Senior Data Orchestrator	Legacy	https://www.youtube.com/watch?v=PQZhN65vq9E	20
100	Central Response Manager	Future	https://www.youtube.com/watch?v=PQZhN65vq9E	13
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, title, url, "courseId") FROM stdin;
1	Principal Mobility Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	24
2	Principal Data Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	19
3	Internal Accounts Developer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	2
4	District Infrastructure Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	47
5	Legacy Branding Developer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	12
6	Forward Directives Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	20
7	International Response Associate	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	42
8	Internal Communications Director	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	24
9	Internal Markets Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	33
10	Global Applications Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	32
11	Internal Group Designer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
12	Forward Metrics Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	50
13	Legacy Paradigm Executive	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	31
14	Customer Integration Facilitator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	28
15	Lead Mobility Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	8
16	Human Markets Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	6
17	Future Marketing Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	40
18	District Division Designer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	25
19	Corporate Functionality Representative	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	37
20	Investor Program Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	22
21	Product Factors Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	9
22	Central Optimization Facilitator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
23	Human Metrics Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
24	Dynamic Intranet Orchestrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	39
25	Forward Accounts Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	18
26	Lead Group Analyst	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	7
27	Investor Web Developer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	22
28	Direct Tactics Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	18
29	Dynamic Paradigm Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	27
30	Global Division Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	11
31	Corporate Communications Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	29
32	Dynamic Branding Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	15
33	Investor Web Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	11
34	Regional Web Orchestrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	16
35	Senior Tactics Executive	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
36	Future Mobility Liaison	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	40
37	Product Metrics Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	9
38	District Division Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
39	Chief Mobility Agent	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	22
40	National Solutions Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	46
41	Internal Communications Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	3
42	Internal Web Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	38
43	Forward Paradigm Executive	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
44	Dynamic Optimization Planner	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	46
45	Principal Marketing Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	13
46	Central Markets Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	49
47	Chief Usability Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
48	National Metrics Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	7
49	Corporate Functionality Orchestrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	40
50	Product Usability Facilitator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	40
51	District Functionality Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	39
52	Lead Infrastructure Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	12
53	District Directives Planner	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
54	Corporate Accountability Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	18
55	National Configuration Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
56	District Web Officer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	10
57	Regional Intranet Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	39
58	International Accountability Assistant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
59	Dynamic Operations Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	1
60	Human Response Supervisor	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	43
61	Senior Infrastructure Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	27
62	District Accounts Director	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	13
63	Global Metrics Orchestrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	12
64	Regional Markets Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	18
65	Dynamic Infrastructure Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	48
66	Dynamic Interactions Representative	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	28
67	Senior Metrics Officer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
68	Internal Implementation Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	15
69	Customer Creative Supervisor	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	11
70	Customer Response Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
71	Global Security Officer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	19
72	Legacy Division Administrator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	3
73	Global Solutions Strategist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
74	Dynamic Data Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	13
75	Future Operations Facilitator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	20
76	District Integration Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	45
77	Central Directives Producer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	5
78	Product Quality Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	44
79	Senior Data Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	21
80	Human Accountability Designer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	25
81	Investor Integration Liaison	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	23
82	Global Configuration Executive	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	6
83	Regional Accountability Specialist	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	42
84	National Branding Director	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
85	Product Mobility Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
86	Senior Program Designer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
87	Corporate Response Technician	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	45
88	Internal Response Consultant	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	44
89	Customer Group Architect	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	7
90	Future Metrics Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	8
91	Regional Communications Agent	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	4
92	Corporate Interactions Developer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	7
93	International Division Supervisor	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	12
94	International Research Supervisor	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
95	Central Quality Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	27
96	International Program Engineer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	8
97	Dynamic Research Coordinator	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	26
98	Central Interactions Manager	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	33
99	Senior Solutions Officer	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	48
100	Dynamic Optimization Agent	https://www.theseus.fi/bitstream/handle/10024/353200/Pham_Duc.pdf	17
\.


--
-- Data for Name: threads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.threads (id, text, date, "time", "userId", "courseId", "parentId") FROM stdin;
1	Underpass Borders Practical modular Computers Cotton hacking Buckinghamshire Infrastructure asymmetric	2020-12-30T04:55:22.076+02:00	09:23	1	41	\N
2	Central African Republic Shirt AI azure Accountability yellow Division Cambridgeshire circuit THX	2021-06-11T23:08:05.582+02:00	03:03	2	31	\N
3	THX turquoise Chair application Direct Mouse Rial Omani Organized Practical Berkshire	2021-09-09T04:14:56.619+02:00	09:22	6	36	\N
4	Electronics conglomeration Dalasi Virginia Garden white Computers magenta Research Movies	2021-07-12T05:58:51.848+02:00	15:42	6	10	\N
5	Taka Future Research Shirt Rhode Island Auto Loan Account Bridge De-engineered Slovenia Legacy	2021-05-26T05:39:52.841+02:00	23:13	2	26	\N
6	Direct Bedfordshire online grey system engine Clothing Bahraini Dinar schemas wireless Fresh	2021-07-09T11:18:35.730+02:00	19:20	4	14	\N
7	Road extend Product Investment Account Architect Chief Soft Bahrain RAM Cotton	2021-04-22T11:12:19.951+02:00	22:09	9	17	\N
8	Licensed Steel Soap Global Swaziland HTTP Intranet violet Administrator budgetary management payment bluetooth	2021-02-24T08:25:43.458+02:00	15:58	10	15	\N
9	hacking calculating Shirt Officer frame payment Grocery Granite Licensed Devolved	2021-05-13T14:10:50.148+02:00	02:26	7	31	\N
10	Investment Account Distributed Keyboard Secured Checking Account Forks Re-engineered International Arizona secured line	2021-07-16T20:15:36.219+02:00	00:36	10	3	\N
11	Kansas Accounts national Small Frozen Chicken experiences Strategist Money Market Account Kids Awesome Rubber Keyboard gold	2021-04-26T10:40:27.055+02:00	00:16	10	19	\N
12	Sports XML Egyptian Pound Idaho New Taiwan Dollar Western Sahara fault-tolerant infrastructures models methodology	2021-08-01T14:02:05.775+02:00	23:53	1	16	\N
13	Auto Loan Account North Dakota Paradigm emulation mesh Mountain Home Loan Account Bulgaria Pants Gorgeous	2021-02-07T00:15:31.801+02:00	07:42	6	10	\N
14	Refined Motorway Analyst implement indigo Games Quality-focused infomediaries strategic hacking	2021-04-13T03:31:39.181+02:00	07:50	5	4	\N
15	Buckinghamshire HDD blue Drive Spurs Investment Account Washington ivory RSS salmon	2021-11-18T01:16:25.158+02:00	20:16	7	2	\N
16	capacitor North Korean Won Streamlined content-based Ergonomic Metal Sausages transmitting Papua New Guinea enhance interface e-business	2021-09-15T17:45:44.958+02:00	13:45	6	44	\N
17	Senior Codes specifically reserved for testing purposes Rustic Wooden Pants Electronics Antigua and Barbuda Facilitator New Israeli Sheqel invoice Money Market Account Soap	2021-10-27T22:39:38.117+02:00	05:29	9	43	\N
18	Division Chair Forward Toys envisioneer Generic Wooden Shoes Avon evolve Liaison port	2021-04-21T20:19:55.193+02:00	06:14	6	44	\N
19	Legacy bi-directional Belize 24/7 Alabama Self-enabling International online synthesizing Home	2021-08-04T20:57:43.964+02:00	12:15	9	11	\N
20	Centralized Bedfordshire invoice Inverse Innovative Small Frozen Towels matrix online withdrawal Walks	2021-12-01T12:29:23.654+02:00	01:54	8	47	\N
21	Kids zero tolerance strategize Licensed convergence olive generate United States Minor Outlying Islands deposit Technician	2021-09-02T13:48:42.582+02:00	21:27	1	42	\N
22	purple Administrator National Bedfordshire SAS azure 5th generation pixel PNG Movies	2021-05-15T02:09:28.919+02:00	09:08	3	16	\N
23	haptic synthesizing Avon bluetooth best-of-breed Soap zero defect solution USB heuristic	2021-06-04T14:19:33.753+02:00	03:15	1	1	\N
24	Corporate Soap Future-proofed Regional Tuna Implementation payment interface Devolved Manager	2021-04-07T17:40:21.510+02:00	12:24	8	46	\N
25	override TCP Handcrafted Wooden Pants infomediaries parse Optimization Somali Shilling artificial intelligence value-added Turkmenistan	2021-03-03T00:53:33.122+02:00	02:45	3	1	\N
26	dot-com Lead SCSI productivity invoice infrastructures Rubber Data Investment Account maximized	2021-10-14T20:15:09.696+02:00	04:21	9	11	\N
27	Kids copying Landing Rhode Island syndicate Infrastructure holistic integrate Proactive synthesizing	2021-02-20T03:41:55.370+02:00	21:32	9	9	\N
28	program feed Bulgarian Lev auxiliary Tanzanian Shilling knowledge user Credit Card Account solid state COM Shirt	2021-06-15T02:58:58.504+02:00	04:28	8	37	\N
29	Coves Awesome Fresh Shirt Health neural Orchestrator virtual Gorgeous District rich Health	2021-04-23T02:41:19.622+02:00	19:43	8	39	\N
30	Wooden International Ameliorated generating Massachusetts enterprise intangible neutral New Taiwan Dollar Soft	2020-12-29T10:12:36.101+02:00	17:19	6	35	\N
31	schemas THX Bedfordshire deposit Handcrafted Grenada Credit Card Account Buckinghamshire deposit Savings Account	2021-10-22T23:30:52.409+02:00	10:35	7	47	\N
32	transmit systems Chair Hill PNG Global Direct Refined pricing structure synthesizing	2021-07-14T14:21:57.334+02:00	22:33	1	18	\N
33	bypass silver Bedfordshire synthesize Home Loan Account Internal Ouguiya red Checking Account Director	2021-11-28T20:58:11.662+02:00	17:07	2	25	\N
34	parsing Identity utilize Gabon orange Division enable Cheese collaboration array	2021-04-30T21:37:17.700+02:00	22:59	7	29	\N
35	withdrawal hybrid Frozen AI Avon Tasty Soft Cheese Gloves XSS Baby Plastic	2021-11-18T10:24:49.001+02:00	19:49	3	31	\N
36	content Andorra Human Sports info-mediaries Nuevo Sol optimal grey Shoes French Southern Territories	2021-08-21T08:37:57.632+02:00	22:23	2	8	\N
37	compress Gloves Unbranded Frozen Salad invoice multi-tasking Sports Bacon interface Producer interface	2021-03-15T11:35:25.357+02:00	12:51	4	8	\N
38	Tugrik Seychelles Rupee synthesize ubiquitous Soap Shoes content-based JBOD Soft Practical	2021-11-26T18:53:05.128+02:00	07:52	2	20	\N
39	Handcrafted Oregon Aruba object-oriented COM channels Buckinghamshire microchip IB firmware	2021-07-05T01:03:56.730+02:00	03:12	4	17	\N
40	Liaison Buckinghamshire frictionless Paradigm bluetooth Investment Account hybrid Village Handcrafted Rubber Chips zero tolerance	2021-06-19T05:58:15.284+02:00	10:37	7	37	\N
41	Unbranded Metal Mouse neural bus Cambridgeshire Coordinator South Carolina orange synthesizing Plastic Gabon	2021-02-08T18:50:43.533+02:00	01:46	3	38	\N
42	Shirt synergize Salad JSON monitor Investor withdrawal matrix systemic Developer	2021-09-11T05:20:34.808+02:00	07:03	7	45	\N
43	Tasty Ergonomic Soft Hat indigo superstructure Clothing panel Cambridgeshire Oregon Borders Switchable	2021-06-13T11:07:27.834+02:00	19:19	10	28	\N
44	users reinvent Cambridgeshire Integrated matrix Computers Unbranded Cotton Cheese Key Harbor enable	2021-03-01T01:33:27.171+02:00	00:20	4	46	\N
45	withdrawal synergies connect Rand Namibia Dollar synthesize SMS full-range Hawaii Malaysian Ringgit content	2021-06-26T04:19:41.096+02:00	02:24	3	27	\N
46	Granite Checking Account Function-based Utah portals AI Credit Card Account Gorgeous Rubber Fish niches Coordinator	2021-04-04T00:29:02.678+02:00	16:03	1	10	\N
47	Incredible Steel Mouse Fantastic Metal Chair interfaces Factors invoice Tasty Cotton Cheese Jewelery Chicken primary New Israeli Sheqel	2021-12-14T00:21:56.648+02:00	18:29	2	2	\N
48	Gorgeous Tactics Bedfordshire scale Kids web-enabled fuchsia Liaison capacitor Legacy	2021-06-04T09:12:29.905+02:00	06:15	2	12	\N
49	Handcrafted Wooden Ball Rhode Island Maryland optical Glens Factors Investment Account Heard Island and McDonald Islands Aruba optical	2021-03-30T07:44:25.070+02:00	16:14	6	34	\N
50	Soap primary copying drive programming Dynamic Cambridgeshire methodology reboot International	2021-03-20T15:00:51.006+02:00	07:30	8	30	\N
51	migration redundant indigo enterprise national Secured indexing Tuna Customer-focused Ergonomic Cotton Cheese	2021-02-25T02:32:26.496+02:00	11:25	7	46	\N
52	programming indigo Indian Rupee Ngultrum Western Sahara Internal optical projection azure Honduras Practical	2021-11-27T14:42:30.217+02:00	06:11	3	10	\N
53	Alaska deposit modular deposit card auxiliary override Ethiopian Birr Gloves District	2021-11-11T04:21:02.084+02:00	21:39	7	39	\N
54	Soft Leone array Handcrafted Personal Loan Account Handmade Compatible web-readiness Crest Group	2021-05-03T08:49:39.676+02:00	17:39	5	27	\N
55	asymmetric Ethiopia Tuvalu Small black copy Savings Account SQL Function-based Shirt	2021-12-05T02:03:41.878+02:00	12:40	6	2	\N
56	hacking disintermediate invoice Global index bi-directional platforms programming Branding Handcrafted	2021-09-11T12:24:09.230+02:00	18:27	4	37	\N
57	Indiana Designer Tasty analyzing navigating withdrawal quantifying Fantastic Fresh Chicken payment Awesome	2021-12-11T20:52:06.730+02:00	08:06	4	41	\N
58	Angola emulation generating aggregate purple Money Market Account hacking firewall regional Branch	2021-04-06T11:23:38.111+02:00	19:15	1	1	\N
59	salmon Pennsylvania copying Cayman Islands bus quantifying New Mexico Shirt Unbranded Money Market Account	2021-10-09T22:33:12.605+02:00	14:12	9	26	\N
60	connecting plug-and-play Corporate channels scale Guinea-Bissau system Distributed regional Refined Granite Mouse	2021-05-25T08:47:37.260+02:00	15:51	6	3	\N
61	Computer overriding Avon virtual Buckinghamshire Practical Rubber Shoes Highway functionalities Iowa JSON	2021-11-29T18:06:52.300+02:00	18:53	2	15	\N
62	Global Andorra Table Ergonomic Steel Chicken Usability Surinam Dollar Yemeni Rial Ridge invoice deposit	2021-07-18T19:55:10.602+02:00	23:06	6	15	\N
63	capacitor South Georgia and the South Sandwich Islands auxiliary Tactics Kansas systems payment plum Somoni South Africa	2021-11-18T17:17:40.447+02:00	16:48	1	10	\N
64	overriding Fiji Dollar Unbranded Fresh Shoes secured line wireless streamline primary alarm matrix Incredible	2021-05-31T15:23:24.846+02:00	09:22	4	33	\N
65	Mouse Security Borders AI Silver Soap Pizza Outdoors Grocery e-enable	2021-06-02T22:15:23.589+02:00	20:27	5	16	\N
66	Generic back-end Usability virtual bypass Home Legacy Data action-items United States of America	2021-02-27T14:18:49.411+02:00	08:19	9	40	\N
67	sticky AGP holistic sky blue networks Refined Soft Keyboard SQL New Leu pixel generate	2021-12-02T23:07:48.115+02:00	14:16	8	18	\N
68	Savings Account sensor synthesize Designer extensible Steel Arkansas Senior open-source invoice	2021-06-27T20:02:48.699+02:00	15:39	1	13	\N
69	Global Bangladesh Dalasi COM Home brand Security navigating Ouguiya Persistent	2021-12-19T11:27:27.570+02:00	21:18	6	25	\N
70	program port Soap synthesize New Leu Money Market Account Metrics Mobility Money Market Account Technician	2021-10-24T11:37:10.270+02:00	09:39	10	33	\N
71	Intelligent Concrete Bike backing up Rubber Executive payment Factors analyzing Bouvet Island (Bouvetoya) ivory Outdoors	2021-02-12T08:25:39.019+02:00	19:10	4	18	\N
72	Central Applications Investment Account magenta backing up Handmade Metal Salad Berkshire Tuna exuding software	2021-03-02T23:33:06.610+02:00	17:58	7	33	\N
73	middleware wireless XML SAS Computer Gorgeous Graphical User Interface Democratic People's Republic of Korea generating hard drive	2021-06-18T15:15:29.681+02:00	18:32	4	29	\N
74	Soft Agent Grocery Credit Card Account solid state Music input Beauty Handcrafted Salad	2021-05-14T23:46:30.278+02:00	15:03	6	48	\N
75	archive Streamlined Zloty RSS Future Awesome Automotive protocol Future Vermont	2021-05-24T02:51:41.458+02:00	02:26	6	10	\N
76	Industrial Minnesota Codes specifically reserved for testing purposes Movies contingency navigating Overpass ADP methodologies calculate	2021-04-12T07:59:56.655+02:00	14:03	10	24	\N
77	Generic Metal Chicken Automated Knoll Exclusive Uganda plum Metal Director generating Cote d'Ivoire	2021-06-13T09:08:25.436+02:00	01:45	4	48	\N
78	Frozen navigate orchid programming China Czech Koruna Personal Loan Account New York Wyoming generate	2021-10-13T03:08:30.768+02:00	03:49	1	45	\N
79	Gloves lavender indigo Practical Rubber Soap Buckinghamshire Executive Consultant Licensed Plastic Mouse digital generating	2021-03-30T15:13:52.547+02:00	19:44	5	14	\N
80	bypass Rustic Granite Focused XML solutions protocol transmit networks Intelligent Frozen Sausages	2021-04-21T04:12:37.915+02:00	16:39	3	16	\N
81	logistical Garden blue deposit invoice Fantastic Wooden compressing deposit Buckinghamshire	2021-05-29T11:24:00.170+02:00	02:15	3	17	\N
82	transmit Strategist THX world-class Home Loan Account input Direct Up-sized SMTP SQL	2021-07-09T12:46:18.191+02:00	09:23	10	5	\N
83	Chair Refined Directives Response revolutionary Chicken Intelligent Steel Shoes Illinois Fresh AGP	2021-02-07T15:09:26.454+02:00	12:05	5	47	\N
84	web-readiness Grass-roots CFA Franc BEAC XML Unbranded attitude-oriented California seamless sticky SSL	2021-07-26T02:46:25.188+02:00	02:33	8	34	\N
85	parsing panel models Robust backing up Massachusetts navigating Savings Account eco-centric Borders	2021-03-15T04:18:22.223+02:00	18:42	7	50	\N
86	Kiribati North Carolina e-business quantify Configurable Parkway niches Bridge Tennessee Crossing	2021-03-11T10:51:18.622+02:00	18:42	5	7	\N
87	Handmade Frozen Computer Congolese Franc Bedfordshire Texas Creative Practical Cross-group repurpose Associate Pike	2021-12-03T03:16:06.572+02:00	02:50	9	25	\N
88	United Kingdom Sleek Concrete Chips mindshare strategize Checking Account Illinois Croatian Kuna relationships Computers 1080p	2021-06-30T04:56:09.144+02:00	23:33	7	33	\N
89	feed generating Iraqi Dinar Illinois deposit mindshare Down-sized Refined Frozen Towels Auto Loan Account Toys	2021-07-29T10:16:13.835+02:00	00:23	8	5	\N
90	Sausages Small virtual Savings Account withdrawal world-class Principal bricks-and-clicks firewall morph	2021-05-04T19:05:28.450+02:00	00:38	10	31	\N
91	navigate Fresh Uganda Practical Saint Martin enterprise Argentine Peso Kip Pass quantifying	2021-03-30T15:43:42.184+02:00	06:48	9	16	\N
92	override system engine Michigan Streets project Investment Account workforce Security invoice Home Loan Account	2021-11-10T06:20:26.485+02:00	22:49	2	8	\N
93	card Electronics payment Automotive Ergonomic paradigms needs-based Georgia capability Unbranded Steel Fish	2021-03-24T09:30:20.950+02:00	14:45	6	15	\N
94	viral action-items Officer Investment Account Home Incredible Generic Fresh Chips Croatian Kuna Gorgeous Cotton Towels Planner	2020-12-24T09:28:42.160+02:00	21:38	7	15	\N
95	teal virtual Rustic Fresh Keyboard Missouri Generic Frozen Keyboard 3rd generation Rustic Concrete Shoes Practical Iranian Rial Cayman Islands	2021-05-28T17:01:09.257+02:00	18:04	4	45	\N
96	Georgia Refined Rubber Chair Refined client-driven Shirt compressing Dynamic Rustic Plastic Cheese Designer compress	2021-09-10T14:25:33.066+02:00	15:38	1	26	\N
97	New Hampshire sensor turn-key reintermediate Wyoming COM Convertible Marks Supervisor Steel Libyan Dinar	2021-03-08T03:07:55.087+02:00	13:39	8	30	\N
98	Kids cutting-edge Orchestrator copy Norfolk Island Applications Manager Avon card cross-platform	2021-01-20T04:58:34.746+02:00	17:35	4	27	\N
99	Grocery Lead Metal array deposit Avon Corporate Engineer Gold Savings Account	2021-11-13T06:08:59.574+02:00	00:13	7	33	\N
100	Bedfordshire Kids Mauritius Rupee invoice Awesome Concrete Hat XSS expedite quantifying generating navigating	2021-05-22T23:12:57.731+02:00	19:02	1	17	\N
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
1	$2a$10$7lonBTYVdH8oanfdRBYLu.leuYP.ekNzlX8eCeZOC1o.JXuMuLZxu	Ahmed	Walid	1999-10-19	ahmed@walid.com	learner	http://localhost:3000/api/files/default.png
2	$2a$10$AdA4.OIFEMkUS.Fiw2OVDesQzf1ZIk1ePUTPnjcBVi6XFgpev0PKW	Abdelrahman	Tarek	1999-10-19	abdelrahman@tarek.com	admin	http://localhost:3000/api/files/default.png
3	$2a$10$8oDwOysRCiacuesvj3Tch.SN3v0ac/zRm.uFHuNwxRzSsx4JofX4u	Hassan	Mohammed	1999-10-19	hassan@mohammed.com	instructor	http://localhost:3000/api/files/default.png
4	$2a$10$GeCM9pAJ145q5Tz2K1DPNuTi5T7snykQgUxc1OXTSVM46vjl.TdGy	Abdelrahman	Arafat	1999-10-19	abdelrahman@arafat.com	admin	http://localhost:3000/api/files/default.png
5	$2a$10$a0nYmmK3pHhIMxhnsD6oSuokUkREdfJLRBvAmw1ioijk2ffHvwTpW	Janice	Mante	2017-02-09	Waino_Jenkins71@gmail.com	learner	http://localhost:3000/api/files/default.png
6	$2a$10$Wj4JN/pfw2xYC/ZmbXUZ5.BCDmCT0sZW.Gs6oeVHgI.4TEdSebSc6	Yazmin	Gleason	2011-08-23	Quinn9@gmail.com	learner	http://localhost:3000/api/files/default.png
7	$2a$10$rbh4lz7frNrLioYeRSChzeKANJBy1v1aVhCk3s9LHRWlLY9auiERu	Terrence	Schroeder	2007-06-03	Josefa70@gmail.com	instructor	http://localhost:3000/api/files/default.png
8	$2a$10$L.jxYrOFyfEkA4E.K6InjeIKzyzPgxL5q11j573N15xfqEng6cFdi	Shayne	Cummerata	2008-08-30	Fred87@yahoo.com	instructor	http://localhost:3000/api/files/default.png
9	$2a$10$47b1swxJfxKNsjZRCyFqj.1KuhLcCEbb0u15NzkV6mO3BKVxmxBBu	Caleb	Dooley	2020-06-24	Chaim_Keebler@gmail.com	admin	http://localhost:3000/api/files/default.png
10	$2a$10$Vhu7PqAQFelvVNcNLXHp8ucrwS/IEQPvH2GlYwQ5Z2qodJPdU5rXK	Toby	Cummings	2015-02-23	Kavon35@gmail.com	learner	http://localhost:3000/api/files/default.png
11	$2a$10$LT3NDML0iZ4ahsZ065Z9MeloZiriPhNU/2elg4Zc5D1BUeY4.wXW.	Jennings	Franecki	2009-09-15	Joannie.Crooks@yahoo.com	learner	http://localhost:3000/api/files/default.png
12	$2a$10$mAO.GWh9CGUnZvsfbw6XrO65KnhAlnOXlAySyHhIQlPEMcB6i318S	Rosendo	Turcotte	2013-09-03	Cheyenne41@yahoo.com	admin	http://localhost:3000/api/files/default.png
13	$2a$10$9QKrwbnQenwxrurhV/4qh.M5sUQNMSlHgBwesni9E1KuwaJ9g5fxW	Evelyn	Doyle	2015-11-12	Alden_Reichel@gmail.com	instructor	http://localhost:3000/api/files/default.png
14	$2a$10$8/rTOI0kY9.iLo6fI84TtOEEZRCZ1iiSVNEdDpFm1TMucTitl2sz.	Lavern	Dare	2004-10-10	Dan37@gmail.com	admin	http://localhost:3000/api/files/default.png
\.


--
-- Data for Name: users_enrolled_courses_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_enrolled_courses_courses ("usersId", "coursesId") FROM stdin;
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 50, true);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lessons_id_seq', 100, true);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_id_seq', 100, true);


--
-- Name: threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.threads_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


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
    ADD CONSTRAINT "FK_926417be2e56242487daddaeade" FOREIGN KEY ("courseId") REFERENCES public.courses(id);


--
-- Name: materials FK_c4996878dc4dba6c010c7ca7767; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT "FK_c4996878dc4dba6c010c7ca7767" FOREIGN KEY ("courseId") REFERENCES public.courses(id);


--
-- PostgreSQL database dump complete
--

