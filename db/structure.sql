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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: artist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist (
    id integer NOT NULL,
    name text,
    realname text,
    profile text,
    data_quality text,
    ingested boolean DEFAULT false NOT NULL
);


--
-- Name: artist_alias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_alias (
    artist_id integer NOT NULL,
    alias_name text NOT NULL,
    alias_artist_id integer
);


--
-- Name: artist_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_image (
    artist_id integer NOT NULL,
    type text,
    width integer,
    height integer
);


--
-- Name: artist_namevariation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_namevariation (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: artist_namevariation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_namevariation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_namevariation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_namevariation_id_seq OWNED BY public.artist_namevariation.id;


--
-- Name: artist_url; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artist_url (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    url text
);


--
-- Name: artist_url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artist_url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artist_url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artist_url_id_seq OWNED BY public.artist_url.id;


--
-- Name: group_member; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_member (
    group_artist_id integer NOT NULL,
    member_artist_id integer NOT NULL,
    member_name text NOT NULL
);


--
-- Name: label; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: label_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.label_image (
    label_id integer NOT NULL,
    type text,
    width integer,
    height integer
);


--
-- Name: label_url; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.label_url (
    id integer NOT NULL,
    label_id integer NOT NULL,
    url text NOT NULL
);


--
-- Name: label_url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.label_url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: label_url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.label_url_id_seq OWNED BY public.label_url.id;


--
-- Name: master; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.master (
    id integer NOT NULL,
    title text NOT NULL,
    year integer,
    main_release integer NOT NULL,
    data_quality text,
    vinyl boolean DEFAULT false NOT NULL,
    ingested boolean DEFAULT false NOT NULL
);


--
-- Name: master_artist; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: master_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.master_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: master_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.master_artist_id_seq OWNED BY public.master_artist.id;


--
-- Name: master_genre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.master_genre (
    id integer NOT NULL,
    master_id integer NOT NULL,
    genre text
);


--
-- Name: master_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.master_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: master_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.master_genre_id_seq OWNED BY public.master_genre.id;


--
-- Name: master_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.master_image (
    master_id integer NOT NULL,
    type text,
    width integer,
    height integer
);


--
-- Name: master_style; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.master_style (
    id integer NOT NULL,
    master_id integer NOT NULL,
    style text
);


--
-- Name: master_style_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.master_style_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: master_style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.master_style_id_seq OWNED BY public.master_style.id;


--
-- Name: master_video; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.master_video (
    id integer NOT NULL,
    master_id integer NOT NULL,
    duration integer,
    title text,
    description text,
    uri text
);


--
-- Name: master_video_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.master_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: master_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.master_video_id_seq OWNED BY public.master_video.id;


--
-- Name: release; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: release_artist; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: release_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_artist_id_seq OWNED BY public.release_artist.id;


--
-- Name: release_company; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: release_company_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_company_id_seq OWNED BY public.release_company.id;


--
-- Name: release_format; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.release_format (
    id integer NOT NULL,
    release_id integer NOT NULL,
    name text,
    qty numeric,
    text_string text,
    descriptions text
);


--
-- Name: release_format_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_format_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_format_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_format_id_seq OWNED BY public.release_format.id;


--
-- Name: release_genre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.release_genre (
    id integer NOT NULL,
    release_id integer NOT NULL,
    genre text
);


--
-- Name: release_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_genre_id_seq OWNED BY public.release_genre.id;


--
-- Name: release_identifier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.release_identifier (
    id integer NOT NULL,
    release_id integer NOT NULL,
    description text,
    type text,
    value text
);


--
-- Name: release_identifier_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_identifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_identifier_id_seq OWNED BY public.release_identifier.id;


--
-- Name: release_image; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.release_image (
    release_id integer NOT NULL,
    type text,
    width integer,
    height integer
);


--
-- Name: release_label; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.release_label (
    id integer NOT NULL,
    release_id integer NOT NULL,
    label_id integer,
    label_name text NOT NULL,
    catno text
);


--
-- Name: release_label_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_label_id_seq OWNED BY public.release_label.id;


--
-- Name: release_style; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.release_style (
    release_id integer NOT NULL,
    style text
);


--
-- Name: release_track; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: release_track_artist; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: release_track_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_track_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_track_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_track_artist_id_seq OWNED BY public.release_track_artist.id;


--
-- Name: release_track_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_track_id_seq OWNED BY public.release_track.id;


--
-- Name: release_video; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.release_video (
    id integer NOT NULL,
    release_id integer NOT NULL,
    duration integer,
    title text,
    description text,
    uri text
);


--
-- Name: release_video_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.release_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: release_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.release_video_id_seq OWNED BY public.release_video.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: artist_namevariation id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_namevariation ALTER COLUMN id SET DEFAULT nextval('public.artist_namevariation_id_seq'::regclass);


--
-- Name: artist_url id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist_url ALTER COLUMN id SET DEFAULT nextval('public.artist_url_id_seq'::regclass);


--
-- Name: label_url id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.label_url ALTER COLUMN id SET DEFAULT nextval('public.label_url_id_seq'::regclass);


--
-- Name: master_artist id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_artist ALTER COLUMN id SET DEFAULT nextval('public.master_artist_id_seq'::regclass);


--
-- Name: master_genre id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_genre ALTER COLUMN id SET DEFAULT nextval('public.master_genre_id_seq'::regclass);


--
-- Name: master_style id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_style ALTER COLUMN id SET DEFAULT nextval('public.master_style_id_seq'::regclass);


--
-- Name: master_video id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_video ALTER COLUMN id SET DEFAULT nextval('public.master_video_id_seq'::regclass);


--
-- Name: release_artist id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_artist ALTER COLUMN id SET DEFAULT nextval('public.release_artist_id_seq'::regclass);


--
-- Name: release_company id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_company ALTER COLUMN id SET DEFAULT nextval('public.release_company_id_seq'::regclass);


--
-- Name: release_format id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_format ALTER COLUMN id SET DEFAULT nextval('public.release_format_id_seq'::regclass);


--
-- Name: release_genre id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_genre ALTER COLUMN id SET DEFAULT nextval('public.release_genre_id_seq'::regclass);


--
-- Name: release_identifier id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_identifier ALTER COLUMN id SET DEFAULT nextval('public.release_identifier_id_seq'::regclass);


--
-- Name: release_label id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_label ALTER COLUMN id SET DEFAULT nextval('public.release_label_id_seq'::regclass);


--
-- Name: release_track id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_track ALTER COLUMN id SET DEFAULT nextval('public.release_track_id_seq'::regclass);


--
-- Name: release_track_artist id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_track_artist ALTER COLUMN id SET DEFAULT nextval('public.release_track_artist_id_seq'::regclass);


--
-- Name: release_video id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release_video ALTER COLUMN id SET DEFAULT nextval('public.release_video_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: master master_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master
    ADD CONSTRAINT master_pkey PRIMARY KEY (id);


--
-- Name: release release_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_artist_alias_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_alias_on_artist_id ON public.artist_alias USING btree (artist_id);


--
-- Name: index_artist_image_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_image_on_artist_id ON public.artist_image USING btree (artist_id);


--
-- Name: index_artist_namevariation_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_namevariation_on_artist_id ON public.artist_namevariation USING btree (artist_id);


--
-- Name: index_artist_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_on_name ON public.artist USING btree (name);


--
-- Name: index_artist_url_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_artist_url_on_artist_id ON public.artist_url USING btree (artist_id);


--
-- Name: index_group_member_on_group_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_member_on_group_artist_id ON public.group_member USING btree (group_artist_id);


--
-- Name: index_group_member_on_member_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_member_on_member_artist_id ON public.group_member USING btree (member_artist_id);


--
-- Name: index_label_image_on_label_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_label_image_on_label_id ON public.label_image USING btree (label_id);


--
-- Name: index_label_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_label_on_name ON public.label USING btree (name);


--
-- Name: index_label_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_label_on_parent_id ON public.label USING btree (parent_id);


--
-- Name: index_label_url_on_label_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_label_url_on_label_id ON public.label_url USING btree (label_id);


--
-- Name: index_master_artist_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_master_artist_on_artist_id ON public.master_artist USING btree (artist_id);


--
-- Name: index_master_artist_on_master_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_master_artist_on_master_id ON public.master_artist USING btree (master_id);


--
-- Name: index_master_genre_on_master_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_master_genre_on_master_id ON public.master_genre USING btree (master_id);


--
-- Name: index_master_image_on_master_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_master_image_on_master_id ON public.master_image USING btree (master_id);


--
-- Name: index_master_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_master_on_title ON public.master USING btree (title);


--
-- Name: index_master_style_on_master_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_master_style_on_master_id ON public.master_style USING btree (master_id);


--
-- Name: index_master_video_on_master_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_master_video_on_master_id ON public.master_video USING btree (master_id);


--
-- Name: index_release_artist_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_artist_on_artist_id ON public.release_artist USING btree (artist_id);


--
-- Name: index_release_artist_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_artist_on_release_id ON public.release_artist USING btree (release_id);


--
-- Name: index_release_company_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_company_on_release_id ON public.release_company USING btree (release_id);


--
-- Name: index_release_format_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_format_on_release_id ON public.release_format USING btree (release_id);


--
-- Name: index_release_genre_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_genre_on_release_id ON public.release_genre USING btree (release_id);


--
-- Name: index_release_identifier_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_identifier_on_release_id ON public.release_identifier USING btree (release_id);


--
-- Name: index_release_image_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_image_on_release_id ON public.release_image USING btree (release_id);


--
-- Name: index_release_label_on_label_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_label_on_label_id ON public.release_label USING btree (label_id);


--
-- Name: index_release_label_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_label_on_release_id ON public.release_label USING btree (release_id);


--
-- Name: index_release_on_master_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_on_master_id ON public.release USING btree (master_id);


--
-- Name: index_release_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_on_title ON public.release USING btree (title);


--
-- Name: index_release_style_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_style_on_release_id ON public.release_style USING btree (release_id);


--
-- Name: index_release_track_artist_on_artist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_track_artist_on_artist_id ON public.release_track_artist USING btree (artist_id);


--
-- Name: index_release_track_artist_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_track_artist_on_release_id ON public.release_track_artist USING btree (release_id);


--
-- Name: index_release_track_artist_on_track_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_track_artist_on_track_id ON public.release_track_artist USING btree (track_id);


--
-- Name: index_release_track_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_track_on_release_id ON public.release_track USING btree (release_id);


--
-- Name: index_release_track_on_track_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_track_on_track_id ON public.release_track USING btree (track_id);


--
-- Name: index_release_video_on_release_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_release_video_on_release_id ON public.release_video USING btree (release_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20260205121628'),
('20260205115424'),
('20260202233548'),
('20260201162647');

