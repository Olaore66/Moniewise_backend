--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: analytics_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analytics_logs (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    details jsonb,
    event_type character varying(255) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.analytics_logs OWNER TO postgres;

--
-- Name: analytics_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.analytics_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.analytics_logs_id_seq OWNER TO postgres;

--
-- Name: analytics_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.analytics_logs_id_seq OWNED BY public.analytics_logs.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.badges (
    id bigint NOT NULL,
    active boolean NOT NULL,
    created_at timestamp without time zone,
    description character varying(255),
    icon_url character varying(255),
    name character varying(255) NOT NULL,
    threshold integer NOT NULL
);


ALTER TABLE public.badges OWNER TO postgres;

--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.badges_id_seq OWNER TO postgres;

--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.badges_id_seq OWNED BY public.badges.id;


--
-- Name: budgets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.budgets (
    id bigint NOT NULL,
    allocated_amount numeric(19,2),
    created_at timestamp without time zone,
    duration_days integer NOT NULL,
    end_date date NOT NULL,
    name character varying(255) NOT NULL,
    start_date date NOT NULL,
    status character varying(255) NOT NULL,
    total_amount numeric(19,2) NOT NULL,
    user_id bigint NOT NULL,
    last_topup_time timestamp without time zone
);


ALTER TABLE public.budgets OWNER TO postgres;

--
-- Name: budgets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.budgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.budgets_id_seq OWNER TO postgres;

--
-- Name: budgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.budgets_id_seq OWNED BY public.budgets.id;


--
-- Name: envelopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.envelopes (
    id bigint NOT NULL,
    amount numeric(19,2) NOT NULL,
    conditions jsonb,
    created_at timestamp without time zone,
    name character varying(255) NOT NULL,
    remaining_amount numeric(19,2) NOT NULL,
    budget_id bigint NOT NULL,
    last_accessed timestamp without time zone
);


ALTER TABLE public.envelopes OWNER TO postgres;

--
-- Name: envelopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.envelopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.envelopes_id_seq OWNER TO postgres;

--
-- Name: envelopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.envelopes_id_seq OWNED BY public.envelopes.id;


--
-- Name: leaderboard_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leaderboard_entries (
    id bigint NOT NULL,
    rank integer,
    score numeric(19,2) NOT NULL,
    updated_at timestamp without time zone,
    leaderboard_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.leaderboard_entries OWNER TO postgres;

--
-- Name: leaderboard_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leaderboard_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leaderboard_entries_id_seq OWNER TO postgres;

--
-- Name: leaderboard_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leaderboard_entries_id_seq OWNED BY public.leaderboard_entries.id;


--
-- Name: leaderboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leaderboards (
    id bigint NOT NULL,
    end_date date NOT NULL,
    metric character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    period character varying(255) NOT NULL,
    start_date date NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.leaderboards OWNER TO postgres;

--
-- Name: leaderboards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leaderboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.leaderboards_id_seq OWNER TO postgres;

--
-- Name: leaderboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leaderboards_id_seq OWNED BY public.leaderboards.id;


--
-- Name: otps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otps (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    otp_code character varying(6) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    expires_at timestamp without time zone NOT NULL
);


ALTER TABLE public.otps OWNER TO postgres;

--
-- Name: otps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.otps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.otps_id_seq OWNER TO postgres;

--
-- Name: otps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.otps_id_seq OWNED BY public.otps.id;


--
-- Name: revenue_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revenue_logs (
    id bigint NOT NULL,
    user_id bigint,
    type character varying(50),
    amount numeric(15,2) NOT NULL,
    description character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT revenue_logs_type_check CHECK (((type)::text = ANY ((ARRAY['budget_creation'::character varying, 'movement_fee'::character varying, 'emergency_fee'::character varying, 'envelope_transfer_fee'::character varying])::text[])))
);


ALTER TABLE public.revenue_logs OWNER TO postgres;

--
-- Name: revenue_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.revenue_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.revenue_logs_id_seq OWNER TO postgres;

--
-- Name: revenue_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.revenue_logs_id_seq OWNED BY public.revenue_logs.id;


--
-- Name: transaction_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_logs (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    budget_id bigint,
    source_envelope_id bigint,
    target_envelope_id bigint,
    external_account character varying(100),
    amount numeric(15,2) NOT NULL,
    fee numeric(15,2),
    transaction_type character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.transaction_logs OWNER TO postgres;

--
-- Name: transaction_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transaction_logs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transaction_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_badges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_badges (
    id bigint NOT NULL,
    earned_at timestamp without time zone,
    badge_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_badges OWNER TO postgres;

--
-- Name: user_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_badges_id_seq OWNER TO postgres;

--
-- Name: user_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_badges_id_seq OWNED BY public.user_badges.id;


--
-- Name: user_goals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_goals (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    current_amount numeric(19,2),
    name character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    target_amount numeric(19,2) NOT NULL,
    target_date date,
    envelope_id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_goals OWNER TO postgres;

--
-- Name: user_goals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_goals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_goals_id_seq OWNER TO postgres;

--
-- Name: user_goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_goals_id_seq OWNED BY public.user_goals.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    bvn character varying(255),
    created_at timestamp without time zone,
    email character varying(255) NOT NULL,
    last_login timestamp without time zone,
    password character varying(255),
    phone character varying(255),
    role character varying(255) NOT NULL,
    profile_data jsonb,
    tnc_accepted boolean DEFAULT false,
    is_verified boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallets (
    id bigint NOT NULL,
    balance numeric(19,2) NOT NULL,
    currency character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    user_id bigint NOT NULL,
    account_number character varying(255),
    bank_name character varying(255)
);


ALTER TABLE public.wallets OWNER TO postgres;

--
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wallets_id_seq OWNER TO postgres;

--
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallets_id_seq OWNED BY public.wallets.id;


--
-- Name: analytics_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_logs ALTER COLUMN id SET DEFAULT nextval('public.analytics_logs_id_seq'::regclass);


--
-- Name: badges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges ALTER COLUMN id SET DEFAULT nextval('public.badges_id_seq'::regclass);


--
-- Name: budgets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budgets ALTER COLUMN id SET DEFAULT nextval('public.budgets_id_seq'::regclass);


--
-- Name: envelopes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envelopes ALTER COLUMN id SET DEFAULT nextval('public.envelopes_id_seq'::regclass);


--
-- Name: leaderboard_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaderboard_entries ALTER COLUMN id SET DEFAULT nextval('public.leaderboard_entries_id_seq'::regclass);


--
-- Name: leaderboards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaderboards ALTER COLUMN id SET DEFAULT nextval('public.leaderboards_id_seq'::regclass);


--
-- Name: otps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otps ALTER COLUMN id SET DEFAULT nextval('public.otps_id_seq'::regclass);


--
-- Name: revenue_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_logs ALTER COLUMN id SET DEFAULT nextval('public.revenue_logs_id_seq'::regclass);


--
-- Name: user_badges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_badges ALTER COLUMN id SET DEFAULT nextval('public.user_badges_id_seq'::regclass);


--
-- Name: user_goals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_goals ALTER COLUMN id SET DEFAULT nextval('public.user_goals_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wallets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets ALTER COLUMN id SET DEFAULT nextval('public.wallets_id_seq'::regclass);


--
-- Data for Name: analytics_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.analytics_logs (id, created_at, details, event_type, user_id) FROM stdin;
\.


--
-- Data for Name: badges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.badges (id, active, created_at, description, icon_url, name, threshold) FROM stdin;
\.


--
-- Data for Name: budgets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.budgets (id, allocated_amount, created_at, duration_days, end_date, name, start_date, status, total_amount, user_id, last_topup_time) FROM stdin;
4	0.00	2025-04-07 22:38:49.711545	30	2025-05-07	Monthly Expenses	2025-04-07	ACTIVE	10000.00	1	\N
5	0.00	2025-04-07 22:41:45.824337	30	2025-05-07	Monthly Expenses	2025-04-07	ACTIVE	50000.00	3	\N
15	15000.00	2025-04-11 15:54:15.25521	30	2025-04-30	April 2025	2025-04-01	ACTIVE	15000.00	1	\N
17	15000.00	2025-04-11 16:59:46.016674	30	2025-04-30	April 2025	2025-04-01	ACTIVE	15000.00	1	\N
18	15000.00	2025-04-11 17:42:33.492683	30	2025-04-30	April 2025	2025-04-01	ACTIVE	15000.00	1	\N
19	15000.00	2025-04-12 02:17:50.163855	30	2025-04-30	April 2025	2025-04-01	ACTIVE	15000.00	1	\N
20	15000.00	2025-04-12 02:48:44.28712	30	2025-04-30	April 2025	2025-04-01	ACTIVE	15000.00	1	\N
21	15000.00	2025-04-13 05:45:54.025942	30	2025-04-14	April Extended	2025-04-01	COMPLETED	15000.00	1	\N
16	25000.00	2025-04-11 16:37:38.449016	30	2025-04-14	April Extended	2025-04-01	COMPLETED	25000.00	1	2025-04-14 16:36:16.700523
28	100000.00	2025-04-24 16:28:33.601454	29	2025-05-19	MAY Budget	2025-04-20	ACTIVE	99900.00	12	\N
\.


--
-- Data for Name: envelopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.envelopes (id, amount, conditions, created_at, name, remaining_amount, budget_id, last_accessed) FROM stdin;
1	1999.50	{"type": "daily", "limit": 500}	2025-04-11 15:54:15.256214	Lunch	1999.50	15	\N
2	3000.00	{"type": "safe_lock"}	2025-04-11 15:54:15.259719	Fun	3000.00	15	\N
3	4999.50	{"type": "strict_lock"}	2025-04-11 15:54:15.259719	Savings	4999.50	15	\N
4	3501.00	{"type": "weekly", "limit": 1000}	2025-04-11 15:54:15.259719	Transport	3501.00	15	\N
5	1500.00	{"day": "Sunday", "type": "dynamic", "end_time": "12:00", "start_time": "08:00"}	2025-04-11 15:54:15.259719	Offering	1500.00	15	\N
11	1999.50	{"type": "daily", "limit": 500}	2025-04-11 16:59:46.016674	Lunch	1999.50	17	\N
12	3000.00	{"type": "safe_lock"}	2025-04-11 16:59:46.01766	Fun	3000.00	17	\N
13	4999.50	{"type": "strict_lock"}	2025-04-11 16:59:46.01766	Savings	4999.50	17	\N
14	3501.00	{"type": "weekly", "limit": 1000}	2025-04-11 16:59:46.01766	Transport	3501.00	17	\N
15	1500.00	{"day": "Sunday", "type": "dynamic", "end_time": "12:00", "start_time": "08:00"}	2025-04-11 16:59:46.01766	Offering	1500.00	17	\N
16	1999.50	{"type": "daily", "limit": 500}	2025-04-11 17:42:33.492683	Lunch	1999.50	18	\N
17	3000.00	{"type": "safe_lock"}	2025-04-11 17:42:33.492683	Fun	3000.00	18	\N
18	4999.50	{"type": "strict_lock"}	2025-04-11 17:42:33.492683	Savings	4999.50	18	\N
19	3501.00	{"type": "weekly", "limit": 1000}	2025-04-11 17:42:33.492683	Transport	3501.00	18	\N
20	1500.00	{"day": "Sunday", "type": "dynamic", "end_time": "12:00", "start_time": "08:00"}	2025-04-11 17:42:33.492683	Offering	1500.00	18	\N
21	1999.50	{"type": "daily", "limit": 500}	2025-04-12 02:17:50.163855	Lunch	1999.50	19	\N
22	3000.00	{"type": "safe_lock"}	2025-04-12 02:17:50.163855	Fun	3000.00	19	\N
23	4999.50	{"type": "strict_lock"}	2025-04-12 02:17:50.163855	Savings	4999.50	19	\N
24	3501.00	{"type": "weekly", "limit": 1000}	2025-04-12 02:17:50.163855	Transport	3501.00	19	\N
25	1500.00	{"day": "Sunday", "type": "dynamic", "end_time": "12:00", "start_time": "08:00"}	2025-04-12 02:17:50.163855	Offering	1500.00	19	\N
29	3501.00	{"type": "weekly", "limit": 1000}	2025-04-12 02:48:44.28712	Transport	3501.00	20	\N
30	1500.00	{"day": "Sunday", "type": "dynamic", "end_time": "12:00", "start_time": "08:00"}	2025-04-12 02:48:44.28712	Offering	1500.00	20	\N
31	1999.50	{"type": "daily", "limit": 500}	2025-04-13 05:45:54.025942	Lunch	1999.50	21	\N
32	3000.00	{"type": "safe_lock"}	2025-04-13 05:45:54.025942	Fun	3000.00	21	\N
33	4999.50	{"type": "strict_lock"}	2025-04-13 05:45:54.025942	Savings	4999.50	21	\N
34	3501.00	{"type": "weekly", "limit": 1000}	2025-04-13 05:45:54.025942	Transport	3501.00	21	\N
35	1500.00	{"day": "Sunday", "type": "dynamic", "end_time": "12:00", "start_time": "08:00"}	2025-04-13 05:45:54.025942	Offering	1500.00	21	\N
26	1999.50	{"type": "daily", "limit": 500}	2025-04-12 02:48:44.28712	Lunch	1474.50	20	\N
28	4999.50	{"type": "strict_lock"}	2025-04-12 02:48:44.28712	Savings	5385.50	20	\N
8	8332.50	{"type": "strict_lock"}	2025-04-11 16:37:38.450021	Savings	8332.50	16	\N
10	2500.00	{"day": "Sunday", "type": "dynamic", "end_time": "12:00", "start_time": "08:00"}	2025-04-11 16:37:38.450021	Offering	2500.00	16	\N
7	5000.00	{"type": "safe_lock"}	2025-04-11 16:37:38.450021	Fun	5392.00	16	\N
6	3332.50	{"type": "daily", "limit": 500}	2025-04-11 16:37:38.450021	Lunch	1422.50	16	\N
9	5835.00	{"type": "weekly", "limit": 1000}	2025-04-11 16:37:38.450021	Transport	7305.00	16	\N
27	3000.00	{"type": "safe_lock"}	2025-04-12 02:48:44.28712	Fun	2490.00	20	\N
44	50000.00	{"type": "daily", "limit": 200.0}	2025-04-24 16:28:33.601454	Food	50000.00	28	\N
45	50000.00	{"type": "dynamic", "startDate": "2025-04-20", "intervalDays": 3, "disbursementTime": "09:00"}	2025-04-24 16:28:33.601454	Transport	50000.00	28	\N
\.


--
-- Data for Name: leaderboard_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leaderboard_entries (id, rank, score, updated_at, leaderboard_id, user_id) FROM stdin;
\.


--
-- Data for Name: leaderboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leaderboards (id, end_date, metric, name, period, start_date, updated_at) FROM stdin;
\.


--
-- Data for Name: otps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otps (id, user_id, otp_code, created_at, expires_at) FROM stdin;
2	11	673530	2025-04-18 17:40:14.663487	2025-04-18 17:45:14.663487
\.


--
-- Data for Name: revenue_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revenue_logs (id, user_id, type, amount, description, created_at) FROM stdin;
1	1	budget_creation	100.00	Created budget: April 2025	2025-04-11 15:54:15.314944
2	1	budget_creation	100.00	Created budget: April 2025	2025-04-11 16:37:38.511945
3	1	budget_creation	100.00	Created budget: April 2025	2025-04-11 16:59:46.08098
4	1	budget_creation	100.00	Created budget: April 2025	2025-04-11 17:42:33.559838
5	1	budget_creation	100.00	Created budget: April 2025	2025-04-12 02:17:50.207346
6	1	budget_creation	100.00	Created budget: April 2025	2025-04-12 02:48:44.323241
7	1	envelope_transfer_fee	8.00	Transfer from envelope 6 to 7 (fee: 2%)	2025-04-12 06:48:22.283212
8	1	envelope_transfer_fee	10.00	Transfer from envelope 6 to 6 (fee: 2%)	2025-04-12 06:59:30.977825
9	1	envelope_transfer_fee	5.00	Transfer from envelope 6 to 9 (fee: 2%)	2025-04-12 07:03:52.553562
10	1	envelope_transfer_fee	5.00	Transfer from envelope 6 to 9 (fee: 2%)	2025-04-12 07:03:57.344943
11	1	envelope_transfer_fee	5.00	Transfer from envelope 6 to 9 (fee: 2%)	2025-04-12 07:04:01.070914
12	1	envelope_transfer_fee	5.00	Transfer from envelope 6 to 9 (fee: 2%)	2025-04-12 07:04:22.117176
13	1	envelope_transfer_fee	5.00	Transfer from envelope 6 to 9 (fee: 2%)	2025-04-12 07:04:26.107272
14	1	envelope_transfer_fee	5.00	Transfer from envelope 6 to 9 (fee: 2%)	2025-04-12 07:04:27.865798
15	1	envelope_transfer_fee	4.00	Transfer in Budget 20 from Fun to Savings (fee: 1%)	2025-04-12 17:12:05.493329
16	1	envelope_transfer_fee	8.00	Transfer in Budget 20 from Lunch to Fun (fee: 2%)	2025-04-12 17:13:32.266894
17	1	envelope_transfer_fee	1.60	Transfer in Budget 20 from Lunch to Fun (fee: 2%)	2025-04-12 17:14:02.830738
18	1	envelope_transfer_fee	0.40	Transfer in Budget 20 from Lunch to Fun (fee: 2%)	2025-04-12 17:14:27.241796
19	1	envelope_transfer_fee	25.00	Transfer in Budget 20 from Savings to Lunch (fee: 5%)	2025-04-12 17:17:11.186419
20	1	envelope_transfer_fee	2.00	Transfer in Budget 20 from Fun to external account 1234567890@bank (fee: 1%)	2025-04-12 17:21:35.512197
21	1	budget_creation	100.00	Created budget: MAY 2025	2025-04-13 05:45:54.046474
22	1	envelope_transfer_fee	10.00	Transfer in Budget 20 from Lunch to Savings (fee: 2%)	2025-04-14 16:35:54.962992
23	1	envelope_transfer_fee	2.00	Transfer in Budget 20 from Fun to external account 1234567890@bank (fee: 1%)	2025-04-14 16:36:05.779995
24	1	envelope_transfer_fee	2.00	Transfer in Budget 20 from Fun to external account 1234567890@bank (fee: 1%)	2025-04-14 16:50:51.511956
26	12	budget_creation	100.00	Budget fee for 29 days	2025-04-24 16:28:33.661339
\.


--
-- Data for Name: transaction_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_logs (id, user_id, budget_id, source_envelope_id, target_envelope_id, external_account, amount, fee, transaction_type, created_at) FROM stdin;
1	1	20	27	28	\N	400.00	4.00	envelope_to_envelope	2025-04-12 17:12:05.403778
2	1	20	26	27	\N	400.00	8.00	envelope_to_envelope	2025-04-12 17:13:32.234531
3	1	20	26	27	\N	80.00	1.60	envelope_to_envelope	2025-04-12 17:14:02.830738
4	1	20	26	27	\N	20.00	0.40	envelope_to_envelope	2025-04-12 17:14:27.241796
5	1	20	28	26	\N	500.00	25.00	envelope_to_envelope	2025-04-12 17:17:11.186419
6	1	20	27	\N	1234567890@bank	200.00	2.00	envelope_to_external	2025-04-12 17:21:35.505173
7	1	16	\N	\N	\N	5000.00	0.00	wallet_to_budget	2025-04-12 17:54:35.1032
8	1	16	\N	\N	\N	0.00	0.00	budget_extension	2025-04-13 05:22:30.386863
9	1	16	\N	\N	\N	0.00	0.00	budget_extension	2025-04-13 05:43:24.64587
10	1	16	\N	\N	\N	0.00	0.00	budget_extension	2025-04-13 05:43:44.294372
11	1	16	\N	\N	\N	0.00	0.00	budget_extension	2025-04-13 05:44:39.59352
12	1	21	\N	\N	\N	0.00	0.00	budget_extension	2025-04-13 05:46:54.26991
13	1	20	26	28	\N	500.00	10.00	envelope_to_envelope	2025-04-14 16:35:54.942031
14	1	20	27	\N	1234567890@bank	200.00	2.00	envelope_to_external	2025-04-14 16:36:05.777915
15	1	16	\N	\N	\N	5000.00	0.00	wallet_to_budget	2025-04-14 16:36:16.711136
16	1	21	\N	\N	\N	0.00	0.00	budget_extension	2025-04-14 16:36:27.371591
17	1	20	27	\N	1234567890@bank	200.00	2.00	envelope_to_external	2025-04-14 16:50:51.509955
18	1	21	\N	\N	\N	0.00	0.00	budget_extension	2025-04-14 16:51:16.098198
19	12	\N	\N	\N	\N	200000.00	0.00	wallet_deposit	2025-04-24 10:38:38.151626
29	12	\N	\N	\N	\N	100000.00	0.00	wallet_deduction	2025-04-24 16:28:33.645175
30	12	28	\N	\N	\N	100000.00	\N	budget_allocation	2025-04-24 16:28:33.653159
31	12	28	\N	\N	\N	100.00	\N	budget_creation_fee	2025-04-24 16:28:33.656341
\.


--
-- Data for Name: user_badges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_badges (id, earned_at, badge_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_goals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_goals (id, created_at, current_amount, name, status, target_amount, target_date, envelope_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, bvn, created_at, email, last_login, password, phone, role, profile_data, tnc_accepted, is_verified) FROM stdin;
2	\N	2025-04-06 23:17:51.202171	olaore4040@gmail.com	\N	\N	\N	USER	\N	f	f
3	\N	2025-04-07 22:04:37.395967	osazuwaidubor01@gmail.com	\N	$2a$10$pi.AKuw63dq5GYgyLPNP2u0s1QMIJVOp7vCU7cp7dnZWWEzf4lFDm	07081783593	USER	\N	f	f
4	\N	2025-04-13 16:44:10.38994	olaore40406@gmail.com	\N	$2a$10$.4ZpDBOSjCko5W2omcsT2.qtbgpF0ZcbBeTX8w5M5IHnnj45Xh2Bq	08060214033	USER	\N	f	f
1	\N	2025-04-06 23:04:55.961508	olaore66@gmail.com	\N	$2a$10$NdgDiULGtHYtvzrH3/DzruzCU6bPjov5kHXcbJ6QCfHCpDdD4yC/C	08060214037	USER	{"occupation": "Software developer", "mainExpense": "Food", "savingsGoal": "Save 10000", "monthlyIncome": 50000}	f	f
6	\N	2025-04-16 21:42:53.944	osazuwaidubor0@gmail.com	\N	$2a$10$FqlX9TyBI.YVy1dPK2vowOjmpFmoZyLZt7ewvAidW36B0FcOExqtK	09088869876	USER	\N	f	f
7	\N	2025-04-17 04:37:19.258	abraham@gmail.com	\N	$2a$10$e/8fe3mljNXKa.b8f.rwiuqraFZ8b58U0E.hOkeUgUYCVXj2r7Cxq	08129489558	ADMIN	\N	f	f
5	\N	2025-04-16 07:31:16.128	abrahamiborida@gmail.com	\N	$2a$10$kKmYAHHhIGEoti47XFIl9eTA.p9JeN46ItH36BTbmif72LQSHJ8FW	08129489559	ADMIN	{"dob": "Software Engineer", "occupation": "Software Engineer", "mainExpense": "Self growth", "savingsGoal": "Save live abroad", "monthlyIncome": 2000000}	f	f
12	\N	2025-04-19 18:05:38.766	test2@moniewise.com	2025-04-24 16:28:27.118584	$2a$10$naBc9kzOlGX6/A2CS1DCiudLcEW.emfAHNkOvoFoncrAn13twQgXK	+23458473638839	ADMIN	{"dob": [1990, 1, 1], "isVerified": true, "occupation": "Software Developer", "mainExpense": "Self growth", "savingsGoal": "Save live abroad", "monthlyIncome": 5000000, "acceptedTncVersion": "2.0"}	f	t
11	\N	2025-04-18 17:40:14.514	test@moniewise.com	2025-04-19 17:26:15.989789	$2a$10$aUJFgME.v6RtunOtU1T.Tuw3LdQZGgyyrGzHUTGqNn2HH48xDbinG	+2341234567890	ADMIN	{"dob": "Software Developer", "occupation": "Software Developer", "mainExpense": "Self growth", "savingsGoal": "Save live abroad", "monthlyIncome": 5000000}	f	f
\.


--
-- Data for Name: wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallets (id, balance, currency, status, updated_at, user_id, account_number, bank_name) FROM stdin;
1	0.00	NGN	ACTIVE	2025-04-16 05:35:55.885353	2	\N	\N
2	0.00	NGN	ACTIVE	2025-04-16 05:35:55.923966	3	\N	\N
3	0.00	NGN	ACTIVE	2025-04-16 05:35:55.928479	4	\N	\N
4	0.00	NGN	ACTIVE	2025-04-16 05:35:55.932477	1	\N	\N
8	0.00	NGN	ACTIVE	2025-04-16 07:31:16.166	5	\N	\N
9	0.00	NGN	ACTIVE	2025-04-16 21:42:54.083	6	\N	\N
10	0.00	NGN	ACTIVE	2025-04-17 04:37:20.223	7	\N	\N
12	0.00	NGN	ACTIVE	2025-04-18 17:40:14.633	11	TEST-11-88992	MonieWise Test Bank
13	100000.00	NGN	ACTIVE	2025-04-19 18:05:38.884	12	TEST-12-63556	Stub Access Bank
\.


--
-- Name: analytics_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.analytics_logs_id_seq', 1, false);


--
-- Name: badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.badges_id_seq', 1, false);


--
-- Name: budgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.budgets_id_seq', 28, true);


--
-- Name: envelopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.envelopes_id_seq', 45, true);


--
-- Name: leaderboard_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leaderboard_entries_id_seq', 1, false);


--
-- Name: leaderboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leaderboards_id_seq', 1, false);


--
-- Name: otps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.otps_id_seq', 8, true);


--
-- Name: revenue_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.revenue_logs_id_seq', 26, true);


--
-- Name: transaction_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_logs_id_seq', 31, true);


--
-- Name: user_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_badges_id_seq', 1, false);


--
-- Name: user_goals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_goals_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallets_id_seq', 13, true);


--
-- Name: analytics_logs analytics_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_logs
    ADD CONSTRAINT analytics_logs_pkey PRIMARY KEY (id);


--
-- Name: badges badges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: budgets budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT budgets_pkey PRIMARY KEY (id);


--
-- Name: envelopes envelopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envelopes
    ADD CONSTRAINT envelopes_pkey PRIMARY KEY (id);


--
-- Name: leaderboard_entries leaderboard_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaderboard_entries
    ADD CONSTRAINT leaderboard_entries_pkey PRIMARY KEY (id);


--
-- Name: leaderboards leaderboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaderboards
    ADD CONSTRAINT leaderboards_pkey PRIMARY KEY (id);


--
-- Name: otps otps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otps
    ADD CONSTRAINT otps_pkey PRIMARY KEY (id);


--
-- Name: revenue_logs revenue_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_logs
    ADD CONSTRAINT revenue_logs_pkey PRIMARY KEY (id);


--
-- Name: transaction_logs transaction_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_logs
    ADD CONSTRAINT transaction_logs_pkey PRIMARY KEY (id);


--
-- Name: user_badges uk5r2v5xn0il3p8dc9nf4v94r2b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_badges
    ADD CONSTRAINT uk5r2v5xn0il3p8dc9nf4v94r2b UNIQUE (user_id, badge_id);


--
-- Name: users uk_6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: users uk_d6m2soe014tvso1vopbp4m1vf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_d6m2soe014tvso1vopbp4m1vf UNIQUE (bvn);


--
-- Name: users uk_du5v5sr43g5bfnji4vb8hg5s3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_du5v5sr43g5bfnji4vb8hg5s3 UNIQUE (phone);


--
-- Name: leaderboard_entries ukhgrnik49qgulopon3vjx7wb0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaderboard_entries
    ADD CONSTRAINT ukhgrnik49qgulopon3vjx7wb0 UNIQUE (leaderboard_id, user_id);


--
-- Name: user_badges user_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_badges
    ADD CONSTRAINT user_badges_pkey PRIMARY KEY (id);


--
-- Name: user_goals user_goals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_goals
    ADD CONSTRAINT user_goals_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- Name: leaderboard_entries fk1xp9a2rpkpolc9rfh9sndp0d3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaderboard_entries
    ADD CONSTRAINT fk1xp9a2rpkpolc9rfh9sndp0d3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: analytics_logs fk2mmvltp1agtgcw9xfgvhkq13q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_logs
    ADD CONSTRAINT fk2mmvltp1agtgcw9xfgvhkq13q FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_goals fkbqj3pc51g999b3nsxgqm3fyj9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_goals
    ADD CONSTRAINT fkbqj3pc51g999b3nsxgqm3fyj9 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: wallets fkc1foyisidw7wqqrkamafuwn4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT fkc1foyisidw7wqqrkamafuwn4e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: envelopes fkd69ckd02n22twge9n8mo3cbu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envelopes
    ADD CONSTRAINT fkd69ckd02n22twge9n8mo3cbu FOREIGN KEY (budget_id) REFERENCES public.budgets(id);


--
-- Name: leaderboard_entries fkevaohs4nwnvdymfl0f8kje2o6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaderboard_entries
    ADD CONSTRAINT fkevaohs4nwnvdymfl0f8kje2o6 FOREIGN KEY (leaderboard_id) REFERENCES public.leaderboards(id);


--
-- Name: user_goals fki7clpcndtklwj0xuec166nuh7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_goals
    ADD CONSTRAINT fki7clpcndtklwj0xuec166nuh7 FOREIGN KEY (envelope_id) REFERENCES public.envelopes(id);


--
-- Name: user_badges fkk6e00pguaij0uke6xr81gt045; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_badges
    ADD CONSTRAINT fkk6e00pguaij0uke6xr81gt045 FOREIGN KEY (badge_id) REFERENCES public.badges(id);


--
-- Name: budgets fkln0tm5tgf3f9q3sp9sa5m8m7b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT fkln0tm5tgf3f9q3sp9sa5m8m7b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_badges fkr46ah81sjymsn035m4ojstn5s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_badges
    ADD CONSTRAINT fkr46ah81sjymsn035m4ojstn5s FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: otps otps_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otps
    ADD CONSTRAINT otps_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: revenue_logs revenue_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_logs
    ADD CONSTRAINT revenue_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: transaction_logs transaction_logs_budget_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_logs
    ADD CONSTRAINT transaction_logs_budget_id_fkey FOREIGN KEY (budget_id) REFERENCES public.budgets(id);


--
-- Name: transaction_logs transaction_logs_source_envelope_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_logs
    ADD CONSTRAINT transaction_logs_source_envelope_id_fkey FOREIGN KEY (source_envelope_id) REFERENCES public.envelopes(id);


--
-- Name: transaction_logs transaction_logs_target_envelope_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_logs
    ADD CONSTRAINT transaction_logs_target_envelope_id_fkey FOREIGN KEY (target_envelope_id) REFERENCES public.envelopes(id);


--
-- Name: transaction_logs transaction_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_logs
    ADD CONSTRAINT transaction_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

