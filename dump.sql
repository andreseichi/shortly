--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url_link text NOT NULL,
    short_url_link character varying(10) NOT NULL,
    visit_count integer DEFAULT 0 NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

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
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, token, created_at) FROM stdin;
1	1	f94b68f5-c335-4076-abca-561a63a3bf2f	2022-08-05 23:25:49.879
2	2	10626b64-75d3-4e88-a7ea-f842b76660f1	2022-08-05 23:26:53.148
3	5	680bbecc-a5eb-4547-b93d-1ad62890963b	2022-08-05 23:39:53.497
4	12	79722feb-ab7d-46fc-a26c-4e88cd0ff0a3	2022-08-05 23:40:37.037
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, url_link, short_url_link, visit_count, user_id, created_at) FROM stdin;
2	https://www.linkedin.com	cZA0Doha	0	1	2022-08-05 23:26:15.233923
7	https://www.youtube.com/	H5U5Ingg	0	2	2022-08-05 23:27:07.713339
13	https://www.youtube.com/	b7rq98fE	3	12	2022-08-05 23:40:52.305466
1	https://www.linkedin.com	XdjKzKXX	3	1	2022-08-05 23:26:14.795082
3	https://www.linkedin.com	Q1vDTvLv	1	1	2022-08-05 23:26:16.531779
4	https://www.linkedin.com	uNxiPPVz	4	1	2022-08-05 23:26:16.840464
5	https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-left-join/	dE44CGOa	2	1	2022-08-05 23:26:34.68131
6	https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-left-join/	zo0mQRQo	12	2	2022-08-05 23:26:59.414455
8	https://www.youtube.com/	VnSPD_Wk	2	2	2022-08-05 23:39:35.573123
9	https://www.youtube.com/	1H6R1DfH	2	5	2022-08-05 23:40:01.950927
10	https://www.google.com/	dF8cyR0K	4	5	2022-08-05 23:40:10.144493
11	https://www.google.com/	vlTufanB	5	12	2022-08-05 23:40:44.697937
12	https://www.youtube.com/	zhKA0qQZ	2	12	2022-08-05 23:40:51.732686
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, created_at) FROM stdin;
1	Fulano	fulano@teste.com	$2b$10$KybLrs4zcvceyaE9BPFe9.ATB68p6zSEEWw72QVATZMuuf01vzhjS	2022-08-05 23:25:41.69183
2	Fulano 2	fulano2@teste.com	$2b$10$5r5j.k.tcAbLJUi0VWC1u.IXhjo2kKBPFXW5s4BbQH2KJRHrzc2ci	2022-08-05 23:26:47.254675
3	Fulano 3	fulano3@teste.com	$2b$10$pxX2H4TM2Bcax.R0MQ7C4ubSvQFdLfO3iqMPgJETcgBpipVYulhJa	2022-08-05 23:39:42.649193
4	Fulano 4	fulano4@teste.com	$2b$10$Kvcn35LufODzdYCdhphsaehlLrsP7v/Ub2nBLdAOYbTIjpNpkDNfu	2022-08-05 23:39:45.898568
5	Fulano 5	fulano5@teste.com	$2b$10$TwHH8JcC5bIkCbhd1adTB.YJfklxovnZfToMeQXBxUYubCKEFI2iS	2022-08-05 23:39:48.994387
6	Fulano 6	fulano6@teste.com	$2b$10$w.vG6URMnroMCGy4ckI2SeBJtbnmmrxUVrz/lSLlUQ7BaLNfimZgy	2022-08-05 23:40:16.420914
7	Fulano 7	fulano7@teste.com	$2b$10$RNDxHXXzJ8cwQXhCsxghO.V1b2fEli885IkowOl7WApBKuuRz7.IW	2022-08-05 23:40:19.256798
8	Fulano 8	fulano8@teste.com	$2b$10$Qpma17j2i0vEpbNFgOsgz.VNrqRi36oD9s980knZyzpgum4p3ooxS	2022-08-05 23:40:21.893014
9	Fulano 	fulano9@teste.com	$2b$10$IyC5p34FO3VWBt1bozEudetaBHeFgcHMwfnyJakUENgyJm02mtq5y	2022-08-05 23:40:25.161801
10	Fulano 11	fulano10@teste.com	$2b$10$wPFJQUBH7D7iiO12nJzpBu9tpa2dXw6F3oj/8wPYQ8DQUS8SB4Gz2	2022-08-05 23:40:27.943353
11	Fulano 11	fulano11@teste.com	$2b$10$zObxu6.EZ6BOJ5gzczvytem5C/SQBqcPZlW5WnQRFxmZexbTcteum	2022-08-05 23:40:30.039865
12	Fulano 12	fulano12@teste.com	$2b$10$F.f6eZoV5pkoo8R5nuMi6e1rL9yU6s37Q/KerqeDPV06.lPJd/TWK	2022-08-05 23:40:33.458363
13	Fulano 13	fulano13@teste.com	$2b$10$KkcgFxMC/DAv5PHxtuCYpOsAhC7S8nVfJio92S7YGSb3.wuSzQdfi	2022-08-05 23:41:58.312818
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: urls urls_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

