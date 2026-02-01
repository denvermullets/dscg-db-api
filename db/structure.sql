--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Homebrew)
-- Dumped by pg_dump version 16.4 (Homebrew)

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
-- Name: artist; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.artist (
    id integer NOT NULL,
    name text,
    realname text,
    profile text,
    data_quality text
);


ALTER TABLE public.artist OWNER TO denvermullets;

--
-- Name: artist_alias; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.artist_alias (
    artist_id integer NOT NULL,
    alias_name text NOT NULL,
    alias_artist_id integer
);


ALTER TABLE public.artist_alias OWNER TO denvermullets;

--
-- Name: artist_image; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.artist_image (
    artist_id integer NOT NULL,
    type text,
    width integer,
    height integer
);


ALTER TABLE public.artist_image OWNER TO denvermullets;

--
-- Name: artist_namevariation; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.artist_namevariation (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.artist_namevariation OWNER TO denvermullets;

--
-- Name: artist_namevariation_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.artist_namevariation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artist_namevariation_id_seq OWNER TO denvermullets;

--
-- Name: artist_namevariation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.artist_namevariation_id_seq OWNED BY public.artist_namevariation.id;


--
-- Name: artist_url; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.artist_url (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    url text
);


ALTER TABLE public.artist_url OWNER TO denvermullets;

--
-- Name: artist_url_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.artist_url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artist_url_id_seq OWNER TO denvermullets;

--
-- Name: artist_url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.artist_url_id_seq OWNED BY public.artist_url.id;


--
-- Name: group_member; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.group_member (
    group_artist_id integer NOT NULL,
    member_artist_id integer NOT NULL,
    member_name text NOT NULL
);


ALTER TABLE public.group_member OWNER TO denvermullets;

--
-- Name: label; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.label (
    id integer NOT NULL,
    name text NOT NULL,
    contact_info text,
    profile text,
    parent_id integer,
    parent_name text,
    data_quality text
);


ALTER TABLE public.label OWNER TO denvermullets;

--
-- Name: label_image; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.label_image (
    label_id integer NOT NULL,
    type text,
    width integer,
    height integer
);


ALTER TABLE public.label_image OWNER TO denvermullets;

--
-- Name: label_url; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.label_url (
    id integer NOT NULL,
    label_id integer NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.label_url OWNER TO denvermullets;

--
-- Name: label_url_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.label_url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.label_url_id_seq OWNER TO denvermullets;

--
-- Name: label_url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.label_url_id_seq OWNED BY public.label_url.id;


--
-- Name: master; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.master (
    id integer NOT NULL,
    title text NOT NULL,
    year integer,
    main_release integer NOT NULL,
    data_quality text
);


ALTER TABLE public.master OWNER TO denvermullets;

--
-- Name: master_artist; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.master_artist (
    id integer NOT NULL,
    master_id integer NOT NULL,
    artist_id integer NOT NULL,
    artist_name text,
    anv text,
    "position" integer,
    join_string text,
    role text
);


ALTER TABLE public.master_artist OWNER TO denvermullets;

--
-- Name: master_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.master_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.master_artist_id_seq OWNER TO denvermullets;

--
-- Name: master_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.master_artist_id_seq OWNED BY public.master_artist.id;


--
-- Name: master_genre; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.master_genre (
    id integer NOT NULL,
    master_id integer NOT NULL,
    genre text
);


ALTER TABLE public.master_genre OWNER TO denvermullets;

--
-- Name: master_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.master_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.master_genre_id_seq OWNER TO denvermullets;

--
-- Name: master_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.master_genre_id_seq OWNED BY public.master_genre.id;


--
-- Name: master_image; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.master_image (
    master_id integer NOT NULL,
    type text,
    width integer,
    height integer
);


ALTER TABLE public.master_image OWNER TO denvermullets;

--
-- Name: master_style; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.master_style (
    id integer NOT NULL,
    master_id integer NOT NULL,
    style text
);


ALTER TABLE public.master_style OWNER TO denvermullets;

--
-- Name: master_style_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.master_style_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.master_style_id_seq OWNER TO denvermullets;

--
-- Name: master_style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.master_style_id_seq OWNED BY public.master_style.id;


--
-- Name: master_video; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.master_video (
    id integer NOT NULL,
    master_id integer NOT NULL,
    duration integer,
    title text,
    description text,
    uri text
);


ALTER TABLE public.master_video OWNER TO denvermullets;

--
-- Name: master_video_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.master_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.master_video_id_seq OWNER TO denvermullets;

--
-- Name: master_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.master_video_id_seq OWNED BY public.master_video.id;


--
-- Name: release; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release (
    id integer NOT NULL,
    title text NOT NULL,
    released text,
    country text,
    notes text,
    data_quality text,
    main integer,
    master_id integer,
    status text
);


ALTER TABLE public.release OWNER TO denvermullets;

--
-- Name: release_artist; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_artist (
    id integer NOT NULL,
    release_id integer NOT NULL,
    artist_id integer NOT NULL,
    artist_name text,
    extra integer NOT NULL,
    anv text,
    "position" integer,
    join_string text,
    role text,
    tracks text
);


ALTER TABLE public.release_artist OWNER TO denvermullets;

--
-- Name: release_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_artist_id_seq OWNER TO denvermullets;

--
-- Name: release_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_artist_id_seq OWNED BY public.release_artist.id;


--
-- Name: release_company; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_company (
    id integer NOT NULL,
    release_id integer NOT NULL,
    company_id integer NOT NULL,
    company_name text NOT NULL,
    entity_type text,
    entity_type_name text,
    uri text
);


ALTER TABLE public.release_company OWNER TO denvermullets;

--
-- Name: release_company_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_company_id_seq OWNER TO denvermullets;

--
-- Name: release_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_company_id_seq OWNED BY public.release_company.id;


--
-- Name: release_format; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_format (
    id integer NOT NULL,
    release_id integer NOT NULL,
    name text,
    qty numeric,
    text_string text,
    descriptions text
);


ALTER TABLE public.release_format OWNER TO denvermullets;

--
-- Name: release_format_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_format_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_format_id_seq OWNER TO denvermullets;

--
-- Name: release_format_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_format_id_seq OWNED BY public.release_format.id;


--
-- Name: release_genre; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_genre (
    id integer NOT NULL,
    release_id integer NOT NULL,
    genre text
);


ALTER TABLE public.release_genre OWNER TO denvermullets;

--
-- Name: release_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_genre_id_seq OWNER TO denvermullets;

--
-- Name: release_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_genre_id_seq OWNED BY public.release_genre.id;


--
-- Name: release_identifier; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_identifier (
    id integer NOT NULL,
    release_id integer NOT NULL,
    description text,
    type text,
    value text
);


ALTER TABLE public.release_identifier OWNER TO denvermullets;

--
-- Name: release_identifier_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_identifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_identifier_id_seq OWNER TO denvermullets;

--
-- Name: release_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_identifier_id_seq OWNED BY public.release_identifier.id;


--
-- Name: release_image; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_image (
    release_id integer NOT NULL,
    type text,
    width integer,
    height integer
);


ALTER TABLE public.release_image OWNER TO denvermullets;

--
-- Name: release_label; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_label (
    id integer NOT NULL,
    release_id integer NOT NULL,
    label_id integer,
    label_name text NOT NULL,
    catno text
);


ALTER TABLE public.release_label OWNER TO denvermullets;

--
-- Name: release_label_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_label_id_seq OWNER TO denvermullets;

--
-- Name: release_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_label_id_seq OWNED BY public.release_label.id;


--
-- Name: release_style; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_style (
    release_id integer NOT NULL,
    style text
);


ALTER TABLE public.release_style OWNER TO denvermullets;

--
-- Name: release_track; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_track (
    id integer NOT NULL,
    release_id integer NOT NULL,
    sequence integer NOT NULL,
    "position" text,
    parent text,
    title text,
    duration text,
    track_id text
);


ALTER TABLE public.release_track OWNER TO denvermullets;

--
-- Name: release_track_artist; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_track_artist (
    id integer NOT NULL,
    track_id text,
    release_id integer NOT NULL,
    track_sequence text,
    artist_id integer NOT NULL,
    artist_name text,
    extra boolean NOT NULL,
    anv text,
    "position" integer,
    join_string text,
    role text,
    tracks text
);


ALTER TABLE public.release_track_artist OWNER TO denvermullets;

--
-- Name: release_track_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_track_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_track_artist_id_seq OWNER TO denvermullets;

--
-- Name: release_track_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_track_artist_id_seq OWNED BY public.release_track_artist.id;


--
-- Name: release_track_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_track_id_seq OWNER TO denvermullets;

--
-- Name: release_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_track_id_seq OWNED BY public.release_track.id;


--
-- Name: release_video; Type: TABLE; Schema: public; Owner: denvermullets
--

CREATE TABLE public.release_video (
    id integer NOT NULL,
    release_id integer NOT NULL,
    duration integer,
    title text,
    description text,
    uri text
);


ALTER TABLE public.release_video OWNER TO denvermullets;

--
-- Name: release_video_id_seq; Type: SEQUENCE; Schema: public; Owner: denvermullets
--

CREATE SEQUENCE public.release_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_video_id_seq OWNER TO denvermullets;

--
-- Name: release_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: denvermullets
--

ALTER SEQUENCE public.release_video_id_seq OWNED BY public.release_video.id;


--
-- Name: artist_namevariation id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.artist_namevariation ALTER COLUMN id SET DEFAULT nextval('public.artist_namevariation_id_seq'::regclass);


--
-- Name: artist_url id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.artist_url ALTER COLUMN id SET DEFAULT nextval('public.artist_url_id_seq'::regclass);


--
-- Name: label_url id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.label_url ALTER COLUMN id SET DEFAULT nextval('public.label_url_id_seq'::regclass);


--
-- Name: master_artist id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.master_artist ALTER COLUMN id SET DEFAULT nextval('public.master_artist_id_seq'::regclass);


--
-- Name: master_genre id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.master_genre ALTER COLUMN id SET DEFAULT nextval('public.master_genre_id_seq'::regclass);


--
-- Name: master_style id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.master_style ALTER COLUMN id SET DEFAULT nextval('public.master_style_id_seq'::regclass);


--
-- Name: master_video id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.master_video ALTER COLUMN id SET DEFAULT nextval('public.master_video_id_seq'::regclass);


--
-- Name: release_artist id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_artist ALTER COLUMN id SET DEFAULT nextval('public.release_artist_id_seq'::regclass);


--
-- Name: release_company id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_company ALTER COLUMN id SET DEFAULT nextval('public.release_company_id_seq'::regclass);


--
-- Name: release_format id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_format ALTER COLUMN id SET DEFAULT nextval('public.release_format_id_seq'::regclass);


--
-- Name: release_genre id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_genre ALTER COLUMN id SET DEFAULT nextval('public.release_genre_id_seq'::regclass);


--
-- Name: release_identifier id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_identifier ALTER COLUMN id SET DEFAULT nextval('public.release_identifier_id_seq'::regclass);


--
-- Name: release_label id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_label ALTER COLUMN id SET DEFAULT nextval('public.release_label_id_seq'::regclass);


--
-- Name: release_track id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_track ALTER COLUMN id SET DEFAULT nextval('public.release_track_id_seq'::regclass);


--
-- Name: release_track_artist id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_track_artist ALTER COLUMN id SET DEFAULT nextval('public.release_track_artist_id_seq'::regclass);


--
-- Name: release_video id; Type: DEFAULT; Schema: public; Owner: denvermullets
--

ALTER TABLE ONLY public.release_video ALTER COLUMN id SET DEFAULT nextval('public.release_video_id_seq'::regclass);


--
-- PostgreSQL database dump complete
--

