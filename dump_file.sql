--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	peaks_app	peak
8	peaks_app	rejectedconnection
9	peaks_app	whitelistcountry
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add peak	7	add_peak
26	Can change peak	7	change_peak
27	Can delete peak	7	delete_peak
28	Can view peak	7	view_peak
29	Can add rejected connection	8	add_rejectedconnection
30	Can change rejected connection	8	change_rejectedconnection
31	Can delete rejected connection	8	delete_rejectedconnection
32	Can view rejected connection	8	view_rejectedconnection
33	Can add whitelist country	9	add_whitelistcountry
34	Can change whitelist country	9	change_whitelistcountry
35	Can delete whitelist country	9	delete_whitelistcountry
36	Can view whitelist country	9	view_whitelistcountry
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$VOyI1tWHa1Ud$Td6r1bIl3O+CIzshIYTRFTEmzXYwg5YGF8qpztPrdsk=	2021-10-30 14:24:49.106265+00	t	root			sofianesynchro@yahoo.fr	t	t	2021-10-28 08:43:40+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
11	2021-10-30 13:51:31.553617+00	1	root	2	[{"changed": {"fields": ["password"]}}]	4	1
12	2021-10-30 14:35:39.384577+00	4	Mount Shasta	1	[{"added": {}}]	7	1
13	2021-10-30 14:36:00.160653+00	3	dgsdg	3		7	1
14	2021-10-30 14:36:00.168912+00	2	testttt	3		7	1
15	2021-10-30 14:39:20.366654+00	5	Aconcagua	1	[{"added": {}}]	7	1
16	2021-10-30 14:39:47.333796+00	5	Aconcagua	2	[{"changed": {"fields": ["Lon"]}}]	7	1
17	2021-10-30 14:41:39.398001+00	6	Denali	1	[{"added": {}}]	7	1
18	2021-10-30 14:43:02.672983+00	6	Denali	2	[{"changed": {"fields": ["Lat", "Lon"]}}]	7	1
19	2021-10-30 14:44:04.796819+00	7	Kilimandjaro	1	[{"added": {}}]	7	1
20	2021-10-30 14:44:47.465761+00	8	Elbrouz	1	[{"added": {}}]	7	1
21	2021-10-30 14:45:36.00545+00	9	Mont Blanc	1	[{"added": {}}]	7	1
22	2021-10-30 14:46:01.981336+00	2	89.84.138.242 (France) at 2021-10-30 13:32:19.238181	3		8	1
23	2021-10-30 14:46:01.988541+00	1	89.84.138.242 (France) at 2021-10-30 13:32:17.807999	3		8	1
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-30 13:30:48.12384+00
2	auth	0001_initial	2021-10-30 13:30:48.268824+00
3	admin	0001_initial	2021-10-30 13:30:48.495495+00
4	admin	0002_logentry_remove_auto_add	2021-10-30 13:30:48.567389+00
5	admin	0003_logentry_add_action_flag_choices	2021-10-30 13:30:48.597307+00
6	contenttypes	0002_remove_content_type_name	2021-10-30 13:30:48.666019+00
7	auth	0002_alter_permission_name_max_length	2021-10-30 13:30:48.713167+00
8	auth	0003_alter_user_email_max_length	2021-10-30 13:30:48.744236+00
9	auth	0004_alter_user_username_opts	2021-10-30 13:30:48.787086+00
10	auth	0005_alter_user_last_login_null	2021-10-30 13:30:48.811627+00
11	auth	0006_require_contenttypes_0002	2021-10-30 13:30:48.823243+00
12	auth	0007_alter_validators_add_error_messages	2021-10-30 13:30:48.855685+00
13	auth	0008_alter_user_username_max_length	2021-10-30 13:30:48.918087+00
14	auth	0009_alter_user_last_name_max_length	2021-10-30 13:30:48.956052+00
15	auth	0010_alter_group_name_max_length	2021-10-30 13:30:48.994047+00
16	auth	0011_update_proxy_permissions	2021-10-30 13:30:49.046344+00
17	auth	0012_alter_user_first_name_max_length	2021-10-30 13:30:49.077208+00
18	peaks_app	0001_initial	2021-10-30 13:30:49.248731+00
19	peaks_app	0002_auto_20211029_2306	2021-10-30 13:30:49.33278+00
20	peaks_app	0003_auto_20211029_2312	2021-10-30 13:30:49.376852+00
21	peaks_app	0004_auto_20211029_2314	2021-10-30 13:30:49.489458+00
22	peaks_app	0005_whitelistcountry	2021-10-30 13:30:49.565075+00
23	peaks_app	0006_rejectedconnection_pub_date	2021-10-30 13:30:49.620628+00
24	sessions	0001_initial	2021-10-30 13:30:49.726322+00
29	peaks_app	0007_auto_20211030_1339	2021-10-30 13:39:59.330559+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
l1vp71ogxijvi7om270oi8j6x2tzbj5s	.eJxVjMEOgjAQRP-lZ9PQ0rJdj975hma7XSxqIKFwMv67kHDQ22Tem3mrSNta4lZliWNWV2XU5bdLxE-ZDpAfNN1nzfO0LmPSh6JPWnU_Z3ndTvfvoFAt-9qSE8roM0OXuBH2mIYGYABABNNagyKB2EMSDntCbIOgQ7HZu47V5wv_nDhl:1mg5EK:zIezsUXkE4wsSzHTyI-dJT8GywVYY4K2Jbj07CkC3x0	2021-11-11 13:14:04.411373+00
8i0d8du8ddgklx5ti15en4rjnb8l0xmh	.eJxVjDsOwjAQRO_iGln-BH8o6TmDtevd4ACypTipEHcnkVJAOfPezFskWJeS1s5zmkhchBan3w4hP7nugB5Q703mVpd5Qrkr8qBd3hrx63q4fwcFetnWzg82BOtVdkNABg9ZGWYyhBk1B3I6upG95-iUOW9R-ZEMKIxo2WXx-QLkSTg5:1mgpHt:tuY0kQ3Kg_CgwSMkLna7PtPAgWxi1eVo8ftEJ_XEvLE	2021-11-13 14:24:49.112545+00
\.


--
-- Data for Name: peaks_app_peak; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.peaks_app_peak (id, name, lat, lon, altitude) FROM stdin;
1	Everest	27.9879017	86.9253141	8848.86
4	Mount Shasta	41.409767	-122.20118	4321.75
5	Aconcagua	-32.653179	-70.010868	6962
6	Denali	63.926585	-152.823601	6190
7	Kilimandjaro	-3.067425	37.355627	5892
8	Elbrouz	43.349938	42.44533	5642
9	Mont Blanc	45.832622	6.865175	4808
\.


--
-- Data for Name: peaks_app_rejectedconnection; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.peaks_app_rejectedconnection (id, remote_addr, country, pub_date) FROM stdin;
\.


--
-- Data for Name: peaks_app_whitelistcountry; Type: TABLE DATA; Schema: public; Owner: mydatabaseuser
--

COPY public.peaks_app_whitelistcountry (id, country) FROM stdin;
1	France
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 28, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 23, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: peaks_app_peak_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.peaks_app_peak_id_seq', 9, true);


--
-- Name: peaks_app_whitelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.peaks_app_whitelist_id_seq', 19, true);


--
-- Name: peaks_app_whitelistcountry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mydatabaseuser
--

SELECT pg_catalog.setval('public.peaks_app_whitelistcountry_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

