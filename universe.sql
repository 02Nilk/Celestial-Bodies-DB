--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: favorite_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.favorite_moons (
    name character varying(20) NOT NULL,
    rank integer NOT NULL,
    in_solar_system boolean,
    favorite_moons_id integer NOT NULL
);


ALTER TABLE public.favorite_moons OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    million_ly_from_earth numeric(3,2),
    discovered_by text,
    shape text
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
    name character varying(20) NOT NULL,
    in_solar_system boolean NOT NULL,
    diameter_in_mi numeric(7,3),
    planet_id integer
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
    name character varying(20) NOT NULL,
    in_solar_system boolean NOT NULL,
    moons integer,
    star_id integer
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
    name character varying(20) NOT NULL,
    planets integer,
    type text,
    galaxy_id integer
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
-- Data for Name: favorite_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.favorite_moons VALUES ('Moon', 1, true, 1);
INSERT INTO public.favorite_moons VALUES ('Titan', 2, true, 10);
INSERT INTO public.favorite_moons VALUES ('Io', 3, true, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 'Galilei', 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.50, 'Al-Sufi', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Draco Dwarf', 0.07, 'Wilson', 'Spheroidal');
INSERT INTO public.galaxy VALUES (4, 'Segue 2', 0.11, 'Sloan', 'Dwarf Spheroidal');
INSERT INTO public.galaxy VALUES (5, 'Leo IV', 0.50, 'Sloan', 'Dwarf Spheroidal');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 2.73, 'Hodierna', 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 2159.100, 7);
INSERT INTO public.moon VALUES (2, 'Ganymede', true, 3273.500, 9);
INSERT INTO public.moon VALUES (3, 'Io', true, 2263.800, 9);
INSERT INTO public.moon VALUES (4, 'Triton', true, 1681.900, 12);
INSERT INTO public.moon VALUES (5, 'Iapetus', true, 912.790, 10);
INSERT INTO public.moon VALUES (6, 'Ariel', true, 719.420, 11);
INSERT INTO public.moon VALUES (7, 'Enceladus', true, 313.300, 10);
INSERT INTO public.moon VALUES (8, 'Hyperion', true, 167.770, 10);
INSERT INTO public.moon VALUES (9, 'Deimos', true, 7.705, 8);
INSERT INTO public.moon VALUES (10, 'Titan', true, 3199.700, 10);
INSERT INTO public.moon VALUES (11, 'Umbriel', true, 726.630, 11);
INSERT INTO public.moon VALUES (12, 'Rhea', true, 949.210, 10);
INSERT INTO public.moon VALUES (13, 'Tethys', true, 659.900, 10);
INSERT INTO public.moon VALUES (14, 'Dione', true, 697.680, 10);
INSERT INTO public.moon VALUES (15, 'Miranda', true, 293.040, 11);
INSERT INTO public.moon VALUES (16, 'Epimetheus', true, 72.203, 10);
INSERT INTO public.moon VALUES (17, 'Mimas', true, 246.300, 10);
INSERT INTO public.moon VALUES (18, 'Callisto', true, 2995.400, 9);
INSERT INTO public.moon VALUES (19, 'Europa', true, 1939.700, 9);
INSERT INTO public.moon VALUES (20, 'Oberon', true, 946.220, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'proxima b', false, NULL, 3);
INSERT INTO public.planet VALUES (2, 'proxima c', false, NULL, 3);
INSERT INTO public.planet VALUES (3, 'proxima d', false, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Barnards Star b', false, NULL, 6);
INSERT INTO public.planet VALUES (5, 'Mercury', true, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Venus', true, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Earth', true, 1, 1);
INSERT INTO public.planet VALUES (8, 'Mars', true, 2, 1);
INSERT INTO public.planet VALUES (9, 'Jupiter', true, 95, 1);
INSERT INTO public.planet VALUES (10, 'Saturn', true, 146, 1);
INSERT INTO public.planet VALUES (11, 'Uranus', true, 28, 1);
INSERT INTO public.planet VALUES (12, 'Neptune', true, 16, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 'yellow dwarf', 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', NULL, 'Spectroscopic Binary', 2);
INSERT INTO public.star VALUES (3, 'Proxima', 3, 'Red Dwarf', 1);
INSERT INTO public.star VALUES (4, 'UY Scuti', NULL, 'Red SuperGiant', 1);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', NULL, 'Red Hypergiant', 1);
INSERT INTO public.star VALUES (6, 'Barnards Star', 3, 'Red Dwarf', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: favorite_moons favorite_moons_name_rank_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.favorite_moons
    ADD CONSTRAINT favorite_moons_name_rank_key UNIQUE (name, rank);


--
-- Name: favorite_moons favorite_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.favorite_moons
    ADD CONSTRAINT favorite_moons_pkey PRIMARY KEY (favorite_moons_id);


--
-- Name: galaxy galaxy_galaxy_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_name_key UNIQUE (galaxy_id, name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_name_key UNIQUE (moon_id, name);


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
-- Name: planet planet_planet_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_name_key UNIQUE (planet_id, name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_name_key UNIQUE (star_id, name);


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

