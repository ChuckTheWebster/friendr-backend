--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
-- Name: matches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.matches (
    creator text NOT NULL,
    receiver text NOT NULL,
    is_liked boolean NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    location text NOT NULL,
    friend_radius integer NOT NULL,
    image_url text NOT NULL,
    bio text,
    password text NOT NULL
);


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.matches (creator, receiver, is_liked) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (first_name, last_name, email, username, location, friend_radius, image_url, bio, password) FROM stdin;
Katie	Carson	justin53@example.org	nmoore	40211	49	https://randomuser.me/api/portraits/men/49.jpg	Bonds trader	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Philip	Walters	johnsoncody@example.com	thomas12	85302	63	https://randomuser.me/api/portraits/men/57.jpg	Firefighter	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Karen	Strong	kerrlori@example.net	rodney38	05905	58	https://randomuser.me/api/portraits/men/64.jpg	Computer games developer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Sabrina	Dickerson	paulchristine@example.com	amanda91	73008	54	https://randomuser.me/api/portraits/men/16.jpg	Product/process development scientist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Vincent	Delgado	robert48@example.com	elizabeth05	40219	31	https://randomuser.me/api/portraits/men/100.jpg	Surveyor	 insurance
Sarah	Cole	maria83@example.org	lambsarah	40223	73	https://randomuser.me/api/portraits/men/34.jpg	Solicitor	 Scotland
Catherine	Banks	ywalker@example.org	xjohnson	94555	45	https://randomuser.me/api/portraits/men/33.jpg	TEFL teacher	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
John	Thompson	richard37@example.com	wyatthannah	40291	92	https://randomuser.me/api/portraits/men/12.jpg	Radiographer	 therapeutic
David	Kelly	ygonzalez@example.com	sanchezleroy	32408	38	https://randomuser.me/api/portraits/men/99.jpg	Applications developer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Samantha	Randall	ballardjames@example.net	richard45	80002	45	https://randomuser.me/api/portraits/men/55.jpg	Community education officer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Carolyn	Stokes	ericajones@example.com	bwiggins	36116	57	https://randomuser.me/api/portraits/men/59.jpg	Teacher	 early years/pre
James	Hart	spencer86@example.com	wtownsend	99501	56	https://randomuser.me/api/portraits/men/32.jpg	Multimedia programmer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Taylor	Moore	lopezdennis@example.net	jacobchristian	21122	86	https://randomuser.me/api/portraits/men/25.jpg	Legal executive	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Jenny	Richardson	gonzalezeric@example.com	joel11	05468	95	https://randomuser.me/api/portraits/men/93.jpg	Engineer	 control and instrumentation
Christopher	Hebert	moniqueboyle@example.net	robinsonvanessa	37218	25	https://randomuser.me/api/portraits/men/40.jpg	Comptroller	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Brian	Powers	powellmatthew@example.com	stacy46	31419	98	https://randomuser.me/api/portraits/men/64.jpg	Statistician	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Nathan	Silva	stephenavila@example.net	lozanogary	06042	86	https://randomuser.me/api/portraits/men/2.jpg	Land	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Andrew	Scott	brucemargaret@example.net	michelemiller	72704	48	https://randomuser.me/api/portraits/men/67.jpg	Designer	 industrial/product
Edwin	Cooper	victoriamurphy@example.org	roberttate	80003	34	https://randomuser.me/api/portraits/men/75.jpg	Network engineer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Margaret	Peterson	nicholasnewman@example.org	sbowers	21403	31	https://randomuser.me/api/portraits/men/43.jpg	Bookseller	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
James	Ward	mikepena@example.org	wilkersonteresa	40216	32	https://randomuser.me/api/portraits/men/34.jpg	Special educational needs teacher	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Joshua	Hoffman	allisonwells@example.com	jennifer56	05482	20	https://randomuser.me/api/portraits/men/7.jpg	Petroleum engineer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Michael	Chavez	fieldstimothy@example.com	cindy85	31419	24	https://randomuser.me/api/portraits/men/13.jpg	Metallurgist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Justin	Ramsey	sharonanderson@example.net	wprice	40272	37	https://randomuser.me/api/portraits/men/51.jpg	Production assistant	 radio
Sarah	Snyder	kelsey41@example.org	woodsmadeline	06040	71	https://randomuser.me/api/portraits/men/94.jpg	Medical illustrator	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Donald	Hunter	maria85@example.com	burkemichael	37217	64	https://randomuser.me/api/portraits/men/21.jpg	Claims inspector/assessor	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Carol	Harris	snyderemily@example.net	whitelaura	36116	14	https://randomuser.me/api/portraits/men/47.jpg	Television camera operator	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Richard	Jackson	josephburgess@example.net	emilysimmons	40291	92	https://randomuser.me/api/portraits/men/89.jpg	Furniture conservator/restorer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Joseph	Mendez	carlos27@example.com	elizabeth07	94544	84	https://randomuser.me/api/portraits/men/88.jpg	Immunologist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Jennifer	Kelly	haley75@example.net	bakercharlotte	40207	85	https://randomuser.me/api/portraits/men/92.jpg	Advertising copywriter	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Stacy	Wright	jordanjackson@example.com	jyoung	72701	90	https://randomuser.me/api/portraits/men/53.jpg	Journalist	 newspaper
Diane	Obrien	petersonjustin@example.net	mmanning	72703	57	https://randomuser.me/api/portraits/men/91.jpg	Operations geologist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Richard	Garza	martinbowman@example.org	heatherduran	73159	1	https://randomuser.me/api/portraits/men/59.jpg	Surveyor	 commercial/residential
Todd	Spencer	gonzaleznancy@example.org	daymatthew	80003	77	https://randomuser.me/api/portraits/men/76.jpg	Horticultural consultant	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Mr.	Kevin	phillipsmichael@example.org	dustinburgess	99508	44	https://randomuser.me/api/portraits/men/51.jpg	Set designer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Julie	Cole	robincain@example.org	summersmelissa	85302	88	https://randomuser.me/api/portraits/men/14.jpg	Technical sales engineer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Melissa	Miller	njennings@example.com	hcampbell	99501	80	https://randomuser.me/api/portraits/men/69.jpg	Environmental consultant	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Carl	Mercado	pennyreed@example.net	gaymary	94538	2	https://randomuser.me/api/portraits/men/72.jpg	Magazine journalist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Andrew	Wilson	zlucas@example.org	michael28	34452	19	https://randomuser.me/api/portraits/men/56.jpg	Housing manager/officer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Crystal	Knapp	snydermary@example.net	lisalane	80005	30	https://randomuser.me/api/portraits/men/7.jpg	Lobbyist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Kenneth	Perez	josephberry@example.org	lorihernandez	94536	8	https://randomuser.me/api/portraits/men/91.jpg	Firefighter	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Connor	Perkins	brian65@example.org	bwright	85302	67	https://randomuser.me/api/portraits/men/100.jpg	Surveyor	 building
Gabriela	Day	bobby43@example.com	jessicaanderson	81435	19	https://randomuser.me/api/portraits/men/61.jpg	Engineer	 building services
April	Fischer	gwashington@example.org	kevinnguyen	94587	46	https://randomuser.me/api/portraits/men/71.jpg	Ambulance person	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Matthew	Ward	taylorhailey@example.com	ythomas	31322	94	https://randomuser.me/api/portraits/men/61.jpg	Designer	 exhibition/display
Mr.	Alexander	pruiz@example.com	aanderson	37211	86	https://randomuser.me/api/portraits/men/72.jpg	Scientist	 marine
Kenneth	Cortez	kwhitney@example.com	dylanelliott	36111	84	https://randomuser.me/api/portraits/men/92.jpg	Applications developer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Julia	Ramirez	cpierce@example.net	cunninghammegan	80002	24	https://randomuser.me/api/portraits/men/90.jpg	Scientist	 biomedical
Laura	Walsh	simskaylee@example.com	jasmineespinoza	81435	28	https://randomuser.me/api/portraits/men/76.jpg	Exercise physiologist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Jessica	Garcia	jeremystone@example.com	pattersonjeremy	85301	100	https://randomuser.me/api/portraits/men/17.jpg	Charity fundraiser	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Joseph	Lee	jacksonjennifer@example.net	scott26	37217	38	https://randomuser.me/api/portraits/men/49.jpg	Designer	 multimedia
Cassandra	Newman	garciajenna@example.org	mooresteven	37215	10	https://randomuser.me/api/portraits/men/44.jpg	Research scientist (physical sciences)	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Sean	Sanchez	vcortez@example.com	susanhodges	91706	75	https://randomuser.me/api/portraits/men/22.jpg	Horticultural consultant	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Tyler	Wilson	chelseaharris@example.net	rebekahlong	06040	71	https://randomuser.me/api/portraits/men/2.jpg	Chartered management accountant	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Caitlin	Payne	debbielewis@example.org	grahamadam	05201	35	https://randomuser.me/api/portraits/men/75.jpg	Film/video editor	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Natalie	Shields	aprince@example.net	codymartinez	40241	33	https://randomuser.me/api/portraits/men/43.jpg	Counselling psychologist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Javier	Thompson	larsonpatrick@example.com	michaelgoodwin	72703	5	https://randomuser.me/api/portraits/men/78.jpg	Operational researcher	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Carla	Smith	sylvia85@example.net	ymitchell	36109	64	https://randomuser.me/api/portraits/men/3.jpg	Ranger/warden	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Michael	Mays	torresangela@example.org	davidmarshall	72701	18	https://randomuser.me/api/portraits/men/62.jpg	Lexicographer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Erica	Curtis	craig95@example.com	emily95	73106	91	https://randomuser.me/api/portraits/men/77.jpg	Barista	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Shelly	Hernandez	lisathomas@example.com	samuel79	21401	19	https://randomuser.me/api/portraits/men/34.jpg	Pension scheme manager	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Todd	Cameron	owebster@example.org	jacksonbrittany	73106	15	https://randomuser.me/api/portraits/men/59.jpg	Chief Technology Officer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Keith	Owens	stoutgreg@example.net	sbanks	94544	47	https://randomuser.me/api/portraits/men/4.jpg	Research scientist (physical sciences)	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Lauren	Smith	kimberly11@example.org	nathan89	80004	95	https://randomuser.me/api/portraits/men/62.jpg	Scientist	 biomedical
Mrs.	Nancy	wheelermike@example.org	lisa18	06042	54	https://randomuser.me/api/portraits/men/63.jpg	IT trainer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Zachary	Baker	kimberly78@example.org	elizabethreed	40212	0	https://randomuser.me/api/portraits/men/59.jpg	Records manager	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Kayla	Jones	tiffany41@example.org	andrewthompson	72703	17	https://randomuser.me/api/portraits/men/14.jpg	Event organiser	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Bradley	Baker	jenniferbutler@example.net	hunterrandall	94579	61	https://randomuser.me/api/portraits/men/22.jpg	Aeronautical engineer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Brittany	Lloyd	harrisshawn@example.org	floresjennifer	72701	57	https://randomuser.me/api/portraits/men/11.jpg	Environmental manager	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Melissa	Brown	amy45@example.org	johnsonmelanie	20002	76	https://randomuser.me/api/portraits/men/26.jpg	Pilot	 airline
Bryan	Estrada	jamiecobb@example.org	davidesparza	01960	10	https://randomuser.me/api/portraits/men/46.jpg	Early years teacher	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Michaela	Gibbs	brivera@example.net	david39	36110	65	https://randomuser.me/api/portraits/men/15.jpg	Seismic interpreter	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Emily	Graham	fieldsheather@example.com	sheilacain	05906	92	https://randomuser.me/api/portraits/men/74.jpg	Commercial horticulturist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Dennis	Brown	kim18@example.com	jbuck	90810	37	https://randomuser.me/api/portraits/men/79.jpg	Plant breeder/geneticist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Manuel	Gibson	pobrien@example.org	steve59	31408	80	https://randomuser.me/api/portraits/men/87.jpg	Primary school teacher	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Nicole	Henry	john45@example.com	mikesmith	72701	7	https://randomuser.me/api/portraits/men/54.jpg	IT technical support officer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Jennifer	Freeman	nperez@example.com	dmoses	20003	27	https://randomuser.me/api/portraits/men/67.jpg	Marine scientist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Connie	Alvarado	newtonchristina@example.org	xjackson	40272	48	https://randomuser.me/api/portraits/men/72.jpg	Garment/textile technologist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Cassandra	Lewis	lindsay27@example.net	vanessamcguire	06040	96	https://randomuser.me/api/portraits/men/37.jpg	Personnel officer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
James	Sullivan	jeremy43@example.org	vclark	21060	98	https://randomuser.me/api/portraits/men/49.jpg	Facilities manager	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Karen	Taylor	iwillis@example.com	kingsean	80003	27	https://randomuser.me/api/portraits/men/79.jpg	Warden/ranger	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Miranda	Hodge	rbryan@example.net	hailey66	99517	54	https://randomuser.me/api/portraits/men/15.jpg	Community arts worker	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Debbie	Fleming	gregory28@example.org	hoffmanscott	21122	98	https://randomuser.me/api/portraits/men/78.jpg	Recycling officer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Sarah	Ryan	teresarodriguez@example.com	javierday	31322	15	https://randomuser.me/api/portraits/men/1.jpg	Education officer	 museum
James	Roman	lisalee@example.org	maciaskevin	80003	13	https://randomuser.me/api/portraits/men/33.jpg	Waste management officer	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Kimberly	Santiago	robinsondarlene@example.net	robertchambers	32456	17	https://randomuser.me/api/portraits/men/89.jpg	Animal nutritionist	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Alan	Young	edward66@example.net	michaelmathews	73118	82	https://randomuser.me/api/portraits/men/89.jpg	Editor	 magazine features
Jerome	Thomas	isimmons@example.net	donaldhansen	32404	65	https://randomuser.me/api/portraits/men/11.jpg	Conservator	 museum/gallery
Rebecca	Tucker	stephanie07@example.org	brian45	32413	17	https://randomuser.me/api/portraits/men/47.jpg	Accounting technician	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
Cheryl	Peters	trussell@example.net	smithamanda	06040	97	https://randomuser.me/api/portraits/men/63.jpg	Futures trader	$2b$12$Q1PUFjhN/AWRQ21LbGYvjeLpZZB6lfZ1BPwifHALGO6oIbyC3CmJe
\.


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (creator, receiver);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: matches matches_creator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_creator_fkey FOREIGN KEY (creator) REFERENCES public.users(username) ON DELETE CASCADE;


--
-- Name: matches matches_receiver_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_receiver_fkey FOREIGN KEY (receiver) REFERENCES public.users(username) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

