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
    name character varying(30) NOT NULL,
    brightest_star character varying(30) NOT NULL,
    english_name character varying(30) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    galaxy_magnitude numeric,
    constellation character varying(30) NOT NULL
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
    name character varying(30) NOT NULL,
    discovery_year integer,
    discovered_by text,
    radius_in_miles numeric NOT NULL,
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
    name character varying(30) NOT NULL,
    planet_type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    number_of_moons integer NOT NULL,
    has_rings boolean NOT NULL,
    radius_in_miles numeric NOT NULL,
    year_length_in_earth_days integer NOT NULL,
    star_id integer,
    in_constellation character varying(30)
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
    name character varying(30) NOT NULL,
    distance_in_lightyears numeric NOT NULL,
    apparent_magnitude numeric NOT NULL,
    visible_from_earth boolean NOT NULL,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (3, 'Aquarius', 'Sadalsuud', 'Water Bearer', 1);
INSERT INTO public.constellation VALUES (4, 'Canes Venatici', 'Cor-Caroli', 'Hunting Dogs', 2);
INSERT INTO public.constellation VALUES (5, 'Draco', 'Eltanin', 'Dragon', 3);
INSERT INTO public.constellation VALUES (6, 'Hercules', 'Kornephoros', 'Hercules', 4);
INSERT INTO public.constellation VALUES (7, 'Leo', 'Regulus', 'Lion', 5);
INSERT INTO public.constellation VALUES (8, 'Lynx', 'Elvashak', 'Lynx', 6);
INSERT INTO public.constellation VALUES (9, 'Sagittarius', 'Kaus-Australis', 'Centaur archer', 7);
INSERT INTO public.constellation VALUES (10, 'Scorpius', 'Antares', 'Scorpion', 8);
INSERT INTO public.constellation VALUES (11, 'Ursa Major', 'Alioth', 'Great Bear', 9);
INSERT INTO public.constellation VALUES (12, 'Ursa Minor', 'Polaris', 'Little Bear', 10);
INSERT INTO public.constellation VALUES (13, 'Virgo', 'Spica', 'Virgin', 11);
INSERT INTO public.constellation VALUES (14, 'Pisces', 'Alpherg', 'Fishes', 12);
INSERT INTO public.constellation VALUES (15, 'Aries', 'Hamal', 'Ram', 13);
INSERT INTO public.constellation VALUES (16, 'Centaurus', 'Alpha Centauri', 'Centaur', 14);
INSERT INTO public.constellation VALUES (17, 'Gemini', 'Pollux', 'Twins', 15);
INSERT INTO public.constellation VALUES (18, 'Capricornus', 'Deneb AAlgedi', 'Sea Goat', 16);
INSERT INTO public.constellation VALUES (19, 'Bootes', 'Arcturus', 'Herdsman', 17);
INSERT INTO public.constellation VALUES (20, 'Coma Berenices', 'beta-Com', 'Hair of Berenice', 18);
INSERT INTO public.constellation VALUES (21, 'Cetus', 'Deneb Kaitos', 'Whale', 19);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Aquarius Dwarf', 'irregular dwarf', 14, 'Aquarius');
INSERT INTO public.galaxy VALUES (2, 'Bears Paw', 'compact dwarf', 12.3, 'Lynx');
INSERT INTO public.galaxy VALUES (3, 'Bodes Galaxy', 'spiral', 6.94, 'Ursa Major');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'starburst', 8.41, 'Ursa Major');
INSERT INTO public.galaxy VALUES (5, 'Draco Dwarf', 'spheroidal', 10.9, 'Draco');
INSERT INTO public.galaxy VALUES (6, 'Eye of Sauron', 'seyfert', 11.5, 'Canes Venatici');
INSERT INTO public.galaxy VALUES (8, 'Leo I', 'spheroidal dwarf', 11.2, 'Leo');
INSERT INTO public.galaxy VALUES (9, 'Leo II', 'spheroidal dwarf', 12.6, 'Leo');
INSERT INTO public.galaxy VALUES (10, 'Leo III', 'irregular', 12.9, 'Leo');
INSERT INTO public.galaxy VALUES (11, 'Medusa Merger', 'galaxy pair', 16.3, 'Ursa Major');
INSERT INTO public.galaxy VALUES (12, 'Virgo A', 'elliptical supergiant', 8.79, 'Virgo');
INSERT INTO public.galaxy VALUES (13, 'Milky Way', 'spiral', -20.5, 'Sagittarius');
INSERT INTO public.galaxy VALUES (7, 'Hercules A', 'radio galaxy', 18.25, 'Hercules');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, 1077.19, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 'A. Hall', 6.87, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 'A. Hall', 3.84, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 'Galileo', 1129.32, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 'Galileo', 967.70, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 1610, 'Galileo', 1494.39, 5);
INSERT INTO public.moon VALUES (7, 'Metis', 1980, 'Voyager Science Team', 13.33, 5);
INSERT INTO public.moon VALUES (8, 'Dione', 1684, 'G.D. Cassini', 348.07, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1687, 'G.D. Cassini', 473.37, 6);
INSERT INTO public.moon VALUES (10, 'Titan', 1655, 'C. Huygens', 1596.35, 6);
INSERT INTO public.moon VALUES (11, 'Hyperion', 1848, 'W. Bond, W. Lassell', 83.70, 6);
INSERT INTO public.moon VALUES (12, 'Prometheus', 1980, 'Voyager Science Team', 26.72, 6);
INSERT INTO public.moon VALUES (13, 'Atlas', 1980, 'Voyager Science Team', 9.36, 6);
INSERT INTO public.moon VALUES (14, 'Pandora', 1980, 'Voyager Science Team', 25.17, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 1851, 'W. Lassell', 358.92, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 1787, 'W. Herschel', 489.12, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 1787, 'W. Herschel', 472.07, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 1846, 'W. Lassell', 838.61, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 1989, 'Voyager Science Team', 128.96, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 1978, 'J. Christy', 375.72, 9);
INSERT INTO public.moon VALUES (21, 'Nix', 2005, 'H.A. Weaver, S.A. Stern, et al.', 11.16, 9);
INSERT INTO public.moon VALUES (22, 'Hydra', 2005, 'H.A. Waever, S.A. Stern, et al.', 11.47, 9);
INSERT INTO public.moon VALUES (23, 'Styx', 2012, 'M.R. Showalter, H.A. Weaver, et al.', 3.22, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 0, false, 1516.0, 88, 12, 'Pisces');
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 0, false, 3760.4, 225, 13, 'Aries');
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 2, false, 2106.1, 687, 15, 'Gemini');
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 80, true, 43440.7, 4333, 12, 'Pisces');
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 84, true, 36183.7, 10759, 1, 'Aquarius');
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 27, true, 15759.2, 30687, 13, 'Aries');
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 14, true, 15299.4, 60190, 12, 'Pisces');
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', false, 5, false, 715.2, 90530, 16, 'Capricornus');
INSERT INTO public.planet VALUES (10, 'Gonggong', 'Dwarf Planet', false, 1, false, 380.0, 202484, 1, 'Aquarius');
INSERT INTO public.planet VALUES (11, 'Huamea', 'Dwarf Planet', false, 2, true, 385.0, 103410, 17, 'Bootes');
INSERT INTO public.planet VALUES (12, 'Ceres', 'Dwarf Planet', false, 0, false, 296.0, 1682, 18, 'Coma Berenices');
INSERT INTO public.planet VALUES (13, 'Eris', 'Dwarf Planet', false, 1, false, 722.0, 203305, 19, 'Cetus');
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 1, false, 3958.8, 365, 14, 'Centaurus');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sadalsuud', 537.34, 2.9, true, 13);
INSERT INTO public.star VALUES (2, 'Cor-Caroli', 114.81, 2.89, true, 13);
INSERT INTO public.star VALUES (3, 'Eltanin', 154.2, 2.24, true, 13);
INSERT INTO public.star VALUES (4, 'Kornephoros', 139.15, 2.78, true, 13);
INSERT INTO public.star VALUES (5, 'Regulus', 79.3, 1.36, true, 13);
INSERT INTO public.star VALUES (6, 'Elvashak', 203.09, 3.14, true, 13);
INSERT INTO public.star VALUES (7, 'Kaus-Australis', 143.31, 1.79, true, 13);
INSERT INTO public.star VALUES (8, 'Antares', 553.76, 1.06, true, 13);
INSERT INTO public.star VALUES (9, 'Alioth', 82.55, 1.76, true, 13);
INSERT INTO public.star VALUES (10, 'Polaris', 432.58, 1.97, true, 13);
INSERT INTO public.star VALUES (11, 'Spica', 249.74, 0.98, true, 13);
INSERT INTO public.star VALUES (12, 'Alpherg', 349, 3.62, true, 13);
INSERT INTO public.star VALUES (13, 'Hamal', 65.88, 2.00, true, 13);
INSERT INTO public.star VALUES (14, 'Aplha Centauri', 4.367, -0.27, true, 13);
INSERT INTO public.star VALUES (15, 'Pollux', 33.72, 1.15, true, 13);
INSERT INTO public.star VALUES (16, 'Deneb Algedi', 38.71, 2.85, true, 13);
INSERT INTO public.star VALUES (17, 'Arcturus', 36.66, -0.05, true, 13);
INSERT INTO public.star VALUES (18, 'beta-Com', 29.95, 4.26, true, 13);
INSERT INTO public.star VALUES (19, 'Deneb Kaitos', 96.22, 2.04, true, 13);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 21, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 19, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

