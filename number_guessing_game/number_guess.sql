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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    tries integer NOT NULL
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_game_id_seq OWNED BY public.game.game_id;


--
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    player_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_player_id_seq OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_player_id_seq OWNED BY public.player.player_id;


--
-- Name: game game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game ALTER COLUMN game_id SET DEFAULT nextval('public.game_game_id_seq'::regclass);


--
-- Name: player player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player ALTER COLUMN player_id SET DEFAULT nextval('public.player_player_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (1, 1, 3);
INSERT INTO public.game VALUES (2, 10, 707);
INSERT INTO public.game VALUES (3, 10, 466);
INSERT INTO public.game VALUES (4, 11, 422);
INSERT INTO public.game VALUES (5, 11, 482);
INSERT INTO public.game VALUES (6, 10, 419);
INSERT INTO public.game VALUES (7, 10, 411);
INSERT INTO public.game VALUES (8, 10, 291);
INSERT INTO public.game VALUES (9, 13, 977);
INSERT INTO public.game VALUES (10, 13, 709);
INSERT INTO public.game VALUES (11, 14, 993);
INSERT INTO public.game VALUES (12, 14, 284);
INSERT INTO public.game VALUES (13, 13, 626);
INSERT INTO public.game VALUES (14, 13, 567);
INSERT INTO public.game VALUES (15, 13, 274);
INSERT INTO public.game VALUES (16, 1, 12);
INSERT INTO public.game VALUES (17, 16, 261);
INSERT INTO public.game VALUES (18, 16, 497);
INSERT INTO public.game VALUES (19, 17, 277);
INSERT INTO public.game VALUES (20, 17, 592);
INSERT INTO public.game VALUES (21, 16, 449);
INSERT INTO public.game VALUES (22, 16, 635);
INSERT INTO public.game VALUES (23, 16, 494);
INSERT INTO public.game VALUES (24, 18, 550);
INSERT INTO public.game VALUES (25, 18, 479);
INSERT INTO public.game VALUES (26, 19, 477);
INSERT INTO public.game VALUES (27, 19, 790);
INSERT INTO public.game VALUES (28, 18, 271);
INSERT INTO public.game VALUES (29, 18, 656);
INSERT INTO public.game VALUES (30, 18, 778);
INSERT INTO public.game VALUES (31, 1, 11);
INSERT INTO public.game VALUES (32, 20, 437);
INSERT INTO public.game VALUES (33, 20, 31);
INSERT INTO public.game VALUES (34, 21, 861);
INSERT INTO public.game VALUES (35, 21, 830);
INSERT INTO public.game VALUES (36, 20, 816);
INSERT INTO public.game VALUES (37, 20, 345);
INSERT INTO public.game VALUES (38, 20, 935);
INSERT INTO public.game VALUES (39, 22, 120);
INSERT INTO public.game VALUES (40, 22, 427);
INSERT INTO public.game VALUES (41, 23, 951);
INSERT INTO public.game VALUES (42, 23, 217);
INSERT INTO public.game VALUES (43, 22, 217);
INSERT INTO public.game VALUES (44, 22, 601);
INSERT INTO public.game VALUES (45, 22, 565);
INSERT INTO public.game VALUES (46, 24, 23);
INSERT INTO public.game VALUES (47, 24, 799);
INSERT INTO public.game VALUES (48, 25, 831);
INSERT INTO public.game VALUES (49, 25, 36);
INSERT INTO public.game VALUES (50, 24, 991);
INSERT INTO public.game VALUES (51, 24, 837);
INSERT INTO public.game VALUES (52, 24, 28);
INSERT INTO public.game VALUES (53, 26, 489);
INSERT INTO public.game VALUES (54, 26, 41);
INSERT INTO public.game VALUES (55, 27, 226);
INSERT INTO public.game VALUES (56, 27, 862);
INSERT INTO public.game VALUES (57, 26, 170);
INSERT INTO public.game VALUES (58, 26, 406);
INSERT INTO public.game VALUES (59, 26, 477);
INSERT INTO public.game VALUES (60, 28, 84);
INSERT INTO public.game VALUES (61, 28, 179);
INSERT INTO public.game VALUES (62, 29, 626);
INSERT INTO public.game VALUES (63, 29, 672);
INSERT INTO public.game VALUES (64, 28, 190);
INSERT INTO public.game VALUES (65, 28, 488);
INSERT INTO public.game VALUES (66, 28, 951);
INSERT INTO public.game VALUES (67, 30, 286);
INSERT INTO public.game VALUES (68, 30, 80);
INSERT INTO public.game VALUES (69, 31, 675);
INSERT INTO public.game VALUES (70, 31, 283);
INSERT INTO public.game VALUES (71, 30, 574);
INSERT INTO public.game VALUES (72, 30, 469);
INSERT INTO public.game VALUES (73, 30, 881);
INSERT INTO public.game VALUES (74, 32, 563);
INSERT INTO public.game VALUES (75, 32, 447);
INSERT INTO public.game VALUES (76, 33, 902);
INSERT INTO public.game VALUES (77, 33, 874);
INSERT INTO public.game VALUES (78, 32, 342);
INSERT INTO public.game VALUES (79, 32, 809);
INSERT INTO public.game VALUES (80, 32, 565);
INSERT INTO public.game VALUES (81, 34, 502);
INSERT INTO public.game VALUES (82, 34, 352);
INSERT INTO public.game VALUES (83, 35, 964);
INSERT INTO public.game VALUES (84, 35, 369);
INSERT INTO public.game VALUES (85, 34, 848);
INSERT INTO public.game VALUES (86, 34, 332);
INSERT INTO public.game VALUES (87, 34, 704);
INSERT INTO public.game VALUES (88, 36, 785);
INSERT INTO public.game VALUES (89, 36, 985);
INSERT INTO public.game VALUES (90, 37, 220);
INSERT INTO public.game VALUES (91, 37, 164);
INSERT INTO public.game VALUES (92, 36, 150);
INSERT INTO public.game VALUES (93, 36, 430);
INSERT INTO public.game VALUES (94, 36, 870);
INSERT INTO public.game VALUES (95, 38, 874);
INSERT INTO public.game VALUES (96, 38, 746);
INSERT INTO public.game VALUES (97, 39, 733);
INSERT INTO public.game VALUES (98, 39, 260);
INSERT INTO public.game VALUES (99, 38, 332);
INSERT INTO public.game VALUES (100, 38, 467);
INSERT INTO public.game VALUES (101, 38, 649);
INSERT INTO public.game VALUES (102, 40, 505);
INSERT INTO public.game VALUES (103, 40, 447);
INSERT INTO public.game VALUES (104, 41, 853);
INSERT INTO public.game VALUES (105, 41, 355);
INSERT INTO public.game VALUES (106, 40, 553);
INSERT INTO public.game VALUES (107, 40, 600);
INSERT INTO public.game VALUES (108, 40, 680);
INSERT INTO public.game VALUES (109, 2, 10);
INSERT INTO public.game VALUES (110, 42, 464);
INSERT INTO public.game VALUES (111, 42, 985);
INSERT INTO public.game VALUES (112, 43, 963);
INSERT INTO public.game VALUES (113, 43, 822);
INSERT INTO public.game VALUES (114, 42, 617);
INSERT INTO public.game VALUES (115, 42, 529);
INSERT INTO public.game VALUES (116, 42, 348);
INSERT INTO public.game VALUES (117, 44, 637);
INSERT INTO public.game VALUES (118, 44, 386);
INSERT INTO public.game VALUES (119, 45, 655);
INSERT INTO public.game VALUES (120, 45, 615);
INSERT INTO public.game VALUES (121, 44, 750);
INSERT INTO public.game VALUES (122, 44, 69);
INSERT INTO public.game VALUES (123, 44, 156);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES (1, 'Test');
INSERT INTO public.player VALUES (2, 'Vilo');
INSERT INTO public.player VALUES (3, 'TEST');
INSERT INTO public.player VALUES (4, 'user_1685386962555');
INSERT INTO public.player VALUES (5, 'user_1685386962554');
INSERT INTO public.player VALUES (6, 'user_1685387646453');
INSERT INTO public.player VALUES (7, 'user_1685387646452');
INSERT INTO public.player VALUES (8, 'user_1685389785509');
INSERT INTO public.player VALUES (9, 'user_1685389785508');
INSERT INTO public.player VALUES (10, 'user_1685390274481');
INSERT INTO public.player VALUES (11, 'user_1685390274480');
INSERT INTO public.player VALUES (12, '');
INSERT INTO public.player VALUES (13, 'user_1685391098008');
INSERT INTO public.player VALUES (14, 'user_1685391098007');
INSERT INTO public.player VALUES (15, 'Koko');
INSERT INTO public.player VALUES (16, 'user_1685391333563');
INSERT INTO public.player VALUES (17, 'user_1685391333562');
INSERT INTO public.player VALUES (18, 'user_1685391340706');
INSERT INTO public.player VALUES (19, 'user_1685391340705');
INSERT INTO public.player VALUES (20, 'user_1685391447310');
INSERT INTO public.player VALUES (21, 'user_1685391447309');
INSERT INTO public.player VALUES (22, 'user_1685391456517');
INSERT INTO public.player VALUES (23, 'user_1685391456516');
INSERT INTO public.player VALUES (24, 'user_1685391466506');
INSERT INTO public.player VALUES (25, 'user_1685391466505');
INSERT INTO public.player VALUES (26, 'user_1685391681530');
INSERT INTO public.player VALUES (27, 'user_1685391681529');
INSERT INTO public.player VALUES (28, 'user_1685391715295');
INSERT INTO public.player VALUES (29, 'user_1685391715294');
INSERT INTO public.player VALUES (30, 'user_1685391802051');
INSERT INTO public.player VALUES (31, 'user_1685391802050');
INSERT INTO public.player VALUES (32, 'user_1685391825992');
INSERT INTO public.player VALUES (33, 'user_1685391825991');
INSERT INTO public.player VALUES (34, 'user_1685391843455');
INSERT INTO public.player VALUES (35, 'user_1685391843454');
INSERT INTO public.player VALUES (36, 'user_1685392243425');
INSERT INTO public.player VALUES (37, 'user_1685392243424');
INSERT INTO public.player VALUES (38, 'user_1685392281438');
INSERT INTO public.player VALUES (39, 'user_1685392281437');
INSERT INTO public.player VALUES (40, 'user_1685392325735');
INSERT INTO public.player VALUES (41, 'user_1685392325734');
INSERT INTO public.player VALUES (42, 'user_1685392432434');
INSERT INTO public.player VALUES (43, 'user_1685392432433');
INSERT INTO public.player VALUES (44, 'user_1685392631665');
INSERT INTO public.player VALUES (45, 'user_1685392631664');


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_game_id_seq', 123, true);


--
-- Name: player_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_player_id_seq', 45, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);


--
-- Name: player player_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_name_key UNIQUE (name);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);


--
-- Name: game game_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(player_id);


--
-- PostgreSQL database dump complete
--


