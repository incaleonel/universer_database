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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30),
    year_discovered integer NOT NULL,
    meaning text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_id_constellation_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_id_constellation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_id_constellation_seq OWNER TO freecodecamp;

--
-- Name: constellation_id_constellation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_id_constellation_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_types character varying(30)
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
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_id_seq'::regclass) NOT NULL,
    name character varying(20),
    is_spherical boolean,
    planet_id integer NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.planet_id_seq'::regclass) NOT NULL,
    name character varying(20),
    has_moon boolean,
    diameter_in_km numeric,
    amount_moon integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer DEFAULT nextval('public.star_id_seq'::regclass) NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer,
    description text,
    distance_in_light_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_id_constellation_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'aquarius', 1943, 'water-bearer');
INSERT INTO public.constellation VALUES (2, 'aries', 1943, 'ram');
INSERT INTO public.constellation VALUES (3, 'capricornus', 1933, 'sea goat');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Es el objeto visible a simple vista mas lejado de la Tierra', 10000, 'Espiral');
INSERT INTO public.galaxy VALUES (3, 'Via Lactea', 'Es la galaxia donde se encuentra nuestro planeta', 13600, 'Espiral barrada');
INSERT INTO public.galaxy VALUES (4, 'Barnard', 'Forma parte del grupo local y es una de las galaxias mas cercanas a la tierra', 12000, 'Secuencia de Hubble');
INSERT INTO public.galaxy VALUES (5, 'Remolino', 'Esta galaxia de belleza deslumbrante fue uno de los descubrimientos originales de charles Messier', 400, 'Secuencia de Hubble');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Tiene un nucleo grande y brillante, una inusual protuberancia central, y una destacada banda de polvo en el disco galactico', 13250, 'Secuencia de Hubble');
INSERT INTO public.galaxy VALUES (7, 'Ojo negro', 'Esta galaxia es reconocida por los astronomos amateur, debido a que es visible con telescopios pequeños', 13280, 'Espiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', true, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 3, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 3, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', true, 7, NULL);
INSERT INTO public.moon VALUES (5, 'lo', true, 7, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 7, NULL);
INSERT INTO public.moon VALUES (7, 'Himalia', true, 7, NULL);
INSERT INTO public.moon VALUES (8, 'Elara', true, 7, NULL);
INSERT INTO public.moon VALUES (9, 'Pasipahe', true, 7, NULL);
INSERT INTO public.moon VALUES (10, 'Sinope', true, 7, NULL);
INSERT INTO public.moon VALUES (11, 'Carme', true, 7, NULL);
INSERT INTO public.moon VALUES (12, 'Ananke', true, 7, NULL);
INSERT INTO public.moon VALUES (13, 'Leda', true, 7, NULL);
INSERT INTO public.moon VALUES (14, 'Thebe', true, 7, NULL);
INSERT INTO public.moon VALUES (15, 'Adrastea', true, 7, NULL);
INSERT INTO public.moon VALUES (16, 'Metis', true, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Thaigete', true, 7, NULL);
INSERT INTO public.moon VALUES (18, 'Locaste', true, 7, NULL);
INSERT INTO public.moon VALUES (19, 'Erinome', true, 7, NULL);
INSERT INTO public.moon VALUES (20, 'Isonoe', true, 7, NULL);
INSERT INTO public.moon VALUES (21, 'Aitne', true, 7, NULL);
INSERT INTO public.moon VALUES (22, 'Aede', true, 7, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 21002, 1, 3);
INSERT INTO public.planet VALUES (3, 'Mars', true, 21002, 1, 5);
INSERT INTO public.planet VALUES (4, 'Venus', true, 1302, 1, 5);
INSERT INTO public.planet VALUES (5, 'Eris', true, 3202, 1, 5);
INSERT INTO public.planet VALUES (6, 'Uranos', true, 3202, 2, 5);
INSERT INTO public.planet VALUES (7, 'Jupiter', true, 3202, 2, 6);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 302, 0, 6);
INSERT INTO public.planet VALUES (9, 'Ceres', false, 302, 0, 6);
INSERT INTO public.planet VALUES (10, 'Orcus', true, 302, 0, 6);
INSERT INTO public.planet VALUES (11, 'Pluto', true, 302, 1, 6);
INSERT INTO public.planet VALUES (12, 'Makemake', true, 302, 1, 6);
INSERT INTO public.planet VALUES (13, 'Saturn', true, 302, 1, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Canopus', 3, 'Se encuentra en la constelacion Carina,y solo puede observarse desde el hemisferio sur', 309);
INSERT INTO public.star VALUES (3, 'Arturo', 3, 'Estrella gigante de tipo espectral de color naranja', 7);
INSERT INTO public.star VALUES (5, 'Vega', 3, 'Estrella gigante de color blanco', 25);
INSERT INTO public.star VALUES (6, 'Alpha andromedae', 2, 'La estrella mas brillante de andromeda', 97);
INSERT INTO public.star VALUES (7, 'Beta andromedae', 2, 'Es la segunda estrella mas brillante de andromeda', 199);
INSERT INTO public.star VALUES (8, 'Spica', 2, 'sarasa', 233);


--
-- Name: constellation_id_constellation_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_id_constellation_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: constellation constellation_meaning_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_meaning_key UNIQUE (meaning);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT description_unique UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_start_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_start_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

