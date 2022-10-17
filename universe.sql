--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id integer NOT NULL,
    name character varying,
    id integer NOT NULL,
    age integer NOT NULL,
    distance numeric(5,2),
    description text,
    has_life boolean,
    is_round boolean
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comets_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comets_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    id integer NOT NULL,
    age integer NOT NULL,
    distance numeric(5,2),
    description text,
    has_life boolean,
    is_round boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    id integer NOT NULL,
    age integer NOT NULL,
    distance numeric(5,2),
    description text,
    has_life boolean,
    is_round boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    id integer NOT NULL,
    age integer NOT NULL,
    distance numeric(5,2),
    description text,
    has_life boolean,
    is_round boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    id integer NOT NULL,
    age integer NOT NULL,
    distance numeric(5,2),
    description text,
    has_life boolean,
    is_round boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comets_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'halley', 1, 300000, 500.23, 'splaching', false, false);
INSERT INTO public.comets VALUES (2, 'mercury', 2, 550000, 600.23, 'poisonous gases', false, true);
INSERT INTO public.comets VALUES (3, 'Venus', 3, 660000, 700.13, 'blue in color', false, true);
INSERT INTO public.comets VALUES (4, 'Mars', 4, 660000, 700.08, 'Red surfacce', false, true);
INSERT INTO public.comets VALUES (5, 'Saturn', 5, 660000, 800.07, 'has rings', false, true);
INSERT INTO public.comets VALUES (6, 'pluto', 6, 770000, 900.03, 'smallest lanet', false, true);
INSERT INTO public.comets VALUES (7, 'neptune', 7, 880000, 900.34, 'largest planet', false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milk-way', 1, 450000, 500.23, 'milky-substance', false, false);
INSERT INTO public.galaxy VALUES (2, 'cigar-galaxy', 2, 550000, 600.23, 'shaped like a cigar', false, false);
INSERT INTO public.galaxy VALUES (3, 'Tadpole-galaxy', 3, 660000, 700.13, 'Tadpole substance like', false, false);
INSERT INTO public.galaxy VALUES (4, 'Hoag', 4, 660000, 700.08, 'shaped like a hoag', false, false);
INSERT INTO public.galaxy VALUES (5, 'whirpool', 5, 660000, 800.07, 'whirly in shape', false, false);
INSERT INTO public.galaxy VALUES (6, 'pinwheel', 6, 770000, 900.03, 'spins rapily', false, false);
INSERT INTO public.galaxy VALUES (7, 'lmc', 7, 880000, 900.34, 'red in color', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'metis', 1, 450000, 500.23, 'cloudy shape', false, false, 3);
INSERT INTO public.moon VALUES (2, 'mercury', 2, 550000, 600.23, 'poisonous gases', false, true, 3);
INSERT INTO public.moon VALUES (3, 'Venus', 3, 660000, 700.13, 'blue in color', false, true, 3);
INSERT INTO public.moon VALUES (4, 'Mars', 4, 660000, 700.08, 'Red surfacce', false, true, 3);
INSERT INTO public.moon VALUES (5, 'Saturn', 5, 660000, 800.07, 'has rings', false, true, 3);
INSERT INTO public.moon VALUES (6, 'pluto', 6, 770000, 900.03, 'smallest lanet', false, true, 3);
INSERT INTO public.moon VALUES (7, 'neptune', 7, 880000, 900.34, 'largest planet', false, true, 3);
INSERT INTO public.moon VALUES (8, 'Asteroi belt', 8, 660000, 200.23, 'lie bewtween mercury and venus', false, true, 3);
INSERT INTO public.moon VALUES (9, 'Jupiter', 9, 200000, 300.12, 'biggest planet', false, true, 3);
INSERT INTO public.moon VALUES (10, 'trans neptunian', 10, 100000, 200.04, 'icy material', false, true, 3);
INSERT INTO public.moon VALUES (11, 'planet nine', 11, 300000, 100.21, 'tens times earth', false, true, 3);
INSERT INTO public.moon VALUES (12, 'solar system edge', 12, 400000, 600.08, 'electroniacally charged', false, true, 3);
INSERT INTO public.moon VALUES (13, 'mercury', 14, 550000, 600.23, 'poisonous gases', false, true, 3);
INSERT INTO public.moon VALUES (14, 'Venus', 15, 660000, 700.13, 'blue in color', false, true, 3);
INSERT INTO public.moon VALUES (15, 'Mars', 16, 660000, 700.08, 'Red surfacce', false, true, 3);
INSERT INTO public.moon VALUES (16, 'Saturn', 17, 660000, 800.07, 'has rings', false, true, 3);
INSERT INTO public.moon VALUES (17, 'pluto', 18, 770000, 900.03, 'smallest lanet', false, true, 3);
INSERT INTO public.moon VALUES (18, 'neptune', 19, 880000, 900.34, 'largest planet', false, true, 3);
INSERT INTO public.moon VALUES (19, 'Asteroi belt', 20, 660000, 200.23, 'lie bewtween mercury and venus', false, true, 3);
INSERT INTO public.moon VALUES (20, 'Jupiter', 21, 200000, 300.12, 'biggest planet', false, true, 3);
INSERT INTO public.moon VALUES (21, 'trans neptunian', 22, 100000, 200.04, 'icy material', false, true, 3);
INSERT INTO public.moon VALUES (22, 'planet nine', 23, 300000, 100.21, 'tens times earth', false, true, 3);
INSERT INTO public.moon VALUES (23, 'solar system edge', 24, 400000, 600.08, 'electroniacally charged', false, true, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 1, 450000, 500.23, 'Third planet from the sun', true, true, 2);
INSERT INTO public.planet VALUES (2, 'mercury', 2, 550000, 600.23, 'poisonous gases', false, true, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 3, 660000, 700.13, 'blue in color', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 4, 660000, 700.08, 'Red surfacce', false, true, 2);
INSERT INTO public.planet VALUES (5, 'Saturn', 5, 660000, 800.07, 'has rings', false, true, 2);
INSERT INTO public.planet VALUES (6, 'pluto', 6, 770000, 900.03, 'smallest lanet', false, true, 2);
INSERT INTO public.planet VALUES (7, 'neptune', 7, 880000, 900.34, 'largest planet', false, true, 2);
INSERT INTO public.planet VALUES (8, 'Asteroi belt', 8, 660000, 200.23, 'lie bewtween mercury and venus', false, true, 2);
INSERT INTO public.planet VALUES (9, 'Jupiter', 9, 200000, 300.12, 'biggest planet', false, true, 2);
INSERT INTO public.planet VALUES (10, 'trans neptunian', 10, 100000, 200.04, 'icy material', false, true, 2);
INSERT INTO public.planet VALUES (11, 'planet nine', 11, 300000, 100.21, 'tens times earth', false, true, 2);
INSERT INTO public.planet VALUES (12, 'solar system edge', 12, 400000, 600.08, 'electroniacally charged', false, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'lacerta', 1, 450000, 500.23, 'blue in color', false, false, 1);
INSERT INTO public.star VALUES (3, 'Rigel', 2, 550000, 600.23, 'blue in color', false, false, 1);
INSERT INTO public.star VALUES (4, 'sirius', 3, 660000, 700.13, 'blue in color', false, false, 1);
INSERT INTO public.star VALUES (5, 'Proyci', 4, 660000, 700.08, 'white in color', false, false, 1);
INSERT INTO public.star VALUES (6, 'sun', 5, 660000, 800.07, 'hottest star', false, false, 1);
INSERT INTO public.star VALUES (7, 'Arcuturs', 6, 770000, 900.03, 'orange in color', false, false, 1);
INSERT INTO public.star VALUES (8, 'Belgeuteuse', 7, 880000, 900.34, 'red in color', false, false, 1);


--
-- Name: comets_comets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comets_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comets comets_comets_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_comets_id_key UNIQUE (comets_id);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

