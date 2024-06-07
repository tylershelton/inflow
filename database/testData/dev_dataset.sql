--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE inflow;




--
-- Drop roles
--

DROP ROLE inflow;


--
-- Roles
--

CREATE ROLE inflow;
ALTER ROLE inflow WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:ybzg8ZmIFDHfxVW7v/N/ng==$yWx/aS4RHu1BetwPyBO5wFmIhmCHLqevXh0y8XY8EnY=:q3Xt+Yv9hecQJz3tyG3s9ty0G2GibBiNScB2G1Fg/FM=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: inflow
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO inflow;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: inflow
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: inflow
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: inflow
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "inflow" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: inflow; Type: DATABASE; Schema: -; Owner: inflow
--

CREATE DATABASE inflow WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE inflow OWNER TO inflow;

\connect inflow

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
-- Name: category; Type: TABLE; Schema: public; Owner: inflow
--

CREATE TABLE public.category (
    id integer NOT NULL,
    title character varying(80) NOT NULL
);


ALTER TABLE public.category OWNER TO inflow;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: inflow
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO inflow;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inflow
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: feed; Type: TABLE; Schema: public; Owner: inflow
--

CREATE TABLE public.feed (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    category_id integer
);


ALTER TABLE public.feed OWNER TO inflow;

--
-- Name: feed_id_seq; Type: SEQUENCE; Schema: public; Owner: inflow
--

CREATE SEQUENCE public.feed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feed_id_seq OWNER TO inflow;

--
-- Name: feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inflow
--

ALTER SEQUENCE public.feed_id_seq OWNED BY public.feed.id;


--
-- Name: feeditem; Type: TABLE; Schema: public; Owner: inflow
--

CREATE TABLE public.feeditem (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    url character varying(255),
    pubdate timestamp without time zone,
    archived boolean DEFAULT false,
    feed_id integer,
    category_id integer,
    CONSTRAINT title_or_description CHECK (((title IS NOT NULL) OR (description IS NOT NULL)))
);


ALTER TABLE public.feeditem OWNER TO inflow;

--
-- Name: feeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: inflow
--

CREATE SEQUENCE public.feeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feeditem_id_seq OWNER TO inflow;

--
-- Name: feeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: inflow
--

ALTER SEQUENCE public.feeditem_id_seq OWNED BY public.feeditem.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: feed id; Type: DEFAULT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feed ALTER COLUMN id SET DEFAULT nextval('public.feed_id_seq'::regclass);


--
-- Name: feeditem id; Type: DEFAULT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feeditem ALTER COLUMN id SET DEFAULT nextval('public.feeditem_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.category (id, title) FROM stdin;
1	News
2	Engineering
3	Business
4	Game Dev
5	Sysadmin
\.


--
-- Data for Name: feed; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.feed (id, url, title, description, category_id) FROM stdin;
1	https://sive.rs/feed	Derek Sivers blog		3
2	http://blog.mozilla.com/feed/	The Mozilla Blog	News and Updates about Mozilla	2
3	https://developer.mozilla.org/en-US/blog/rss.xml	MDN Blog	The MDN Web Docs blog publishes articles about web development, open source software, web platform updates, tutorials, changes and updates to MDN, and more.	2
4	http://martinfowler.com/bliki/bliki.atom	Martin Fowler	Master feed of news and updates from martinfowler.com	2
5	http://patflynn.com/feed/	Pat Flynn	Father, husband, entrepreneur, author, speaker.	3
6	http://www.ansible.com/blog/rss.xml	Ansible Blog	The official blog for Ansible by Red Hat and the Ansible open source project.	5
7	http://feeds.feedburner.com/Phoronix	Phoronix	Linux Hardware Reviews, Benchmarks & Open-Source News	5
8	https://feeds.npr.org/1001/rss.xml	News : NPR	NPR news, audio, and podcasts. Coverage of breaking stories, national and world news, politics, business, science, technology, and extended coverage of major national and world events.	1
9	http://code.blender.org/index.php/feed/	Developer Blog	code.blender.org	2
10	https://www.unrealengine.com/rss	Unreal Engine - News, Developer Interviews, Spotlights, Tech Blogs		4
11	http://www.archlinux.org/feeds/news/	Arch Linux: Recent news updates	The latest and greatest news from the Arch Linux distribution.	5
\.


--
-- Data for Name: feeditem; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.feeditem (id, title, description, url, pubdate, archived, feed_id, category_id) FROM stdin;
1	The past is not true	When I was 17, I was driving recklessly and crashed into an oncoming car. I found out that I broke the other driver’s spine, and she’ll never walk again. I carried that burden with me everywhere, and felt so horrible about it for so many years...	https://sive.rs/pnt	2023-07-20 00:00:00	f	1	3
2	dashing dog, searching for purpose	People search for their passion or purpose. But “purpose” and “passion” are words we use when we’re not working. When we’re actually engaged in the flow of fascinating work, we don’t think in these terms. The task at hand fills our mind. The...	https://sive.rs/pdog	2023-06-30 00:00:00	f	1	3
3	$575K of books sold. $575K to save lives.	I sell my books directly through my website, sivers.com, for a few important reasons. Direct communication with the readers. Considerate pricing. Including all digital formats (MP3, EPUB, PDF, HTML, etc) with every sale. Giving all profits to...	https://sive.rs/575k	2023-05-18 00:00:00	f	1	3
4	The joy and freedom of harmlessly upsetting social norms	My band was playing a gig in Oslo, Norway, when I struck up a conversation with a woman who was staring at me. Turns out we had read many of the same books, and we were super-attracted to each other. We talked all night, but just as things got...	https://sive.rs/nor	2023-04-21 00:00:00	f	1	3
5	Why I let go of my U.S. citizenship	I forbid myself from anything too tempting or addicting. I keep no cookies in my home. To prevent myself from falling off the wagon, I strap myself to the mast. I was born in California, and lived the first forty years of my life in America. But I...	https://sive.rs/xus	2023-04-20 00:00:00	f	1	3
6	the Michael Browne suits	In 2020, I was about to move to New York City. I wanted to get to know all of its ethnic enclaves, like visiting the whole world in one city. But I know I have a tendency to stay at home, immersed in my work. So I made a rule for myself. If I move...	https://sive.rs/suits	2023-04-15 00:00:00	f	1	3
7	Curve into the target	I’m pretty bad at bowling and frisbee. I roll the ball or throw the disc straight at the target, but away it curves. After this happens a couple times, I adjust. I stop aiming straight, since that’s not working. If it always curves to the left,...	https://sive.rs/aim	2023-03-09 00:00:00	f	1	3
8	Thinking something nice about someone? Tell them.	When you think something nice about someone, you should tell them. People don’t hear enough compliments. Even well-known people. We assume they must hear it too much. But famous people often say the thanks from the public is the best part of...	https://sive.rs/nice	2023-03-07 00:00:00	f	1	3
9	50 conversations in Bangalore and Chennai	February 13 through 21, 2023, I went to Chennai and Bengaluru, India. My sole purpose was to meet new friends. I’m an “Overseas Citizen of India” and my son is half-Indian (Tamil). I will always have ties to India. I wanted to deepen those ties and...	https://sive.rs/meet-chbg	2023-03-02 00:00:00	f	1	3
10	Explorers are bad leaders	Explorers poke through the unknown, experimenting, trying many little dead-ends. Explorers meander, constantly changing directions based on hunch, mood, and curiosity. Explorers are hard to follow. It’s better to let them wander alone, then...	https://sive.rs/exled	2023-02-09 00:00:00	f	1	3
11	Travelling just for the people	When I was 21, I moved to New York City. An old friend travelled many hours and came to stay with me for a couple days. It was his first time in New York. I said, “Do you want to see the Statue of Liberty?  Empire State Building?  Central Park? ...	https://sive.rs/travp	2023-02-06 00:00:00	f	1	3
12	Want anonymity? Make a persona not a mystery.	Because of my open inbox, I meet a lot of strangers. I love it. Almost everyone tells me who and where they are in the world. If they don’t, I wonder. Am I talking with someone from Australia? Philippines? Brazil? Are they 20 or 60? Male or...	https://sive.rs/anon	2023-02-02 00:00:00	f	1	3
13	I want to lose every debate.	My favorite moments in life are when someone shows me a new perspective — a way of thinking I had never considered. Ideally it’s something I opposed, but they help me understand why it works for them. The sex worker explains why she loves her...	https://sive.rs/led	2023-01-31 00:00:00	f	1	3
14	Conversations with Tyler Cowen	Tyler Cowen is my favorite interviewer of all-time. His interviewing style has spoiled me for all others. He creates a tasting feast for the mind. First he finds brilliant accomplished people that he wants to learn from — people that are not too...	https://sive.rs/tyler	2023-01-29 00:00:00	f	1	3
15	Reading the Bible start to finish	I like going to the source. Like finding musicians’ influences, and getting to know that music too. Same with film, art, philosophy, and technology. I also like doing what people I admire recommend. And a few people I really admire suggest we read...	https://sive.rs/bible	2023-01-27 00:00:00	f	1	3
16	Make believe	Kids scream, “Monster in the hallway!”, and hide behind the couch. They stack up cushions for protection, and plan their defense. They know it’s not true — there’s not really a monster in the hallway — but it’s exciting to feel the adrenaline of...	https://sive.rs/mb	2022-10-30 00:00:00	f	1	3
17	Daily run, part two	In my previous post, “a daily run” — (please read it first) — running was a metaphor for whatever actions you take in your life. The story is about how we choose beliefs because they’re useful, not true. Beliefs make emotions. Emotions make...	https://sive.rs/run2	2022-10-28 00:00:00	f	1	3
18	Static HTML comments	If you have a static HTML website, but you want to include comments, here’s an interesting way to do it using PostgreSQL’s NOTIFY and LISTEN. The big idea is to write the comments as static HTML, only when comments change, instead of doing a...	https://sive.rs/shc	2022-10-08 00:00:00	f	1	3
19	Daily run, part one	Every day you go on a long run through the forest. You picture a pot of gold at the end. It helps you finish when you feel like quitting. One day you pretend there’s a tiger right behind you. It makes you much faster, so you keep using this...	https://sive.rs/run	2022-09-28 00:00:00	f	1	3
20	Your explanations are not true	We all confabulate without realizing it. To confabulate is to create an explanation that you believe to be true. “Con” means together, and “fabula” means story or fable, so: to put together a story. Confabulate. To fabricate. When you don’t know...	https://sive.rs/confab	2022-09-20 00:00:00	f	1	3
21	Shortest date, and ketchup	Here’s a story about my shortest date, and ketchup. I was dating in New York City, and matched with someone named Kelly. We agreed to meet, so I called her to decide where. She had a miserable voice, creaky and weary, but I tried not to judge. I...	https://sive.rs/ketchup	2022-09-12 00:00:00	f	1	3
22	full-length videobook for “Your Music and People”	Today I’m releasing something I’ve been working on since 2019. It’s a full-length animation for my book “YOUR MUSIC AND PEOPLE”. 2½ hours long, it contains the entire audiobook, animated throughout. Hand-drawn by the great Patrick Smith over the...	https://sive.rs/ymap	2022-09-08 00:00:00	f	1	3
23	Anything You Want — third edition for 2022	In 2011, I got a phone call from a number I didn’t recognize. “Hello?” “Derek. It’s Seth Godin.” “Wow! Hi Seth!” “I’m starting a new publishing company, so I want you to write a book.  Short, like a manifesto.  Will you do it?” “Uh,...	https://sive.rs/a3	2022-08-25 00:00:00	f	1	3
24	Scuba, panic, empathy	I used to scoff at those people who had panic attacks. “The cake is late! Oh no! I’m freaking out! I can’t breathe!” Ridiculous. Hysterical. Over-reacting. I was learning scuba diving, and went on my first practice dive. While I was 15 meters...	https://sive.rs/dive	2022-07-26 00:00:00	f	1	3
25	Writing one sentence per line	My advice to anyone who writes: Try writing one sentence per line. I’ve been doing it for twenty years, and it improved my writing more than anything else. New sentence? Hit [Enter]. New line. Not publishing one sentence per line, no. Write like...	https://sive.rs/1s	2022-06-20 00:00:00	f	1	3
26	The joke that changed my life	Growing up in America, I didn’t know much about other cultures. When I was 25, my band got some gigs in Europe — my first time there. It was 1995. The European Union was new. I heard a street performer in Copenhagen tell this joke: “The EU will...	https://sive.rs/joke	2022-06-19 00:00:00	f	1	3
27	Find a good available .com domain	If you need a new domain name, and you want a .com, and you don’t want to type random ideas into a registrar search, here’s a way to do it. Download the list of all registered .com domains First, apply for access to the zone file, using ICANN’s...	https://sive.rs/com	2022-06-08 00:00:00	f	1	3
28	Travel is best with young children	“Once you have a baby, you can’t travel.” I’ve heard this so many times, although only from people who haven’t done it. But I took my baby to nine countries before he was one year old. Then another ten countries by the time he was eight. So I can...	https://sive.rs/tk	2022-05-09 00:00:00	f	1	3
29	Short URLs: why and how	If you make your own website, consider making short URLs. This is not about a URL shortener. This is about making your original URLs short in the first place. Instead of: yoursite.com/blog/2022/05/08/short-urls-why-and-how.html … consider...	https://sive.rs/su	2022-05-08 00:00:00	f	1	3
30	Ancestors, Luck, and Descendants	My Sivers ancestors came from Grantham, Lincolnshire, England on a boat to America in 1849. The boat crashed on rocks in the Irish sea, caught fire in the Atlantic Ocean, got pushed off course repeatedly by storms, and finally landed in New Orleans...	https://sive.rs/ald	2022-03-24 00:00:00	f	1	3
31	Why I left America	I was living on the beach in Santa Monica, California, and life was perfect. I was in paradise, and deeply happy. Friends wanted to travel, but I had no interest. I had already lived a few years each in New York City, Boston, Chicago, Portland,...	https://sive.rs/left	2022-03-09 00:00:00	f	1	3
32	Write plain text files	I write almost everything important in my life: thoughts, plans, notes, diaries, correspondence, code, articles, and entire books. They are my extended memory — my noted self — my organized thoughts. I refer to them often. I search them, update...	https://sive.rs/plaintext	2022-03-02 00:00:00	f	1	3
33	Generate unique random values directly in the database	You often need to generate random strings, like for login cookies and unique entry codes. These strings always need to be stored in the database. So make your life simpler by generating the random strings directly in the database. Here's a very...	https://sive.rs/rand1	2022-03-01 00:00:00	f	1	3
34	Database triggers to clean text inputs	Even smart people can accidently put bad data into a database. We copy text from a web page, then paste it into a form, not realizing it also copied a space, tab, or newline character. Then your system thinks someone’s name is not “Jim” but “...	https://sive.rs/clean1	2022-03-01 00:00:00	f	1	3
35	Database functions to wrap logic and SQL queries	When you make a database-backed app, you have some functions that need to run multiple database queries. For example, to move money from one account to another, you have to insert a negative amount into account #1, and a positive amount into...	https://sive.rs/api01	2022-02-28 00:00:00	f	1	3
36	Database trigger recalculates totals, for data integrity	When you make a database-backed app, you write code to ensure data integrity in related fields. If an item is sold, you update the inventory. If someone withdraws money, you update their balance. You recalcuate the total and update the related...	https://sive.rs/recalc	2022-02-27 00:00:00	f	1	3
37	About my book notes	At sive.rs/book I have a collection of my notes from the 320+ books I’ve read since 2007. This page is just to answer some questions about it. My notes are not a summary of the book! When I’m reading and come across a surprising or inspiring...	https://sive.rs/bfaq	2022-01-26 00:00:00	f	1	3
38	Considerate book pricing	I love having my own store so I can make things the way I think they should be. For example, I disagree with the usual pricing of books. If I buy a book in one format, it doesn’t seem fair to pay full price to get it in another format. That would...	https://sive.rs/bp	2021-10-27 00:00:00	f	1	3
39	How many pets do you have?	I used to have too many pets. Each time I adopted one, I was fully in love. I was enamored with the potential. Each new pet was meant to be my constant companion. So I would take it home, and love it. But eventually I would discover a new pet, and...	https://sive.rs/pets	2021-08-13 00:00:00	f	1	3
40	$250K books sold. $250K to save lives.	2023 UPDATE: see “$575K of books sold. $575K to save lives.” Six weeks ago I emailed my private email list with a secret link to buy my new books. They’re not even officially released yet, but they’ve already sold over $250,000. I made 5000...	https://sive.rs/250k	2020-08-06 00:00:00	f	1	3
41	How to learn JavaScript	Since I’ve mentioned that I recently learned JavaScript, people have asked me how and what I recommend. So here’s my experience and best advice for 2020. Learn plain JavaScript First, it’s important to learn plain JavaScript. Don’t depend on a...	https://sive.rs/learn-js	2020-06-22 00:00:00	f	1	3
42	Time is personal. Your year changes when your life changes.	A new day begins when I wake up, not at midnight. Midnight means nothing to me. It’s not a turning point. Nothing changes at that moment. A new year begins when there’s a memorable change in my life. Not January 1st. Nothing changes on January...	https://sive.rs/mny	2019-12-30 00:00:00	f	1	3
43	Experiments in music and life	One approach to music is to do whatever you want. Absolutely anything goes. But to me, that’s too free. It’s anti-inspiring because having infinite options is overwhelming. Another approach to music is to follow tradition. You stay within the...	https://sive.rs/eml	2019-11-07 00:00:00	f	1	3
66	What happens when we ignore plans?	I took my 7-year-old to London today. I made two plans: if it rains, we go to a museum, if not, we go to the zoo. But when the train arrived in London, he said he didn’t really want to do either one. So we just walked with no plans. We...	https://sive.rs/ldn	2019-10-05 00:00:00	f	1	3
44	Writing daily, but posting when ready	I just finished an experiment. Last month, I published a new article to my blog every day. I’m glad I tried it, but ultimately I didn’t like it. Here’s why: It made my writing worse, not better. I was trying to force a conclusion quicker. I was...	https://sive.rs/nod	2019-11-01 00:00:00	f	1	3
45	How I got rich on the other hand	I don’t usually talk about money, but a friend asked me what it was like to get rich, and he wanted to know specifics, so I told him my story. I had a day job in midtown Manhattan paying $20K per year — about minimum wage. On weekends I would earn...	https://sive.rs/richand	2019-10-30 00:00:00	f	1	3
46	Podcast published today	Starting today you can follow my podcast at sive.rs/podcast.rss or listen on the web at sive.rs/podcast. Each episode is around two minutes long. They are my posts since September 22nd. 33 episodes so far. I generated the RSS XML feed myself...	https://sive.rs/pinit2	2019-10-29 00:00:00	f	1	3
47	When in doubt, try the difference	If you’re in doubt about something that’s not in your life, try it. Things are so different in practice versus in theory. The only way to know is to experience it yourself. Try it examples: Pursuing a new interest? Moving somewhere very...	https://sive.rs/trd	2019-10-28 00:00:00	f	1	3
48	Why experts are annoying	When someone becomes an expert at something, you know what else they become? Annoying. At a restaurant, your designer friend complains about the font on the menu, your musician friend complains about the background music, and your manager friend...	https://sive.rs/exan	2019-10-27 00:00:00	f	1	3
49	What you learn by travelling	I wanted to learn about the world, so I went travelling. People in the east are so graceful, I felt like an inconsiderate pig. People up north are so serious, I felt like a lightweight clown. People down south are so laid-back, I had to escape...	https://sive.rs/trav1	2019-10-26 00:00:00	f	1	3
50	PostgreSQL example of self-contained stored procedures	First, see my previous article about PostgreSQL functions at sive.rs/pg. That article gave tiny examples, but no finished working code. This week, I wrote a shopping cart to sell my books directly from my own site. So I took a couple extra hours...	https://sive.rs/pg2	2019-10-25 00:00:00	f	1	3
51	Mastery school	Here’s an idea: Create a little school somewhere remote. School of what? School of mastery. A place for anyone who wants go focus on a skill of their choice, surrounded by other people doing the same, and a few coaches — experts on the craft of...	https://sive.rs/masch	2019-10-24 00:00:00	f	1	3
52	Monthly self-expansion project	Here’s an idea: Every month, pick something you hate or know nothing about, and get to know it well. Spend a few hours per week, for an entire month, just learning about that subject. Why? The idea is inspired by a very successful friend of mine...	https://sive.rs/exex	2019-10-23 00:00:00	f	1	3
53	Living according to your hierarchy of values	My “daily” blog was silent the last four days, because I took my kid on a spontaneous trip to another country. No phone. No computer. I gave him my full attention every day from when he woke me in the morning to when we fell asleep together at...	https://sive.rs/vls1	2019-10-22 00:00:00	f	1	3
54	How to ask your mentors for help	I have three mentors. When I’m stuck on a problem and need their help, I take the time to write a good description of my dilemma, before reaching out to them. I summarize the context, the problem, my options, and thoughts on each. I make it as...	https://sive.rs/ment	2019-10-17 00:00:00	f	1	3
55	When you win the game, you stop playing	Someone asked me today why I don’t charge money for the things I do. Why don’t I have ads on my site? Why don’t I exploit my assets and pursue some profitable things? I already did that. I made more than I’ll ever be able to spend. What do you...	https://sive.rs/wtg	2019-10-16 00:00:00	f	1	3
56	Digital pollution	You couldn’t just roll down the street leaving huge piles of garbage everywhere you go, making life slower for everyone as they climb over your mountains of junk, just to get on with their life. You’d feel bad about it, right? That’s how I feel...	https://sive.rs/polut	2019-10-15 00:00:00	f	1	3
57	Cut out everything that’s not surprising	This is my advice to anyone writing something for the public — especially a talk on stage. People listen to a talk, or read an article, because they want to learn something new. They want a little “oh wow” moment. “I never thought of it that way...	https://sive.rs/d22	2019-10-14 00:00:00	f	1	3
58	Heed your fears	People often ask me how they can get over their fears. For example, they are scared to quit their job and start a business. I think they want me to say something to make their fears go away. So my advice is pretty disappointing. We should pay...	https://sive.rs/gofear	2019-10-13 00:00:00	f	1	3
59	Daydreaming is my favorite pastime	Somewhere in our past, we were told it’s bad to daydream, because it meant doing nothing — staring out the window — instead of doing what we’re supposed to be doing. To admit we’re daydreaming felt like it needed an apology. But now I’ve finally...	https://sive.rs/daydream	2019-10-12 00:00:00	f	1	3
60	Anti-chameleon	I don’t know why I have this rebellious nature. I tend to want to be the opposite of my surroundings. At serious formal events, I can’t stop laughing inside. At crazy festivals, I want to hide and read a book. My ambitious friends bring out the...	https://sive.rs/antic	2019-10-11 00:00:00	f	1	3
61	Where we do and don’t want automation	I used to use Gmail. But one day, as I typed my mother’s email address into the “To:” field, Google popped up a prompt asking if I also wanted to CC my uncle. That was so invasive and creepy that I deleted the account immediately and never used it...	https://sive.rs/autom	2019-10-10 00:00:00	f	1	3
62	Human nature to focus on the one bad thing	Today my bus was delayed, and I was really annoyed. Also, I got a really nasty email, which put me in a worse mood. No, wait, I should give the full story. It takes two busses to get from the airport back to my house. The first bus leaves once...	https://sive.rs/negz	2019-10-09 00:00:00	f	1	3
63	Back and forth between super-hot and super-cold	The most relaxed feeling I know is after going back and forth between a super-hot pool and super-cold pool. Stay in the super-hot pool until you can’t stand it. Then go in a super-cold pool until you can’t stand it. Repeat that a few times, and...	https://sive.rs/sauna	2019-10-08 00:00:00	f	1	3
64	Err on the side of action, to test theories	I spend a lot time thinking of alternate ways to approach life. I re-consider my hierarchy of values. When values change, the plan of action needs to change, too. For example, if I decide that personal growth is top priority, then I plan a life...	https://sive.rs/erra	2019-10-07 00:00:00	f	1	3
65	Blowing off work to play	What do you call it when you skip school or work for a day, to do whatever you want instead? In America, we call it playing hooky. In England, we call it skiving. (Got another word for it?) Some of my best, most productive, and enjoyable days have...	https://sive.rs/hooky	2019-10-06 00:00:00	f	1	3
67	Tour -isms	Since I’m living in Europe now, I thought it would be good to tour everywhere in Europe, and get to know it better. I’m not into seeing the sights. I don’t take photos. What I want is to get to know the mindset, the world-view of each place. The...	https://sive.rs/isms	2019-10-04 00:00:00	f	1	3
68	Meta-considerate	My friend has a huge crush on someone. He showers her with attention and appreciation. He remembers her preferences, and constantly gives her thoughtful gifts. He thinks he’s being considerate, but he’s actually being...	https://sive.rs/metac	2019-10-03 00:00:00	f	1	3
69	Daydreaming the downside, for once	A few years ago, I thought it would be fun to get into camping. I live in New Zealand! How can I not? I daydreamed about it, picturing how much fun it could be. I read a book about it. I carefully picked out then bought some highly-recommended...	https://sive.rs/ddown	2019-10-02 00:00:00	f	1	3
70	Where to find the hours to make it happen	When you experience someone else’s genius work, a little part of you feels, “That’s what I could have, would have, and should have done!” Someone else did it. You didn’t. They fought the resistance. You gave in to distractions. They made it top...	https://sive.rs/uncomf	2019-10-01 00:00:00	f	1	3
71	Your heroes show which way you’re facing	People with many interests often ask my advice on which industry or career path they should follow. Years ago, I felt I was just a programmer and entrepreneur. Yes sometimes I write a tiny blog post sharing what I’ve learned, but that’s just...	https://sive.rs/hf	2019-09-30 00:00:00	f	1	3
72	Don’t quote. Make it yours and say it yourself.	Which sounds better to you? “In his best-selling book on behavioral science, Thinking, Fast and Slow, Nobel-prize winning psychologist Daniel Kahneman said, ‘Nothing in life is as important as you think it is when you are thinking about it.’.” …...	https://sive.rs/dq	2019-09-29 00:00:00	f	1	3
73	Have a private email account	I used to like the internet. I thought it was cool, creative, wild, untamed, expressive, decentralized, and educational. I guess it was, back then, but now? I kinda hate most of what’s out there. I don’t like social media, either. Staged photos,...	https://sive.rs/pe	2019-09-28 00:00:00	f	1	3
74	Future posthumous autobiography	I’ve started writing my autobiography. I’ll keep writing it for the rest of my life. It’s private now, but will be released the week I die. I’ve written the last chapter, which is more of an afterword. (“Now I’m dead.”) So now I will just keep...	https://sive.rs/abio	2019-09-27 00:00:00	f	1	3
75	Cross the world four times	Cross the world four times. First, in your teens or 20s, to take it all in. See it all, do it all, and learn. Get involved. Stay up all night talking with strangers, everywhere. Kiss and fall and promise to them all. Make lots of mistakes. Cross...	https://sive.rs/4	2019-09-27 00:00:00	f	1	3
76	What I did belies why	Imagine you host a dinner party with two doctors and two accountants. You introduce the doctors to each other and the accountants to each other, assuming they’d have the most in common. But actually one doctor got into it because her mother died...	https://sive.rs/ww	2019-09-26 00:00:00	f	1	3
77	Would you make your art if you were the last person on earth?	Musicians, photographers, writers, and artists of all sorts: Would you make your art if you were the last person on earth? For me, it’s an immediate YES — of course! In fact, it might make the experience even better. A musician friend asked me...	https://sive.rs/tp3	2019-09-25 00:00:00	f	1	3
78	Travel without social praise	I met a couple who were thinking of quitting their jobs and travelling the world for a year. They asked my thoughts. I suggested they should only do it if they don’t bring a camera, and don’t tell anyone but their family and few dear friends. No...	https://sive.rs/tp2	2019-09-24 00:00:00	f	1	3
79	Travel without a phone	The first time, it was an accident. I’d always wanted to go to Korea. I was so excited. I set out to explore and forgot my phone in the hotel. I walked around Seoul for twelve hours that day and experienced so many wonderful things. I remember...	https://sive.rs/tp1	2019-09-23 00:00:00	f	1	3
80	initialize	I’m starting a podcast today. Subscribe to https://sive.rs/podcast.rss.	https://sive.rs/pinit	2019-09-22 00:00:00	f	1	3
81	My old clothes don’t fit	I was uncomfortable, unhappy, and restless. I didn’t want to meet new people, because I felt I was giving the wrong impression. Something wasn’t right. It took me months to figure out the real problem: My clothes don’t fit anymore! Once I realized...	https://sive.rs/clothes	2019-07-31 00:00:00	f	1	3
82	Doors and windows and what’s real	Like everyone, I live in a little house with many doors and windows. One door goes out to my neighborhood. The local kids come to play with my dog. The elderly neighbors take so long to tell me their stories. I slow down my inner clock to...	https://sive.rs/dw	2019-07-01 00:00:00	f	1	3
83	I’ve moved from New Zealand to Oxford England	I rarely cry, but I cried a lot last month, leaving New Zealand. I’ve never loved and felt so connected to a place before. It wasn’t simple sadness that made me cry, but overflowing appreciation. I’d been feeling it for years, almost every day,...	https://sive.rs/ox1	2019-03-08 00:00:00	f	1	3
84	Benefits of a daily diary and topic journals	You know those people whose lives are transformed by meditation or yoga or something like that? For me, it’s writing in my diary and journals. It’s made all the difference in the world for my learning, reflecting, and peace of mind. After 20+...	https://sive.rs/dj	2019-01-28 00:00:00	f	1	3
85	Subtract	Life can be improved by adding, or by subtracting. The world pushes us to add, because that benefits them. But the secret is to focus on subtracting. Imagine a number line, with 0 on the left and 20 on the right. Say I want to be in the middle, at...	https://sive.rs/subtract	2018-12-05 00:00:00	f	1	3
86	The art of selfishness	David grew up in St. Louis, Missouri, USA, with five brothers and sisters. When he was 18, he got accepted to a very prestigious art school in Vienna. Vienna! This was his dream come true! He had wanted this so badly, but never thought he’d...	https://sive.rs/aos	2018-11-18 00:00:00	f	1	3
87	You don’t need confidence, just contribution.	Years ago, I was so confident and so naive. I was sure I was right and everyone else was wrong. After I sold my company, I felt ready to do something new, so I started to learn. But the more I learned, the more I realized how little I knew and how...	https://sive.rs/contrib	2018-08-06 00:00:00	f	1	3
88	Unlearning	Things I learned in the past are now wrong. Times have changed. Beliefs that were true are now false. They were based on old limitations that are now gone. Ways that used to work don’t work anymore. The old road collapsed. There’s a tunnel...	https://sive.rs/unlearning	2018-06-07 00:00:00	f	1	3
334	Node Tools in Blender 4.0	Node tools are available in Blender 4.0 Beta!	https://code.blender.org/2023/10/node-tools/	2023-10-05 10:43:17	f	9	2
89	If you’re not feeling “hell yeah!” then say no	Most of us have lives filled with mediocrity. We said yes to things that we felt half-hearted about. So we’re too busy to react when opportunities come our way. We miss out on the great because we’re busy with the mediocre. The solution is to say...	https://sive.rs/hyn	2018-06-03 00:00:00	f	1	3
90	About this book	In my first book, Anything You Want, I told the story of how I started, grew, and sold my company. As part of selling the company, I signed a non-compete agreement that said I couldn’t do the one thing I’d been doing since I was twenty-seven years...	https://sive.rs/hy1	2018-06-01 00:00:00	f	1	3
91	OpenBSD : why and how	The only operating system I use on my computers is not Mac, not Windows, and not even Linux. It’s OpenBSD, and I love it so much. So I figured I should say a little something about why, and how you can try it. It’s probably not for you. It’s...	https://sive.rs/openbsd	2018-04-20 00:00:00	f	1	3
92	Moving for good	You are the way you are because of what you’ve experienced. Your country, family, town, random circumstances, and friends have shaped the way you think. If you had grown up on the other side of the world, you would have a different set of values...	https://sive.rs/mfg	2018-03-31 00:00:00	f	1	3
93	Why I’m not on Facebook	I tried Facebook for a few weeks in 2007, but I hadn’t really used it since then. I would log in once a month for a few minutes and click [ACCEPT] to all the friend requests from strangers, then log out. I hit the 5000 friend-limit, so I created a...	https://sive.rs/facebook	2018-03-21 00:00:00	f	1	3
94	Detailed dreams blind you to new means.	There’s a fable of a man stuck in a flood. Convinced that God is going to save him, he says no to a passing canoe, boat, and helicopter that offer to help. He dies, and in heaven asks God why He didn’t save him. God says, “I sent you a canoe, a...	https://sive.rs/details	2018-03-18 00:00:00	f	1	3
95	Include everyone in your success.	Everyone who is drawn to you before you’re famous is thinking the same thing: You might be famous soon! fans who want to help you professionals who want to meet you musicians who want to play with you companies that want to work with...	https://sive.rs/inclev	2018-03-07 00:00:00	f	1	3
96	My writing process	This is what I do for everything I post: Write all of my thoughts on a subject. Argue against those ideas. Explore different angles until I’m sick of it. Leave it for a few days or years, then repeat those steps. Hate how messy these thoughts...	https://sive.rs/7	2018-03-06 00:00:00	f	1	3
97	Keep in touch.	When I was promoting myself as a musician, I noticed an interesting pattern. If I had a good conversation with somebody in the music business, then quite often they would send an opportunity my way within a day or two. In other words, when I look...	https://sive.rs/kit	2018-03-05 00:00:00	f	1	3
98	Be an extreme character.	This is both fun and considerate. When people say that a movie has a great character, they mean it was someone especially shocking, funny, or honest. To be a great entertainer, you need to be larger than life. Push your outer boundaries. Show...	https://sive.rs/evers	2018-02-28 00:00:00	f	1	3
99	Get specific!	This is one of the most useful lessons I’ve learned in life. When you don’t know your next step… When you’re feeling unmotivated… When asking someone to help you… When you’re ready to make a dream come true… Get more specific about what’s...	https://sive.rs/get-specific	2018-02-25 00:00:00	f	1	3
100	What it means to be resourceful	I was at a musicians’ gathering in Memphis. I met a lot of people complaining that their various forms of online distribution weren’t earning them as much as they’d hoped. Then I met a musician who sold 8000 copies of his album himself. No...	https://sive.rs/res	2018-02-23 00:00:00	f	1	3
101	Rock stars have a boss?	I was 20 years old. I had just moved to New York City. And I was working inside the music industry. I ran the music library at Warner/Chappell. It was a huge room, near the executives’ offices, and I had it all to myself. Rock stars would come...	https://sive.rs/noboss	2018-02-18 00:00:00	f	1	3
102	Never wait.	One of the top music industry lawyers in Los Angeles was speaking at a conference. She’s an expert in copyright law, so someone asked her advice on a licensing problem. They had recorded their version of a famous song, but were unable to get the...	https://sive.rs/neverwait	2018-02-17 00:00:00	f	1	3
103	The higher the price, the more they value it.	Psychology experiments have shown that the more people pay for something, the more they value it. People given a placebo pill were twice as likely to have their pain disappear when they were told that the pill was expensive. People who paid more...	https://sive.rs/morepay	2018-02-16 00:00:00	f	1	3
104	Creative communication	The way you communicate with people is part of your art. For people who have never heard your music, it’s the start of your art! If you make depressing music, send your fans a dark black announcement that’s depressing just to look at. If you are...	https://sive.rs/reach	2018-02-15 00:00:00	f	1	3
105	Considerate communication	You get a big long email from someone and think, “Ooof. I’ll come back to that later.” (Then you never do.) Someone tries to contact you using a technology you hate, like a surprising incoming video call. You have a dilemma and need a good...	https://sive.rs/ccom	2018-02-15 00:00:00	f	1	3
106	Get personal.	Before I got into the music industry, I had an idea of what it would look like: Some powerful manager or agent calling me into his office to discuss the business of my music. Then I moved to New York City and became friends with cool people who...	https://sive.rs/gpers	2018-02-14 00:00:00	f	1	3
107	Pedestals prevent friendships.	I was a struggling musician, with big ambitions but not much success, when I went to a music industry conference in Las Vegas to promote my music. I was nervous, but doing everything I could to make connections with the managers at all the big...	https://sive.rs/pedestal	2018-02-13 00:00:00	f	1	3
108	Use the internet, not just companies.	I’ve been online since 1994, and seen so many companies come and go. In the year 2000, the place to be was mp3.com. Every musician would keep all of their music and fans there. A few years later, it was gone — shut down — all music and fan lists...	https://sive.rs/netskill	2018-02-12 00:00:00	f	1	3
109	Move to the big city.	I hate to admit this, but it’s true. One of the best things you can do for your career is to move to a big city — one of the major media centers — the places that broadcast to the entire world. Nothing less than New York, Los Angeles, London,...	https://sive.rs/city	2018-02-11 00:00:00	f	1	3
110	Why you need a database	A database is just an organized collection of information. You could have a database of your music or your books. But I’m going to talk about a database of all the people you know. Your email app is a kind of database. It has an address book of...	https://sive.rs/dbt	2018-02-09 00:00:00	f	1	3
111	Shed your money taboos.	Everyone has weird mental associations with money. They think the only way to make money is to take it away from others. They think that charging for your art means it was insincere, and only for profit. But after knowing thousands of musicians...	https://sive.rs/mn1	2018-02-05 00:00:00	f	1	3
112	Pricing philosophy	For years I made a living playing at universities. One time a college far away in Ohio — about a 12-hour drive — asked what I would charge to do a two-hour show. I said, “$1500”. She said, “Oh, that’s a bit too much. What would you charge to do...	https://sive.rs/pp	2018-01-23 00:00:00	f	1	3
113	Art doesn’t end at the edge of the canvas.	Imagine you see a caged feather on a museum wall. The sign underneath says the artist is a political activist in jail. Imagine that same caged feather again. But instead the sign says the artist is a high school kid in Florida. Or imagine that...	https://sive.rs/ext	2018-01-22 00:00:00	f	1	3
114	It’s hard to get off stage.	Being a songwriter is weird. You dig deep inside yourself. You extract and explain your emotions. Then you broadcast your innermost feelings to the biggest possible audience. It’s a life that demands a deep focus on yourself. It’s all you, you,...	https://sive.rs/stage	2018-01-16 00:00:00	f	1	3
115	“Marketing” just means being considerate.	Don’t confuse the word “marketing” with advertising, announcing, spamming, or giving away branded crap. Really, “marketing” just means being considerate. Marketing means making it easy for people to notice you, relate to you, remember you, and...	https://sive.rs/cons	2018-01-15 00:00:00	f	1	3
116	Repeatedly follow-up to show you care.	I knew a music publicist in New York City when she was at the peak of her success. A few of her clients had hits, so everyone wanted to work with her. She was flooded with new music. Here’s how she dealt with the flood: Whenever someone sent...	https://sive.rs/3in	2018-01-14 00:00:00	f	1	3
117	Unlikely places and untangled goals	I once went without food for ten days, and that was fine. But the two things I can’t do without for long are solitude and silence. (Freedom from people and their noises.) I was on a holiday in Ireland with seven members of my family, all packed...	https://sive.rs/unun	2017-12-11 00:00:00	f	1	3
118	What are the odds of that?	Three true stories: In 1992, in Tokyo, I dated a girl named Masako. After our month together, she moved to London. We lost touch. In 2008, I was in London for a few days. I wondered if Masako still lived there, sixteen years later. A minute...	https://sive.rs/odds	2017-07-03 00:00:00	f	1	3
119	Parenting : Who is it really for?	Since my son was born five years ago, I’ve spent at least thirty hours a week with him, just one-on-one, giving him my full attention. But I’ve never written about parenting before because it’s a touchy subject — too easily misunderstood. So why...	https://sive.rs/pa	2017-06-26 00:00:00	f	1	3
120	To hone your writing, hire a translator.	.ar, .de, .eo, .es, .fr, .ja, .ko, .pt, .ru, .zh, aside { display: none; } Deutsch English Español Esperanto Français Português Русский 中文 日本語 한국어 العربية حتى تتمكن من صقّل كتاباتك، قُم باستئجار مترجم. Um dein Schreiben zu verbessern,...	https://sive.rs/tra	2017-06-21 00:00:00	f	1	3
121	Ego is the Enemy	A friend asked why I don’t write more often. I told her it’s my minimalism, not wanting to put anything into the world unless necessary. And because of the size of my mailing list, I don’t want to bother people unless it’s really important. She...	https://sive.rs/ego	2017-06-16 00:00:00	f	1	3
122	Actions, not words, reveal our real values	I told my old coach that I really wanted to start my new company. He said, “No, you don’t.” I said, “Yes, I do! This is really important to me!” He said, “No, it’s not. Saying it doesn’t make it true.” I said, “You can’t ignore what I’m...	https://sive.rs/arv	2017-06-16 00:00:00	f	1	3
123	Think like a bronze medalist, not silver	Imagine the Olympics, where you have the three winners of a race standing on the podium: the gold, the silver, and the bronze. Imagine what it’s like to be the silver medalist. If you’d been just one second faster, you could have won the...	https://sive.rs/bronze	2017-03-13 00:00:00	f	1	3
124	Art is useless, and so am I	Art is useless by definition. If it was useful, it would be a tool. For the past twenty years, I was obsessed with being useful. That one measure drove all of my daily decisions: “How can I be the most useful to the most people today?” That...	https://sive.rs/useless	2017-03-10 00:00:00	f	1	3
125	Quitting something you love	Personal change needs some space to happen. To bring something new into your life, you need somewhere to put it. If your current habits are filling your day, where are these new habits supposed to go? The English word “quit” comes from old...	https://sive.rs/quit	2016-12-30 00:00:00	f	1	3
126	Solitary socialite	For the past ten years, I’ve answered up to two hundred emails per day. I sit alone in my little office for hours, engaging with everyone’s stories and questions for a few minutes each. Then when friends want to hang out with me, I say I need some...	https://sive.rs/soso	2016-12-27 00:00:00	f	1	3
127	Frequently Asked Questions	In the last ten years, I have answered over 200,000 emails from 86,000 people. It’s my part-time job — my community service. These are the most common questions. What should I do about my career? Read the book “So Good They Can’t Ignore...	https://sive.rs/faq	2016-12-22 00:00:00	f	1	3
128	How to do what you love and make good money	People with a well-paying job ask my advice because they want to quit to become full-time artists. But full-time artists ask my advice because they’re finding it impossible to make money. (Let’s define “art” as anything you do for expression,...	https://sive.rs/balance	2016-12-19 00:00:00	f	1	3
129	Tilting my mirror (motivation is delicate)	Motivation is delicate. When you notice your motivation fading, you have to seek out the subtle cause. A simple tweak can make all the difference between achieving something or not. An hour outside my city, there’s a little mountain range. The...	https://sive.rs/tilt	2016-12-05 00:00:00	f	1	3
130	Why are you doing?	It’s crucial to know why you’re doing what you’re doing. Most people don’t know. They just go with the flow. Social norms are powerful. The inputs that influence you are powerful. A great talk, book, or video can instantly change how you...	https://sive.rs/why	2016-09-05 00:00:00	f	1	3
131	I’m a very slow thinker	When a friend says something interesting to me, I usually don’t have a reaction until much later. When someone asks me a deep question, I say, “Hmm. I don’t know.” The next day, I have an answer. I’m a disappointing person to try to debate or...	https://sive.rs/slow	2016-08-26 00:00:00	f	1	3
132	Keep earning your title, or it expires	Until yesterday, I called myself an entrepreneur. Now, I don’t. It’s been years since I started a company, so I can’t keep using that title. Someone who played football in high school can’t call himself an athlete forever. Someone who did...	https://sive.rs/expire	2016-08-04 00:00:00	f	1	3
133	When you’re extremely unmotivated	Like everyone, I get those times when I’m unmotivated to do anything. Brain dead. No energy. Everything feels like, “Why bother? What’s the point?” But I’ve finally figured out what to do with those times. Like everyone, I have a list of boring...	https://sive.rs/unmo	2016-08-02 00:00:00	f	1	3
134	Disconnect	All the best, happiest, and most creatively productive times in my life have something in common: being disconnected. No internet. No TV. No phone. No people. Long uninterrupted solitude. When I was twenty-two, I quit my job and spent five months...	https://sive.rs/dc	2016-07-27 00:00:00	f	1	3
135	Don’t add your two cents	“My two cents” is American slang for adding a small opinion or suggestion. An employee says to the boss, “I’ve been working for the past two weeks on this new design. What do you think?” The boss says, “Good job. Maybe just change the blue to...	https://sive.rs/2c	2016-07-25 00:00:00	f	1	3
136	Possible futures	I occasionally get a big vision for my future — a huge project that will take many months or years. Something exciting and very worth doing. I’ll do a bunch of research, make a bunch of plans, and feel like I’ve made a big decision on a new...	https://sive.rs/futures	2016-04-27 00:00:00	f	1	3
137	Singing the counter-melody	My advice and opinions may sound strange on their own. Do you know what musical counterpoint is? Underneath the main melody, you have a counter-melody that goes against it, and together they make harmony. This is different from harmonizing, where...	https://sive.rs/counter	2016-04-21 00:00:00	f	1	3
138	How to stop being rich and happy	(part of the “do this” directives) 1. Prioritize lifestyle design. You’ve made it, so it’s all about you, now.  Make your dreams come true. Shape your surroundings to please your every desire. Make your immediate gratification the most...	https://sive.rs/d1x	2016-04-18 00:00:00	f	1	3
139	How to be useful to others	(part of the “do this” directives) 1. Get famous. Do everything in public and for the public. The more people you reach, the more useful you are. The opposite is hiding, which is of no use to anyone. 2. Get rich. Money is neutral proof you’re...	https://sive.rs/d1u	2016-04-18 00:00:00	f	1	3
140	How to thrive in an unknowable future	(part of the “do this” directives) 1. Prepare for the worst. Since you have no idea what the future may bring, be open to the best and the worst. But the best case scenario doesn’t need your preparation or your attention. So mentally and...	https://sive.rs/d1t	2016-04-18 00:00:00	f	1	3
141	What to do when you get successful	(part of the “do this” directives) 1. Change yes to “Hell yeah!” or no. Once successful, you need to switch strategies. To get successful, you had to say yes to everything. Now if you continue doing that, you’ll drown in all the...	https://sive.rs/d1s	2016-04-18 00:00:00	f	1	3
142	How to get rich	(part of the “do this” directives) 1. Live where luck strikes. Live where everything is happening, where the money is flowing, where careers are being made, where your role models live. Once there, be as in the game as anyone can be. Be...	https://sive.rs/d1r	2016-04-18 00:00:00	f	1	3
143	How to like people	(part of the “do this” directives) 1. Assume it’s their last day. Everyone talks about living like it’s your last day on earth. Instead, to appreciate someone, live like it’s their last day on earth. Treat them accordingly.  Try to fulfill...	https://sive.rs/d1p	2016-04-18 00:00:00	f	1	3
144	Do this. Directives — part 1	First see “just tell me what to do” for context. These directives will take another form some day, with more details and references. And there are many more to come. But I decided to post this outline now, because so many people have asked for...	https://sive.rs/d1	2016-04-18 00:00:00	f	1	3
145	Don’t start a business until people are asking you to	When you bake a cake, you need to do first things first. You need to get the ingredients before you turn on the oven. You need to bake it before you frost it and slice it. I meet a lot of people who want to start a business. Some don’t have an...	https://sive.rs/asking	2016-04-13 00:00:00	f	1	3
146	Interviews at sive.rs/i	I’ve been the guest on 54 interview shows, most of them in the past year. Now you can hear or read them all in one place: sive.rs/i You might find them interesting because I put a lot of heart into them, getting personal in a way I don’t in my...	https://sive.rs/interviews	2016-03-27 00:00:00	f	1	3
147	Why I don’t promote	Every day, someone asks me to promote or announce something they’ve created. Every day, I have to say no, no matter who or what it is. It upsets me every time. Almost everyone I know is a creator. Everyone has made a song, site, video, book,...	https://sive.rs/nopr	2016-03-17 00:00:00	f	1	3
148	Happy, Smart, and Useful	There are three things to consider when making life-size decisions: What makes you happy What’s smart — meaning long-term good for you What’s useful to others We have a tendency to forget one of these. For example: Smart and useful (but not...	https://sive.rs/hsu	2016-03-03 00:00:00	f	1	3
149	Assume men and women are the same	Men say, “Women can never make up their minds.” But actually both men and women are equally indecisive. Women say, “Men think one thing but say another.” But actually both men and women are equally indirect. We think the differences between...	https://sive.rs/mw	2016-02-28 00:00:00	f	1	3
150	Beware of advice	Imagine that you hand someone your camera, and ask him to take a photo of you. He does, but when you look at the photo later, you notice that he took a photo of himself by mistake. Imagine you’ve got a big question like, “Should I quit my job and...	https://sive.rs/advice	2016-02-25 00:00:00	f	1	3
151	Overcompensate to compensate	You have something you want to change: a thought process or habit you want to fix. Let’s use the metaphor of a bunch of bricks on a seesaw. Right now all the bricks are stacked on one side. This is the way you have been. To make a change, most...	https://sive.rs/compensate	2016-02-23 00:00:00	f	1	3
152	How to take a compliment	You would think this would be a basic life skill, but it seems almost nobody knows it, so please spread the word. When someone gives you a compliment, what should you do? Do you say, “What? No! Not at all. That’s ridiculous.” Do you give details...	https://sive.rs/thx	2016-02-18 00:00:00	f	1	3
153	Why I don’t want stuff	About once a month, someone asks for my mailing address because they want to send me something. They liked something I wrote, and want to send me a gift in return. I’m very thankful, but have to say no. Here’s why. I live in a little pre-furnished...	https://sive.rs/gifts	2016-02-16 00:00:00	f	1	3
154	Should you learn programming? Yes.	When I was 14 years old, my guitar teacher told me something important: “You need to learn to sing. Because if you don’t, you’re always going to be at the mercy of some asshole singer.” His point was about self-reliance. If you ever have any...	https://sive.rs/prog	2016-02-14 00:00:00	f	1	3
155	Switch strategies	Life is like any journey. You need to change directions a few times to get where you want to go. Early in your career, the best strategy is to say yes to everything. The more things you try, and the more people you meet, the better. Each one...	https://sive.rs/switch	2016-01-27 00:00:00	f	1	3
156	nownownow.com	A month ago I announced the /now page movement, where many personal websites are adding a “/now” page to answer the question, “What are you focused on now?” At the time, only ten websites had a /now page. Now there are over 280. It’s...	https://sive.rs/now3	2015-11-20 00:00:00	f	1	3
157	The /now page movement	People often ask me what I’m doing now. Each time I would type out a reply, describing where I’m at, what I’m focused on, and what I’m not. So earlier this year I added a /now page to my site: sive.rs/now A simple link. Easy to remember. Easy to...	https://sive.rs/nowff	2015-10-21 00:00:00	f	1	3
158	Relax for the same result	A few years ago, I lived in Santa Monica, California, right on the beach. There’s a great bike path that goes along the ocean for seven and a half miles. So, fifteen miles round trip. On weekday afternoons, it’s almost empty. It’s perfect for...	https://sive.rs/relax	2015-10-02 00:00:00	f	1	3
159	Saying no to everything else	Steven Pressfield called himself an author for years, but he’d never actually finished a book. Eventually, the psychological pain of not finishing kept building until he couldn’t stand it anymore. He decided to finally beat the devil he calls “The...	https://sive.rs/no2	2015-09-23 00:00:00	f	1	3
160	“Just tell me what to do”: compressing knowledge into directives	Internalizing books Wanting to be successful, I’ve always read every book I thought could help. Even if a book had just one useful insight, it was worth the $20 and my time spent reading and thinking. A few years ago, I realized I was forgetting...	https://sive.rs/2do	2015-08-29 00:00:00	f	1	3
161	Simplify: move code into database functions	If you are a web or API developer, programming code that uses an SQL database, this is for you. I’ve found a very different and useful way to structure code. It’s made such a big difference for me that I had to share it here. How things...	https://sive.rs/pg	2015-05-04 00:00:00	f	1	3
162	Getting out of a bad state of mind	The last time I was in really bad state of mind, I used these five steps to get out of it. I’ve shared this with a few friends in a similar situation, and they said it helped. I hope it works for you too. 1. Ask myself what’s wrong in this very...	https://sive.rs/bad	2015-02-01 00:00:00	f	1	3
163	How to change or build your career	I get emails from many people wanting to change or build their career. I always recommend the best book on the subject: “So Good They Can’t Ignore You” by Cal Newport. Here are a few of its best points: Forget passion and purpose Forget “follow...	https://sive.rs/career	2014-10-06 00:00:00	f	1	3
164	Fixed mindset vs Growth mindset	One of the most important concepts I’ve learned is the difference between the “fixed” mindset and the “growth” mindset. It’s a little bit like “nature vs nurture”: People in a fixed mindset believe you either are or aren’t good at something,...	https://sive.rs/mindset	2014-09-21 00:00:00	f	1	3
165	I love being wrong	Most of the time, I feel smart, successful, and driven — like I’ve got it all figured out. But last month a bunch of stuff knocked me on my ass. I’ve never felt so wrong. I vulnerably called on friends for help. They gave me a bunch of good...	https://sive.rs/lw	2014-09-09 00:00:00	f	1	3
166	You can afford to be generous	Your business is secure. Even if it’s not, you have to feel that it is. Money is coming your way. You are doing well. You are one of the lucky ones. Most are not so fortunate. You can afford to be generous. All great service comes from this...	https://sive.rs/afford	2014-07-04 00:00:00	f	1	3
167	Lose every fight	Customer service often starts when someone has a problem, and is upset. When you feel attacked, it’s hard not to fight back, especially when you know they’re wrong. But the best thing to do is to lose the fight. Let them know that they were right,...	https://sive.rs/cs3	2014-07-03 00:00:00	f	1	3
168	Every interaction is your moment to shine	Probably only 1% of your potential customers ever bother to contact you. So when they do, it’s your time to shine. Three minutes spent talking with them is going to shape their impression of your company more than your name, price, design, or...	https://sive.rs/cs2	2014-07-02 00:00:00	f	1	3
169	Customer service is everything	I was honestly surprised that CD Baby was such a runaway success. But I was even more surprised to find out why. Whenever I was out at events, I’d listen as musicians would tell other musicians why they chose CD Baby. Was it the pricing? The...	https://sive.rs/cs1	2014-07-01 00:00:00	f	1	3
170	The philosophy of great customer service	I was honestly surprised that my company, CD Baby, was such a runaway success. But I was even more surprised to find out why. CD Baby had lots of powerful well-funded competitors, but after a few years they were all but gone, and we dominated our...	https://sive.rs/cs	2014-06-29 00:00:00	f	1	3
171	Loving what I used to hate	Be careful when you say you like or dislike something, because you could change your mind soon. The first time I heard Tom Waits’s music, when he was a guest on David Letterman, I thought it was so horrible that it must be a joke. Even years...	https://sive.rs/hate	2014-05-18 00:00:00	f	1	3
172	The Meaning of Life	Let’s just figure out the meaning of life, once and for all, in under 20 minutes, OK? This is a 19-minute talk I’ve given at four conferences in Ireland, Taiwan, India, and New Zealand. I’ve improved it after each, and finally consider it done, so...	https://sive.rs/ml	2014-05-05 00:00:00	f	1	3
173	Change careers like Tarzan	I get emails from many people who want to make a big change in their career. Each one wants to quit their current career, and boldly leap into their new venture or preferred lifestyle. When they ask my advice, they think I’m going to say, “Yes!...	https://sive.rs/tarzan	2014-03-30 00:00:00	f	1	3
174	What if you didn’t need money or attention?	You know that feeling you have after a big meal? When you’re so full that you don’t want anything more? Ever wonder what that would feel like in other parts of your life? We do so many things for the attention, to feel important or praised. But...	https://sive.rs/full	2014-03-19 00:00:00	f	1	3
175	How will this game end?	Imagine that I’m going to auction a $100 bill. The bidding starts at $1. The regular rules of auctions apply with one change: if you are the second-highest bidder, you don’t get the $100 bill but you still have to pay what you bid. OK? Go. I get...	https://sive.rs/game	2014-02-06 00:00:00	f	1	3
176	Imitate. We are imperfect mirrors.	You know that song you love that you wish you’d written? Copy it. You know that existing business that you wish you had thought of? Copy it. Why? Because we’re imperfect mirrors. Like a funhouse mirror that distorts what it reflects, your...	https://sive.rs/mirror	2014-02-02 00:00:00	f	1	3
177	Understanding Vietnam	This essay is by Jeremy Wellard, who is based in Hanoi. This is the first chapter of my new Vietnam 2014 book. The only thing most people know of Vietnam is the Vietnam War. In Vietnam, they call it the American War, and it’s just old...	https://sive.rs/vn14	2014-01-21 00:00:00	f	1	3
178	Understanding Singapore	When I tell people I live in Singapore, the most common misunderstandings I hear are: “How can you live in that sterile squeaky-clean police state?” “Isn’t that where they cane people for chewing gum?” “Disneyland with a death penalty!...	https://sive.rs/sg14	2014-01-21 00:00:00	f	1	3
179	Understanding Indonesia	This essay is by Daniel Ziv, who has worked in Indonesia for 14 years as a journalist, editor, and now filmmaker. He wrote the bestselling book “Jakarta Inside Out” and directed the award-winning documentary film JALANAN, about the lives of three...	https://sive.rs/id14	2014-01-21 00:00:00	f	1	3
180	Understanding Japan	This essay is adapted from an excerpt of the great book “A Geek in Japan” by Héctor Garcia. It is the first chapter of my new Japan 2014 book. If three Japanese people are talking together, and a fourth one joins the conversation, he will...	https://sive.rs/jp14	2014-01-19 00:00:00	f	1	3
181	Same word. Different places? Different meanings.	I had just moved to Singapore when I met the brilliant Benjamin Joffe. He’s a startup consultant and investor from France, who has spent the last 13 years living around Asia — a few years each in Korea, China, and Japan. I asked him if he could...	https://sive.rs/quality	2014-01-16 00:00:00	f	1	3
182	Wood Egg 2014 books are on sale now	If you know you’ll never go to Asia, you can skip this. If you’re looking for a travel guide, you can skip this. But if you might do business in Asia, have thought about moving to Asia, or just want to understand the cultures of Asia, you will...	https://sive.rs/we14	2014-01-12 00:00:00	f	1	3
183	Jac Holzman	I met Jac Holzman the same day I met Bill Gates, but Jac made a much bigger impression, and he’s been my friend and mentor ever since. Jac Holzman is a living legend. He founded Elektra Records in 1950. (Yeah! 1950! Let that soak in a minute....	https://sive.rs/jac	2013-12-24 00:00:00	f	1	3
184	Why am I here?	Looking around the room. “Why am I here?” It’s a useful question to ask often. Either it will re-focus your reasons for being where you are, or it will make you realize your reasons have expired and you should be somewhere else. In a little...	https://sive.rs/here	2013-12-20 00:00:00	f	1	3
185	Why my code and ideas are public	Over dinner my friend Valerie said, “I’m not worried about someone finding out my secrets, because secrets are just facts, right? So if someone is going through my private things, for example, and gets upset about what they find, then that’s their...	https://sive.rs/ws	2013-12-12 00:00:00	f	1	3
186	OK Milt, I’ll start writing again	Yesterday I procrastinated, tinkered, and wasted time, doing nothing of any value. Then this morning, I found out that one of my best friends died yesterday. He was out on a bike ride on a quiet street when a car swerved into the bike lane,...	https://sive.rs/milt	2013-12-09 00:00:00	f	1	3
187	Fragile Plan vs Robust Plan	When I first had the idea for Wood Egg — publishing 16 books about 16 countries every year — I thought I would write them all myself. Visit 16 countries for 3 weeks each, doing intensive research the whole time. That’s 48 weeks, so I could do it...	https://sive.rs/robust	2013-06-15 00:00:00	f	1	3
188	Wood Egg (my new company)	Like everyone, I can get deeply curious about something, and dive in. Starting five years ago, I got deeply curious about the differences between countries and cultures, fascinated with understanding the different perspectives. I talked about a...	https://sive.rs/eg	2013-06-08 00:00:00	f	1	3
189	Some will always say you’re wrong	Some people are into money. Some aren’t. Some people are inspired by helping the needy. Some aren’t. Some people are into fame, power, and prestige. Others are into anonymity and freedom from responsibility. People have different preferences in...	https://sive.rs/wrong	2013-06-03 00:00:00	f	1	3
190	No rules in this game	Everyone thinks you have to move to the big music cities. But Mihkel Raud in Estonia sold thousands of albums, 100% independent, without leaving Estonia. “Rondellus Sabbatum” was an album so unique that word-of-mouth sold thousands, with hardly any...	https://sive.rs/360	2013-05-20 00:00:00	f	1	3
191	Seeking inspiration?	The word “inspiration” usually means “something that mentally stimulates you.” But “inspiration” also means to breathe in. The meanings poetically combine when you think of yourself breathing in thoughts, filling your body with ideas. But don’t...	https://sive.rs/io	2013-04-14 00:00:00	f	1	3
192	The Great Movies	A friend I hadn’t heard from in years called me out of the blue yesterday, and just said, “Dude... did you hear?” I went home and my girlfriend immediately said, “Babe... I heard the news. Are you OK?” They all know I’m a fan of Roger Ebert. He...	https://sive.rs/ebert2	2013-04-06 00:00:00	f	1	3
193	Human Intervention as a Competitive Advantage	The listening algorithm A year after I started CD Baby, when it was still just me in my bedroom, the CEO and VP of a hugely-funded Silicon Valley online music company contacted me, saying they wanted to fly out to New York to meet me. I said OK,...	https://sive.rs/hi	2013-03-21 00:00:00	f	1	3
194	It’s all who you know?	When you hear, “It’s all who you know,” it sounds so intimidating — like you need to be a former roommate of Mark Zuckerburg, cousins with Richard Branson, and dating Taylor Swift. But simply contacting a stranger can lead to a worldwide network...	https://sive.rs/xn	2013-02-11 00:00:00	f	1	3
195	Focus, entertain, or both?	You have a bigger audience than you had just a few years ago. You have more people reading your updates, and wanting to hear something new. Standing on this virtual stage, you want to be entertaining, post exciting updates, be impressive, and...	https://sive.rs/boring	2013-01-27 00:00:00	f	1	3
196	Memorizing a programming language using spaced repetition software	I’ve been doing this for a year, and it’s the most helpful learning technique I’ve found in 14 years of computer programming. Background: I’m an intermediate programmer. I didn’t go to school for it. I just learned by necessity because I...	https://sive.rs/srs	2013-01-06 00:00:00	f	1	3
197	Everything is my fault	I used to get mad at people. They lied. They betrayed me. They disappeared. Do you hear the pattern? “They this. They that.” When someone upsets you, it’s human nature to feel it’s their fault. But one day I tried thinking of everything as my...	https://sive.rs/my-fault	2012-12-09 00:00:00	f	1	3
198	You don’t have to be local	You can focus your time locally or globally. If you’re local, you focus on your community, doing things in-person. But this means you have less time to focus on the rest of the world. If you’re global, you make things for the whole world. But...	https://sive.rs/local	2012-12-02 00:00:00	f	1	3
199	Push, push, push. Expanding your comfort zone.	I’m 40 meters underwater. It’s getting cold and dark. It’s only the third dive in my life, but I’m taking the advanced scuba course, and the Caribbean teacher was a little reckless, dashing ahead, leaving me alone. The next day I’m in a government...	https://sive.rs/comfort	2012-08-13 00:00:00	f	1	3
200	Smart people don’t think others are stupid	The woman seemed to be making some pretty good points until she stopped with, “Ugh! Those people are just so stupid!!” She could have said Southerners, Northerners, Liberals, Conservatives, Chinese, or Americans. It doesn’t matter. She just proved...	https://sive.rs/ss	2012-05-16 00:00:00	f	1	3
201	Mozilla Joins Latest AI Insight Forum	Today Mozilla Foundation President, Mark Surman, spoke with members of the US Senate, including Senator Leader Schumer, Senator Rounds, Senator Heinrich and Senator Young about two of what Mozilla believes are the most critical questions we must...	https://blog.mozilla.org/en/mozilla/ai/mozilla-joins-latest-ai-insight-forum/	2023-11-08 21:49:51	f	2	2
202	A Third Way on AI	Last week was an important moment in the debate about AI, with President Biden issuing an executive order and the UK’s AI Safety Summit convening world leaders. Much of the buzz around these events made it sound like AI presents us with a binary...	https://blog.mozilla.org/en/mozilla/a-third-way-on-ai/	2023-11-07 16:06:54	f	2	2
203	The Future of Shopping	It’s clear that online shopping has given consumers more choices than ever, offering remarkable convenience with a few clicks of a button. But there’s a catch. With Fakespot by Mozilla, which uses AI to detect fake reviews and scams, we&#8217;ve...	https://blog.mozilla.org/en/mozilla/the-future-of-shopping/	2023-11-07 14:00:00	f	2	2
204	Why we’re renaming ‘Firefox accounts’ to ‘Mozilla accounts’	For many Firefox users, a Firefox account has been indispensable. It safely syncs everything from open tabs, bookmarks, history and add-ons to passwords, credit card information and saved addresses across desktop and mobile devices.&#160; In fact,...	https://blog.mozilla.org/en/mozilla/firefox-accounts-transition-mozilla-accounts/	2023-11-01 16:30:00	f	2	2
205	Quick as a Fox: Firefox keeps getting faster	Web browsing is a pervasive part of modern life, and the quality of the experience directly affects the quality of your day. When your tasks are disrupted by slow or unresponsive pages, it is frustrating and distracting. As such, performance is a...	https://blog.mozilla.org/en/products/quick-as-a-fox-firefox-keeps-getting-faster/	2023-10-31 16:58:22	f	2	2
206	Introducing Mozilla’s AI Guide, the developers onboarding ramp to AI	Today, Mozilla announces the availability of its AI Guide, a community-driven resource, where developers can come together, ready to pioneer and drive generative AI innovations. In the spirit of a truly open web, Mozilla launches a tool that will...	https://blog.mozilla.org/en/mozilla/introducing-mozillas-ai-guide-the-developers-onboarding-ramp-to-ai/	2023-10-26 13:00:00	f	2	2
207	Built for privacy: Partnering to deploy Oblivious HTTP and Prio in Firefox	Protecting user privacy is a core element of Mozilla’s vision for the web and the internet at large. In pursuit of this vision, we’re pleased to announce new partnerships with Fastly and Divvi Up to deploy privacy-preserving technology in Firefox....	https://blog.mozilla.org/en/products/firefox/partnership-ohttp-prio/	2023-10-12 13:00:00	f	2	2
208	‘Reclaim Expression’: An immersive installation that puts you at the center of the internet	Mozilla’s Reclaim the Internet event at the Alte Münze in Berlin, happening Oct. 12 to 16, features an immersive journey that invites people to act, build and choose to reimagine our digital future. The journey includes three art installations...	https://blog.mozilla.org/en/mozilla/reclaim-expression-art-exhibit/	2023-10-11 16:00:00	f	2	2
209	‘Reclaim Inspiration’: An immersive installation to spark creativity	Mozilla’s Reclaim the Internet event at the Alte Münze in Berlin, happening Oct. 12 to 16, features an immersive journey that invites people to act, build and choose to reimagine our digital future. The journey includes three art installations...	https://blog.mozilla.org/en/mozilla/reclaim-inspiration-art-exhibit/	2023-10-11 16:00:00	f	2	2
210	‘Reclaim Wonder’: An immersive installation that captures the beauty of the open internet	Mozilla’s Reclaim the Internet event at the Alte Münze in Berlin, happening Oct. 12 to 16, features an immersive journey that invites people to act, build and choose to reimagine our digital future. The journey includes three art installations...	https://blog.mozilla.org/en/mozilla/reclaim-wonder-art-exhibit/	2023-10-11 16:00:00	f	2	2
211	Deploying Node.js applications with PM2 on Vultr	Learn how to deploy a Node.js application on Vultr using PM2 to create persistent services. This guide shows how to efficiently use resources via PM2 cluster mode. It also covers Nginx server setup and SSL security.	https://developer.mozilla.org/en-US/blog/deploying-node-js-applications-with-pm2-on-vultr/	2023-11-08 00:00:00	f	3	2
212	VS Code: Tips and tricks for beginners	Discover essential tips and tricks for using Visual Studio Code (VS Code), a powerful IDE. Learn how to leverage its integrated editing features and Git support, and explore a few extensions.	https://developer.mozilla.org/en-US/blog/vs-code-tips-tricks/	2023-11-07 00:00:00	f	3	2
213	Coming Soon: MDN Observatory 2.0	Observatory 2.0 is launching soon as part of the Mozilla Developer Network as the MDN Observatory with new security scoring standards and other exciting updates.	https://developer.mozilla.org/en-US/blog/mdn-observatory/	2023-10-25 00:00:00	f	3	2
214	Optimizing DevSecOps workflows with GitLab's conditional CI/CD pipelines	This guide explores the various types of CI/CD pipelines and helps you understand their specific use cases. Learn how to leverage rules to create highly efficient DevSecOps workflows.	https://developer.mozilla.org/en-US/blog/optimizing-devsecops-workflows-with-gitlab-conditional-ci-cd-pipelines/	2023-10-23 00:00:00	f	3	2
215	Introduction to web sustainability	What can web designers and developers do to build a more sustainable web? This post explores the environmental impacts of web technologies and looks at some of the ways we can build greener websites.	https://developer.mozilla.org/en-US/blog/introduction-to-web-sustainability/	2023-10-11 00:00:00	f	3	2
216	Migrating from GitHub to GitLab seamlessly: A step-by-step guide	Thinking about making the move from GitHub to GitLab? This guide demystifies the migration process, addressing common concerns for DevSecOps teams that are looking to seamlessly transition between the two platforms. This post provides a...	https://developer.mozilla.org/en-US/blog/migrating-from-github-to-gitlab-seamlessly-a-step-by-step-guide/	2023-10-05 00:00:00	f	3	2
217	Announcing the MDN front-end developer curriculum	MDN has created a curriculum for aspiring front-end developers to build a rewarding and successful career. Take a look at the curriculum, who it's for, and the research it's based on.	https://developer.mozilla.org/en-US/blog/announcing-mdn-front-end-developer-curriculum/	2023-08-14 00:00:00	f	3	2
218	Creating custom easing effects in CSS animations using the linear() function	The new CSS linear() timing function enables custom easing in animations. Explore how linear() works compared with other timing functions used for easing, with practical examples.	https://developer.mozilla.org/en-US/blog/custom-easing-in-css-with-linear/	2023-08-01 00:00:00	f	3	2
219	Securing your CDN: Why and how should you use SRI	Relying on external resources for your website is always fraught with risks. Learn how to protect your website and its visitors by using SRI to secure third-party content.	https://developer.mozilla.org/en-US/blog/securing-cdn-using-sri-why-how/	2023-07-21 00:00:00	f	3	2
220	Scroll progress animations in CSS	Scroll-driven animations are coming to CSS! In this post, we'll look at a few types of animations and learn how to link them to the scroll progress of a container.	https://developer.mozilla.org/en-US/blog/scroll-progress-animations-in-css/	2023-07-14 00:00:00	f	3	2
221	Reflections on AI Explain: A postmortem	We recently launched a feature called AI Explain, but we have rolled this back for now. In this post, we look into the story behind AI Explain: its development, launch, and the reasons that led us to press the pause button.	https://developer.mozilla.org/en-US/blog/ai-explain-postmortem/	2023-07-11 00:00:00	f	3	2
222	Developer essentials: How to search code using grep	grep is a powerful tool for searching code from the terminal. This post will show you how to use grep and why it's an essential developer tool.	https://developer.mozilla.org/en-US/blog/searching-code-with-grep/	2023-07-03 00:00:00	f	3	2
223	Introducing AI Help (Beta): Your Companion for Web Development	We're introducing an AI assistant powered by MDN and OpenAI GPT 3.5 to answer all your web development questions in real time.	https://developer.mozilla.org/en-US/blog/introducing-ai-help/	2023-06-27 00:00:00	f	3	2
224	Learn how to use hue in CSS colors with HSL	Hues are a bright way to define colors in CSS. Learn about hues, color wheels, how to use color functions, and how you can create vibrant color palettes for your website using hue.	https://developer.mozilla.org/en-US/blog/learn-css-hues-colors-hsl/	2023-06-26 00:00:00	f	3	2
225	Introducing the MDN Playground: Bring your code to life!	MDN is launching a code Playground. Users can prototype ideas and expand all live samples into an interactive experience.	https://developer.mozilla.org/en-US/blog/introducing-the-mdn-playground/	2023-06-22 00:00:00	f	3	2
226	MDN doc updates: CSS selectors & media queries, WebGPU & WebTransport APIs, Progressive web apps	Discover CSS :lang(), experimental media queries, manipulating graphics with WebGPU, client-server communication with WebTransport, ECMAScript module support, and more.	https://developer.mozilla.org/en-US/blog/mdn-docs-june-2023/	2023-06-13 00:00:00	f	3	2
227	How to draw any regular shape with just one JavaScript function	Learn how to use JavaScript to draw any regular shape to a HTML canvas with a single function, and how to modify it to draw multiple shapes.	https://developer.mozilla.org/en-US/blog/javascript-shape-drawing-function/	2023-05-26 00:00:00	f	3	2
228	New reference pages on MDN for JavaScript regular expressions	See the latest updates to the MDN reference pages about JavaScript regular expressions, including new sections on sub-features and browser compatibility information.	https://developer.mozilla.org/en-US/blog/regular-expressions-reference-updates/	2023-05-23 00:00:00	f	3	2
229	Celebrating Global Accessibility Awareness Day	In celebration of Global Accessibility Awareness Day in 2023, we share some tools and guidelines to help you make the web more accessible.	https://developer.mozilla.org/en-US/blog/accessibility-celebrating-gaad-2023/	2023-05-18 00:00:00	f	3	2
230	Using HTML landmark roles to improve accessibility	Learn what HTML landmark roles are, how they improve accessibility, and how you can include them on your website effectively.	https://developer.mozilla.org/en-US/blog/aria-accessibility-html-landmark-roles/	2023-05-15 00:00:00	f	3	2
231	Introducing Baseline: a unified view of stable web features	MDN leads the way in implementing WebDX community group's efforts, delivering a clear and simple baseline for the web platform to developers.	https://developer.mozilla.org/en-US/blog/baseline-unified-view-stable-web-features/	2023-05-10 00:00:00	f	3	2
232	How :not() chains multiple selectors	Learn how the CSS `:not()` pseudo-class behaves when multiple selectors are passed as argument.	https://developer.mozilla.org/en-US/blog/css-not-pseudo-multiple-selectors/	2023-05-05 00:00:00	f	3	2
233	New functions, gradients, and hues in CSS colors (Level 4)	Learn what's new in CSS Colors Module Level 4, including color spaces, color functions, fancy gradients, and support for wide-gamut displays.	https://developer.mozilla.org/en-US/blog/css-color-module-level-4/	2023-05-03 00:00:00	f	3	2
234	Welcome to the MDN blog	The MDN blog publishes web development news, tutorials, and insights as an extension of MDN Web Docs, helping you discover, learn, and create for the web.	https://developer.mozilla.org/en-US/blog/welcome-to-the-MDN-blog/	2023-05-03 00:00:00	f	3	2
235	Three reasons a liberal arts degree helped me succeed in tech	My colleague Sannie Lee has met many students who are looking into     getting into technology, taking narrow professionally-oriented majors.     Sannie, however, has found that a traditional liberal-arts degree has given     her skills that are...	https://martinfowler.com/articles/2023-liberal-arts.html	2023-11-09 15:12:00	f	4	2
236	Enhancing the Headless Component	In the second (and final) part of his explanation of React Headless Components     Juntao Qiu explores how a headless component allows us to     create a visually different component that does the same base behavior, and     how it encourages...	https://martinfowler.com/articles/headless-component.html	2023-11-07 15:00:00	f	4	2
237	Current thoughts on social media	It's now been a year since The Muskover, what does my use of social      media look like now, both as a reader and a writer? more…	https://martinfowler.com/articles/2023-social-media.html	2023-11-02 16:33:00	f	4	2
239	How is GenAI different from other code generators?	How is code generation with GenAI different from more "traditional" code     generators? The newest memo in  Birgitta Böckeler's     explorations of GenAI talks about abstraction     levels in software engineering, and on which levels GenAI sits...	https://martinfowler.com/articles/exploring-gen-ai.html	2023-09-19 07:57:00	f	4	2
240	Technology Strategy for Emerging Technologies and Markets	Sarah Taraporewalla completes her study of building a     technology strategy that's integrated with strategic business interests.     This final strategic direction considers the ever-changing future,     suggesting lines of inquiry to consider...	https://martinfowler.com/articles/creating-integrated-tech-strategy.html	2023-08-24 13:44:00	f	4	2
335	Lessons from the 2023 Animation Workshop	Some ideas for making design workshops more effective.	https://code.blender.org/2023/07/lessons-from-the-2023-animation-workshop/	2023-07-21 16:11:16	f	9	2
241	Demo Front-End: A front-end application to test and explore an API	Many software teams create services exposed as APIs, designed to be     consumed by other software and thus without any user-interface. Such     services are hard to demonstrate, as they effectively just dump pages of     JSON. A demo front-end...	https://martinfowler.com/articles/demo-front-end.html	2023-08-23 14:37:00	f	4	2
243	Bottlenecks of Scaleups #05: Resilience and Observability	Here is a new article in the bottlenecks of scaleups series, looking at     resilience and observability. Startups tend to only address resilience when     their systems are already down, often taking a very reactive approach. For     a scaleup,...	https://martinfowler.com/articles/bottlenecks-of-scaleups/05-resilience-and-observability.html	2023-08-22 14:21:00	f	4	2
245	Final parts of the cost bottleneck of scaleups	Sofia Tania  and  Stefania       Stefansdottir complete their examination of how to overcome the       bottleneck that costs impose on a scaleup. In this final installment,       they look at how to review and govern the technology...	https://martinfowler.com/articles/bottlenecks-of-scaleups/04-costs.html	2023-08-17 00:00:00	f	4	2
247	Bottlenecks of Scaleups Webinar: Sep 7 2023	Join Tim Cochran and Rickey Zachary on Thursday, September 7th 1-2pm EST     for a webinar on Bottlenecks of     Scaleups: Technology mistakes every growing startup makes. They researched     Thoughtwork's portfolio to analyze why companies...	https://www.thoughtworks.com/about-us/events/webinars/scaling-bottlenecks--technology-mistakes-every-growing-startup-m	2023-08-15 18:35:00	f	4	2
250	We will miss Stefan Tilkov	We are saddened today to learn of the passing of Stefan Tilkov. We’ve met Stefan several times at workshops and conferences and always enjoyed his good company and insightful views. He advocated many of the things that we and our colleagues support...	https://martinfowler.com/articles/202308-stefan-tilkov.html	2023-08-14 18:58:00	f	4	2
261	Bliki: TeamTopologies	Any large software effort, such as the software estate for a large    company, requires a lot of people - and whenever you have a lot of people    you have to figure out how to divide them into effective teams. Forming    Business Capability...	https://martinfowler.com/bliki/TeamTopologies.html	2023-07-25 13:25:00	f	4	2
262	Bliki: TwoPizzaTeam	A two-pizza team is a small team  that fully supports software for a particular business capability. The term  became popular as it used to describe how Amazon organized their software staff. The name suggests the most obvious aspect of such...	https://martinfowler.com/bliki/TwoPizzaTeam.html	2023-07-25 13:22:00	f	4	2
263	How platform teams get stuff done	Platform teams have a unique reliance on other teams to ensure adoption     of their platform - getting code changes into other teams' codebase is     critical to their success. Pete Hodgson structures how     platform teams collaborate into...	https://martinfowler.com/articles/platform-teams-stuff-done.html	2023-07-19 14:21:00	f	4	2
264	Decentralizing the Practice of Architecture at Xapo Bank	It's common to see a centralized architecture function that sets     standards and oversees development projects. Such teams often suffer from     being far removed from the issues of implementation with long     feedback loops that slow down...	https://martinfowler.com/articles/xapo-architecture-experience.html	2023-07-18 11:46:00	f	4	2
265	This Life Skill is Emerging in Our Kids Thanks to the Pandemic, and I’m All For It	This year (2020) has been challenging for everyone, and as we're still in the midst of this pandemic, and coming up to an incredibly important election next month (please vote!), I always try to look on the bright side of things. But that's been...	https://patflynn.com/life-skill-kids-pandemic/	2020-10-17 00:35:24	f	5	3
266	That Time I Tried Out for a Quake 2 Clan	I had two tests within 12 hours. One of these tests was more important to me than the other. It was a week before Christmas break and I had just turned 16 years old. The calculus final I was pretty confident about, and I snuck in one more practice...	https://patflynn.com/i-tried-out-for-a-quake-2-clan/	2020-05-19 05:33:53	f	5	3
267	My Live Streaming Equipment and Setup	During the coronavirus outbreak, I'm vowing to go live on YouTube every morning at 8am PT (11am ET) in an effort to help and support those in need at this time. Plus, it holds me accountable to waking up in the morning and starting the day with...	https://patflynn.com/live-streaming-equipment-setup/	2020-03-29 05:07:23	f	5	3
268	How to Use Elon Musk to Start Your First Business	Elon musk, founder of X.com (which later became PayPal), Space X, Tesla Motors, the Boring Company, and probably several more companies after this blog post is published, is a master of building huge, industry disrupting businesses. And today,...	https://patflynn.com/how-to-use-elon-musk-to-start-your-first-business/	2020-03-13 07:05:00	f	5	3
269	The Toughest Crowd I’ve Ever Spoken to: Fifth Graders	In February 2020, I had the honor of visiting a local school and giving a presentation about entrepreneurship and business. I've spoken in front of crowds of thousands before, but this time, it was a little different. These were fifth graders, and...	https://patflynn.com/the-toughest-crowd-ive-ever-spoken-to-fifth-graders/	2020-02-23 23:56:24	f	5	3
270	Ski Week 2020: No Snow, No Problem	Last week, the family and I went to Big Bear Lake to find some real snow. Unfortunately, the only real snow that we saw was left over from the week before, piled up on the side of the road, melting and full of dirt. But that didn't stop us from...	https://patflynn.com/ski-week-2020-no-snow-no-problem/	2020-02-23 21:43:34	f	5	3
271	The Complaint Jar	My wife April and I don't believe in complaining. We get frustrated, absolutely, and there's nothing wrong with blowing off a little steam when trying to accomplish something and things don't go according to plan. But complaining &#8211; to...	https://patflynn.com/the-complaint-jar/	2020-02-23 18:19:01	f	5	3
272	My Tesla Model Y Specs – The Future is Here	I leased a Tesla Model X in 2016 (90D) and every part of that experience, from ordering online, to picking up the car and feeling the rush of a fast-moving electric vehicle on the road that would make any passenger smile (plus the Falcon wing doors...	https://patflynn.com/my-tesla-model-y-specs-the-future-is-here/	2020-02-23 08:42:41	f	5	3
273	These NES Games Shaped Who I Am	In 1985, I opened a Christmas present that would change my life forever. A Nintendo Entertainment System (NES). I was only 3 at the time, and looking back as a parent now I feel like I was quite young to have a legit gaming console like that...	https://patflynn.com/these-nes-games-shaped-who-i-am/	2020-02-23 08:00:31	f	5	3
274	I sold two businesses last month. Here’s why.	I've never sold a business before last month. Today, I can happily say I've now sold two. The businesses that I sold were FoodTruckr, and Security Guard Training Headquarters, two niche sites that I built back in the early 2010s as experiments on...	https://patflynn.com/i-sold-two-businesses-last-month-heres-why/	2020-02-23 06:45:59	f	5	3
275	5 use cases for automating your infrastructure with Ansible Automation Platform	Infrastructure automation is an area where systems administrators and&nbsp; IT operations teams can see some of the biggest benefits from automation, including time savings, reducing tedious manual work, and improving the overall health of their...	https://www.ansible.com/blog/5-use-cases-for-automating-your-infrastructure-with-ansible-automation-platform	2023-11-07 14:00:00	f	6	5
276	Fact-Gathering with Event-Driven Ansible for Microsoft Windows ITSM	The use of Event-Driven Ansible to enable fact gathering from events is considered a “Getting Started” type of use case, but it can be extremely powerful. This use case is simple and it is what we consider a “Read Only” type of action, meaning that...	https://www.ansible.com/blog/fact-gathering-with-event-driven-ansible-and-ai	2023-11-02 13:00:00	f	6	5
277	Ansible can help with the Cisco IOS XE Software Web UI Privilege Escalation Vulnerability	CVE-2023-20198&nbsp;	https://www.ansible.com/blog/ansible-can-help-with-the-cisco-ios-xe-software-web-ui-privilege-escalation-vulnerability	2023-10-25 13:00:00	f	6	5
278	NEW!!! Getting started landing page for Ansible Automation Platform on Azure	This blog is co-authored by Tomas Znamenacek and Hicham (he-sham) Mourad	https://www.ansible.com/blog/new-getting-started-landing-page-for-ansible-automation-platform-on-azure	2023-10-23 13:00:00	f	6	5
279	Red Hat Insights Collection for Event-Driven Ansible	Event-Driven Ansible became generally available in Ansible Automation Platform 2.4. As part of the release, Red Hat Insights and Ansible teams collaborated to implement and certify a Red Hat Insights collection integrating Insights events as a...	https://www.ansible.com/blog/red-hat-insights-collection-for-event-driven-ansible	2023-10-10 13:00:00	f	6	5
280	Seeding Ansible Automation Platform Content At Installation Time	In a previous blog, I announced the tech preview of containerized Red Hat Ansible Automation Platform. With that we introduced a new feature to enable you to pre-seed configuration and content at installation time. This blog will take you through...	https://www.ansible.com/blog/seeding-ansible-automation-platform-content-at-installation-time	2023-10-04 13:00:00	f	6	5
281	Importing Ansible Validated Content into Private Automation Hub	Introduction Ansible validated content is a set of collections containing pre-built YAML content (such as playbooks or roles) to address the most common automation use cases. You can use Ansible validated content out-of-the-box or as a learning...	https://www.ansible.com/blog/importing-ansible-validated-content-into-private-automation-hub	2023-10-03 13:00:00	f	6	5
282	Now serving: Event-Driven Ansible with a dash of durability	In the realm of automation, the ability to respond to events in real-time is a game-changer. At Red Hat, we've been pioneering in this space with Event-Driven Ansible, which can consume messages from various sources like AWS Simple Queue Service...	https://www.ansible.com/blog/now-serving-event-driven-ansible-with-a-dash-of-durability	2023-10-02 13:00:00	f	6	5
283	Announcing Containerized Ansible Automation Platform	Everything you know and love about Ansible Automation Platform in containerized form We’re excited to announce something that we’ve been working on for a while now, the technical preview of a containerized Red Hat Ansible Automation Platform...	https://www.ansible.com/blog/announcing-containerized-ansible-automation-platform	2023-09-28 13:00:00	f	6	5
284	New Ansible Galaxy	For awhile, the Red Hat Ansible team behind the components Ansible automation hub and Ansible cloud automation hub at console.redhat.com have been on a special ops mission to enhance the galaxy_ng code base that serves the aforementioned components...	https://www.ansible.com/blog/new-ansible-galaxy	2023-09-26 13:00:00	f	6	5
285	Terakan Driver Continues Working To Bring Vulkan To The Radeon HD 6000 Series	While AMD officially supports a much narrower range of more recent Radeon hardware with their official graphics drivers for Windows (and Linux - as it pertains to their Radeon Software for Linux packaged driver and AMDVLK official Vulkan driver),...	https://www.phoronix.com/news/Terakan-Does-Triangles-HD-6000	2023-11-09 20:34:25	f	7	5
286	AMD Closing In On IOMMU SVA Support For Linux	The IOMMU changes for Linux 6.7 aren't particularly noteworthy besides adding SMMUv2 support for the Qualcomm SDM670 and SM7150 SoCs. But the IOMMU updates also take the kernel one step away from supporting Shared Virtual Addressing (SVA) on AMD...	https://www.phoronix.com/news/AMD-IOMMU-SVA-Nears	2023-11-09 19:29:00	f	7	5
287	Valve Announces The Steam Deck OLED With Upgraded Display, 6nm APU & Larger Battery	Valve just announced the Steam Deck OLED as an upgraded version of their Steam Deck handheld Linux gaming device...	https://www.phoronix.com/news/Steam-Deck-OLED	2023-11-09 17:56:48	f	7	5
288	OpenZFS Lands Exciting RAIDZ Expansion Feature	In addition to the OpenZFS code this week landing sync parallelism to improve write performance scalability, another shiny new feature was also merged: RAIDZ expansion...	https://www.phoronix.com/news/OpenZFS-RAIDZ-Expansion	2023-11-09 15:31:24	f	7	5
289	Cloud-Hypervisor 36 Brings AMD CPU Topology Support, AIO Backend For Block Devices	Cloud Hypervisor 36 has been released as this Rust-written VMM that started out as an Intel open-source project that since was folded into the Linux Foundation umbrella with support from Microsoft, Arm, and other vendors. More recently even the...	https://www.phoronix.com/news/Cloud-Hypervisor-36	2023-11-09 13:51:08	f	7	5
290	Linux 6.7 MM Brings Performance Optimizations, Better Handling For Unaccepted Memory	Andrew Morton last week sent out all of the memory management "MM" changes for the Linux 6.7 kernel for which there is a lot of code churn...	https://www.phoronix.com/news/Linux-6.7-Memory-Management	2023-11-09 13:40:26	f	7	5
291	TuxClocker 1.3 Preparing Additional AMD GPU Voltage & Memory Controls	Since the release of TuxClocker 1.0 back in September, this open-source and independently-developed overclocking/performance utility for Linux systems has been quick to tack on new features and rolling out new versions. A release candidate for...	https://www.phoronix.com/news/TuxClocker-1.3-RC1	2023-11-09 13:24:56	f	7	5
292	Mesa 23.3-rc3 Released As The Stable Version Nears	Mesa 23.3-rc3 was released on Wednesday night as the newest weekly release candidate ahead of the Mesa 23.3 release as this quarter's feature series for this collection of OpenGL and Vulkan open-source drivers...	https://www.phoronix.com/news/Mesa-23.3-rc3-Released	2023-11-09 11:57:13	f	7	5
293	MIPS AR7 Platform Support Removed In Linux 6.7	With the MIPS CPU architecture at the end of the road in light of RISC-V and LoongArch, there isn't much going on when it comes to MIPS development for the Linux kernel. Most cycles these days just brings bug fixes and removing old/unmaintained...	https://www.phoronix.com/news/MIPS-AR7-Removed-Linux-6.7	2023-11-09 11:47:17	f	7	5
336	Animation Workshop: June 2023	Speeding up animators (and others working with animation data) by reducing manual data management.	https://code.blender.org/2023/07/animation-workshop-june-2023/	2023-07-17 14:38:52	f	9	2
294	NVIDIA Pushes 62MB Of GSP Binary Firmware Blobs Into Linux-Firmware.Git	As mentioned last week, merged for the Linux 6.7 kernel is NVIDIA GSP firmware support in the Nouveau driver so that these NVIDIA firmware blobs can handle hardware initialization and power management related tasks. This support is optional right...	https://www.phoronix.com/news/NVIDIA-Big-GSP-Firmware-Dump	2023-11-09 00:35:17	f	7	5
295	In Development Since 2019, NetBSD 10-RC1 Released As A Huge Update	NetBSD 10 has been in development since late 2019 and the beta release is already a year old while now it's up to the release candidate phase with the availability of NetBSD 10-RC1...	https://www.phoronix.com/news/NetBSD-10-RC1	2023-11-08 21:02:45	f	7	5
296	AMD Cleaning Up RadeonSI Linux Driver Code Ahead Of Next-Gen GPU Enablement	There's been a number of patches quietly landing for the RadeonSI Gallium3D driver by AMD engineers in making various clean-ups and appearing to prepare for future adjustments to the driver in eventually extending the support beyond the current...	https://www.phoronix.com/news/RadeonSI-Cleanup-GFX11-After	2023-11-08 19:25:33	f	7	5
297	Intel Lunar Lake M Added To LPSS Driver In Linux 6.7	The Multi-Function Device (MFD) updates were sent out last week for the in-development Linux 6.7 kernel for these drivers catering to heterogeneous hardware blocks...	https://www.phoronix.com/news/Intel-LPSS-Linux-Lunar-Lake-M	2023-11-08 19:03:17	f	7	5
298	KDE Plasma 6.0 Alpha Released With KDE Frameworks 6 & KDE Gear Updates Too	Today marks the on-time alpha release of the "KDE 6th Megarelease" -- this encompasses the KDE Plasma 6.0 desktop, KDE Frameworks 6 libraries, and KDE Gear applications...	https://www.phoronix.com/news/KDE-Plasma-6-Alpha	2023-11-08 16:41:56	f	7	5
299	Microsoft Gets OpenGL 4.3 Implemented Atop Direct3D 12 With Mesa	Microsoft engineers continue working on the Mesa drivers as part of their effort for implementing various industry standard APIs atop Direct3D 12. This support can be used in cases of Windows drivers lacking for these APIs as well as being used...	https://www.phoronix.com/news/OpenGL-4.3-D3D12-Mesa	2023-11-08 16:15:51	f	7	5
300	Linux 6.7 Staging Drops The QLGE Ethernet & rtl8192u WiFi Drivers	The staging changes for Linux 6.7 are on the heavier side in part due to many new contributors from Outreachy mailing in their first kernel patches with various minor fixes. But staging is also lightened up a bit by dropping a wired Ethernet and...	https://www.phoronix.com/news/Linux-6.7-Staging	2023-11-08 16:03:39	f	7	5
301	EROFS No Longer Treating MicroLZMA Compression As Experimental	With Linux 6.7 the EROFS read-only file-system intended primarily for mobile devices and containers is considering their MicroLZMA compression support as stable...	https://www.phoronix.com/news/EROFS-MicroLZMA-Stable	2023-11-08 14:05:08	f	7	5
302	Microsoft's CBL-Mariner Linux Distro Issues A Big Update For November	Microsoft yesterday published CBL-Mariner 2.0.20231106 as the newest version of their in-house Linux distribution that is used for a variety of services from Azure to WSL...	https://www.phoronix.com/news/CBL-Mariner-2.0-November-2023	2023-11-08 13:53:11	f	7	5
303	FEX 2311 Brings More AVX Optimizations, Preparations For Better Performance	FEX 2311 is out today as the newest version of this emulator for running x86/x86_64 Linux binaries on AArch64 systems...	https://www.phoronix.com/news/FEX-2311-Emulator	2023-11-08 13:29:38	f	7	5
304	New Set Of 86 Patches Overhaul The Linux Kernel's Preemption Model	Ankur Arora of Oracle on Tuesday sent out a set of 86 patches for making the Linux kernel preemptible. This is based on earlier work by prominent Linux kernel engineer Thomas Gleixner...	https://www.phoronix.com/news/Overhaul-Linux-Preemptible-RFC	2023-11-08 11:51:25	f	7	5
305	GIMP 2.10.36 Released As GIMP 3.0 Might Finally Be Close	GIMP 2.10.36 was released on Tuesday for this long-running stable series of this open-source Adobe Photoshop alternative while GIMP 3.0 has been very slow to materialize...	https://www.phoronix.com/news/GIMP-2.10.36-Released	2023-11-08 05:00:00	f	7	5
306	Bcachefs Lands Big Scalability Improvement, Disables Debug Option By Default	Following last week's merging of the Bcachefs file-system into Linux 6.7, a secondary set of updates were merged today for adding a few new features as well as some fixes for this newly-merged Linux file-system...	https://www.phoronix.com/news/Bcachefs-Updated-Linux-6.7	2023-11-08 00:13:33	f	7	5
307	OpenZFS Lands Sync Parallelism To Drive Big Gains For Write Performance Scalability	A very enticing performance optimization was merged yesterday into the OpenZFS codebase to enhance the write performance scalability...	https://www.phoronix.com/news/OpenZFS-Sync-Parallelism	2023-11-07 20:00:00	f	7	5
308	Intel Arc Graphics vs. AMD Radeon vs. NVIDIA GeForce For 1080p Linux Graphics In Late 2023	Following last month&#039;s launch of the Intel Arc Graphics A580 for a sub-$200 graphics card backed by an open-source Linux driver stack I ran some benchmarks looking at the Intel Arc Graphics compute performance against NVIDIA&#039;s proprietary...	https://www.phoronix.com/review/1080p-linux-gaming-late-2023	2023-11-07 19:12:04	f	7	5
309	Servo Browser Engine Receives Funding To Work On HTML <table> Support	The Rust-written Servo browser engine that started at Mozilla but now developed by Linux Foundation Europe with contributors from Igalia and other organizations has been enjoying a fruitful 2023...	https://www.phoronix.com/news/Servo-Grant-Funding-Table	2023-11-07 17:00:00	f	7	5
310	Ubuntu's Miriway Maturing As A Mir-Based Wayland Compositor For Other Desktops	In addition to Canonical continuing to invest in developing Mir  as a platform now built atop Wayland, over the past year Canonical developers have been quietly working on Miriway as a Mir-based Wayland compositor and it's becoming iteratively more...	https://www.phoronix.com/news/Ubuntu-Mir-Miriway-2023	2023-11-07 16:42:45	f	7	5
311	AMD Releases Six New EPYC 7003 "Milan" Processors	While there is now the 4th Gen EPYC processors with the exciting and vast line-up from the very powerful general purpose Genoa(X) processors and Bergamo for CSPs and very dense servers to Siena for telco/edge, the 3rd Gen EPYC "Milan(X)" processors...	https://www.phoronix.com/news/AMD-6-More-EPYC-Milan	2023-11-07 16:28:32	f	7	5
312	Fedora Linux 39 Released As A Wonderful Upgrade For Leading Workstations & Servers	While delayed by several weeks compared to their initial release goals, today marks the availability of Fedora 39 as a wonderful upgrade to this popular Linux distribution...	https://www.phoronix.com/news/Fedora-39-Released	2023-11-07 14:07:35	f	7	5
313	Canonical Brings Intel TDX Tech Preview To Ubuntu 23.10	Ahead of the all-important Ubuntu 24.04 LTS cycle dubbed the "Noble Numbat", Canonical is making a technology preview of Intel Trust Domain Extensions (TDX) available for Ubuntu 23.10...	https://www.phoronix.com/news/Intel-TDX-Preview-Ubuntu-23.10	2023-11-07 13:52:40	f	7	5
337	Node Tools, Interface and Baking	Exploring high-level user interfaces for Geometry Nodes assets.	https://code.blender.org/2023/06/node-tools-interface-and-baking/	2023-06-01 13:35:44	f	9	2
314	Open-Source AMD OpenSIL Continues Making Progress To Eventually Replace AGESA	Back at the OCP Summit in Prague earlier this year AMD detailed openSIL for advancing open-source system firmware by opening up the CPU silicon initialization process. An update was provided at the OCP San Jose event in October around the AMD...	https://www.phoronix.com/news/AMD-OpenSIL-Autumn-2023	2023-11-07 12:00:22	f	7	5
315	Dell & Lenovo Keyboard Quirks Addressed In Linux 6.7	The HID subsystem updates for the Linux 6.7 kernel don't bring any shiny new features or notable hardware support additions, but there is a clean-up to the Logitech HID++ (logitech-hidpp) driver probing code as well as some notable quirks/fixes to...	https://www.phoronix.com/news/Linux-6.7-HID	2023-11-07 11:50:00	f	7	5
316	Trying Out & Benchmarking Bcachefs On Linux 6.7	The biggest surprise this week so far with the Linux 6.7 merge window has been the landing of the Bcachefs file-system. Here is an early look at Bcachefs with Linux 6.7 and some preliminary benchmarks.	https://www.phoronix.com/review/bcachefs-linux-67	2023-11-03 14:59:19	f	7	5
317	Ballot shortages created democracy problems during Mississippi governor's election	People in Mississippi's largest county are demanding answers about why some polling places ran out of ballots and voters had to wait for them to be replenished on election day.	https://www.npr.org/2023/11/09/1212002542/mississippi-governors-election-ballot-shortages	2023-11-09 23:45:19	f	8	1
318	Fran Drescher tells NPR the breakthrough moment that ended the Hollywood strikes	The longest strike in history by actors against film and TV studios has finally ended. SAG-AFTRA president Fran Drescher says there is a "new dawn."	https://www.npr.org/2023/11/09/1211771891/hollywood-strike-ends-fran-drescher-sag-aftra	2023-11-09 22:35:33	f	8	1
319	Video chat site Omegle shuts down after 14 years — and an abuse victim's lawsuit	At its best, Omegle allowed strangers to connect and share ideas. But, its founder admits, "some people misused it, including to commit unspeakably heinous crimes."	https://www.npr.org/2023/11/09/1211807851/omegle-shut-down-leif-k-brooks	2023-11-09 22:01:11	f	8	1
320	Man accuses riverboat co-captain of assault during Alabama riverfront brawl	Court records show one of the white men accused of assaulting the co-captain during the August brawl filed a complaint last month saying the co-captain hit him first during the chaotic melee.	https://www.npr.org/2023/11/09/1211963948/alabama-riverfront-brawl-co-captain-charged	2023-11-09 21:37:21	f	8	1
321	How American Girl dolls became a part of American culture — problems and all	Growing up, it felt like you were either the kid with all the American Girl dolls, or you knew the kid with all the American Girl dolls. A new book examines this cultural force.	https://www.npr.org/2023/11/09/1211764678/american-girl-dolls-culture-toys	2023-11-09 21:05:22	f	8	1
322	Apollo astronaut Frank Borman, who first orbited moon, dies at age 95	Frank Borman commanded two early NASA missions including Apollo 8, the first to orbit the moon. He was a no-nonsense astronaut known for his keen attention to detail and duty to country.	https://www.npr.org/2023/11/09/953342565/nasa-apollo-gemini-astronaut-frank-borman-dies	2023-11-09 20:55:12	f	8	1
323	Justice Department watchdog finds alarming conditions inside Florida federal prison	The inspector general's office found inmates served moldy bread, containers of food covered by what appear to be rodent droppings and insects in bags of cereal.	https://www.npr.org/2023/11/09/1211823240/justice-department-watchdog-finds-alarming-conditions-inside-florida-federal-pri	2023-11-09 20:25:24	f	8	1
324	Sen. Joe Manchin announces he won't seek reelection in 2024	West Virginia Democrat Joe Manchin will not seek reelection to the Senate in 2024, Democrats have a narrow majority and face and uphill battle to retain his seat.	https://www.npr.org/2023/11/09/1211907129/joe-manchin-retire	2023-11-09 20:22:31	f	8	1
325	A shortage of air traffic controllers is hurting safety, aviation experts warn Senate	At a Senate hearing, aviation experts testified that a shortage of air traffic controllers is leading to fatigue and distraction, likely contributing to a series of close calls on runways this year.	https://www.npr.org/2023/11/09/1211838624/air-traffic-controllers-shortage-close-calls-senate-safety-near-miss-senate	2023-11-09 18:44:49	f	8	1
326	Journalist reflects on the ideological, religious and ethnic conflicts within Israel	New York Times journalist Isabel Kershner says before war broke out between Israel and Hamas, it sometimes looked as if Israel was headed toward a civil war. Her new book is The Land of Hope and Fear.	https://www.npr.org/2023/11/09/1211766670/journalist-reflects-on-the-ideological-religious-and-ethnic-conflicts-within-isr	2023-11-09 18:33:20	f	8	1
327	Thai farmhands in Israel face a grim choice: work in a war zone or go home to poverty	Some 30,000 Thais were working in Israel prior to the Oct. 7 Hamas attacks. More than 7,000 have left Israel since. More than 50 Thai citizens were killed or taken hostage in the attacks.	https://www.npr.org/2023/11/09/1211191682/thailand-israel-hamas-attack-hostages-farm-workers	2023-11-09 15:20:00	f	8	1
328	Science says teens need more sleep. So why is it so hard to start school later?	Reasearch shows teens don't get sleepy until 10:45 or 11 p.m. But high school classes in Nashville still start at 7:05 a.m. "It's not a badge of honor," says the mayor.	https://www.npr.org/sections/health-shots/2023/11/09/1211610533/science-says-teens-need-more-sleep-so-why-is-it-so-hard-to-start-school-later	2023-11-09 14:01:13	f	8	1
329	Up First briefing: GOP debate takeaways; striking actors and studios reach a deal	Five presidential candidates — but no Trump  —  debated the Israel-Hamas war and other issues onstage in Miami. SAG-AFTRA says it's reached a deal of "extraordinary scope" with Hollywood studios.	https://www.npr.org/2023/11/09/1211740155/up-first-briefing-gop-debate-takeaways-striking-actors-and-studios-reach-a-deal	2023-11-09 12:48:45	f	8	1
330	How interpretations of the phrase 'from the river to the sea' made it so divisive	It's a nod to the land between the Jordan River and the Mediterranean Sea and the tensions between Palestinian Arabs and Israeli Jews who live there. But what does it actually mean?	https://www.npr.org/2023/11/09/1211671117/how-interpretations-of-the-phrase-from-the-river-to-the-sea-made-it-so-divisive	2023-11-09 10:01:03	f	8	1
331	Map: After a month of bombardments, as much as a third of Gaza City is damaged	New analysis of imagery from a European Space Agency satellite allows for what researchers say is the most comprehensive look yet at the scale of damage due to the Israeli bombardment.	https://www.npr.org/2023/11/09/1211571220/israel-gaza-damage-map-satellite-imagery	2023-11-09 10:01:02	f	8	1
332	Vulkan Project Update	Last week a big milestone was reached: the Vulkan backend has been enabled as an experimental option.	https://code.blender.org/2023/10/vulkan-project-update/	2023-10-13 12:51:36	f	9	2
333	Blender Translation Platform	Introducing the new localization platform for Blender projects.	https://code.blender.org/2023/10/blender-translation-platform/	2023-10-09 15:15:53	f	9	2
338	The Next Big Step: Grease Pencil 3.0	Plans and timeline for the third generation Grease Pencil coming to Blender 4.0.	https://code.blender.org/2023/05/the-next-big-step-grease-pencil-3-0/	2023-05-30 11:05:55	f	9	2
339	Sunsetting Subversion	Announcing the first steps to sunset Subversion from the Blender development infrastructure.	https://code.blender.org/2023/05/sunsetting-subversion/	2023-05-15 12:58:47	f	9	2
340	Development Fund Supported Projects Q2	Roadmap of Blender Foundation suported projects for the second quarter of 2023.	https://code.blender.org/2023/05/development-fund-supported-projects-q2/	2023-05-05 12:48:52	f	9	2
341	Google Summer of Code 2023	Blender gets five slots for Google Summer of Code 2023!	https://code.blender.org/2023/05/google-summer-of-code-2023/	2023-05-04 18:00:00	f	9	2
342	Taking the leap on <em>Nightingale</em>: How Inflexion Games upgraded from UE4 to UE5 mid-development	Senior team members at Inflexion Games reveal why they chose to upgrade to Unreal Engine 5 midway through developing Nightingale, and share tips, tricks, and best practices that could help you do the same with your project.	https://www.unrealengine.com/tech-blog/taking-the-leap-on-nightingale-how-inflexion-games-upgraded-from-ue4-to-ue5-mid-development	2023-10-25 14:00:00	f	10	4
343	Inside Croteam's transition from in-house tech to UE5 for <em>The Talos Principle 2</em>	The creators of Serious Sam and The Talos Principle, Croteam have been building games in their in-house engine for more than two decades. But everything changed when they saw the “dazzling Unreal Engine 5 demo.” The result? A complete shift to UE5...	https://www.unrealengine.com/developer-interviews/inside-croteam-s-transition-from-in-house-tech-to-ue5-for-the-talos-principle-2	2023-10-18 14:00:00	f	10	4
344	October Marketplace sale: over 2,000 products—now 50% off	There are all kinds of great products to choose from this month, including environments, plugins, props, characters, sounds, music, Blueprints, and more. See some of our personal favorites and explore the sale today.	https://www.unrealengine.com/blog/october-marketplace-sale-over-2-000-products-now-50-off	2023-10-10 14:00:00	f	10	4
345	Featured free Unreal Marketplace content—October 2023	Looking for ways to make your games more visually stunning, immersive, and engaging? Explore October's Unreal Marketplace content, featuring free stylized natural environments, dark caves, grand coliseums, NPC optimization plugins, and more.	https://www.unrealengine.com/blog/featured-free-unreal-marketplace-content-october-2023	2023-10-03 14:00:00	f	10	4
346	<em>Racing Master </em>brings authentic racing action and best-in-class graphics to mobile and other platforms	The team behind Racing Master talks about its commitment to recreating the realistic feel of high-end sports cars and optimizing Unreal Engine for cross-platform games on mobile and game simulator on PC.&nbsp;	https://www.unrealengine.com/developer-interviews/racing-master-brings-authentic-racing-action-and-best-in-class-graphics-to-mobile-and-other-platforms	2023-09-21 14:30:00	f	10	4
347	<em>Tower of Fantasy</em> leverages Unreal Engine to bring open world action to mobile, PC, and PlayStation	With Tower of Fantasy, Hotta Studio utilized the power of Unreal Engine to bring its debut title to iOS, Android, PC, PlayStation 4, and PlayStation 5.	https://www.unrealengine.com/developer-interviews/tower-of-fantasy-leverages-unreal-engine-to-bring-open-world-action-to-mobile-pc-and-playstation	2023-09-20 18:00:00	f	10	4
348	Behind the scenes on <em>Blue Dot</em>: MetaHuman Animator brings stunning fidelity to cinematics	The film shows how MetaHuman Animator unlocks the ability for teams to create cinematics of stunning fidelity and resonance by using a creative on-set process typical of traditional filmmaking to direct and capture a performance.	https://www.unrealengine.com/spotlights/behind-the-scenes-on-blue-dot-metahuman-animator-brings-stunning-fidelity-to-cinematics	2023-09-20 14:00:00	f	10	4
349	How Odyssey Interactive launched live-service game <em>Omega Strikers </em>across mobile, console, and PC	Odyssey Interactive shares techniques and best practices used to release Omega Strikers on Android and iOS simultaneously with Console and PC.	https://www.unrealengine.com/tech-blog/how-odyssey-interactive-launched-live-service-game-omega-strikers-across-mobile-console-and-pc	2023-09-19 16:00:00	f	10	4
350	<em>King Arthur: Legends Rise</em> leverages UE5 for future release on mobile and PC	After its work on Marvel and Disney titles, Kabam is making its own universe with King Arthur: Legends Rise, a cinematic RPG reimagining of the Arthurian myth.	https://www.unrealengine.com/developer-interviews/king-arthur-legends-rise-leverages-ue5-for-future-release-on-mobile-and-pc	2023-09-18 17:00:00	f	10	4
351	<em>Fort Solis</em> uses Unreal Engine 5.2 to deliver an immersive martian experience	The Epic MegaGrant Recipient was inspired by the loneliness of the pandemic and paranoia of John Carpenter’s The Thing.	https://www.unrealengine.com/developer-interviews/fort-solis-uses-unreal-engine-5-2-to-deliver-an-immersive-martian-experience	2023-09-07 14:00:00	f	10	4
352	<em>Stray Gods</em> is a musical murder mystery RPG from a Bioware veteran	Summerfall Studios is spearheaded by David Gaider, who worked on acclaimed games such as Baldur's Gate II: Shadows of Amn, Dragon Age: Origins, and Star Wars: Knights of the Old Republic.	https://www.unrealengine.com/developer-interviews/stray-gods-is-a-musical-murder-mystery-rpg-from-a-bioware-veteran	2023-09-06 16:00:00	f	10	4
353	<em>Pacific Drive</em> is a run-based driving survival game with an ever changing, mysterious landscape	Ironwood Studios talks about the production realities of development with a small team, nailing the feel of driving survival, and how Unreal Engine helped the studio fill out its anomalous portrayal of the Pacific Northwest.	https://www.unrealengine.com/developer-interviews/pacific-drive-is-a-run-based-driving-survival-game-with-an-ever-changing-mysterious-landscape	2023-09-05 14:30:00	f	10	4
354	Featured free Unreal Marketplace content—September 2023	This month’s free 3D asset drop includes an NPC-friendly quest editor, a Lumen-infused archviz apartment, a safe house, a melee system, and more. See what strikes your fancy inside!	https://www.unrealengine.com/blog/featured-free-unreal-marketplace-content-september-2023	2023-09-05 14:30:00	f	10	4
355	Unreal Developer Roundtable: Taking AAA to indie -- how small teams are making big games	In our first Unreal Developer Roundtable, we invited three former devs who worked in the AAA space (David Gaider, James Tinsdale, and Alex Dracott) and talked about how they branched out to form their own indie studios.	https://www.unrealengine.com/developer-interviews/unreal-developer-roundtable-taking-aaa-to-indie----how-small-teams-are-making-big-games	2023-09-04 14:00:00	f	10	4
356	Two high school friends used Unreal Engine 5.1 to create atmospheric retro shooter <em>Kvark</em>	Pixelated, low-poly shooter Kvark drops players into a fictional ‘80s mining facility.	https://www.unrealengine.com/developer-interviews/two-high-school-friends-used-unreal-engine-5-1-to-create-atmospheric-retro-shooter-kvark	2023-08-30 14:30:00	f	10	4
357	<em>Lies of P</em> takes inspiration from Pinocchio, French history, and marries them with Soulslike combat	NEOWIZ Games and Round8 Studio explain how they took inspiration from Pinocchio to deliver a fierce third-person action game.	https://www.unrealengine.com/developer-interviews/lies-of-p-takes-inspiration-from-pinocchio-french-history-and-marries-them-with-soulslike-combat	2023-08-29 16:00:00	f	10	4
358	Anniversary Marketplace Sale: over 1,700 products—now 50% off	There’s all kinds of great products to choose from this month. Click now to see some of our personal favorites and explore the sale today.	https://www.unrealengine.com/blog/anniversary-marketplace-sale-over-1-700-products-now-50-off	2023-08-29 14:00:00	f	10	4
359	Incoming 2023 Epic MegaJam–Register Now!	The time for the 2023 Epic MegaJam is almost upon us! Our next annual game jam event will kick off on September 14 at 2 PM EDT, with Unreal Editor for Fortnite (UEFN) submissions accepted for the first time ever!	https://www.unrealengine.com/blog/epic-megajam-2023	2023-08-28 20:30:00	f	10	4
360	<em>The Plucky Squire</em> blends 2D and 3D visuals in aesthetically pleasing and mechanically interesting ways	All Possible Futures started when two developers who worked on Nintendo games got together.	https://www.unrealengine.com/developer-interviews/the-plucky-squire-blends-2d-and-3d-visuals-in-aesthetically-pleasing-and-mechanically-interesting-ways	2023-08-23 14:30:00	f	10	4
361	<em>Octopath Traveler II</em> builds a bigger, bolder world in its stunning HD-2D style	Square Enix and Acquire talk about how Unreal Engine helped them revisit and expand the world of Octopath Traveler in this sequel.	https://www.unrealengine.com/developer-interviews/octopath-traveler-ii-builds-a-bigger-bolder-world-in-its-stunning-hd-2d-style	2023-08-22 13:30:00	f	10	4
362	Over 40 Unreal Engine-powered games highlighted during recent summer events	Join us as we roundup all of the excellent Unreal Engine games announced during several Summer showcase events, including surprising reveals and new trailers.	https://www.unrealengine.com/blog/over-40-unreal-engine-powered-games-highlighted-during-recent-summer-events	2023-08-17 16:00:00	f	10	4
363	How the three-person team behind <em>Laysara: Summit Kingdom</em> found a new spin on city-builders	Quite OK Games, the indie studio behind mountainside city builder Laysara: Summit Kingdom, talks about how Unreal Engine and other tools keep it ahead of the game development avalanche.	https://www.unrealengine.com/developer-interviews/how-the-three-person-team-behind-laysara-summit-kingdom-found-a-new-spin-on-city-builders	2023-08-15 14:00:00	f	10	4
364	How KeelWorks moved from animation to game dev to create <em>CYGNI: All Guns Blazing</em>	CYGNI: All Guns Blazing represents an amazing journey for KeelWorks, with one founder making the transition from working at Pixar to creating a blistering shoot ‘em up experience.	https://www.unrealengine.com/developer-interviews/how-keelworks-moved-from-animation-to-game-dev-to-create-cygni-all-guns-blazing	2023-08-09 16:00:00	f	10	4
365	Why Avalanche worked to deliver a <em>Hogwarts </em>game with soul	The record-breaking Hogwarts Legacy is the product of a leap from in-house game dev tools to Unreal Engine.	https://www.unrealengine.com/developer-interviews/why-avalanche-worked-to-deliver-a-hogwarts-game-with-soul	2023-08-08 14:00:00	f	10	4
366	Award-winning short film <em>The Voice in the Hollow</em> takes real-time animation to dark places	The Voice in the Hollow reimagines the Cain and Abel story as a fantastical African-inspired movie short created by a small team of professionals, blending real-time 3D, 2D elements, and motion capture.	https://www.unrealengine.com/spotlights/award-winning-short-film-the-voice-in-the-hollow-takes-real-time-animation-to-dark-places	2023-08-03 14:00:00	f	10	4
367	Unreal Engine powers stylish stellar mystery <em>The Invincible</em>	The Invincible is the first video game adaptation of a book by prolific influential sci-fi author Stanisław Lem.	https://www.unrealengine.com/developer-interviews/unreal-engine-powers-stylish-stellar-mystery-the-invincible	2023-08-02 14:30:00	f	10	4
368	August Marketplace Sale: over 1,800 products—now 50% off	There’s all kinds of great products to choose from this month. Click now to see some of our personal favorites and explore the sale today.	https://www.unrealengine.com/blog/august-marketplace-sale-over-1-800-products-now-50-off	2023-08-01 14:00:00	f	10	4
369	Featured free Unreal Marketplace content—August 2023	Need a fully stocked pirate ship? A modular building creator with some Italian flair? Maybe enough coral to start your own reef? Find all that and more in this month's free asset drop.	https://www.unrealengine.com/blog/featured-free-unreal-marketplace-content-august-2023	2023-08-01 14:00:00	f	10	4
370	<em>Born of Bread</em> is a <em>Paper Mario</em>-inspired RPG made entirely with Blueprints	Born of Bread is 100 percent built through Unreal Engine’s Blueprints.	https://www.unrealengine.com/developer-interviews/born-of-bread-is-a-paper-mario-inspired-rpg-made-entirely-with-blueprints	2023-07-25 14:00:00	f	10	4
371	Epic Games at SIGGRAPH 2023	SIGGRAPH 2023 is coming up! Register for the event and join us for sessions that explore how tools like Unreal Engine, Quixel Megascans, and Twinmotion are changing the game for film, TV, and animation.&nbsp;	https://www.unrealengine.com/events/epic-games-at-siggraph-2023	2023-07-20 15:00:00	f	10	4
372	<em>The Devil Within: Satgat</em> is a Metroidvania with fighting game inspiration 	Newcore Games explains how it brought together the fast-paced combos of a fighting game, the vast interconnected world of a Metroidvania, and a unique mystical and cybernetic aesthetic to create The Devil Within: Satgat.	https://www.unrealengine.com/developer-interviews/the-devil-within-satgat-is-a-metroidvania-with-fighting-game-inspiration	2023-07-19 14:00:00	f	10	4
373	Why a team of nine switched to Unreal Engine to deliver visually stunning action game <em>Strayed Lights</em>	How an small indie team crafted the otherworldly vision for its first game.	https://www.unrealengine.com/developer-interviews/why-a-team-of-nine-switched-to-unreal-engine-to-deliver-visually-stunning-action-game-strayed-lights	2023-07-12 14:00:00	f	10	4
374	Featured free Unreal Marketplace content—July 2023	Take a look at this month’s free Unreal Marketplace content, featuring a captivating bazaar, an office crafted with Brutalist architecture, a fearless goblin warrior, and more.	https://www.unrealengine.com/blog/featured-free-unreal-marketplace-content-july-2023	2023-07-04 14:00:00	f	10	4
375	How Unreal Engine empowered a small team to build <em>Luna Abyss</em>’ beautiful bullet hell prison	Bonsai Collective talks about the manga inspiration behind Luna Abyss, bringing “bullet hell” into first-person, and how Unreal Engine helped them craft a vast prison players must escape from.	https://www.unrealengine.com/developer-interviews/how-unreal-engine-empowered-a-small-team-to-build-luna-abyss-beautiful-bullet-hell-prison	2023-06-30 14:00:00	f	10	4
376	Winning Epic’s MegaJam was the spark that ignited the creation of UE5-powered platformer <em>Boti: Byteland Overclocked</em>	Unreal Engine 5’s Lumen empowered the team’s work to create stunning visuals of the colorful world inside a computer.	https://www.unrealengine.com/developer-interviews/winning-epic-s-megajam-was-the-spark-that-ignited-the-creation-of-ue5-powered-platformer-boti-byteland-overclocked	2023-06-29 15:00:00	f	10	4
377	<em>Two Falls</em> represents two different cultures with contrasting art styles	Developer Unreliable Narrators talks about how it collaborated with authentic sources to craft Two Falls’ engaging tale of French and Indigenous cultures meeting for the first time.	https://www.unrealengine.com/developer-interviews/two-falls-represents-two-different-cultures-with-contrasting-art-styles	2023-06-28 14:00:00	f	10	4
378	Inside <em>Kingdoms Reborn</em>’s game dev’s journey of discovery and city building	Unreal Engine’s performance prioritization helped fuel Kingdom’s Reborn’s creation.	https://www.unrealengine.com/developer-interviews/inside-kingdoms-reborn-s-game-dev-s-journey-of-discovery-and-city-building	2023-06-27 13:30:00	f	10	4
379	<em>Norse </em>is a tactical Viking game that taps into many aspects of Unreal Engine 5’s ecosystem	Located in Norway, studio Arctic Hazard leans on its local history to develop Norse, a MegaGrant recipient and turn-based tactical adventure that utilizes UE5, Quixel Megascans, and MetaHumans for its lush, realistic visuals.	https://www.unrealengine.com/developer-interviews/norse-is-a-tactical-viking-game-that-taps-into-many-aspects-of-unreal-engine-5-s-ecosystem	2023-06-26 14:30:00	f	10	4
380	Step into Nike’s virtual sneaker hunt <em>Airphoria </em>built using UEFN	When Nike set out to reach the next generation of gamers, the brand dreamed up a virtual sneaker hunt inspired by the iconic Nike Air Max shoe. Find out how Unreal Editor for Fortnite helped the team turn its vision into reality.	https://www.unrealengine.com/spotlights/step-into-nike-s-virtual-sneaker-hunt-airphoria-built-using-uefn	2023-06-23 16:00:00	f	10	4
381	June Marketplace Sale: over 1,500 products—now 50% off	There’s all kinds of great products to choose from this month. Click now to see some of our personal favorites and explore the sale today.	https://www.unrealengine.com/blog/june-marketplace-sale-over-1500-products-now-50-off	2023-06-20 14:00:00	f	10	4
382	RealityScan is now available for Android devices!	We’re pleased to announce that RealityScan is now available for Android as well as iOS devices, putting this powerful, free-to-download photogrammetry application into the hands of almost anyone with a modern smartphone or tablet.	https://www.unrealengine.com/blog/realityscan-is-now-available-for-android-devices	2023-06-20 13:00:00	f	10	4
383	Delivering high-quality facial animation in minutes, MetaHuman Animator is now available!	Capture a facial performance for your digital human using just an iPhone and a PC and turn it into facial animation for your MetaHuman in minutes. Fast, easy, and cost-effective, MetaHuman Animator unlocks facial performance capture for all...	https://www.unrealengine.com/blog/delivering-high-quality-facial-animation-in-minutes-metahuman-animator-is-now-available	2023-06-15 14:00:00	f	10	4
384	White paper: Reducing <em>Fortnite</em>’s power consumption	Learn how we cut energy costs for players by reducing Fortnite’s energy consumption, and get tips, recommendations, and code examples that you can use to bring these energy savings to your own game.	https://www.unrealengine.com/blog/white-paper-reducing-fortnite-s-power-consumption	2023-06-13 14:00:00	f	10	4
385	<em>Layers of Fear</em> reimagines horror with Unreal Engine 5	The new Layers of Fear recreates both original titles and all DLC in the franchise with some new twists, all recreated using Unreal Engine 5.	https://www.unrealengine.com/developer-interviews/layers-of-fear-reimagines-horror-with-unreal-engine-5	2023-06-09 16:00:00	f	10	4
386	Education and business join forces to create the Augmented Reality Center	Find out how a partnership between Oakland University, the College for Creative Studies, and a coalition of industry players led to the creation of a new initiative that introduces students to cutting-edge AR technology.	https://www.unrealengine.com/spotlights/education-and-business-join-forces-to-create-the-augmented-reality-center	2023-06-09 13:30:00	f	10	4
387	Join us as we celebrate the animation community at Annecy Festival 2023	We’re excited to celebrate the magic of animation at Annecy Festival. Explore our schedule, come say hi to the Epic team, attend enlightening panels, and discover groundbreaking ways to enhance your real-time animation journey with Unreal Engine.	https://www.unrealengine.com/blog/join-us-as-we-celebrate-the-animation-community-at-annecy-festival-2023	2023-06-08 14:00:00	f	10	4
388	<em>CRISIS CORE –FINAL FANTASY VII– REUNION</em> modernizes a PSP classic using Unreal Engine	Square Enix and development partner TOSE CO., LTD. explain how they revitalized a PSP prequel with CRISIS CORE –FINAL FANTASY VII– REUNION and brought the updated game to a wide variety of platforms.	https://www.unrealengine.com/developer-interviews/crisis-core-final-fantasy-vii-reunion-modernizes-a-psp-classic-using-unreal-engine	2023-06-07 17:00:00	f	10	4
389	Marketplace Seller Spotlight Sale: special selections, up to 70% off	Accelerate your game, movie, and more with assets from handpicked sellers—and then take up to 70% off while you’re doing it. Click now to see some of our favorite options inside and get a taste of what this great sale has to offer.	https://www.unrealengine.com/blog/marketplace-seller-spotlight-sale-special-selections-up-to-70-off	2023-06-07 14:00:00	f	10	4
390	Featured free Unreal Marketplace content—June 2023	Vintage interior design, shanty towns, and an interactive system starter pack—this month’s free content has plenty to pique your interest. Jump in and take a look!	https://www.unrealengine.com/blog/featured-free-unreal-marketplace-content-june-2023	2023-06-06 14:00:00	f	10	4
391	Epic Bootcamp 2023: Animation applications open now for European and Middle Eastern artists	Announcing Epic Bootcamp 2023: Animation—a free course that’ll teach you the fundamentals of real-time animation in four weeks. Classes run from July 17 through August 11, 2023, so if you want in, sign up today.	https://www.unrealengine.com/blog/epic-bootcamp-2023-animation-applications-open-now-for-european-and-middle-eastern-artists	2023-06-05 14:00:00	f	10	4
392	Meet MAVE: the virtual K-pop stars created with Unreal Engine and MetaHuman	Find out how Metaverse Entertainment used MetaHuman and Unreal Engine to create a natural, believable, and charming virtual K-pop band, and in the process, produced IP content in various forms.	https://www.unrealengine.com/spotlights/meet-mave-the-virtual-k-pop-stars-created-with-unreal-engine-and-metahuman	2023-06-01 15:30:00	f	10	4
393	Inside <em>Level Zero</em>’s war-torn game development	Doghowl Games discusses the current challenges of developing a game in Ukraine.	https://www.unrealengine.com/developer-interviews/inside-level-zero-s-war-torn-game-development	2023-05-31 16:00:00	f	10	4
394	Dream builders: Recreating the original vision for Habitat 67 with an Unreal Engine and RealityCapture Sample Project	Moshe Safdie's original vision for Habitat 67 has been recreated virtually, so anyone can explore one of the most important buildings of the 20th century in a new sample project. Find out how Neoscape, Epic, Safdie Architects, and others did it...	https://www.unrealengine.com/spotlights/dream-builders-recreating-the-original-vision-for-habitat-67-with-an-unreal-engine-and-realitycapture-sample-project	2023-05-30 14:30:00	f	10	4
395	Unreal Engine 5.2 brings native support for Apple Silicon and other developments for macOS	Starting with Unreal Engine 5.2, the Unreal Editor for macOS is built and distributed as a universal binary, providing native support for past-generation Intel-based and current-generation Apple Silicon-based Macs in a single package. This tech...	https://www.unrealengine.com/tech-blog/unreal-engine-5-2-brings-native-support-for-apple-silicon-and-other-developments-for-macos	2023-05-30 14:00:00	f	10	4
396	Explore the Virtual Production Visualization Guide	Want to learn visualization in Unreal Engine? Explore the new Virtual Production Visualization Guide—a step-by-step look at how to master this innovative filmmaking process that encompasses previs, pitchvis, techvis, stuntvis, and postvis.	https://www.unrealengine.com/blog/explore-the-virtual-production-visualization-guide	2023-05-22 16:00:00	f	10	4
397	<em>DRAGON QUEST TREASURES</em> is an charming RPG offshoot about the excitement of treasure hunting	Square Enix and TOSE talk about bringing the spirit of treasure hunting to life in DRAGON QUEST TREASURES, a new entry in the historic RPG franchise.	https://www.unrealengine.com/developer-interviews/dragon-quest-treasures-is-an-charming-rpg-offshoot-about-the-excitement-of-treasure-hunting	2023-05-22 14:30:00	f	10	4
398	Chart-topping sensation Jackson Wang embraces virtual production for superpowered music video	From a cinematic post-apocalyptic cityscape to complex levitation effects and fire-breathing dance routines, virtual production and old-fashioned filmmaking techniques took the music video for Jackson Wang’s single Cruel to new heights.	https://www.unrealengine.com/spotlights/chart-topping-sensation-jackson-wang-embraces-virtual-production-for-superpowered-music-video	2023-05-18 14:00:00	f	10	4
399	<em>Everspace 2</em> delivers a handcrafted universe brimming with space combat	ROCKFISH Games crafted more than 100 hand-crafted locations for Everspace 2 with the help of Unreal Engine .	https://www.unrealengine.com/developer-interviews/everspace-2-delivers-a-handcrafted-universe-brimming-with-space-combat	2023-05-17 16:00:00	f	10	4
400	Virtual production reaches new levels across the entire M&E industry	Just a couple of years ago, virtual production was—for the most part—only for those intrepid filmmakers and creators living right on the bleeding edge. Today, it’s taking the industry by storm. This month, we’re sharing a host of new content,...	https://www.unrealengine.com/blog/virtual-production-reaches-new-levels-across-the-entire-m-e-industry	2023-05-16 13:30:00	f	10	4
401	<em>Unreal Challenge: Spellar Performance</em>—winners announced!	Our latest Unreal Challenge invited the community to demonstrate their skillset surrounding VFX in Unreal Engine. We received so many fantastic, beautifully inspired, and creative short entries. Here are the winners!	https://www.unrealengine.com/blog/unreal-challenge-spellar-performance-winners-announced	2023-05-15 18:00:00	f	10	4
402	Unreal Engine 5.2 is now available!	This release further expands UE5's groundbreaking toolset as it continues to deliver on the promise of making Unreal Engine the most open and advanced real-time 3D creation tool in the world. Find out what’s new.&nbsp;	https://www.unrealengine.com/blog/unreal-engine-5-2-is-now-available	2023-05-11 14:30:00	f	10	4
403	Unreal Fest 2023 announced—speaker submissions now open!	Unreal Fest returns to New Orleans from October 3 to 5, 2023! We’re looking for speakers to showcase the inspirational work they’re doing using Unreal Engine or other Epic tools. If you’ve got something to share with the community, we want to hear...	https://www.unrealengine.com/blog/unreal-fest-2023-announced-speaker-submissions-now-open	2023-05-11 12:30:00	f	10	4
404	<em>The Lord of the Rings: Gollum</em> reimagines Tolkien’s Middle-Earth 	The Lord of the Rings: Gollum returns to Tolkien’s Middle-Earth to expand upon the adventures of the twisted Hobbit. Daedalic Entertainment explains how it turned to Unreal Engine to craft a new vision of the beloved fantasy landscape.	https://www.unrealengine.com/spotlights/the-lord-of-the-rings-gollum-reimagines-tolkien-s-middle-earth	2023-05-09 14:00:00	f	10	4
405	Apply now for Unreal Fellowship: Animation	Applications for Unreal Fellowship: Animation are now open. Continue your path to real-time animation success with other like-minded, experienced professionals in this engaging virtual course.	https://www.unrealengine.com/blog/sign-up-now-for-unreal-fellowship-animation	2023-05-03 18:00:00	f	10	4
406	<em>Redfall </em>brings Arkane Austin’s immersive sim DNA to a compelling, co-op open world	Developer Arkane Austin explains how it approached bringing the immersive sim gameplay and narrative worldbuilding of its previous games to Redfall, an all-new co-op FPS.	https://www.unrealengine.com/developer-interviews/redfall-brings-arkane-austin-s-immersive-sim-dna-to-a-compelling-co-op-open-world	2023-05-02 18:00:00	f	10	4
407	Featured free Unreal Marketplace content—May 2023	This month’s free Unreal Marketplace content can help you create detailed Viking villages, provide spooky scares in a Victorian mansion, and add features like a photo mode, portals, and more. See what May has to offer!	https://www.unrealengine.com/blog/featured-free-unreal-marketplace-content-may-2023	2023-05-02 14:00:00	f	10	4
408	Mega Marketplace Sale: over 15,000 products—now up to 70% off	One of our biggest sales of the year is going down in May, which means tons of great products, just waiting to help move your project forward. Click now to see some of our personal favorites and explore the sale today.	https://www.unrealengine.com/blog/mega-marketplace-sale-over-15-000-products-now-up-to-70-off	2023-05-02 14:00:00	f	10	4
409	Haute couture and sci-fi merge in new fashion short, <em>Neon Rapture</em>	Filmmaker Tim Richardson’s short film, Neon Rapture, takes Iris van Herpen’s futuristic fashion line into a stunning virtual world, blurring the line between couture and cinema. Learn how Unreal Engine helped them do it inside.	https://www.unrealengine.com/spotlights/haute-couture-and-sci-fi-merge-in-new-fashion-short-neon-rapture	2023-04-26 15:00:00	f	10	4
410	Watch the Unreal Fellowship: Worldbuilding sizzle reel	See the unique worlds industry professionals created in only three weeks, as they explored the core principles of real-time production design and real-time worldbuilding.	https://www.unrealengine.com/blog/watch-the-unreal-fellowship-worldbuilding-sizzle-reel	2023-04-26 14:00:00	f	10	4
411	Unreal Fest Gold Coast 2023	Unreal Fest is heading down under for the first time ever! Join us on the Gold Coast for two action-packed days of skills development, Epic dev support, networking…and an Unreal Fest Party. Get your ticket today!	https://www.unrealengine.com/events/unreal-fest-gold-coast-2023	2023-04-26 00:00:00	f	10	4
412	<em>GigaBash </em>is a colossal kaiju clash paying homage to Godzilla and Ultraman	The team at Passion Republic Games talk about being inspired by classic tokusatsu films, designing their own unique kaiju, and getting to work with Godzilla.&nbsp;	https://www.unrealengine.com/developer-interviews/gigabash-is-a-colossal-kaiju-clash-paying-homage-to-godzilla-and-ultraman	2023-04-20 15:00:00	f	10	4
413	Real-time hits the FIFA World Cup: exploring one of broadcast's best-kept secrets	Learn the Unreal Engine tools and techniques KéexFrame used to create a broadcast cinematic uniquely customized for live coverage of the 2022 FIFA World Cup.	https://www.unrealengine.com/spotlights/real-time-hits-the-fifa-world-cup-exploring-one-of-broadcast-s-best-kept-secrets	2023-04-13 13:30:00	f	10	4
414	Join Epic Games at NAB 2023	Over 30 companies are showing off Unreal Engine-driven tech and services at NAB 2023. See who’ll be at the show inside.	https://www.unrealengine.com/events/join-us-at-nab-2023	2023-04-12 14:00:00	f	10	4
415	April Marketplace Sale preview: over 1,500 products—up to 70% off	From dangerous ninja girls to lushly vibrant pirate islands, there's a multitude of wonderful products to choose from this month. See some of our favorites in the April marketplace sale today.	https://www.unrealengine.com/blog/april-marketplace-sale-preview-over-1-500-products-up-to-70-off	2023-04-11 14:00:00	f	10	4
416	Firaxis Games talks about designing and developing the superhero tactical experience of <em>Marvel’s Midnight Suns</em>	Firaxis Games, the studio behind the XCOM franchise, dives into the supernatural side of the Marvel Universe in this super-powered tactical strategy game. Find out how they flipped the formula.	https://www.unrealengine.com/developer-interviews/firaxis-games-talks-about-designing-and-developing-the-superhero-tactical-experience-of-marvel-s-midnight-suns	2023-04-05 15:00:00	f	10	4
417	Featured free Unreal Marketplace content—April 2023	Go from shark-infested, underwater depths to soaring the skies and beyond with April’s free Marketplace content.	https://www.unrealengine.com/blog/featured-free-unreal-marketplace-content-april-2023	2023-04-04 13:30:00	f	10	4
418	Thirdverse puts your finger on the trigger in its immersive VR hero shooter <em>X8</em>	Thirdverse explains how it packs in all the action you’d expect from a hero shooter into X8, a VR game where players can enjoy high-speed tactical combat and use hand gestures to activate powerful abilities.	https://www.unrealengine.com/developer-interviews/thirdverse-puts-your-finger-on-the-trigger-in-its-immersive-vr-hero-shooter-x8	2023-03-30 14:00:00	f	10	4
419	Singapore Virtual Production Challenge	Based in Singapore? Submit your best pitches for short-form content created in UE5. The Infocomm Media Development Authority (IMDA) will provide shortlisted entries with $30,000 SGD to create their project, and the winner will take home $20,000 SGD...	https://www.unrealengine.com/events/singapore-virtual-production-challenge-2023	2023-03-28 20:00:00	f	10	4
420	Epic Bootcamp 2023: Animation applications open now for Latin American artists	Announcing Epic Bootcamp 2023: Animation—a free course that’ll teach you the fundamentals of real-time animation in four weeks. Classes start on May 22, 2023, so if you want in, sign up today.	https://www.unrealengine.com/blog/epic-bootcamp-2023-animation-applications-open-now-for-latin-american-artists	2023-03-28 14:00:00	f	10	4
421	Unreal Editor for Fortnite is now available in Public Beta!	Unreal Editor for Fortnite (UEFN) combines the power of Unreal Engine with the scale of Fortnite. Use development tools to build games and experiences that can be unlike anything seen in Fortnite so far and publish for millions of players to...	https://www.unrealengine.com/blog/unreal-editor-for-fortnite-is-now-available-in-beta	2023-03-22 18:30:00	f	10	4
422	New MetaHuman Animator feature set to bring easy high-fidelity performance capture to MetaHumans	Do you love the visual fidelity of MetaHumans but find it hard to make their facial animation equally believable? A new MetaHuman feature set will soon change all that. And you may already have the hardware you need in your pocket.	https://www.unrealengine.com/blog/new-metahuman-animator-feature-set-to-bring-easy-high-fidelity-performance-capture-to-metahumans	2023-03-22 17:30:00	f	10	4
423	Dive into Epic’s announcements from GDC 2023	At the State of Unreal, we revealed how we’re laying the foundations for an open ecosystem and economy for all creators. Find out how everything Epic has been building for the past 30 years fits together.&nbsp;	https://www.unrealengine.com/blog/dive-into-epic-s-announcements-from-gdc-2023	2023-03-22 17:30:00	f	10	4
424	<em>Hi-Fi RUSH</em> was inspired by <em>Shaun of the Dead </em>and <em>Futurama</em>	Developer Tango Gameworks talks about how Blueprints, UE’s Animation Editor, and the Editor Utility Widget allowed the studio to create the unique rhythmic action gameplay.&nbsp;	https://www.unrealengine.com/developer-interviews/hi-fi-rush-was-inspired-by-shaun-of-the-dead-and-futurama	2023-03-16 14:00:00	f	10	4
425	<em>ONE PIECE ODYSSEY</em> turns the popular manga into a rousing RPG adventure as a celebration of its 25th anniversary	For the 25th anniversary of the ONE PIECE manga and anime series, Bandai Namco Entertainment and ILCA explain how they crafted ONE PIECE ODYSSEY, an immense RPG adventure that honors the series’ history.	https://www.unrealengine.com/developer-interviews/one-piece-odyssey-turns-the-popular-manga-into-a-rousing-rpg-adventure-as-a-celebration-of-its-25th-anniversary	2023-03-15 16:00:00	f	10	4
426	From <em>The Lion King</em> to fairyland: inside the beautiful world of <em>Brave Creatures</em>	Journey into a short that feels destined for bigger things, as we learn how an Academy Award-winner tapped Epic Ecosystem standards like UE5, Megascans, MetaHumans, and the Path Tracer to pull you into a fairy world on the brink of war.	https://www.unrealengine.com/spotlights/from-lion-king-to-fairyland-inside-the-beautiful-world-of-brave-creatures	2023-03-15 14:00:00	f	10	4
427	<em>34EVERLAST </em>represents a composer's journey deep into game development	Syohei Ogami of Kanata Lab spent years as a successful musician, only to see a musical project turn into 34EVERLAST, a high-speed action game that you can complete in as little as 10 minutes.	https://www.unrealengine.com/developer-interviews/34everlast-represents-a-composer-s-journey-deep-into-game-development	2023-03-14 17:30:00	f	10	4
428	Why <em>Ukiyo </em>is a casual game about escaping a Japanese virtual reality	Ukiyo’s Epic MegaGrant introduced devs to Japan’s indie game scene.	https://www.unrealengine.com/developer-interviews/why-ukiyo-is-a-casual-game-about-escaping-a-japanese-virtual-reality	2023-03-14 16:00:00	f	10	4
429	March Marketplace Sale preview: over 1,500 products—now 70% off	There are all kinds of great products to choose from this month. Click now to see some of our personal favorites and explore the sale today.	https://www.unrealengine.com/blog/march-marketplace-sale-preview-over-1-500-products-now-70-off	2023-03-14 14:00:00	f	10	4
430	Incoming changes in JDK / JRE 21 packages may require manual intervention	We are introducing a change in JDK/JRE packages of our distro. This is triggered from the way a JRE is build in modern versions of Java (&gt;9). We are introducing this change in Java 21. To sum it up instead of having JDK and JRE packages coexist...	https://archlinux.org/news/incoming-changes-in-jdk-jre-21-packages-may-require-manual-intervention/	2023-11-02 10:51:53	f	11	5
431	Changes to default password hashing algorithm and umask settings	With shadow &gt;= 4.14.0, Arch Linux's default password hashing algorithm changed from SHA512 to yescrypt. Furthermore, the umask settings are now configured in /etc/login.defs instead of /etc/profile. This should not require any manual...	https://archlinux.org/news/changes-to-default-password-hashing-algorithm-and-umask-settings/	2023-09-22 20:26:30	f	11	5
432	ansible-core >= 2.15.3-1 update may require manual intervention	As of ansible-core 2.15.3, upstream moved documentation and examples to a separate dedicated repository (see the related changelogs). This means that, starting from version 2.15.3 the ansible-core package will stop shipping documentation and a...	https://archlinux.org/news/ansible-core-2153-1-update-may-require-manual-intervention/	2023-08-19 10:41:34	f	11	5
433	budgie-desktop >= 10.7.2-6 update requires manual intervention	When upgrading from budgie-desktop 10.7.2-5 to 10.7.2-6, the package mutter43 must be replaced with magpie-wm, which currently depends on mutter. As mutter43 conflicts with mutter, manual intervention is required to complete the upgrade. First...	https://archlinux.org/news/budgie-desktop-1072-6-update-requires-manual-intervention/	2023-08-11 14:55:16	f	11	5
434	TeX Live package reorganization	Starting from version 2023.66594-9, TeX Live packages have been reorganized to mirror upstream collections. Even though the new texlive-basic replaces the old texlive-core, many of the texlive-core contents (including language specific files) are...	https://archlinux.org/news/tex-live-package-reorganization/	2023-06-18 09:14:37	f	11	5
435	OpenBLAS >= 0.3.23-2 update requires manual intervention	The openblas package prior to version 0.3.23-2 doesn't ship optimized LAPACK routine and CBLAS/LAPACKE interfaces for compatibility. This decision has been reverted now, and the ability to choose a different default system BLAS/LAPACK...	https://archlinux.org/news/openblas-0323-2-update-requires-manual-intervention/	2023-06-14 20:27:28	f	11	5
436	Git migration completed	We are proud to announce that the migration to Git packaging succeeded! 🥳 Thanks to everyone who has helped during the migration! Package sources are now available on GitLab. Note that the bugtracker is still flyspray and that merge requests are...	https://archlinux.org/news/git-migration-completed/	2023-05-21 11:14:50	f	11	5
437	Git migration announcement	This Friday morning (2023-05-19) the Git packaging migration will start until Sunday (2023-05-21). The Arch Linux packaging team will not be able to update packages in any of the repositories during this period. Notification when the migration...	https://archlinux.org/news/git-migration-announcement/	2023-05-15 19:50:21	f	11	5
438	Switch to the base-devel meta package requires manual intervention	On February 2nd, the base-devel package group has been replaced by a meta package of the same name. If you installed the base-devel package group prior to this date, explicitly re-install it to get the new base-devel package installed on the...	https://archlinux.org/news/switch-to-the-base-devel-meta-package-requires-manual-intervention/	2023-02-12 14:43:35	f	11	5
439	PHP 8.2 update and introduction of legacy branch	The php packages have been updated to the latest version 8.2. In addition to this, a new set of php-legacy packages have been introduced. These will follow the oldest but still actively supported PHP branch. This enables users to install the latest...	https://archlinux.org/news/php-82-update-and-introduction-of-legacy-branch/	2023-01-13 14:46:04	f	11	5
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inflow
--

SELECT pg_catalog.setval('public.category_id_seq', 5, true);


--
-- Name: feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inflow
--

SELECT pg_catalog.setval('public.feed_id_seq', 11, true);


--
-- Name: feeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inflow
--

SELECT pg_catalog.setval('public.feeditem_id_seq', 439, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: category category_title_key; Type: CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_title_key UNIQUE (title);


--
-- Name: feed feed_pkey; Type: CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feed
    ADD CONSTRAINT feed_pkey PRIMARY KEY (id);


--
-- Name: feed feed_url_key; Type: CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feed
    ADD CONSTRAINT feed_url_key UNIQUE (url);


--
-- Name: feeditem feeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feeditem
    ADD CONSTRAINT feeditem_pkey PRIMARY KEY (id);


--
-- Name: feeditem feeditem_url_key; Type: CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feeditem
    ADD CONSTRAINT feeditem_url_key UNIQUE (url);


--
-- Name: feed feed_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feed
    ADD CONSTRAINT feed_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: feeditem feeditem_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feeditem
    ADD CONSTRAINT feeditem_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: feeditem feeditem_feed_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: inflow
--

ALTER TABLE ONLY public.feeditem
    ADD CONSTRAINT feeditem_feed_id_fkey FOREIGN KEY (feed_id) REFERENCES public.feed(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: inflow
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO inflow;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: inflow
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--
