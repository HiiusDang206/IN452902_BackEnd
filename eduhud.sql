--
-- PostgreSQL database dump
--

\restrict cKVG3HDvBXe72PtIhJKB9emS7j7oTIDcPYyBLD6bm5NyZg8MfCYGWAnb8Lq7UQB

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-20 02:49:34

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16403)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    capacity integer NOT NULL,
    CONSTRAINT courses_capacity_check CHECK ((capacity > 0))
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE courses; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.courses IS 'Luu tru danh muc khoa hoc';


--
-- TOC entry 221 (class 1259 OID 16402)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.courses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    joined_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.members OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.members ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16481)
-- Name: registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registrations (
    id integer NOT NULL,
    member_id integer NOT NULL,
    course_id integer NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying NOT NULL,
    registered_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.registrations OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16480)
-- Name: registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.registrations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5036 (class 0 OID 16403)
-- Dependencies: 222
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, title, capacity) FROM stdin;
1	Lập trình Wed	2
2	Cơ sở dữ liệu	40
\.


--
-- TOC entry 5034 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, full_name, email, joined_at) FROM stdin;
2	Trần Bình	binh@dthu.edu.vn	2026-10-19 08:08:54.307418+07
3	Lê Chi	chi@dthu.edu.vn	2026-10-19 08:08:54.307418+07
1	Nguyễn An	an@dthu.edu.vn	2026-10-19 08:08:54.307418+07
\.


--
-- TOC entry 5038 (class 0 OID 16481)
-- Dependencies: 224
-- Data for Name: registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registrations (id, member_id, course_id, status, registered_at) FROM stdin;
2	1	2	pending	2026-10-19 08:08:54.307418+07
1	1	1	confirmed	2026-10-19 08:08:54.307418+07
6	2	2	pending	2026-10-19 23:59:50.364621+07
7	3	2	pending	2026-10-20 02:41:18.507632+07
\.


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 221
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 2, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 219
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 3, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 223
-- Name: registrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registrations_id_seq', 7, true);


--
-- TOC entry 4875 (class 2606 OID 16411)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 16413)
-- Name: courses courses_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_title_key UNIQUE (title);


--
-- TOC entry 4871 (class 2606 OID 16401)
-- Name: members members_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_email_key UNIQUE (email);


--
-- TOC entry 4873 (class 2606 OID 16399)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 4881 (class 2606 OID 16494)
-- Name: registrations registrations_member_id_course_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_member_id_course_id_key UNIQUE (member_id, course_id);


--
-- TOC entry 4883 (class 2606 OID 16492)
-- Name: registrations registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4878 (class 1259 OID 16505)
-- Name: ix_reg_course; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_reg_course ON public.registrations USING btree (course_id);


--
-- TOC entry 4879 (class 1259 OID 16506)
-- Name: ix_reg_member; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_reg_member ON public.registrations USING btree (member_id);


--
-- TOC entry 4884 (class 2606 OID 16500)
-- Name: registrations registrations_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4885 (class 2606 OID 16495)
-- Name: registrations registrations_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrations
    ADD CONSTRAINT registrations_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.members(id);


-- Completed on 2026-10-20 02:49:34

--
-- PostgreSQL database dump complete
--

\unrestrict cKVG3HDvBXe72PtIhJKB9emS7j7oTIDcPYyBLD6bm5NyZg8MfCYGWAnb8Lq7UQB

