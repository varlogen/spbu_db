--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 10.0

-- Started on 2017-11-03 18:14:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 195 (class 1259 OID 16566)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16397)
-- Name: cities; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE cities (
    id integer DEFAULT nextval('cities_id_seq'::regclass) NOT NULL,
    name text NOT NULL,
    country integer NOT NULL
);


ALTER TABLE cities OWNER TO pavel;

--
-- TOC entry 196 (class 1259 OID 16569)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16403)
-- Name: countries; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE countries (
    id integer DEFAULT nextval('countries_id_seq'::regclass) NOT NULL,
    name text NOT NULL,
    region integer
);


ALTER TABLE countries OWNER TO pavel;

--
-- TOC entry 197 (class 1259 OID 16571)
-- Name: matches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE matches_id_seq OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16409)
-- Name: matches; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE matches (
    id integer DEFAULT nextval('matches_id_seq'::regclass) NOT NULL,
    team_1 integer,
    team_2 integer,
    tournament integer,
    score_team_1 integer,
    score_team_2 integer
);


ALTER TABLE matches OWNER TO pavel;

--
-- TOC entry 198 (class 1259 OID 16573)
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE players_id_seq OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16412)
-- Name: players; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE players (
    id integer DEFAULT nextval('players_id_seq'::regclass) NOT NULL,
    nik_name text NOT NULL,
    name text,
    team integer,
    age date,
    country integer,
    role integer
);


ALTER TABLE players OWNER TO pavel;

--
-- TOC entry 199 (class 1259 OID 16575)
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regions_id_seq OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16418)
-- Name: regions; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE regions (
    id integer DEFAULT nextval('regions_id_seq'::regclass) NOT NULL,
    name text NOT NULL
);


ALTER TABLE regions OWNER TO pavel;

--
-- TOC entry 200 (class 1259 OID 16577)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16424)
-- Name: roles; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE roles (
    id integer DEFAULT nextval('roles_id_seq'::regclass) NOT NULL,
    name text NOT NULL
);


ALTER TABLE roles OWNER TO pavel;

--
-- TOC entry 204 (class 1259 OID 16585)
-- Name: t_r_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_r_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_r_id_seq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16581)
-- Name: t_s_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_s_id_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16579)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16430)
-- Name: teams; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE teams (
    id integer DEFAULT nextval('teams_id_seq'::regclass) NOT NULL,
    name text NOT NULL,
    region integer NOT NULL
);


ALTER TABLE teams OWNER TO pavel;

--
-- TOC entry 192 (class 1259 OID 16436)
-- Name: tournament_system; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE tournament_system (
    id integer DEFAULT nextval('t_s_id_seq'::regclass) NOT NULL,
    system text NOT NULL
);


ALTER TABLE tournament_system OWNER TO pavel;

--
-- TOC entry 203 (class 1259 OID 16583)
-- Name: tournaments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tournaments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tournaments_id_seq OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16442)
-- Name: tournaments; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE tournaments (
    id integer DEFAULT nextval('tournaments_id_seq'::regclass) NOT NULL,
    name text NOT NULL,
    city integer,
    date_begin date,
    date_end date,
    prize integer NOT NULL,
    system integer
);


ALTER TABLE tournaments OWNER TO pavel;

--
-- TOC entry 194 (class 1259 OID 16448)
-- Name: tournaments_results; Type: TABLE; Schema: public; Owner: pavel
--

CREATE TABLE tournaments_results (
    id integer DEFAULT nextval('t_r_id_seq'::regclass) NOT NULL,
    team integer NOT NULL,
    tournament integer NOT NULL,
    result text,
    percent integer
);


ALTER TABLE tournaments_results OWNER TO pavel;

--
-- TOC entry 2250 (class 0 OID 16397)
-- Dependencies: 185
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY cities (id, name, country) FROM stdin;
1	Bucharest	29
2	Kiev	2
3	Los Angeles	3
4	Seattle	3
5	Jönköping	12
6	Atlanta	3
7	Hamburg	5
8	Moscow	1
9	Manila	18
10	Texas	3
11	Shanghai	24
\.


--
-- TOC entry 2251 (class 0 OID 16403)
-- Dependencies: 186
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY countries (id, name, region) FROM stdin;
1	Russia	1
2	Ukrain	1
3	USA	5
4	Canada	5
5	Germany	2
6	Denmark	2
7	Peru	6
8	Argentina	6
9	Brazil	6
10	Bolivia	6
11	Colombia	6
12	Sweden	2
13	Greece	2
14	Finland	2
15	Estonia	1
17	Poland	2
18	Philippines	4
19	Singapore	4
20	South Korea	4
21	Malaysia	4
22	Pakistan	\N
16	Jordan	\N
23	Israel	\N
24	China	3
25	Australia	\N
26	Macau	\N
27	Bulgaria	\N
28	Lebanon	\N
29	Romania	2
\.


--
-- TOC entry 2252 (class 0 OID 16409)
-- Dependencies: 187
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY matches (id, team_1, team_2, tournament, score_team_1, score_team_2) FROM stdin;
1	5	1	10	1	2
2	3	1	10	0	3
3	1	2	10	2	0
4	8	2	10	0	2
5	4	5	10	2	0
6	6	1	3	0	2
7	9	1	3	1	3
8	18	6	3	0	2
9	16	9	3	1	2
10	3	6	3	0	2
11	15	9	3	0	2
12	1	10	10	1	2
13	6	18	3	1	2
14	2	4	10	2	1
15	10	2	10	1	2
\.


--
-- TOC entry 2253 (class 0 OID 16412)
-- Dependencies: 188
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY players (id, nik_name, name, team, age, country, role) FROM stdin;
1	Arteezy	Artour Babaev	7	1996-08-01	4	1
2	SumaiL	Syed Sumail Hassan	7	1999-02-13	22	2
4	UNiVeRsE	Saahil Arora	7	1989-10-11	3	3
3	Cr1t-	Andreas Franck Nielsen	7	1996-08-13	6	4
5	Fear	Clinton Loomis	7	1988-02-19	3	5
6	Maybe	Lu Yao	2	1995-12-16	24	2
7	Ame	Wang Chunyu	2	1997-04-07	24	1
8	Yao	Yao Zhengzheng	2	1990-12-23	24	4
9	fy	Xu Linsen	2	1995-02-12	24	3
10	Victoria	Victoria	2	1995-11-05	24	5
11	 Resolut1on	Roman Fominok	8	1996-09-02	2	2
12	s4	Gustav Magnusson	8	1992-04-01	12	3
13	N0tail	Johan Sundstein	8	1993-09-08	6	1
14	Fly	Tal Aizik	8	1993-03-09	23	5
15	JerAx	Jesse Vainikka	8	1992-05-07	14	4
47	DDC	Leong Fat-meng	4	1990-07-03	26	5
48	RAMZES666	Roman Kushnarev	5	1999-04-25	1	1
49	Noone	Vladimir Minenko	5	1997-09-04	2	2
50	9pasha	Pavel Khvastunov	5	1992-06-30	1	3
51	Monet	Du Peng	4	1999-09-25	24	1
52	Super	Xie Junhao	4	1993-01-04	24	2
53	Inflame	He Yongzheng	4	1992-12-22	24	3
54	ah fu	Tue Soon Chuan	4	1994-06-19	21	4
55	Lil	Ilya Ilyuk	5	1995-12-24	2	4
56	Solo	Alexei Berezin	5	1990-08-07	1	5
57	KuroKy	Kuro Salehi Takhasomi	1	1992-10-28	5	5
58	GH	Maroun Merhej	1	\N	28	4
59	MinD_ContRoL	Ivan Borislavov Ivanov	1	1995-01-20	27	3
60	Moogy	Xu Han	3	1994-04-19	24	1
61	kpii	Damien Sau-jing Chok	3	\N	25	3
62	Sccc	Song Chun	3	1995-08-18	24	2
63	Faith	Zeng Hongda	3	1992-02-06	24	5
64	Kaka	Hu Liangzhi	3	1992-11-07	24	4
65	Mushi	Chai Yee Fung	9	1990-11-27	21	2
66	NaNa	Kam Boon Seng	9	1995-02-12	21	1
67	Miracle-	Amer Al-Barqawi	1	1997-06-20	16	2
68	MATUMBAMAN	Lasse Aukusti Urpalainen	1	1995-03-03	14	1
69	Liposa	Rodrigo Lelis Santos	15	1996-11-24	9	3
71	ninjaboogie	Michael Ross Jr.	9	1992-01-31	18	5
72	iceiceice	Daryl Koh Pei Xiang	9	1990-06-17	19	3
70	Thiolicor	Thiago de Oliveira Cordeiro	15	\N	9	4
\.


--
-- TOC entry 2254 (class 0 OID 16418)
-- Dependencies: 189
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY regions (id, name) FROM stdin;
1	CIS
2	Europe
3	China
4	SEA
5	North America
6	South America
\.


--
-- TOC entry 2255 (class 0 OID 16424)
-- Dependencies: 190
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY roles (id, name) FROM stdin;
1	carry
2	mider
3	harder
4	semi-support
5	full-support
\.


--
-- TOC entry 2256 (class 0 OID 16430)
-- Dependencies: 191
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY teams (id, name, region) FROM stdin;
1	Team Liquid	2
2	LGD	3
3	Newbee	3
4	LGD.Forever Young	3
5	Virtus Pro	1
6	Team Secret	2
7	Evil Geniuses	5
8	OG	2
9	Mineski	4
10	Invictus Gaming	3
11	Team Empire	1
12	Vici Gaming	3
13	TnC	4
14	Team Freedom	5
15	SG e-sports	6
16	compLexity Gaming	5
17	Team Spirit	1
18	Natus Vincere	1
19	Alliance	2
\.


--
-- TOC entry 2257 (class 0 OID 16436)
-- Dependencies: 192
-- Data for Name: tournament_system; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY tournament_system (id, system) FROM stdin;
1	double elimination
2	single elimination
\.


--
-- TOC entry 2258 (class 0 OID 16442)
-- Dependencies: 193
-- Data for Name: tournaments; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY tournaments (id, name, city, date_begin, date_end, prize, system) FROM stdin;
2	PGL Open Bucharest	2	2017-10-19	2017-10-22	300000	2
3	StarLadder i-League Invitational Season 3	1	2017-10-12	2017-10-15	300000	2
4	The Summit 7	3	2017-06-14	2017-06-18	100000	1
10	The International 2017	4	2017-08-02	2017-08-12	24787916	1
11	DreamLeague Season 7	6	2017-07-21	2017-07-21	175000	1
12	DreamLeague Season 8	5	2017-12-01	2017-12-04	1000000	\N
13	EPICENTER 2016	7	2016-05-09	2016-05-15	500000	1
14	EPICENTER 2017	7	2017-06-04	2017-06-11	500000	1
15	ESL One Hamburg 2017	8	2017-10-26	2017-10-29	1000000	2
16	The Perfect World Masters	11	2017-11-19	2017-11-26	300000	\N
\.


--
-- TOC entry 2259 (class 0 OID 16448)
-- Dependencies: 194
-- Data for Name: tournaments_results; Type: TABLE DATA; Schema: public; Owner: pavel
--

COPY tournaments_results (id, team, tournament, result, percent) FROM stdin;
11	3	10	2	16
12	1	10	1	44
13	2	10	4	7
14	4	10	3	11
15	10	10	5-6	5
16	5	10	5-6	5
17	9	3	2	20
18	1	3	1	45
19	6	3	3-4	10
20	16	3	3-4	10
\.


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 195
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cities_id_seq', 11, true);


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 196
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('countries_id_seq', 29, true);


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 197
-- Name: matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('matches_id_seq', 15, true);


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 198
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('players_id_seq', 72, true);


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 199
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('regions_id_seq', 6, true);


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 200
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 5, true);


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 204
-- Name: t_r_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_r_id_seq', 20, true);


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 202
-- Name: t_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_s_id_seq', 2, true);


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 201
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('teams_id_seq', 19, true);


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 203
-- Name: tournaments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tournaments_id_seq', 16, true);


--
-- TOC entry 2087 (class 2606 OID 16455)
-- Name: cities cities_name_key; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);


--
-- TOC entry 2089 (class 2606 OID 16457)
-- Name: cities cities_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 16555)
-- Name: countries countries_name_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE countries
    ADD CONSTRAINT countries_name_check CHECK ((length(name) < 32)) NOT VALID;


--
-- TOC entry 2091 (class 2606 OID 16459)
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- TOC entry 2093 (class 2606 OID 16461)
-- Name: countries countries_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (id);


--
-- TOC entry 2095 (class 2606 OID 16463)
-- Name: matches matches_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_pk PRIMARY KEY (id);


--
-- TOC entry 2069 (class 2606 OID 16556)
-- Name: matches matches_score_team_1_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE matches
    ADD CONSTRAINT matches_score_team_1_check CHECK ((score_team_1 <= 5)) NOT VALID;


--
-- TOC entry 2070 (class 2606 OID 16557)
-- Name: matches matches_score_team_2_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE matches
    ADD CONSTRAINT matches_score_team_2_check CHECK ((score_team_2 <= 5)) NOT VALID;


--
-- TOC entry 2065 (class 2606 OID 16553)
-- Name: cities none; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE cities
    ADD CONSTRAINT "none" CHECK ((length(name) < 32)) NOT VALID;


--
-- TOC entry 2072 (class 2606 OID 16558)
-- Name: players players_name_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE players
    ADD CONSTRAINT players_name_check CHECK ((length(name) < 64)) NOT VALID;


--
-- TOC entry 2097 (class 2606 OID 16465)
-- Name: players players_name_key; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_name_key UNIQUE (name);


--
-- TOC entry 2073 (class 2606 OID 16559)
-- Name: players players_nik_name_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE players
    ADD CONSTRAINT players_nik_name_check CHECK ((length(nik_name) < 32)) NOT VALID;


--
-- TOC entry 2099 (class 2606 OID 16467)
-- Name: players players_nik_name_key; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_nik_name_key UNIQUE (nik_name);


--
-- TOC entry 2101 (class 2606 OID 16469)
-- Name: players players_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pk PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 16560)
-- Name: regions regions_name_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE regions
    ADD CONSTRAINT regions_name_check CHECK ((length(name) < 32)) NOT VALID;


--
-- TOC entry 2103 (class 2606 OID 16471)
-- Name: regions regions_name_key; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);


--
-- TOC entry 2105 (class 2606 OID 16473)
-- Name: regions regions_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pk PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 16561)
-- Name: roles roles_name_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE roles
    ADD CONSTRAINT roles_name_check CHECK ((length(name) < 16)) NOT VALID;


--
-- TOC entry 2107 (class 2606 OID 16475)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 2109 (class 2606 OID 16477)
-- Name: roles roles_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 16562)
-- Name: teams teams_name_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE teams
    ADD CONSTRAINT teams_name_check CHECK ((length(name) < 32)) NOT VALID;


--
-- TOC entry 2111 (class 2606 OID 16479)
-- Name: teams teams_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pk PRIMARY KEY (id);


--
-- TOC entry 2113 (class 2606 OID 16481)
-- Name: tournament_system tournament_system_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY tournament_system
    ADD CONSTRAINT tournament_system_pk PRIMARY KEY (id);


--
-- TOC entry 2115 (class 2606 OID 16483)
-- Name: tournament_system tournament_system_system_key; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY tournament_system
    ADD CONSTRAINT tournament_system_system_key UNIQUE (system);


--
-- TOC entry 2082 (class 2606 OID 16563)
-- Name: tournaments tournaments_name_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE tournaments
    ADD CONSTRAINT tournaments_name_check CHECK ((length(name) < 64)) NOT VALID;


--
-- TOC entry 2117 (class 2606 OID 16485)
-- Name: tournaments tournaments_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY tournaments
    ADD CONSTRAINT tournaments_pk PRIMARY KEY (id);


--
-- TOC entry 2084 (class 2606 OID 16565)
-- Name: tournaments_results tournaments_results_percent_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE tournaments_results
    ADD CONSTRAINT tournaments_results_percent_check CHECK ((percent <= 100)) NOT VALID;


--
-- TOC entry 2119 (class 2606 OID 16487)
-- Name: tournaments_results tournaments_results_pk; Type: CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY tournaments_results
    ADD CONSTRAINT tournaments_results_pk PRIMARY KEY (id);


--
-- TOC entry 2085 (class 2606 OID 16564)
-- Name: tournaments_results tournaments_results_result_check; Type: CHECK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE tournaments_results
    ADD CONSTRAINT tournaments_results_result_check CHECK ((length(result) < 6)) NOT VALID;


--
-- TOC entry 2120 (class 2606 OID 16488)
-- Name: cities cities_fk0; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_fk0 FOREIGN KEY (country) REFERENCES countries(id);


--
-- TOC entry 2121 (class 2606 OID 16493)
-- Name: countries countries_fk0; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_fk0 FOREIGN KEY (region) REFERENCES regions(id);


--
-- TOC entry 2122 (class 2606 OID 16498)
-- Name: matches matches_fk0; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_fk0 FOREIGN KEY (team_1) REFERENCES teams(id);


--
-- TOC entry 2123 (class 2606 OID 16503)
-- Name: matches matches_fk1; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_fk1 FOREIGN KEY (team_2) REFERENCES teams(id);


--
-- TOC entry 2124 (class 2606 OID 16508)
-- Name: matches matches_fk2; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY matches
    ADD CONSTRAINT matches_fk2 FOREIGN KEY (tournament) REFERENCES tournaments(id);


--
-- TOC entry 2125 (class 2606 OID 16513)
-- Name: players players_fk0; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_fk0 FOREIGN KEY (team) REFERENCES teams(id);


--
-- TOC entry 2126 (class 2606 OID 16518)
-- Name: players players_fk1; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_fk1 FOREIGN KEY (country) REFERENCES countries(id);


--
-- TOC entry 2127 (class 2606 OID 16523)
-- Name: players players_fk2; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_fk2 FOREIGN KEY (role) REFERENCES roles(id);


--
-- TOC entry 2128 (class 2606 OID 16528)
-- Name: teams teams_fk0; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_fk0 FOREIGN KEY (region) REFERENCES regions(id);


--
-- TOC entry 2129 (class 2606 OID 16533)
-- Name: tournaments tournaments_fk0; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY tournaments
    ADD CONSTRAINT tournaments_fk0 FOREIGN KEY (city) REFERENCES cities(id);


--
-- TOC entry 2130 (class 2606 OID 16538)
-- Name: tournaments tournaments_fk1; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY tournaments
    ADD CONSTRAINT tournaments_fk1 FOREIGN KEY (system) REFERENCES tournament_system(id);


--
-- TOC entry 2131 (class 2606 OID 16543)
-- Name: tournaments_results tournaments_results_fk0; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY tournaments_results
    ADD CONSTRAINT tournaments_results_fk0 FOREIGN KEY (team) REFERENCES teams(id);


--
-- TOC entry 2132 (class 2606 OID 16548)
-- Name: tournaments_results tournaments_results_fk1; Type: FK CONSTRAINT; Schema: public; Owner: pavel
--

ALTER TABLE ONLY tournaments_results
    ADD CONSTRAINT tournaments_results_fk1 FOREIGN KEY (tournament) REFERENCES tournaments(id);


-- Completed on 2017-11-03 18:14:48

--
-- PostgreSQL database dump complete
--

