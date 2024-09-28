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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(30) NOT NULL,
    discovery_year integer NOT NULL,
    constellation_id integer NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    is_spherical boolean,
    age_in_million_years integer NOT NULL,
    description text,
    mass numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    is_spherical boolean,
    age_in_million_years integer NOT NULL,
    description text,
    mass numeric,
    moon_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    is_spherical boolean,
    age_in_million_years integer NOT NULL,
    description text,
    mass numeric,
    planet_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    is_spherical boolean,
    age_in_million_years integer NOT NULL,
    description text,
    mass numeric,
    star_id integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Orion', 1000, 1, 'A prominent constellation located on the celestial equator.');
INSERT INTO public.constellation VALUES ('Andromeda', 1000, 2, 'A constellation named after the princess in Greek mythology.');
INSERT INTO public.constellation VALUES ('Cassiopeia', 1000, 3, 'A W-shaped constellation in the northern sky, named after a queen in Greek mythology.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', true, 13000, 'A barred spiral galaxy containing the Solar System.', 1500000000000, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', true, 10000, 'The nearest spiral galaxy to the Milky Way.', 1000000000000, 2);
INSERT INTO public.galaxy VALUES ('Triangulum', true, 3000, 'A spiral galaxy located in the constellation Triangulum.', 140000000000, 3);
INSERT INTO public.galaxy VALUES ('Whirlpool', true, 11000, 'A grand-design spiral galaxy located in the constellation Canes Venatici.', 1500000000000, 4);
INSERT INTO public.galaxy VALUES ('Sombrero', true, 10000, 'A spiral galaxy in the constellation Virgo.', 1000000000000, 5);
INSERT INTO public.galaxy VALUES ('Cartwheel', false, 200, 'A ring galaxy located in the constellation Sculptor.', 900000000000, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', true, 4500, 'It is the only natural satellite of Earth.', 73000000000000000000000, 1, 3);
INSERT INTO public.moon VALUES ('Phobos', true, 4500, 'A moon of Mars.', 10000000000000000000, 2, 4);
INSERT INTO public.moon VALUES ('Deimos', true, 4500, 'The smaller moon of Mars.', 2000000000000000000, 3, 4);
INSERT INTO public.moon VALUES ('Europa', true, 4500, 'A moon of Jupiter with a subsurface ocean.', 8000000000000000000000, 4, 5);
INSERT INTO public.moon VALUES ('Ganymede', true, 4500, 'The largest moon in the Solar System.', 150000000000000000000000, 5, 5);
INSERT INTO public.moon VALUES ('Io', true, 4500, 'A volcanic moon of Jupiter.', 89000000000000000000000, 6, 5);
INSERT INTO public.moon VALUES ('Callisto', true, 4500, 'A heavily cratered moon of Jupiter.', 107000000000000000000000, 7, 5);
INSERT INTO public.moon VALUES ('Titan', true, 4500, 'A moon of Saturn with a thick atmosphere.', 134000000000000000000000, 8, 6);
INSERT INTO public.moon VALUES ('Enceladus', true, 4500, 'A moon of Saturn with icy geysers.', 100000000000000000000, 9, 6);
INSERT INTO public.moon VALUES ('Mimas', true, 4500, 'A moon of Saturn with a large crater.', 370000000000000000000, 10, 6);
INSERT INTO public.moon VALUES ('Triton', true, 4500, 'A retrograde moon of Neptune.', 21000000000000000000000, 11, 8);
INSERT INTO public.moon VALUES ('Charon', true, 4500, 'The largest moon of Pluto.', 12500000000000000000000, 12, 9);
INSERT INTO public.moon VALUES ('Oberon', true, 4500, 'A moon of Uranus.', 3000000000000000000000, 13, 7);
INSERT INTO public.moon VALUES ('Miranda', true, 4500, 'A moon of Uranus with dramatic cliffs.', 660000000000000000000, 14, 7);
INSERT INTO public.moon VALUES ('Nereid', true, 4500, 'An irregular moon of Neptune.', 30000000000000000000, 15, 8);
INSERT INTO public.moon VALUES ('Dysnomia', true, 4500, 'A moon of the dwarf planet Eris.', 60000000000000000000, 16, 10);
INSERT INTO public.moon VALUES ('Umbriel', true, 4500, 'A dark moon of Uranus.', 12000000000000000000000, 17, 7);
INSERT INTO public.moon VALUES ('Iapetus', true, 4500, 'A two-toned moon of Saturn.', 18000000000000000000000, 18, 6);
INSERT INTO public.moon VALUES ('Hyperion', true, 4500, 'A moon of Saturn with a spongy appearance.', 560000000000000000000, 19, 6);
INSERT INTO public.moon VALUES ('Ganymede II', true, 4500, 'A fictional moon of Jupiter.', 1000000000000000000000, 20, 5);
INSERT INTO public.moon VALUES ('Titan II', true, 4500, 'A fictional moon of Saturn.', 2000000000000000000000, 21, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', true, 4500, 'The smallest planet in the Solar System.', 330000000000000000000000, 1, 1);
INSERT INTO public.planet VALUES ('Venus', true, 4500, 'The hottest planet in the Solar System.', 4870000000000000000000000, 2, 1);
INSERT INTO public.planet VALUES ('Earth', true, 4500, 'The only planet known to support life.', 5970000000000000000000000, 3, 1);
INSERT INTO public.planet VALUES ('Mars', true, 4500, 'Known as the Red Planet.', 642000000000000000000000, 4, 1);
INSERT INTO public.planet VALUES ('Jupiter', true, 4500, 'The largest planet in the Solar System.', 1898000000000000000000000000, 5, 1);
INSERT INTO public.planet VALUES ('Saturn', true, 4500, 'Famous for its ring system.', 568000000000000000000000000, 6, 1);
INSERT INTO public.planet VALUES ('Uranus', true, 4500, 'An ice giant tilted on its side.', 86800000000000000000000000, 7, 1);
INSERT INTO public.planet VALUES ('Neptune', true, 4500, 'The furthest planet from the Sun.', 102000000000000000000000000, 8, 1);
INSERT INTO public.planet VALUES ('Proxima b', true, 1000, 'A potentially habitable exoplanet in the Proxima Centauri system.', 1270000000000000000000000, 9, 2);
INSERT INTO public.planet VALUES ('Andromeda I', true, 6000, 'A rocky planet in the Andromeda galaxy.', 3200000000000000000000000, 10, 3);
INSERT INTO public.planet VALUES ('Alpha Centauri Bb', true, 5000, 'An exoplanet in the Alpha Centauri system.', 4800000000000000000000000, 11, 4);
INSERT INTO public.planet VALUES ('HD 209458 b', true, 4500, 'A gas giant exoplanet also known as Osiris.', 220000000000000000000000000, 12, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', true, 5, 'The star at the center of the Solar System.', 1989000000000000000000000000000, 1, 1);
INSERT INTO public.star VALUES ('Sirius', true, 200, 'The brightest star in the night sky.', 4020000000000000000000000000000, 2, 1);
INSERT INTO public.star VALUES ('Betelgeuse', true, 1000, 'A red supergiant star in the constellation Orion.', 1500000000000000000000000000000, 3, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', true, 4500, 'The closest known star to the Sun.', 123000000000000000000000000000, 4, 2);
INSERT INTO public.star VALUES ('Alpheratz', true, 500, 'A binary star in the constellation Andromeda.', 2500000000000000000000000000000, 5, 2);
INSERT INTO public.star VALUES ('Canopus', true, 10, 'The second-brightest star in the night sky.', 1400000000000000000000000000000, 6, 3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: constellation constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key1 UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

