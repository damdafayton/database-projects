--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animals (
    id integer,
    name character(40),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric(5,2)
);


ALTER TABLE public.animals OWNER TO postgres;

--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) FROM stdin;
\N	Agumon                                  	2020-02-03	0	t	10.23
\.


--
-- PostgreSQL database dump complete
--

