SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attendance; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attendance (
    schedule_id integer DEFAULT 0 NOT NULL,
    student_id integer DEFAULT 0 NOT NULL,
    attend_status character(10) DEFAULT NULL::bpchar,
    description character(40) DEFAULT NULL::bpchar
);


--
-- Name: com; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE com (
    cno integer,
    cname character varying(15) DEFAULT NULL::character varying,
    prc integer,
    sno integer
);


--
-- Name: course; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE course (
    course_id character varying(20) DEFAULT ''::character varying NOT NULL,
    course_title character varying(50) DEFAULT NULL::character varying,
    topic character varying(100) DEFAULT NULL::character varying,
    day_length integer,
    price integer DEFAULT 0 NOT NULL,
    level_id integer,
    category character varying(40) DEFAULT NULL::character varying
);


--
-- Name: detail; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE detail (
    orderno integer DEFAULT 0 NOT NULL,
    itemno integer DEFAULT 0 NOT NULL,
    itemname character varying(50) NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: emp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE emp (
    empno integer NOT NULL,
    empname character varying(50) NOT NULL,
    dep character varying(30) DEFAULT NULL::character varying,
    post character varying(30) NOT NULL
);


--
-- Name: itemorder; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE itemorder (
    orderno integer NOT NULL,
    empno integer NOT NULL,
    orderdate date NOT NULL
);


--
-- Name: officer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE officer (
    officerno integer NOT NULL,
    officername character varying(50) NOT NULL
);


--
-- Name: optimism; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE optimism (
    id integer NOT NULL,
    name character varying(10) DEFAULT NULL::character varying,
    version integer
);


--
-- Name: partner; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE partner (
    instructor_id character(11) DEFAULT ''::bpchar NOT NULL,
    last_name character(30) DEFAULT NULL::bpchar,
    first_name character(30) DEFAULT NULL::bpchar,
    e_mail character(30) DEFAULT NULL::bpchar
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    product_id integer NOT NULL,
    product_name character varying(50) NOT NULL,
    price integer NOT NULL
);


--
-- Name: salary; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE salary (
    empno integer NOT NULL,
    money integer
);


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schedule (
    schedule_id integer NOT NULL,
    schedule_date date,
    classroom_id integer,
    course_id character(11) DEFAULT NULL::bpchar,
    instructor_id character(11) DEFAULT NULL::bpchar
);


--
-- Name: shops; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shops (
    shop_id integer NOT NULL,
    shop_name character varying(50) NOT NULL
);


--
-- Name: sns_link; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sns_link (
    id integer NOT NULL,
    linked_id integer NOT NULL
);


--
-- Name: student; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE student (
    student_id integer NOT NULL,
    last_name character(20) DEFAULT NULL::bpchar,
    first_name character(30) DEFAULT NULL::bpchar,
    company character(30) DEFAULT NULL::bpchar,
    tel character(15) DEFAULT NULL::bpchar,
    e_mail character(30) DEFAULT NULL::bpchar
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    user_name character varying(20) NOT NULL,
    age smallint NOT NULL,
    dept smallint NOT NULL
);


--
-- Name: attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (schedule_id, student_id);


--
-- Name: course_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- Name: detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY detail
    ADD CONSTRAINT detail_pkey PRIMARY KEY (orderno, itemno);


--
-- Name: emp_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY emp
    ADD CONSTRAINT emp_pkey PRIMARY KEY (empno);


--
-- Name: itemorder_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY itemorder
    ADD CONSTRAINT itemorder_pkey PRIMARY KEY (orderno);


--
-- Name: officer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY officer
    ADD CONSTRAINT officer_pkey PRIMARY KEY (officerno);


--
-- Name: optimism_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY optimism
    ADD CONSTRAINT optimism_pkey PRIMARY KEY (id);


--
-- Name: partner_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY partner
    ADD CONSTRAINT partner_pkey PRIMARY KEY (instructor_id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: salary_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY salary
    ADD CONSTRAINT salary_pkey PRIMARY KEY (empno);


--
-- Name: schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);


--
-- Name: shops_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (shop_id);


--
-- Name: sns_link_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sns_link
    ADD CONSTRAINT sns_link_pkey PRIMARY KEY (id, linked_id);


--
-- Name: student_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

