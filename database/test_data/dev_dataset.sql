--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.user_account (id, username, password_hash, password_salt, last_login, created_at, updated_at) FROM stdin;
2	user	\\xe0de93b7b3c6bfaccbbaf0ccce3ee8740430b9117c1392994cdfa6de662f0f70	\\xeac899dcde1f9be69437c9ad9761a69e	\N	2024-08-23 05:07:15.044644	2024-08-23 05:07:15.044644
3	user2	\\xca19e6e744dc45fd059e3469ba6f2484ed1128be76267805118b512006d90793	\\xd32a8e8ad281dd969256998e5abe3ca8	\N	2024-08-26 05:47:27.056855	2024-08-26 05:47:27.056855
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.collection (id, title, user_id) FROM stdin;
39	Game Dev	2
40	Engineering	2
41	Sysadmin	2
42	Business	2
43	News	2
44	Sysadmin	3
52	Web Development	3
\.


--
-- Data for Name: feed; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.feed (id, url, title, description) FROM stdin;
1	https://sive.rs/feed	Derek Sivers blog	
2	http://blog.mozilla.com/feed/	The Mozilla Blog	News and Updates about Mozilla
3	https://developer.mozilla.org/en-US/blog/rss.xml	MDN Blog	The MDN Web Docs blog publishes articles about web development, open source software, web platform updates, tutorials, changes and updates to MDN, and more.
4	http://martinfowler.com/bliki/bliki.atom	Martin Fowler	Master feed of news and updates from martinfowler.com
5	http://patflynn.com/feed/	Pat Flynn	Father, husband, entrepreneur, author, speaker.
6	http://www.ansible.com/blog/rss.xml	Ansible Blog	The official blog for Ansible by Red Hat and the Ansible open source project.
8	https://feeds.npr.org/1001/rss.xml	News : NPR	NPR news, audio, and podcasts. Coverage of breaking stories, national and world news, politics, business, science, technology, and extended coverage of major national and world events.
9	http://code.blender.org/index.php/feed/	Developer Blog	code.blender.org
10	https://www.unrealengine.com/rss	Unreal Engine - News, Developer Interviews, Spotlights, Tech Blogs	
11	http://www.archlinux.org/feeds/news/	Arch Linux: Recent news updates	The latest and greatest news from the Arch Linux distribution.
7	http://feeds.feedburner.com/Phoronix	Phoronix	Linux Hardware Reviews, Benchmarks & Open-Source News
14	http://feeds.rssboard.org/rssboard	RSS Advisory Board	RSS Advisory Board announcements and Really Simple Syndication news
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.item (id, title, description, url, pubdate, feed_id) FROM stdin;
1	WATCH: DNC Night 4 speeches from Harris, Whitmer, Sharpton, Kinzinger and more	Gun violence, race, climate change and, of course, Donald Trump were themes of the night that culminated in Kamala Harris  accepting the Democratic Party's nomination for president.	https://www.npr.org/2024/08/23/nx-s1-5086821/democratic-national-convention-speakers-harris-kinzinger-whitmer-warren-sharpton	2024-08-23 04:58:07	8
2	Harris had one of the shortest acceptance speeches in history. Trump had the longest	Her speech, at only 38 minutes, was the 12th-shortest in modern history, while her opponent holds the records for the three longest acceptance speeches in American political history.	https://www.npr.org/2024/08/23/g-s1-19242/kamala-harris-acceptance-speech-dnc-trump	2024-08-23 04:48:50	8
3	Fact checking Trump's claims during Harris' acceptance speech	Former President Donald Trump was posting on Truth Social throughout Kamala Harris' DNC speech, where she formally accepted the party's nomination for president.	https://www.npr.org/2024/08/23/g-s1-19229/trump-fact-check-kamala-harris-dnc-speech	2024-08-23 04:46:09	8
4	Gretchen Whitmer takes jabs at Trump: 'Donald Trump doesn't know you at all'	Whitmer called Trump "that man from Mar-a-Lago" while also brushing off his previous remarks by saying being from Michigan is "a badge of honor."	https://www.npr.org/2024/08/23/g-s1-19234/gretchen-whitmer-dnc-speech-trump	2024-08-23 04:26:41	8
5	Harris says Israel 'has right to defend itself,' Palestinians need 'dignity, security'	After much speculation, Vice President Harris, now the Democratic nominee for president, came out with the strongest remarks so far on where she stands on the Israel-Hamas war and the humanitarian crisis in Gaza.	https://www.npr.org/2024/08/23/g-s1-19232/kamala-harris-israel-gaza-dnc	2024-08-23 04:04:42	8
6	So, about that special musical guest .... Where was Beyoncé for the DNC's final night?	Instead, the special, previously unannounced guest was … nobody. The night’s headliner, Vice President Harris, had the spotlight to herself — which may have been the point all along.	https://www.npr.org/2024/08/22/g-s1-18988/beyonce-taylor-swift-dnc-performances	2024-08-23 03:50:29	8
7	Watch The Chicks and Pink perform at the DNC's final night	The Chicks and Pink brought plenty of star power of their own.	https://www.npr.org/2024/08/22/g-s1-19108/democratic-national-convention-pink-the-chicks	2024-08-23 03:48:27	8
8	North Carolina Gov. Roy Cooper says Harris will fight for America	Cooper delivered the final remarks ahead of Vice President Harris’ keynote address, vowing that a Harris administration would fight for everyday Americans.	https://www.npr.org/2024/08/22/g-s1-19218/roy-cooper-dnc-speaker-north-carolina	2024-08-23 03:41:22	8
9	WATCH: Kamala Harris' full Democratic National Convention speech	Vice President Harris accepted the Democratic Party’s nomination for president tonight in Chicago, the final day of the Democratic National Convention.	https://www.npr.org/2024/08/22/g-s1-19111/watch-kamala-harris-dnc-speech-democratic-national-convention	2024-08-23 03:38:44	8
10	Former Republican lawmaker offers a blistering assessment of Trump in DNC speech	A group of Republicans, including Kinzinger, have come together in support of Harris. Kinzinger said he lost faith in Trump and experienced a “profound sorrow” after Jan. 6.	https://www.npr.org/2024/08/22/g-s1-19226/adam-kinzinger-trump-dnc-speech	2024-08-23 03:28:34	8
11	Celebrating an important step forward for Open Source AI	By: Ayah Bdeir, Imo Udom and Nik Marda TL;DR: Mozilla is excited about today’s new definition of open source AI, and we endorse it as an important step forward. This past year has been marked by more and more people recognizing the societal...	https://blog.mozilla.org/en/mozilla/ai/open-source-ai-definition/	2024-08-22 13:01:40	2
12	At the Rise25 Awards, the future of AI is ethical, inclusive and accountable	The second annual Rise25 Awards in Dublin wasn’t just about celebrating 25 AI leaders. It was about mapping out the future. The Gardiner Brothers, known for bringing Irish dance into the social media spotlight, kicked off the night with a...	https://blog.mozilla.org/en/mozilla/rise25-dublin/	2024-08-15 10:06:37	2
13	Firefox hacks for everyone: From cozy gamers to minimalists and beyond	Firefox users, we’ve got tips for you. The Mozilla team has gathered some of our favorite tricks to help you get the most out of your browser – from customizing the look of Firefox and managing tabs, to watching videos on the sly and staying cozy...	https://blog.mozilla.org/en/products/firefox/firefox-tips/firefox-hacks-for-everyone/	2024-08-06 16:00:00	2
14	Streamline your schoolwork with Firefox’s PDF editor	As a student pursuing a master’s degree, I’ve spent too much time searching for PDF editors to fill out forms, take notes and complete projects. I discovered Firefox’s built-in PDF editor while interning at Mozilla as a corporate communications...	https://blog.mozilla.org/en/products/firefox/firefox-tips/streamline-schoolwork-firefox-pdf-editor/	2024-08-02 13:00:00	2
15	Browsers, cookies and surfing the web: The quirky history of internet lingo	Dr. Erica Brozovsky is a sociolinguist, a public scholar and a lover of words. She is the host of Otherwords, a PBS series on language and linguistics, and a professor of writing and rhetoric at Worcester Polytechnic Institute. You can find her at...	https://blog.mozilla.org/en/internet-culture/history-of-internet-terms/	2024-08-01 16:00:00	2
16	Picture-in-Picture lets you watch videos while ‘working’	Some days there’s something extra interesting to watch online — a sports event, election coverage, a certain show is leaving Netflix so you gotta binge — but you’ve got work to do. The Picture-in-Picture feature in Firefox makes multitasking with...	https://blog.mozilla.org/en/products/firefox/picture-in-picture/	2024-07-26 16:26:17	2
17	BAFTA Award-Winner Siobhán McSweeney to host Mozilla’s 2nd Annual Rise25 Awards in Dublin, Ireland on Aug. 13	Following the news of our 25 honorees for The 2nd Annual Rise25 Awards, Mozilla is thrilled to announce that actress and presenter Siobhán McSweeney will be hosting this year’s ceremony which will celebrate these individuals for leading the next...	https://blog.mozilla.org/en/mozilla/bafta-award-winner-siobhan-mcsweeney-to-host-mozillas-2nd-annual-rise25-awards-in-dublin-ireland-on-august-13/	2024-07-24 07:00:00	2
18	Top 5 Firefox features for tab maximalists	I am a tab maximalist. On any given day, you can find me with 50+ tabs open across multiple windows on Firefox. Having this many tabs open can seem chaotic, but rest assured there is a method to the madness. As a global product marketing manager at...	https://blog.mozilla.org/en/products/firefox/firefox-tips/efficient-tab-management-firefox/	2024-07-23 16:00:00	2
19	Here’s what we’re working on in Firefox	We recently shared a number of updates with our community of users, and now we want to share them here: At Mozilla, we work hard to make Firefox the best browser for you. That’s why we’re always focused on building a browser that empowers you to...	https://blog.mozilla.org/en/mozilla/heres-what-were-working-on-in-firefox/	2024-07-15 18:16:38	2
20	Fakespot reveals the product categories with the most and least reliable product reviews	Today, Fakespot, a free browser extension and website that protects consumers from unreliable reviews and sellers, announced the Amazon product categories with the most reliable and unreliable reviews, just in time for the big summer sales and...	https://blog.mozilla.org/en/mozilla/news/fakespot-reveals-the-product-categories-with-the-most-and-least-reliable-product-reviews-for-summer-and-back-to-school-shopping/	2024-07-12 13:00:00	2
21	How to debug mobile apps across devices	This post explores what mobile app debugging is, commonly used techniques, and how you can debug mobile apps on multiple devices.	https://developer.mozilla.org/en-US/blog/debug-mobile-apps-across-devices/	2024-08-07 00:00:00	3
22	Exclusive accordions using the HTML details element	The 'name' attribute of the HTML details element is gaining more support across browsers. Learn how this feature allows creating exclusive accordions without scripting widgets from scratch.	https://developer.mozilla.org/en-US/blog/html-details-exclusive-accordions/	2024-08-05 00:00:00	3
23	Exploring the Broadcast Channel API for cross-tab communication	This article explains how to use the Broadcast Channel API to build synchronized and interconnected web applications.	https://developer.mozilla.org/en-US/blog/exploring-the-broadcast-channel-api-for-cross-tab-communication/	2024-07-12 00:00:00	3
24	MDN partners with Scrimba to enhance web development learning	We have chosen Scrimba as a course partner for the MDN Curriculum. This blog post explores what the partnership means practically, and how we will provide an even better web education experience together.	https://developer.mozilla.org/en-US/blog/mdn-scrimba-partnership/	2024-07-09 00:00:00	3
25	Introducing the MDN HTTP Observatory	First released in 2016, the HTTP Observatory became popular in the web community with a combination of helpful security audits and educational material. Fast forward to 2024, and we are delighted to announce that Observatory's new home is MDN. Read...	https://developer.mozilla.org/en-US/blog/mdn-http-observatory-launch/	2024-07-02 00:00:00	3
26	Static Site Generation (SSG) with Next.js	This guide explains how to use Static Site Generation in Next.js to build scalable and secure web applications with fast loading times and a focus on performance.	https://developer.mozilla.org/en-US/blog/static-site-generation-with-nextjs/	2024-06-28 00:00:00	3
27	New JavaScript Set methods	New JavaScript Set methods are landing across browsers. Learn about sets, how you can use these methods to compare different sets, create new sets with specific properties, and more.	https://developer.mozilla.org/en-US/blog/javascript-set-methods/	2024-06-24 00:00:00	3
28	Securing APIs: Express rate limit and slow down	This guide introduces you to rate limits and slow down mechanisms. Learn how to apply slow down and rate limit mechanisms in Express applications.	https://developer.mozilla.org/en-US/blog/securing-apis-express-rate-limit-and-slow-down/	2024-05-28 00:00:00	3
29	Using the Page Visibility API	This post takes a look at what page visibility is, how you can use the Page Visibility API in your applications, and describes pitfalls to avoid if you build features around this functionality.	https://developer.mozilla.org/en-US/blog/using-the-page-visibility-api/	2024-05-10 00:00:00	3
30	A year of publishing the MDN Blog	We've been writing about web development and the web platform on the MDN Blog since May 2023. Here's our highlights and top posts along with our favorites.	https://developer.mozilla.org/en-US/blog/mdn-blog-one-year-on/	2024-05-03 00:00:00	3
31	Setting up service workers on Vultr	This guide introduces you to service workers and their lifecycle. Learn how to deploy a project using service workers with HTTPS on Vultr.	https://developer.mozilla.org/en-US/blog/setting-up-service-workers-on-vultr/	2024-04-23 00:00:00	3
32	Interop 2023: MDN updates	Interop 2023 has successfully concluded, and the Interop 2024 project is now officially underway. Learn what Interop is, discover the updates from Interop 2023 now on MDN, and find out what's coming to the web next.	https://developer.mozilla.org/en-US/blog/interop2023-mdn-doc-updates/	2024-03-27 00:00:00	3
33	Testing JavaScript with Jest on Vultr	This guide introduces you to the common types of tests and the testing conventions. Learn how to test JavaScript with Jest on Vultr.	https://developer.mozilla.org/en-US/blog/test-javascript-with-jest-on-vultr/	2024-03-22 00:00:00	3
34	Creating color palettes with the CSS color-mix() function	Working with colors on the web just got more interesting! In this article, we’ll explore how to use the CSS color-mix() function to create variations in color palettes.	https://developer.mozilla.org/en-US/blog/color-palettes-css-color-mix/	2024-03-08 00:00:00	3
35	Modernizing conventional test automation with TestGrid	This post reflects on the conventional test automation methods using Selenium and Appium. Learn how you can use TestGrid's unified testing platform to enhance the conventional methods and also leverage the modern codeless testing techniques.	https://developer.mozilla.org/en-US/blog/modernizing-test-automation-with-test-grid/	2024-02-29 00:00:00	3
36	Lift-off: The MDN Curriculum launch	The long-awaited MDN Curriculum is now live on MDN, providing a structured guide to the essential front-end development skills and best practices for industry newcomers. Learn all the key details in this article.	https://developer.mozilla.org/en-US/blog/mdn-curriculum-launch/	2024-02-27 00:00:00	3
37	Creating effective technical documentation	This article provides an overview of the core components required for creating effective technical documentation. Learn the best practices to make your documentation clear, consistent, and well-structured.	https://developer.mozilla.org/en-US/blog/technical-writing/	2024-02-13 00:00:00	3
38	Leveraging Bun on Vultr: A superior Node.js alternative	This guide explains Bun functionalities as a runtime package manager and a bundler. It also explains the benefits of built-in Bun APIs and how to use Bun's Vultr marketplace application.	https://developer.mozilla.org/en-US/blog/leveraging-bun-on-vultr-a-superior-node-js-alternative/	2024-01-17 00:00:00	3
39	Border images in CSS: A key focus area for Interop 2023	Aligning with Interop 2023's emphasis on cross-browser consistency, this post walks you through various `border-image` properties that you can control to create captivating web designs. Learn how to use custom graphics for enhancing the look of...	https://developer.mozilla.org/en-US/blog/border-images-interop-2023/	2023-12-19 00:00:00	3
40	Build AI-powered applications using OpenLLM and Vultr Cloud GPU	Learn how to build AI-powered apps using OpenLLM and Vultr Cloud GPU. This guide shows how to generate API responses using a Large Language Model. It also covers instructions for setting up an Nginx server and implementing SSL security.	https://developer.mozilla.org/en-US/blog/build-ai-powered-apps-openllm-vultr-gpu/	2023-12-12 00:00:00	3
41	Saying goodbye to third-party cookies in 2024	The tail end of 2023 welcomes positive news for web privacy, as Chrome announces it is to join Firefox and Safari in deprecating third-party cookies in 2024. Find out more details about these changes, and what they mean for web developers.	https://developer.mozilla.org/en-US/blog/goodbye-third-party-cookies/	2023-12-08 00:00:00	3
42	Baseline's evolution on MDN	Today we're updating the Baseline widgets and introducing a new one, along with the updated definition of Baseline.	https://developer.mozilla.org/en-US/blog/baseline-evolution-on-mdn/	2023-12-05 00:00:00	3
43	Developer essentials: JavaScript console methods	The JavaScript console is an essential tool for web development. Learn new and fun ways to use the console to display data and debug your code.	https://developer.mozilla.org/en-US/blog/learn-javascript-console-methods/	2023-11-30 00:00:00	3
44	Getting started with CSS container queries	CSS container queries are a powerful new tool for our CSS layout toolbox. In this post we'll dive into the practicalities of building a layout with container queries.	https://developer.mozilla.org/en-US/blog/getting-started-with-css-container-queries/	2023-11-16 00:00:00	3
45	Deploying Node.js applications with PM2 on Vultr	Learn how to deploy a Node.js application on Vultr using PM2 to create persistent services. This guide shows how to efficiently use resources via PM2 cluster mode. It also covers Nginx server setup and SSL security.	https://developer.mozilla.org/en-US/blog/deploying-node-js-applications-with-pm2-on-vultr/	2023-11-08 00:00:00	3
46	VS Code: Tips and tricks for beginners	Discover essential tips and tricks for using Visual Studio Code (VS Code), a powerful IDE. Learn how to leverage its integrated editing features and Git support, and explore a few extensions.	https://developer.mozilla.org/en-US/blog/vs-code-tips-tricks/	2023-11-07 00:00:00	3
47	Coming Soon: MDN Observatory 2.0	Observatory 2.0 is launching soon as part of the Mozilla Developer Network as the MDN Observatory with new security scoring standards and other exciting updates.	https://developer.mozilla.org/en-US/blog/mdn-observatory/	2023-10-25 00:00:00	3
48	Optimizing DevSecOps workflows with GitLab's conditional CI/CD pipelines	This guide explores the various types of CI/CD pipelines and helps you understand their specific use cases. Learn how to leverage rules to create highly efficient DevSecOps workflows.	https://developer.mozilla.org/en-US/blog/optimizing-devsecops-workflows-with-gitlab-conditional-ci-cd-pipelines/	2023-10-23 00:00:00	3
49	Introduction to web sustainability	What can web designers and developers do to build a more sustainable web? This post explores the environmental impacts of web technologies and looks at some of the ways we can build greener websites.	https://developer.mozilla.org/en-US/blog/introduction-to-web-sustainability/	2023-10-11 00:00:00	3
50	Migrating from GitHub to GitLab seamlessly: A step-by-step guide	Thinking about making the move from GitHub to GitLab? This guide demystifies the migration process, addressing common concerns for DevSecOps teams that are looking to seamlessly transition between the two platforms. This post provides a...	https://developer.mozilla.org/en-US/blog/migrating-from-github-to-gitlab-seamlessly-a-step-by-step-guide/	2023-10-05 00:00:00	3
51	Announcing the MDN front-end developer curriculum	MDN has created a curriculum for aspiring front-end developers to build a rewarding and successful career. Take a look at the curriculum, who it's for, and the research it's based on.	https://developer.mozilla.org/en-US/blog/announcing-mdn-front-end-developer-curriculum/	2023-08-14 00:00:00	3
52	Creating custom easing effects in CSS animations using the linear() function	The new CSS linear() timing function enables custom easing in animations. Explore how linear() works compared with other timing functions used for easing, with practical examples.	https://developer.mozilla.org/en-US/blog/custom-easing-in-css-with-linear/	2023-08-01 00:00:00	3
53	Securing your CDN: Why and how should you use SRI	Relying on external resources for your website is always fraught with risks. Learn how to protect your website and its visitors by using SRI to secure third-party content.	https://developer.mozilla.org/en-US/blog/securing-cdn-using-sri-why-how/	2023-07-21 00:00:00	3
54	Scroll progress animations in CSS	Scroll-driven animations are coming to CSS! In this post, we'll look at a few types of animations and learn how to link them to the scroll progress of a container.	https://developer.mozilla.org/en-US/blog/scroll-progress-animations-in-css/	2023-07-14 00:00:00	3
55	Reflections on AI Explain: A postmortem	We recently launched a feature called AI Explain, but we have rolled this back for now. In this post, we look into the story behind AI Explain: its development, launch, and the reasons that led us to press the pause button.	https://developer.mozilla.org/en-US/blog/ai-explain-postmortem/	2023-07-11 00:00:00	3
56	Developer essentials: How to search code using grep	grep is a powerful tool for searching code from the terminal. This post will show you how to use grep and why it's an essential developer tool.	https://developer.mozilla.org/en-US/blog/searching-code-with-grep/	2023-07-03 00:00:00	3
57	Introducing AI Help (Beta): Your Companion for Web Development	We're introducing an AI assistant powered by MDN and OpenAI GPT 3.5 to answer all your web development questions in real time.	https://developer.mozilla.org/en-US/blog/introducing-ai-help/	2023-06-27 00:00:00	3
58	Learn how to use hue in CSS colors with HSL	Hues are a bright way to define colors in CSS. Learn about hues, color wheels, how to use color functions, and how you can create vibrant color palettes for your website using hue.	https://developer.mozilla.org/en-US/blog/learn-css-hues-colors-hsl/	2023-06-26 00:00:00	3
59	Introducing the MDN Playground: Bring your code to life!	MDN is launching a code Playground. Users can prototype ideas and expand all live samples into an interactive experience.	https://developer.mozilla.org/en-US/blog/introducing-the-mdn-playground/	2023-06-22 00:00:00	3
60	MDN doc updates: CSS selectors & media queries, WebGPU & WebTransport APIs, Progressive web apps	Discover CSS :lang(), experimental media queries, manipulating graphics with WebGPU, client-server communication with WebTransport, ECMAScript module support, and more.	https://developer.mozilla.org/en-US/blog/mdn-docs-june-2023/	2023-06-13 00:00:00	3
61	How to draw any regular shape with just one JavaScript function	Learn how to use JavaScript to draw any regular shape to a HTML canvas with a single function, and how to modify it to draw multiple shapes.	https://developer.mozilla.org/en-US/blog/javascript-shape-drawing-function/	2023-05-26 00:00:00	3
62	New reference pages on MDN for JavaScript regular expressions	See the latest updates to the MDN reference pages about JavaScript regular expressions, including new sections on sub-features and browser compatibility information.	https://developer.mozilla.org/en-US/blog/regular-expressions-reference-updates/	2023-05-23 00:00:00	3
63	Celebrating Global Accessibility Awareness Day	In celebration of Global Accessibility Awareness Day in 2023, we share some tools and guidelines to help you make the web more accessible.	https://developer.mozilla.org/en-US/blog/accessibility-celebrating-gaad-2023/	2023-05-18 00:00:00	3
64	Using HTML landmark roles to improve accessibility	Learn what HTML landmark roles are, how they improve accessibility, and how you can include them on your website effectively.	https://developer.mozilla.org/en-US/blog/aria-accessibility-html-landmark-roles/	2023-05-15 00:00:00	3
65	Introducing Baseline: a unified view of stable web features	MDN leads the way in implementing WebDX community group's efforts, delivering a clear and simple baseline for the web platform to developers.	https://developer.mozilla.org/en-US/blog/baseline-unified-view-stable-web-features/	2023-05-10 00:00:00	3
66	How :not() chains multiple selectors	Learn how the CSS `:not()` pseudo-class behaves when multiple selectors are passed as argument.	https://developer.mozilla.org/en-US/blog/css-not-pseudo-multiple-selectors/	2023-05-05 00:00:00	3
67	New functions, gradients, and hues in CSS colors (Level 4)	Learn what's new in CSS Colors Module Level 4, including color spaces, color functions, fancy gradients, and support for wide-gamut displays.	https://developer.mozilla.org/en-US/blog/css-color-module-level-4/	2023-05-03 00:00:00	3
68	Welcome to the MDN blog	The MDN blog publishes web development news, tutorials, and insights as an extension of MDN Web Docs, helping you discover, learn, and create for the web.	https://developer.mozilla.org/en-US/blog/welcome-to-the-MDN-blog/	2023-05-03 00:00:00	3
69	Rewriting Strangler Fig	Two decades ago, I posted that I found that the strangler fig plant was an interesting metaphor for the gradual replacement of a legacy system. I didn’t refer to the metaphor since, but meanwhile it grew a life of its own. Other people increasingly...	https://martinfowler.com/articles/2024-strangler-fig-rewrite.html	2024-08-22 15:51:00	4
70	Onboarding to a "legacy" codebase with the help of AI	Much of the attention to generative AI in software development is       about generating code. But it may have a more useful role in helping us       understand existing code. This is especially true for older codebases       that are getting...	https://martinfowler.com/articles/exploring-gen-ai.html	2024-08-15 14:32:00	4
71	Refresh of the PoEAA catalog page	From time to time I take a look at my site analytics to see how much traffic various bits of this site get. When doing this I saw that I continue to get a lot of traffic to the Catalog of Patterns of Enterprise Application Architecture. I put this...	https://martinfowler.com/articles/2024-eaa-catalog-refresh.html	2024-07-31 20:11:00	4
72	Testing server calls in generated HTML	Matteo Vaccari completes his article on testing          template-generated HTML, by looking at how to use TDD with pages that make          calls to the server. more…	https://martinfowler.com/articles/tdd-html-templates.html	2024-06-05 13:00:00	4
75	Prefetching in Single-Page Applications	Juntao Qiu's completes his set of data fetching      patterns for single-page applications. Prefetching involves fetching data      before it's called for in the application flow. Although this can mean      data is fetched unnecessarily, it...	https://martinfowler.com/articles/data-fetch-spa.html	2024-05-29 14:24:00	4
77	A short note on how I use and render footnotes	Last week I added a small feature to this website, changing the way it        renders footnotes. That prompted me to write this quick note about how I        use footnotes, and how that influences the best way to render them. more…	https://martinfowler.com/articles/2024-footnote-rendering.html	2024-05-22 18:17:00	4
83	photostream 131		https://martinfowler.com/photos/131.html	2024-05-12 21:39:00	4
84	photostream 130		https://martinfowler.com/photos/130.html	2024-04-21 22:21:00	4
85	Using data replication in legacy displacement	Alessio Ferri and Tom Coggrave       complete their article about introducing seams into mainframe systems by       looking how we can use data replication. Done well, it can provide a       rapid start to a displacement effort, but we must be...	https://martinfowler.com/articles/uncovering-mainframe-seams.html	2024-04-10 15:00:00	4
88	Joining LinkedIn	As the enmuskification of Twitter continues, I’ve increasingly heard that more people are using LinkedIn to keep up with new professional material. So, a couple of weeks ago, I set up my LinkedIn account, so people can follow me on that...	https://martinfowler.com/articles/2024-joining-linkedin.html	2024-03-28 16:26:00	4
89	Farewell, John Kordyback	John Kordyback, a treasured colleague and friend, died last week, aged 64. more…	https://martinfowler.com/articles/kordyback-tribute.html	2024-03-27 16:48:00	4
92	How to capture qualitative metrics	Abi Noda and Tim Cochran complete        their article on qualitative metrics by outlining how to capture them        effectively. They discuss the mental steps that people go through as        they respond to a survey and provide a template to...	https://martinfowler.com/articles/measuring-developer-productivity-humans.html	2024-03-19 13:33:00	4
93	Code samples for the opening chapter of Refactoring	From time to time people ask me for a copy of the code I used in the       opening chapter of Refactoring, so       they can follow along themselves. I had Reasons for not providing this code,       specifically laziness. Fortunately Emily Bache...	https://martinfowler.com/articles/2024-refactoring-code-samples.html	2024-03-15 15:04:00	4
96	What if we rotate pairs every day?	When pair programming, it's important to rotate the pairs frequently,       but many organizations that do pair programming are reluctant to do that.       Gabriel Robaina and Kieran Murphy ask       the question: “What if we rotate pairs every...	https://martinfowler.com/articles/rotate-pairs-experiment.html	2024-03-06 15:33:00	4
97	Patterns of Legacy Displacement: Event Interception	When we gradually replace a legacy system, we have plenty of cases       where the legacy system and its replacement need to interact. Since these       legacy systems are often difficult, and costly, to change, we need a       mechanism that...	https://martinfowler.com/articles/patterns-legacy-displacement/event-interception.html	2024-03-05 15:03:00	4
98	Bliki: Periodic Face-to-Face	Improvements in communications technology have led an increasing number of  teams that work in a Remote-First  style, a trend that was boosted by the forced isolation of Covid-19 pandemic.  But a team that operates remotely still benefits from...	https://martinfowler.com/bliki/PeriodicFaceToFace.html	2024-02-27 14:17:00	4
99	Online Assets Workshop Report	Remote Asset Libraries design and improvements on assets organization.	https://code.blender.org/2024/08/online-assets-workshop/	2024-08-06 09:41:21	9
100	EEVEE Next Generation in Blender 4.2 LTS	The next major iteration on the Blender viewport system is available in Blender. 4.2 LTS.	https://code.blender.org/2024/07/eevee-next-generation-in-blender-4-2-lts/	2024-07-11 17:42:36	9
101	Brush Assets is out!	Brush Assets is merged into Blender and ready for the upcoming 4.3 release.	https://code.blender.org/2024/07/brush-assets-is-out/	2024-07-08 18:26:26	9
102	Blender 4.2 LTS Beta	Public call for testing Blender 4.2 LTS Beta. Let's make it a rock solid release!	https://code.blender.org/2024/06/blender-4-2-lts-beta/	2024-06-28 16:31:46	9
103	Geometry Nodes Workshop: May 2024	In May 2024, various Geometry Nodes contributors came together in Amsterdam to discuss design topics and upcoming projects in that area.	https://code.blender.org/2024/05/geometry-nodes-workshop-may-2024/	2024-05-23 11:15:06	9
104	Extensions Platform Beta Release	Today the extensions platform becomes generally available in the development version of Blender.	https://code.blender.org/2024/05/extensions-platform-beta-release/	2024-05-15 17:53:11	9
105	Animation 2025: Progress & Planning	The Animation & Rigging module presents the progress and future plans for Animation 2025.	https://code.blender.org/2024/02/animation-2025-progress-planning/	2024-02-15 16:24:13	9
106	A New Developer Documentation Platform	A new platform to foster a shift in developer documentation culture.	https://code.blender.org/2023/12/a-new-developer-documentation-platform/	2023-12-13 16:04:21	9
107	Grease Pencil: Task Force	This is a call to the Blender community to help out and get Grease Pencil 3 out of experimental!	https://code.blender.org/2023/11/grease-pencil-task-force/	2023-11-17 14:51:07	9
108	Geometry Nodes Workshop: November 2023	Exploring many design topics for the future of geometry nodes.	https://code.blender.org/2023/11/geometry-nodes-workshop-november-2023/	2023-11-11 21:17:44	9
109	How to make the best possible translation of a book?	You know that frustration of reading a book that should have been an article? Me too. So I try to do the opposite — to write so succinctly that you wish I would have said a little more. You complete it with your own thoughts. That’s why I edit the...	https://sive.rs/bpt	2024-08-14 00:00:00	1
110	How and why to make a /now page on your site	Background I used to wonder what my friend Benny Lewis was doing. He has a website and social media accounts, but neither gave an overview of what he’s doing now. Then I realized some people might wonder the same about me. So in 2015, I made a...	https://sive.rs/now2	2024-05-18 00:00:00	1
111	the best book ever written	I’ve asked my favorite musicians if, when they’re done writing a new song, they feel it’s the best song ever. All of them said yes. I’ve asked my favorite authors if, when they’re done writing a new book, they feel it was the best book ever. All...	https://sive.rs/htl00	2024-04-12 00:00:00	1
112	Ben Kihnel	I just got the call from the super-connected Alex Steininger that our mutual friend Ben Kihnel died in his sleep. He was only 48. Ben was employee #2 of CD Baby. (#1 was the great John Steup.) John hired Ben the day we moved the company to...	https://sive.rs/ben-kihnel	2024-03-28 00:00:00	1
113	It shows what you need to believe	In Harry Potter, there’s a magic mirror that reflects the viewer’s desire. What Harry sees in that mirror is very different than what Dumbledore or Ron sees, because their desires are all different. Imagine if there was something similar that...	https://sive.rs/n2b	2024-03-12 00:00:00	1
114	AI gives the news you need	UPDATE: My metaphor was too distracting, so this post has been replaced. Please click here to read the new post instead. Both have the same intention but that one says it with less distraction. Your personal AI knows you inside-out. It’s...	https://sive.rs/ainews	2024-03-11 00:00:00	1
115	How to learn JavaScript	Since I mentioned that I learned JavaScript, people have asked me how and what I recommend. So here’s my experience and best advice for 2024. Learn plain JavaScript First, it’s important to learn plain JavaScript. Don’t depend on a library of...	https://sive.rs/learn-js	2024-03-08 00:00:00	1
116	How I backup	Some people have asked, so here is how I do my backups. It takes me about ten seconds per day and five minutes per month to maintain. It works well for me, but I’m always open to suggestions. Just email me with any ideas or questions. every-day...	https://sive.rs/backup	2024-02-27 00:00:00	1
117	Esperanto, Toki Pona, Swahili, Indonesian	This is a lukewarm little story with a few connected bits, but it might be interesting or even helpful. Follow the links in it, for full effect. Esperanto start For decades, I’ve wanted the experience of carrying on a conversation in another...	https://sive.rs/esperanto	2024-02-26 00:00:00	1
118	walk and talk	Kevin Kelly invited me to walk 100 kilometers (62 miles) through northern Thailand for seven days, ending in Chiang Mai. Walking with us were ten other smart interesting people, including five other authors whose work I’ve loved for years. It’s a...	https://sive.rs/wt	2023-12-12 00:00:00	1
119	The past is not true	When I was 17, I was driving recklessly and crashed into an oncoming car. I found out that I broke the other driver’s spine, and she’ll never walk again. I carried that burden with me everywhere, and felt so horrible about it for so many years...	https://sive.rs/pnt	2023-07-20 00:00:00	1
120	dashing dog, searching for purpose	People search for their passion or purpose. But “purpose” and “passion” are words we use when we’re not working. When we’re actually engaged in the flow of fascinating work, we don’t think in these terms. The task at hand fills our mind. The task...	https://sive.rs/pdog	2023-06-30 00:00:00	1
121	$575K of books sold. $575K to save lives.	I sell my books directly through my website, sivers.com, for a few important reasons. Direct communication with the readers. Considerate pricing. Including all digital formats (MP3, EPUB, PDF, HTML, etc) with every sale. Giving all profits to...	https://sive.rs/575k	2023-05-18 00:00:00	1
122	The joy and freedom of harmlessly upsetting social norms	My band was playing a gig in Oslo, Norway, when I struck up a conversation with a woman who was staring at me. Turns out we had read many of the same books, and we were super-attracted to each other. We talked all night, but just as things got...	https://sive.rs/nor	2023-04-21 00:00:00	1
123	Why I let go of my U.S. citizenship	I forbid myself from anything too tempting or addicting. I keep no cookies in my home. To prevent myself from falling off the wagon, I strap myself to the mast. I was born in California, and lived the first forty years of my life in America. But I...	https://sive.rs/xus	2023-04-20 00:00:00	1
124	the Michael Browne suits	In 2020, I was about to move to New York City. I wanted to get to know all of its ethnic enclaves, like visiting the whole world in one city. But I know I have a tendency to stay at home, immersed in my work. So I made a rule for myself. If I move...	https://sive.rs/suits	2023-04-15 00:00:00	1
125	Curve into the target	I’m pretty bad at bowling and frisbee. I roll the ball or throw the disc straight at the target, but away it curves. After this happens a couple times, I adjust. I stop aiming straight, since that’s not working. If it always curves to the left,...	https://sive.rs/aim	2023-03-09 00:00:00	1
126	Thinking something nice about someone? Tell them.	When you think something nice about someone, you should tell them. People don’t hear enough compliments. Even well-known people. We assume they must hear it too much. But famous people often say the thanks from the public is the best part of...	https://sive.rs/nice	2023-03-07 00:00:00	1
127	50 conversations in Bangalore and Chennai	UPDATE: I moved the conversations to sive.rs/met. February 13 through 21, 2023, I went to Chennai and Bengaluru, India. My sole purpose was to meet new friends. I’m an “Overseas Citizen of India” and my son is half-Indian (Tamil). I will always...	https://sive.rs/meet-chbg	2023-03-02 00:00:00	1
128	Explorers are bad leaders	Explorers poke through the unknown, experimenting, trying many little dead-ends. Explorers meander, constantly changing directions based on hunch, mood, and curiosity. Explorers are hard to follow. It’s better to let them wander alone, then...	https://sive.rs/exled	2023-02-09 00:00:00	1
129	Travelling just for the people	When I was 21, I moved to New York City. An old friend travelled many hours and came to stay with me for a couple days. It was his first time in New York. I said, “Do you want to see the Statue of Liberty?  Empire State Building?  Central Park? ...	https://sive.rs/travp	2023-02-06 00:00:00	1
130	Want anonymity? Make a persona not a mystery.	Because of my open inbox, I meet a lot of strangers. I love it. Almost everyone tells me who and where they are in the world. If they don’t, I wonder. Am I talking with someone from Australia? Philippines? Brazil? Are they 20 or 60? Male or...	https://sive.rs/anon	2023-02-02 00:00:00	1
131	I want to lose every debate.	My favorite moments in life are when someone shows me a new perspective — a way of thinking I had never considered. Ideally it’s something I opposed, but they help me understand why it works for them. The sex worker explains why she loves her...	https://sive.rs/led	2023-01-31 00:00:00	1
132	Conversations with Tyler Cowen	Tyler Cowen is my favorite interviewer of all-time. His interviewing style has spoiled me for all others. He creates a tasting feast for the mind. First he finds brilliant accomplished people that he wants to learn from — people that are not too...	https://sive.rs/tyler	2023-01-29 00:00:00	1
133	Reading the Bible start to finish	I like going to the source. Like finding musicians’ influences, and getting to know that music too. Same with film, art, philosophy, and technology. I also like doing what people I admire recommend. And a few people I really admire suggest we read...	https://sive.rs/bible	2023-01-27 00:00:00	1
134	Make believe	Kids scream, “Monster in the hallway!”, and hide behind the couch. They stack up cushions for protection, and plan their defense. They know it’s not true — there’s not really a monster in the hallway — but it’s exciting to feel the adrenaline of...	https://sive.rs/mb	2022-10-30 00:00:00	1
135	Daily run, part two	In my previous post, “a daily run” — (please read it first) — running was a metaphor for whatever actions you take in your life. The story is about how we choose beliefs because they’re useful, not true. Beliefs make emotions. Emotions make...	https://sive.rs/run2	2022-10-28 00:00:00	1
136	Static HTML comments	If you have a static HTML website, but you want to include comments, here’s an interesting way to do it using PostgreSQL’s NOTIFY and LISTEN. The big idea is to write the comments as static HTML, only when comments change, instead of doing a...	https://sive.rs/shc	2022-10-08 00:00:00	1
137	Daily run, part one	Every day you go on a long run through the forest. You picture a pot of gold at the end. It helps you finish when you feel like quitting. One day you pretend there’s a tiger right behind you. It makes you much faster, so you keep using this...	https://sive.rs/run	2022-09-28 00:00:00	1
138	Your explanations are not true	We all confabulate without realizing it. To confabulate is to create an explanation that you believe to be true. “Con” means together, and “fabula” means story or fable, so: to put together a story. Confabulate. To fabricate. When you don’t know...	https://sive.rs/confab	2022-09-20 00:00:00	1
139	Shortest date, and ketchup	Here’s a story about my shortest date, and ketchup. I was dating in New York City, and matched with someone named Kelly. We agreed to meet, so I called her to decide where. She had a miserable voice, creaky and weary, but I tried not to judge. I...	https://sive.rs/ketchup	2022-09-12 00:00:00	1
140	full-length videobook for “Your Music and People”	Today I’m releasing something I’ve been working on since 2019. It’s a full-length animation for my book “YOUR MUSIC AND PEOPLE”. 2½ hours long, it contains the entire audiobook, animated throughout. Hand-drawn by the great Patrick Smith over the...	https://sive.rs/ymap	2022-09-08 00:00:00	1
141	Anything You Want — third edition for 2022	In 2011, I got a phone call from a number I didn’t recognize. “Hello?” “Derek. It’s Seth Godin.” “Wow! Hi Seth!” “I’m starting a new publishing company, so I want you to write a book.  Short, like a manifesto.  Will you do it?” “Uh,...	https://sive.rs/a3	2022-08-25 00:00:00	1
142	Scuba, panic, empathy	I used to scoff at those people who had panic attacks. “The cake is late! Oh no! I’m freaking out! I can’t breathe!” Ridiculous. Hysterical. Over-reacting. I was learning scuba diving, and went on my first practice dive. While I was 15 meters...	https://sive.rs/dive	2022-07-26 00:00:00	1
143	Writing one sentence per line	My advice to anyone who writes: Try writing one sentence per line. I’ve been doing it for twenty years, and it improved my writing more than anything else. New sentence? Hit [Enter]. New line. Not publishing one sentence per line, no. Write like...	https://sive.rs/1s	2022-06-20 00:00:00	1
144	The joke that changed my life	Growing up in America, I didn’t know much about other cultures. When I was 25, my band got some gigs in Europe — my first time there. It was 1995. The European Union was new. I heard a street performer in Copenhagen tell this joke: “The EU will...	https://sive.rs/joke	2022-06-19 00:00:00	1
145	Find a good available .com domain	If you need a new domain name, and you want a .com, and you don’t want to type random ideas into a registrar search, here’s a way to do it. Download the list of all registered .com domains First, apply for access to the zone file, using ICANN’s...	https://sive.rs/com	2022-06-08 00:00:00	1
146	Travel is best with young children	“Once you have a baby, you can’t travel.” I’ve heard this so many times, although only from people who haven’t done it. But I took my baby to nine countries before he was one year old. Then another ten countries by the time he was eight. So I can...	https://sive.rs/tk	2022-05-09 00:00:00	1
147	Short URLs: why and how	If you make your own website, consider making short URLs. This is not about a URL shortener. This is about making your original URLs short in the first place. Instead of: yoursite.com/blog/2022/05/08/short-urls-why-and-how.html … consider...	https://sive.rs/su	2022-05-08 00:00:00	1
148	Ancestors, Luck, and Descendants	My Sivers ancestors came from Grantham, Lincolnshire, England on a boat to America in 1849. The boat crashed on rocks in the Irish sea, caught fire in the Atlantic Ocean, got pushed off course repeatedly by storms, and finally landed in New Orleans...	https://sive.rs/ald	2022-03-24 00:00:00	1
149	Why I left America	I was living on the beach in Santa Monica, California, and life was perfect. I was in paradise, and deeply happy. Friends wanted to travel, but I had no interest. I had already lived a few years each in New York City, Boston, Chicago, Portland,...	https://sive.rs/left	2022-03-09 00:00:00	1
150	Write plain text files	I write almost everything important in my life: thoughts, plans, notes, diaries, correspondence, code, articles, and entire books. They are my extended memory — my noted self — my organized thoughts. I refer to them often. I search them, update...	https://sive.rs/plaintext	2022-03-02 00:00:00	1
151	Generate unique random values directly in the database	You often need to generate random strings, like for login cookies and unique entry codes. These strings always need to be stored in the database. So make your life simpler by generating the random strings directly in the database. Here's a very...	https://sive.rs/rand1	2022-03-01 00:00:00	1
152	Database triggers to clean text inputs	Even smart people can accidently put bad data into a database. We copy text from a web page, then paste it into a form, not realizing it also copied a space, tab, or newline character. Then your system thinks someone’s name is not “Jim” but “...	https://sive.rs/clean1	2022-03-01 00:00:00	1
153	Database functions to wrap logic and SQL queries	When you make a database-backed app, you have some functions that need to run multiple database queries. For example, to move money from one account to another, you have to insert a negative amount into account #1, and a positive amount into...	https://sive.rs/api01	2022-02-28 00:00:00	1
154	Database trigger recalculates totals, for data integrity	When you make a database-backed app, you write code to ensure data integrity in related fields. If an item is sold, you update the inventory. If someone withdraws money, you update their balance. You recalcuate the total and update the related...	https://sive.rs/recalc	2022-02-27 00:00:00	1
155	About my book notes	At sive.rs/book I have a collection of my notes from the 320+ books I’ve read since 2007. This page is just to answer some questions about it. My notes are not a summary of the book! When I’m reading and come across a surprising or inspiring...	https://sive.rs/bfaq	2022-01-26 00:00:00	1
156	How to Live: conclusion	Is this a duck or bunny? No. This is a duck and bunny. This is an orchestra. You are the composer and conductor.	https://sive.rs/htl28	2021-12-28 00:00:00	1
157	Here’s how to live: Balance everything.	All bad things in life come from extremes. Too much of this. Too little of that. When we lack balance, we’re upset. Over-worked, under-loved, over-eating, under-sleeping. Focused on wealth, but ignoring health. Focused on the present, but...	https://sive.rs/htl27	2021-12-27 00:00:00	1
158	Here’s how to live: Make change.	Change the world as much as you can. All your learning and thinking is wasted if you don’t take action. People try to explain the world, but the real point is to change the world. If you go through life without changing anything, what have you...	https://sive.rs/htl26	2021-12-26 00:00:00	1
159	Here’s how to live: Make a million mistakes.	You learn best from your mistakes. This is true. So you should deliberately make as many mistakes as possible. Try absolutely everything, all the time, expecting everything to fail. Just make sure that you capture the lessons from each...	https://sive.rs/htl25	2021-12-25 00:00:00	1
160	Here’s how to live: Don’t die.	There’s only one law of nature: if you survive, you win. Be paranoid. Avoid failure to survive. For something to succeed, everything needs to go right. For something to fail, only one thing needs to go wrong. Don’t try to be more right. Just...	https://sive.rs/htl24	2021-12-24 00:00:00	1
161	Here’s how to live: Create.	The most valuable real estate in the world is the graveyard. There lie millions of half-written books, ideas never launched, and talents never developed. Most people die with everything still inside of them. The way to live is to create. Die...	https://sive.rs/htl23	2021-12-23 00:00:00	1
162	Here’s how to live: Love.	Not love, the feeling, but love the active verb. It’s not something that happens to you. It’s something you do. You choose to love something or someone. You can love anything or anyone you decide to love. Love is a combination of attention,...	https://sive.rs/htl22	2021-12-22 00:00:00	1
163	Here’s how to live: Reinvent yourself regularly.	People say everything is connected. They’re wrong. Everything is disconnected. There is no line between moments in time. Something happened. Something else happened. People love stories, so they connect two events, calling them cause and...	https://sive.rs/htl21	2021-12-21 00:00:00	1
164	Here’s how to live: Get rich.	Suspend judgment. Making money isn’t evil, greedy, shallow, or vain. Money isn’t your worth as a human being, or a substitute for love. But don’t pretend it doesn’t matter. Money can represent freedom, safety, experience, generosity,...	https://sive.rs/htl20	2021-12-20 00:00:00	1
165	Here’s how to live: for others.	Focusing on yourself seems smarter and easier, but it’s short-sighted. It’s ignoring the huge benefit of cooperation. Compare survival strategies. You could prepare for disaster by stocking food and ammunition in a bunker by yourself. But what...	https://sive.rs/htl19	2021-12-19 00:00:00	1
166	Here’s how to live: Prepare for the worst.	Things are going to get harder. The future will test your strength. So far, you’ve lived in a time of prosperity. You haven’t experienced massive devastation, but you probably will. It’ll be harder to make money. It’ll be harder to be...	https://sive.rs/htl18	2021-12-18 00:00:00	1
167	Here’s how to live: Laugh at life.	A gorilla, speaking with sign language, makes a joke. We’re amazed. She’s showing the fullest expression of a soul. But when a person is humorless, it’s the opposite. They’ve lost the point of life. A recovering hospital patient makes a...	https://sive.rs/htl17	2021-12-17 00:00:00	1
168	Here’s how to live: Follow the great book.	You know what your great book is. Whether the Bible, Tanakh, Upanishads, Quran, Think and Grow Rich, Seven Habits of Highly Effective People, or another, follow it diligently. Your book is wiser than you. It’s describing natural law — the way...	https://sive.rs/htl16	2021-12-16 00:00:00	1
169	Here’s how to live: Learn.	Learning is underrated. People wonder why they’re not living their ideal life. Maybe they never learned how. You get healthy by learning healthy habits. You get wealthy by learning valuable skills. You build a great interpersonal life by...	https://sive.rs/htl15	2021-12-15 00:00:00	1
170	Here’s how to live: Value only what has endured.	The longer something lasts, the longer it will probably last. Something that’s been around for a year will probably be around for another year. Something that’s been around for fifty years will probably be around for another fifty years. Only...	https://sive.rs/htl14	2021-12-14 00:00:00	1
171	Here’s how to live: Chase the future.	Live in the world of tomorrow. Surround yourself only with what’s brand new and upcoming. That’s where life is made. It’s the most optimistic environment, full of hope and promises. It’s the smartest way to live. You’re moving forward in time,...	https://sive.rs/htl13	2021-12-13 00:00:00	1
172	Here’s how to live: Be a famous pioneer.	Nobody had ever run a mile in under four minutes. It seemed impossible. But one day, Roger Bannister did it, and the news spread worldwide. Over the next two years, thirty-seven people also did it. This is the power of the pioneer: To enable...	https://sive.rs/htl12	2021-12-12 00:00:00	1
173	Here’s how to live: Do whatever you want now.	The past? That’s what we call our memories. The future? That’s what we call our imagination. Neither exists outside of your mind. The only real time is this moment. So live accordingly. Whatever benefits you right now is the right...	https://sive.rs/htl11	2021-12-11 00:00:00	1
174	Here’s how to live: Pursue pain.	Everything good comes from some kind of pain. Muscle fatigue makes you healthy and strong. The pain of practice leads to mastery. Difficult conversations save your relationships. But if you avoid pain, you avoid improvement. Avoid...	https://sive.rs/htl10	2021-12-10 00:00:00	1
175	Here’s how to live: Let randomness rule.	We think we see patterns and causes. Really there are none. We think events are meaningful. Really they’re just coincidence. We’re not used to the logic of probability. Life is more random than it seems. Identical twins were separated at...	https://sive.rs/htl09	2021-12-09 00:00:00	1
176	Here’s how to live: Master something.	Be a monomaniac on a mission to be truly great at something difficult. Pick one thing and spend the rest of your life getting deeper into it. Mastery is the best goal because the rich can’t buy it, the impatient can’t rush it, the privileged...	https://sive.rs/htl08	2021-12-08 00:00:00	1
177	Here’s how to live: Make memories.	You recently had a day, or even a month, that you can’t remember. If I asked what you did then, you couldn’t say. There was nothing unusual about it. What if you have many more of those? What if, when you’re older, you can’t recall entire...	https://sive.rs/htl07	2021-12-07 00:00:00	1
178	Here’s how to live: Intertwine with the world.	We’re all cousins. Everybody on Earth, no matter how far apart, has a surprisingly recent common ancestor. Go meet your family in the Middle East, in Asia, in Africa, in the Americas, and in Europe. Understand that there is no “them”. It’s just...	https://sive.rs/htl06	2021-12-06 00:00:00	1
179	Here’s how to live: Think super-long-term.	In 1790, Benjamin Franklin gifted £2000 to the cities of Philadelphia and Boston by putting it into a 200-year trust, and by 1990 it was worth over $7 million. If you put $2000 into the stock market for 200 years at the average 8% return, it will...	https://sive.rs/htl05	2021-12-05 00:00:00	1
180	Here’s how to live: Do nothing.	The ten commandments said what not to do. Most of being a good person is not doing bad. Don’t be cruel or selfish. Don’t lie or steal. Just do no harm. People always think they need to do something. One action creates a problem, fixed by...	https://sive.rs/htl04	2021-12-04 00:00:00	1
181	Here’s how to live: Fill your senses.	See it all. Touch it all. Hear it all. Taste it all. Do it all. Appreciate this wonderful physical world. If you knew you’d go blind tomorrow, how intensely would you look at the world today? If you knew you’d go deaf tomorrow, how intensely...	https://sive.rs/htl03	2021-12-03 00:00:00	1
182	Here’s how to live: Commit.	If you’ve ever been confused or distracted, with too many options… If you don’t finish what you start… If you’re not with a person you love… … then you’ve felt the problem. The problem is a lack of commitment. You’ve been looking for the best...	https://sive.rs/htl02	2021-12-02 00:00:00	1
183	Here’s how to live: Be independent.	All misery comes from dependency. If you weren’t dependent on income, people, or technology, you would be truly free. The only way to be deeply happy is to break all dependencies. Most problems are interpersonal. To be part of society is to...	https://sive.rs/htl01	2021-12-01 00:00:00	1
184	Considerate book pricing	I love having my own store so I can make things the way I think they should be. For example, I disagree with the usual pricing of books. If I buy a book in one format, it doesn’t seem fair to pay full price to get it in another format. That would...	https://sive.rs/bp	2021-10-27 00:00:00	1
185	How many pets do you have?	I used to have too many pets. Each time I adopted one, I was fully in love. I was enamored with the potential. Each new pet was meant to be my constant companion. So I would take it home, and love it. But eventually I would discover a new pet, and...	https://sive.rs/pets	2021-08-13 00:00:00	1
186	$250K books sold. $250K to save lives.	2023 UPDATE: see “$575K of books sold. $575K to save lives.” Six weeks ago I emailed my private email list with a secret link to buy my new books. They’re not even officially released yet, but they’ve already sold over $250,000. I made 5000...	https://sive.rs/250k	2020-08-06 00:00:00	1
187	Time is personal. Your year changes when your life changes.	A new day begins when I wake up, not at midnight. Midnight means nothing to me. It’s not a turning point. Nothing changes at that moment. A new year begins when there’s a memorable change in my life. Not January 1st. Nothing changes on January...	https://sive.rs/mny	2019-12-30 00:00:00	1
188	Experiments in music and life	One approach to music is to do whatever you want. Absolutely anything goes. But to me, that’s too free. It’s anti-inspiring because having infinite options is overwhelming. Another approach to music is to follow tradition. You stay within the...	https://sive.rs/eml	2019-11-07 00:00:00	1
189	Writing daily, but posting when ready	I just finished an experiment. Last month, I published a new article to my blog every day. I’m glad I tried it, but ultimately I didn’t like it. Here’s why: It made my writing worse, not better. I was trying to force a conclusion quicker. I was...	https://sive.rs/nod	2019-11-01 00:00:00	1
190	How I got rich on the other hand	I don’t usually talk about money, but a friend asked me what it was like to get rich, and he wanted to know specifics, so I told him my story. I had a day job in midtown Manhattan paying $20K per year — about minimum wage. On weekends I would earn...	https://sive.rs/richand	2019-10-30 00:00:00	1
191	Podcast published today	Starting today you can follow my podcast at sive.rs/podcast.rss or listen on the web at sive.rs/podcast. Each episode is around two minutes long. They are my posts since September 22nd. 33 episodes so far. I generated the RSS XML feed myself...	https://sive.rs/pinit2	2019-10-29 00:00:00	1
192	When in doubt, try the difference	If you’re in doubt about something that’s not in your life, try it. Things are so different in practice versus in theory. The only way to know is to experience it yourself. Try it examples: Pursuing a new interest? Moving somewhere very...	https://sive.rs/trd	2019-10-28 00:00:00	1
193	Why experts are annoying	When someone becomes an expert at something, you know what else they become? Annoying. At a restaurant, your designer friend complains about the font on the menu, your musician friend complains about the background music, and your manager friend...	https://sive.rs/exan	2019-10-27 00:00:00	1
194	What you learn by travelling	I wanted to learn about the world, so I went travelling. People in the east are so graceful, I felt like an inconsiderate pig. People up north are so serious, I felt like a lightweight clown. People down south are so laid-back, I had to escape...	https://sive.rs/trav1	2019-10-26 00:00:00	1
195	PostgreSQL example of self-contained stored procedures	First, see my previous article about PostgreSQL functions at sive.rs/pg. That article gave tiny examples, but no finished working code. This week, I wrote a shopping cart to sell my books directly from my own site. So I took a couple extra hours...	https://sive.rs/pg2	2019-10-25 00:00:00	1
196	Mastery school	Here’s an idea: Create a little school somewhere remote. School of what? School of mastery. A place for anyone who wants go focus on a skill of their choice, surrounded by other people doing the same, and a few coaches — experts on the craft of...	https://sive.rs/masch	2019-10-24 00:00:00	1
197	Monthly self-expansion project	Here’s an idea: Every month, pick something you hate or know nothing about, and get to know it well. Spend a few hours per week, for an entire month, just learning about that subject. Why? The idea is inspired by a very successful friend of mine...	https://sive.rs/exex	2019-10-23 00:00:00	1
198	Living according to your hierarchy of values	My “daily” blog was silent the last four days, because I took my kid on a spontaneous trip to another country. No phone. No computer. I gave him my full attention every day from when he woke me in the morning to when we fell asleep together at...	https://sive.rs/vls1	2019-10-22 00:00:00	1
199	How to ask your mentors for help	I have three mentors. When I’m stuck on a problem and need their help, I take the time to write a good description of my dilemma, before reaching out to them. I summarize the context, the problem, my options, and thoughts on each. I make it as...	https://sive.rs/ment	2019-10-17 00:00:00	1
200	When you win the game, you stop playing	Someone asked me today why I don’t charge money for the things I do. Why don’t I have ads on my site? Why don’t I exploit my assets and pursue some profitable things? I already did that. I made more than I’ll ever be able to spend. What do you...	https://sive.rs/wtg	2019-10-16 00:00:00	1
201	Digital pollution	You couldn’t just roll down the street leaving huge piles of garbage everywhere you go, making life slower for everyone as they climb over your mountains of junk, just to get on with their life. You’d feel bad about it, right? That’s how I feel...	https://sive.rs/polut	2019-10-15 00:00:00	1
202	Cut out everything that’s not surprising	This is my advice to anyone writing something for the public — especially a talk on stage. People listen to a talk, or read an article, because they want to learn something new. They want a little “oh wow” moment. “I never thought of it that way...	https://sive.rs/d22	2019-10-14 00:00:00	1
203	Heed your fears	People often ask me how they can get over their fears. For example, they are scared to quit their job and start a business. I think they want me to say something to make their fears go away. So my advice is pretty disappointing. We should pay...	https://sive.rs/gofear	2019-10-13 00:00:00	1
204	Daydreaming is my favorite pastime	Somewhere in our past, we were told it’s bad to daydream, because it meant doing nothing — staring out the window — instead of doing what we’re supposed to be doing. To admit we’re daydreaming felt like it needed an apology. But now I’ve finally...	https://sive.rs/daydream	2019-10-12 00:00:00	1
205	Anti-chameleon	I don’t know why I have this rebellious nature. I tend to want to be the opposite of my surroundings. At serious formal events, I can’t stop laughing inside. At crazy festivals, I want to hide and read a book. My ambitious friends bring out the...	https://sive.rs/antic	2019-10-11 00:00:00	1
206	Where we do and don’t want automation	I used to use Gmail. But one day, as I typed my mother’s email address into the “To:” field, Google popped up a prompt asking if I also wanted to CC my uncle. That was so invasive and creepy that I deleted the account immediately and never used it...	https://sive.rs/autom	2019-10-10 00:00:00	1
207	Human nature to focus on the one bad thing	Today my bus was delayed, and I was really annoyed. Also, I got a really nasty email, which put me in a worse mood. No, wait, I should give the full story. It takes two busses to get from the airport back to my house. The first bus leaves once...	https://sive.rs/negz	2019-10-09 00:00:00	1
208	Back and forth between super-hot and super-cold	The most relaxed feeling I know is after going back and forth between a super-hot pool and super-cold pool. Stay in the super-hot pool until you can’t stand it. Then go in a super-cold pool until you can’t stand it. Repeat that a few times, and...	https://sive.rs/sauna	2019-10-08 00:00:00	1
209	Err on the side of action, to test theories	I spend a lot time thinking of alternate ways to approach life. I re-consider my hierarchy of values. When values change, the plan of action needs to change, too. For example, if I decide that personal growth is top priority, then I plan a life...	https://sive.rs/erra	2019-10-07 00:00:00	1
210	Blowing off work to play	What do you call it when you skip school or work for a day, to do whatever you want instead? In America, we call it playing hooky. In England, we call it skiving. (Got another word for it?) Some of my best, most productive, and enjoyable days have...	https://sive.rs/hooky	2019-10-06 00:00:00	1
211	What happens when we ignore plans?	I took my 7-year-old to London today. I made two plans: if it rains, we go to a museum, if not, we go to the zoo. But when the train arrived in London, he said he didn’t really want to do either one. So we just walked with no plans. We...	https://sive.rs/ldn	2019-10-05 00:00:00	1
212	Tour -isms	Since I’m living in Europe now, I thought it would be good to tour everywhere in Europe, and get to know it better. I’m not into seeing the sights. I don’t take photos. What I want is to get to know the mindset, the world-view of each place. The...	https://sive.rs/isms	2019-10-04 00:00:00	1
213	Meta-considerate	My friend has a huge crush on someone. He showers her with attention and appreciation. He remembers her preferences, and constantly gives her thoughtful gifts. He thinks he’s being considerate, but he’s actually being...	https://sive.rs/metac	2019-10-03 00:00:00	1
214	Daydreaming the downside, for once	A few years ago, I thought it would be fun to get into camping. I live in New Zealand! How can I not? I daydreamed about it, picturing how much fun it could be. I read a book about it. I carefully picked out then bought some highly-recommended...	https://sive.rs/ddown	2019-10-02 00:00:00	1
215	Where to find the hours to make it happen	When you experience someone else’s genius work, a little part of you feels, “That’s what I could have, would have, and should have done!” Someone else did it. You didn’t. They fought the resistance. You gave in to distractions. They made it top...	https://sive.rs/uncomf	2019-10-01 00:00:00	1
216	Your heroes show which way you’re facing	People with many interests often ask my advice on which industry or career path they should follow. Years ago, I felt I was just a programmer and entrepreneur. Yes sometimes I write a tiny blog post sharing what I’ve learned, but that’s just...	https://sive.rs/hf	2019-09-30 00:00:00	1
217	Don’t quote. Make it yours and say it yourself.	Which sounds better to you? “In his best-selling book on behavioral science, Thinking, Fast and Slow, Nobel-prize winning psychologist Daniel Kahneman said, ‘Nothing in life is as important as you think it is when you are thinking about it.’.” …...	https://sive.rs/dq	2019-09-29 00:00:00	1
218	Have a private email account	I used to like the internet. I thought it was cool, creative, wild, untamed, expressive, decentralized, and educational. I guess it was, back then, but now? I kinda hate most of what’s out there. I don’t like social media, either. Staged photos,...	https://sive.rs/pe	2019-09-28 00:00:00	1
219	Future posthumous autobiography	I’ve started writing my autobiography. I’ll keep writing it for the rest of my life. It’s private now, but will be released the week I die. I’ve written the last chapter, which is more of an afterword. (“Now I’m dead.”) So now I will just keep...	https://sive.rs/abio	2019-09-27 00:00:00	1
220	Cross the world four times	Cross the world four times. First, in your teens or 20s, to take it all in. See it all, do it all, and learn. Get involved. Stay up all night talking with strangers, everywhere. Kiss and fall and promise to them all. Make lots of mistakes. Cross...	https://sive.rs/4	2019-09-27 00:00:00	1
221	What I did belies why	Imagine you host a dinner party with two doctors and two accountants. You introduce the doctors to each other and the accountants to each other, assuming they’d have the most in common. But actually one doctor got into it because her mother died...	https://sive.rs/ww	2019-09-26 00:00:00	1
222	Would you make your art if you were the last person on earth?	Musicians, photographers, writers, and artists of all sorts: Would you make your art if you were the last person on earth? For me, it’s an immediate YES — of course! In fact, it might make the experience even better. A musician friend asked me...	https://sive.rs/tp3	2019-09-25 00:00:00	1
223	Travel without social praise	I met a couple who were thinking of quitting their jobs and travelling the world for a year. They asked my thoughts. I suggested they should only do it if they don’t bring a camera, and don’t tell anyone but their family and few dear friends. No...	https://sive.rs/tp2	2019-09-24 00:00:00	1
224	Travel without a phone	The first time, it was an accident. I’d always wanted to go to Korea. I was so excited. I set out to explore and forgot my phone in the hotel. I walked around Seoul for twelve hours that day and experienced so many wonderful things. I remember...	https://sive.rs/tp1	2019-09-23 00:00:00	1
225	initialize	I’m starting a podcast today. Subscribe to https://sive.rs/podcast.rss.	https://sive.rs/pinit	2019-09-22 00:00:00	1
226	My old clothes don’t fit	I was uncomfortable, unhappy, and restless. I didn’t want to meet new people, because I felt I was giving the wrong impression. Something wasn’t right. It took me months to figure out the real problem: My clothes don’t fit anymore! Once I realized...	https://sive.rs/clothes	2019-07-31 00:00:00	1
227	Doors and windows and what’s real	Like everyone, I live in a little house with many doors and windows. One door goes out to my neighborhood. The local kids come to play with my dog. The elderly neighbors take so long to tell me their stories. I slow down my inner clock to...	https://sive.rs/dw	2019-07-01 00:00:00	1
228	I’ve moved from New Zealand to Oxford England	I rarely cry, but I cried a lot last month, leaving New Zealand. I’ve never loved and felt so connected to a place before. It wasn’t simple sadness that made me cry, but overflowing appreciation. I’d been feeling it for years, almost every day,...	https://sive.rs/ox1	2019-03-08 00:00:00	1
229	Benefits of a daily diary and topic journals	You know those people whose lives are transformed by meditation or yoga or something like that? For me, it’s writing in my diary and journals. It’s made all the difference in the world for my learning, reflecting, and peace of mind. After 20+...	https://sive.rs/dj	2019-01-28 00:00:00	1
230	Subtract	Life can be improved by adding, or by subtracting. The world pushes us to add, because that benefits them. But the secret is to focus on subtracting. Imagine a number line, with 0 on the left and 20 on the right. Say I want to be in the middle, at...	https://sive.rs/subtract	2018-12-05 00:00:00	1
231	The art of selfishness	David grew up in St. Louis, Missouri, USA, with five brothers and sisters. When he was 18, he got accepted to a very prestigious art school in Vienna. Vienna! This was his dream come true! He had wanted this so badly, but never thought he’d...	https://sive.rs/aos	2018-11-18 00:00:00	1
232	You don’t need confidence, just contribution.	Years ago, I was so confident and so naive. I was sure I was right and everyone else was wrong. After I sold my company, I felt ready to do something new, so I started to learn. But the more I learned, the more I realized how little I knew and how...	https://sive.rs/contrib	2018-08-06 00:00:00	1
233	Unlearning	Things I learned in the past are now wrong. Times have changed. Beliefs that were true are now false. They were based on old limitations that are now gone. Ways that used to work don’t work anymore. The old road collapsed. There’s a tunnel...	https://sive.rs/unlearning	2018-06-07 00:00:00	1
234	If you’re not feeling “hell yeah!” then say no	Most of us have lives filled with mediocrity. We said yes to things that we felt half-hearted about. So we’re too busy to react when opportunities come our way. We miss out on the great because we’re busy with the mediocre. The solution is to say...	https://sive.rs/hyn	2018-06-03 00:00:00	1
235	About this book	In my first book, Anything You Want, I told the story of how I started, grew, and sold my company. As part of selling the company, I signed a non-compete agreement that said I couldn’t do the one thing I’d been doing since I was twenty-seven years...	https://sive.rs/hy1	2018-06-01 00:00:00	1
236	OpenBSD : why and how	The only operating system I use on my computers is not Mac, not Windows, and not even Linux. It’s OpenBSD, and I love it so much. So I figured I should say a little something about why, and how you can try it. It’s probably not for you. It’s...	https://sive.rs/openbsd	2018-04-20 00:00:00	1
237	Moving for good	You are the way you are because of what you’ve experienced. Your country, family, town, random circumstances, and friends have shaped the way you think. If you had grown up on the other side of the world, you would have a different set of values...	https://sive.rs/mfg	2018-03-31 00:00:00	1
238	Why I’m not on Facebook	I tried Facebook for a few weeks in 2007, but I hadn’t really used it since then. I would log in once a month for a few minutes and click [ACCEPT] to all the friend requests from strangers, then log out. I hit the 5000 friend-limit, so I created a...	https://sive.rs/facebook	2018-03-21 00:00:00	1
239	Detailed dreams blind you to new means.	There’s a fable of a man stuck in a flood. Convinced that God is going to save him, he says no to a passing canoe, boat, and helicopter that offer to help. He dies, and in heaven asks God why He didn’t save him. God says, “I sent you a canoe, a...	https://sive.rs/details	2018-03-18 00:00:00	1
240	Include everyone in your success.	Everyone who is drawn to you before you’re famous is thinking the same thing: You might be famous soon! fans who want to help you professionals who want to meet you musicians who want to play with you companies that want to work with...	https://sive.rs/inclev	2018-03-07 00:00:00	1
241	My writing process	This is what I do for everything I post: Write all of my thoughts on a subject. Argue against those ideas. Explore different angles until I’m sick of it. Leave it for a few days or years, then repeat those steps. Hate how messy these thoughts...	https://sive.rs/7	2018-03-06 00:00:00	1
242	Keep in touch.	When I was promoting myself as a musician, I noticed an interesting pattern. If I had a good conversation with somebody in the music business, then quite often they would send an opportunity my way within a day or two. In other words, when I look...	https://sive.rs/kit	2018-03-05 00:00:00	1
243	Be an extreme character.	This is both fun and considerate. When people say that a movie has a great character, they mean it was someone especially shocking, funny, or honest. To be a great entertainer, you need to be larger than life. Push your outer boundaries. Show...	https://sive.rs/evers	2018-02-28 00:00:00	1
244	Get specific!	This is one of the most useful lessons I’ve learned in life. When you don’t know your next step… When you’re feeling unmotivated… When asking someone to help you… When you’re ready to make a dream come true… Get more specific about what’s...	https://sive.rs/get-specific	2018-02-25 00:00:00	1
245	What it means to be resourceful	I was at a musicians’ gathering in Memphis. I met a lot of people complaining that their various forms of online distribution weren’t earning them as much as they’d hoped. Then I met a musician who sold 8000 copies of his album himself. No...	https://sive.rs/res	2018-02-23 00:00:00	1
246	Rock stars have a boss?	I was 20 years old. I had just moved to New York City. And I was working inside the music industry. I ran the music library at Warner/Chappell. It was a huge room, near the executives’ offices, and I had it all to myself. Rock stars would come...	https://sive.rs/noboss	2018-02-18 00:00:00	1
247	Never wait.	One of the top music industry lawyers in Los Angeles was speaking at a conference. She’s an expert in copyright law, so someone asked her advice on a licensing problem. They had recorded their version of a famous song, but were unable to get the...	https://sive.rs/neverwait	2018-02-17 00:00:00	1
248	The higher the price, the more they value it.	Psychology experiments have shown that the more people pay for something, the more they value it. People given a placebo pill were twice as likely to have their pain disappear when they were told that the pill was expensive. People who paid more...	https://sive.rs/morepay	2018-02-16 00:00:00	1
249	Creative communication	The way you communicate with people is part of your art. For people who have never heard your music, it’s the start of your art! If you make depressing music, send your fans a dark black announcement that’s depressing just to look at. If you are...	https://sive.rs/reach	2018-02-15 00:00:00	1
250	Considerate communication	You get a big long email from someone and think, “Ooof. I’ll come back to that later.” (Then you never do.) Someone tries to contact you using a technology you hate, like a surprising incoming video call. You have a dilemma and need a good...	https://sive.rs/ccom	2018-02-15 00:00:00	1
251	Get personal.	Before I got into the music industry, I had an idea of what it would look like: Some powerful manager or agent calling me into his office to discuss the business of my music. Then I moved to New York City and became friends with cool people who...	https://sive.rs/gpers	2018-02-14 00:00:00	1
252	Pedestals prevent friendships.	I was a struggling musician, with big ambitions but not much success, when I went to a music industry conference in Las Vegas to promote my music. I was nervous, but doing everything I could to make connections with the managers at all the big...	https://sive.rs/pedestal	2018-02-13 00:00:00	1
253	Use the internet, not just companies.	I’ve been online since 1994, and seen so many companies come and go. In the year 2000, the place to be was mp3.com. Every musician would keep all of their music and fans there. A few years later, it was gone — shut down — all music and fan lists...	https://sive.rs/netskill	2018-02-12 00:00:00	1
254	Move to the big city.	I hate to admit this, but it’s true. One of the best things you can do for your career is to move to a big city — one of the major media centers — the places that broadcast to the entire world. Nothing less than New York, Los Angeles, London,...	https://sive.rs/city	2018-02-11 00:00:00	1
255	Why you need a database	A database is just an organized collection of information. You could have a database of your music or your books. But I’m going to talk about a database of all the people you know. Your email app is a kind of database. It has an address book of...	https://sive.rs/dbt	2018-02-09 00:00:00	1
256	Shed your money taboos.	Everyone has weird mental associations with money. They think the only way to make money is to take it away from others. They think that charging for your art means it was insincere, and only for profit. But after knowing thousands of musicians...	https://sive.rs/mn1	2018-02-05 00:00:00	1
257	Pricing philosophy	For years I made a living playing at universities. One time a college far away in Ohio — about a 12-hour drive — asked what I would charge to do a two-hour show. I said, “$1500”. She said, “Oh, that’s a bit too much. What would you charge to do...	https://sive.rs/pp	2018-01-23 00:00:00	1
258	Art doesn’t end at the edge of the canvas.	Imagine you see a caged feather on a museum wall. The sign underneath says the artist is a political activist in jail. Imagine that same caged feather again. But instead the sign says the artist is a high school kid in Florida. Or imagine that...	https://sive.rs/ext	2018-01-22 00:00:00	1
259	It’s hard to get off stage.	Being a songwriter is weird. You dig deep inside yourself. You extract and explain your emotions. Then you broadcast your innermost feelings to the biggest possible audience. It’s a life that demands a deep focus on yourself. It’s all you, you,...	https://sive.rs/stage	2018-01-16 00:00:00	1
434	Archinstall 2.8.3 Arch Linux Installer Adds COSMIC Desktop Option	Just one week after the Archinstall 2.8.2 update, another release of this command-line driven Arch Linux installer is now available for quick and easy Arch deployments...	https://www.phoronix.com/news/Arch-Linux-Archinstall-2.8.3	2024-08-25 10:05:40	7
260	“Marketing” just means being considerate.	Don’t confuse the word “marketing” with advertising, announcing, spamming, or giving away branded crap. Really, “marketing” just means being considerate. Marketing means making it easy for people to notice you, relate to you, remember you, and...	https://sive.rs/cons	2018-01-15 00:00:00	1
261	Repeatedly follow-up to show you care.	I knew a music publicist in New York City when she was at the peak of her success. A few of her clients had hits, so everyone wanted to work with her. She was flooded with new music. Here’s how she dealt with the flood: Whenever someone sent...	https://sive.rs/3in	2018-01-14 00:00:00	1
262	Unlikely places and untangled goals	I once went without food for ten days, and that was fine. But the two things I can’t do without for long are solitude and silence. (Freedom from people and their noises.) I was on a holiday in Ireland with seven members of my family, all packed...	https://sive.rs/unun	2017-12-11 00:00:00	1
263	What are the odds of that?	Three true stories: In 1992, in Tokyo, I dated a girl named Masako. After our month together, she moved to London. We lost touch. In 2008, I was in London for a few days. I wondered if Masako still lived there, sixteen years later. A minute...	https://sive.rs/odds	2017-07-03 00:00:00	1
264	Parenting : Who is it really for?	Since my son was born five years ago, I’ve spent at least thirty hours a week with him, just one-on-one, giving him my full attention. But I’ve never written about parenting before because it’s a touchy subject — too easily misunderstood. So why...	https://sive.rs/pa	2017-06-26 00:00:00	1
265	To hone your writing, hire a translator.	.ar, .de, .eo, .es, .fr, .ja, .ko, .pt, .ru, .zh, aside { display: none; } Deutsch English Español Esperanto Français Português Русский 中文 日本語 한국어 العربية حتى تتمكن من صقّل كتاباتك، قُم باستئجار مترجم. Um dein Schreiben zu verbessern,...	https://sive.rs/tra	2017-06-21 00:00:00	1
266	Ego is the Enemy	A friend asked why I don’t write more often. I told her it’s my minimalism, not wanting to put anything into the world unless necessary. And because of the size of my mailing list, I don’t want to bother people unless it’s really important. She...	https://sive.rs/ego	2017-06-16 00:00:00	1
267	Actions, not words, reveal our real values	I told my old coach that I really wanted to start my new company. He said, “No, you don’t.” I said, “Yes, I do! This is really important to me!” He said, “No, it’s not. Saying it doesn’t make it true.” I said, “You can’t ignore what I’m...	https://sive.rs/arv	2017-06-16 00:00:00	1
268	Think like a bronze medalist, not silver	Imagine the Olympics, where you have the three winners of a race standing on the podium: the gold, the silver, and the bronze. Imagine what it’s like to be the silver medalist. If you’d been just one second faster, you could have won the...	https://sive.rs/bronze	2017-03-13 00:00:00	1
269	Art is useless, and so am I	Art is useless by definition. If it was useful, it would be a tool. For the past twenty years, I was obsessed with being useful. That one measure drove all of my daily decisions: “How can I be the most useful to the most people today?” That...	https://sive.rs/useless	2017-03-10 00:00:00	1
270	Quitting something you love	Personal change needs some space to happen. To bring something new into your life, you need somewhere to put it. If your current habits are filling your day, where are these new habits supposed to go? The English word “quit” comes from old...	https://sive.rs/quit	2016-12-30 00:00:00	1
271	Solitary socialite	For the past ten years, I’ve answered up to two hundred emails per day. I sit alone in my little office for hours, engaging with everyone’s stories and questions for a few minutes each. Then when friends want to hang out with me, I say I need some...	https://sive.rs/soso	2016-12-27 00:00:00	1
272	Frequently Asked Questions	In the last ten years, I have answered over 200,000 emails from 86,000 people. It’s my part-time job — my community service. These are the most common questions. What should I do about my career? Read the book “So Good They Can’t Ignore...	https://sive.rs/faq	2016-12-22 00:00:00	1
273	How to do what you love and make good money	People with a well-paying job ask my advice because they want to quit to become full-time artists. But full-time artists ask my advice because they’re finding it impossible to make money. (Let’s define “art” as anything you do for expression,...	https://sive.rs/balance	2016-12-19 00:00:00	1
274	Tilting my mirror (motivation is delicate)	Motivation is delicate. When you notice your motivation fading, you have to seek out the subtle cause. A simple tweak can make all the difference between achieving something or not. An hour outside my city, there’s a little mountain range. The...	https://sive.rs/tilt	2016-12-05 00:00:00	1
275	Why are you doing?	It’s crucial to know why you’re doing what you’re doing. Most people don’t know. They just go with the flow. Social norms are powerful. The inputs that influence you are powerful. A great talk, book, or video can instantly change how you...	https://sive.rs/why	2016-09-05 00:00:00	1
276	I’m a very slow thinker	When a friend says something interesting to me, I usually don’t have a reaction until much later. When someone asks me a deep question, I say, “Hmm. I don’t know.” The next day, I have an answer. I’m a disappointing person to try to debate or...	https://sive.rs/slow	2016-08-26 00:00:00	1
277	Keep earning your title, or it expires	Until yesterday, I called myself an entrepreneur. Now, I don’t. It’s been years since I started a company, so I can’t keep using that title. Someone who played football in high school can’t call himself an athlete forever. Someone who did...	https://sive.rs/expire	2016-08-04 00:00:00	1
278	When you’re extremely unmotivated	Like everyone, I get those times when I’m unmotivated to do anything. Brain dead. No energy. Everything feels like, “Why bother? What’s the point?” But I’ve finally figured out what to do with those times. Like everyone, I have a list of boring...	https://sive.rs/unmo	2016-08-02 00:00:00	1
279	Disconnect	All the best, happiest, and most creatively productive times in my life have something in common: being disconnected. No internet. No TV. No phone. No people. Long uninterrupted solitude. When I was twenty-two, I quit my job and spent five months...	https://sive.rs/dc	2016-07-27 00:00:00	1
280	Don’t add your two cents	“My two cents” is American slang for adding a small opinion or suggestion. An employee says to the boss, “I’ve been working for the past two weeks on this new design. What do you think?” The boss says, “Good job. Maybe just change the blue to...	https://sive.rs/2c	2016-07-25 00:00:00	1
281	Possible futures	I occasionally get a big vision for my future — a huge project that will take many months or years. Something exciting and very worth doing. I’ll do a bunch of research, make a bunch of plans, and feel like I’ve made a big decision on a new...	https://sive.rs/futures	2016-04-27 00:00:00	1
282	Singing the counter-melody	My advice and opinions may sound strange on their own. Do you know what musical counterpoint is? Underneath the main melody, you have a counter-melody that goes against it, and together they make harmony. This is different from harmonizing, where...	https://sive.rs/counter	2016-04-21 00:00:00	1
283	How to stop being rich and happy	(part of the “do this” directives) 1. Prioritize lifestyle design. You’ve made it, so it’s all about you, now.  Make your dreams come true. Shape your surroundings to please your every desire. Make your immediate gratification the most...	https://sive.rs/d1x	2016-04-18 00:00:00	1
284	How to be useful to others	(part of the “do this” directives) 1. Get famous. Do everything in public and for the public. The more people you reach, the more useful you are. The opposite is hiding, which is of no use to anyone. 2. Get rich. Money is neutral proof you’re...	https://sive.rs/d1u	2016-04-18 00:00:00	1
285	How to thrive in an unknowable future	(part of the “do this” directives) 1. Prepare for the worst. Since you have no idea what the future may bring, be open to the best and the worst. But the best case scenario doesn’t need your preparation or your attention. So mentally and...	https://sive.rs/d1t	2016-04-18 00:00:00	1
286	What to do when you get successful	(part of the “do this” directives) 1. Change yes to “Hell yeah!” or no. Once successful, you need to switch strategies. To get successful, you had to say yes to everything. Now if you continue doing that, you’ll drown in all the...	https://sive.rs/d1s	2016-04-18 00:00:00	1
287	How to get rich	(part of the “do this” directives) 1. Live where luck strikes. Live where everything is happening, where the money is flowing, where careers are being made, where your role models live. Once there, be as in the game as anyone can be. Be...	https://sive.rs/d1r	2016-04-18 00:00:00	1
288	How to like people	(part of the “do this” directives) 1. Assume it’s their last day. Everyone talks about living like it’s your last day on earth. Instead, to appreciate someone, live like it’s their last day on earth. Treat them accordingly.  Try to fulfill...	https://sive.rs/d1p	2016-04-18 00:00:00	1
289	Do this. Directives — part 1	First see “just tell me what to do” for context. These directives will take another form some day, with more details and references. And there are many more to come. But I decided to post this outline now, because so many people have asked for...	https://sive.rs/d1	2016-04-18 00:00:00	1
290	Don’t start a business until people are asking you to	When you bake a cake, you need to do first things first. You need to get the ingredients before you turn on the oven. You need to bake it before you frost it and slice it. I meet a lot of people who want to start a business. Some don’t have an...	https://sive.rs/asking	2016-04-13 00:00:00	1
291	Interviews at sive.rs/i	I’ve been the guest on 54 interview shows, most of them in the past year. Now you can hear or read them all in one place: sive.rs/i You might find them interesting because I put a lot of heart into them, getting personal in a way I don’t in my...	https://sive.rs/interviews	2016-03-27 00:00:00	1
292	Why I don’t promote	Every day, someone asks me to promote or announce something they’ve created. Every day, I have to say no, no matter who or what it is. It upsets me every time. Almost everyone I know is a creator. Everyone has made a song, site, video, book,...	https://sive.rs/nopr	2016-03-17 00:00:00	1
293	Happy, Smart, and Useful	There are three things to consider when making life-size decisions: What makes you happy What’s smart — meaning long-term good for you What’s useful to others We have a tendency to forget one of these. For example: Smart and useful (but not...	https://sive.rs/hsu	2016-03-03 00:00:00	1
294	Assume men and women are the same	Men say, “Women can never make up their minds.” But actually both men and women are equally indecisive. Women say, “Men think one thing but say another.” But actually both men and women are equally indirect. We think the differences between...	https://sive.rs/mw	2016-02-28 00:00:00	1
295	Beware of advice	Imagine that you hand someone your camera, and ask him to take a photo of you. He does, but when you look at the photo later, you notice that he took a photo of himself by mistake. Imagine you’ve got a big question like, “Should I quit my job and...	https://sive.rs/advice	2016-02-25 00:00:00	1
296	Overcompensate to compensate	You have something you want to change: a thought process or habit you want to fix. Let’s use the metaphor of a bunch of bricks on a seesaw. Right now all the bricks are stacked on one side. This is the way you have been. To make a change, most...	https://sive.rs/compensate	2016-02-23 00:00:00	1
297	How to take a compliment	You would think this would be a basic life skill, but it seems almost nobody knows it, so please spread the word. When someone gives you a compliment, what should you do? Do you say, “What? No! Not at all. That’s ridiculous.” Do you give details...	https://sive.rs/thx	2016-02-18 00:00:00	1
298	Why I don’t want stuff	About once a month, someone asks for my mailing address because they want to send me something. They liked something I wrote, and want to send me a gift in return. I’m very thankful, but have to say no. Here’s why. I live in a little pre-furnished...	https://sive.rs/gifts	2016-02-16 00:00:00	1
299	Should you learn programming? Yes.	When I was 14 years old, my guitar teacher told me something important: “You need to learn to sing. Because if you don’t, you’re always going to be at the mercy of some asshole singer.” His point was about self-reliance. If you ever have any...	https://sive.rs/prog	2016-02-14 00:00:00	1
300	Switch strategies	Life is like any journey. You need to change directions a few times to get where you want to go. Early in your career, the best strategy is to say yes to everything. The more things you try, and the more people you meet, the better. Each one...	https://sive.rs/switch	2016-01-27 00:00:00	1
301	nownownow.com	A month ago I announced the /now page movement, where many personal websites are adding a “/now” page to answer the question, “What are you focused on now?” At the time, only ten websites had a /now page. Now there are over 280. It’s...	https://sive.rs/now3	2015-11-20 00:00:00	1
302	The /now page movement	People often ask me what I’m doing now. Each time I would type out a reply, describing where I’m at, what I’m focused on, and what I’m not. So earlier this year I added a /now page to my site: sive.rs/now A simple link. Easy to remember. Easy to...	https://sive.rs/nowff	2015-10-21 00:00:00	1
303	Relax for the same result	A few years ago, I lived in Santa Monica, California, right on the beach. There’s a great bike path that goes along the ocean for seven and a half miles. So, fifteen miles round trip. On weekday afternoons, it’s almost empty. It’s perfect for...	https://sive.rs/relax	2015-10-02 00:00:00	1
435	GNU DDD 3.4.1 Released As GUI Front-End To GDB	As the first new release in more than one year, GNU DDD 3.4.1 is now available as a GUI front-end to the GNU Debugger (GDB)...	https://www.phoronix.com/news/GNU-GDD-3.4.1-GDB	2024-08-24 19:12:56	7
304	Saying no to everything else	Steven Pressfield called himself an author for years, but he’d never actually finished a book. Eventually, the psychological pain of not finishing kept building until he couldn’t stand it anymore. He decided to finally beat the devil he calls “The...	https://sive.rs/no2	2015-09-23 00:00:00	1
305	“Just tell me what to do”: compressing knowledge into directives	Internalizing books Wanting to be successful, I’ve always read every book I thought could help. Even if a book had just one useful insight, it was worth the $20 and my time spent reading and thinking. A few years ago, I realized I was forgetting...	https://sive.rs/2do	2015-08-29 00:00:00	1
306	Simplify: move code into database functions	If you are a web or API developer, programming code that uses an SQL database, this is for you. I’ve found a very different and useful way to structure code. It’s made such a big difference for me that I had to share it here. How things...	https://sive.rs/pg	2015-05-04 00:00:00	1
307	Getting out of a bad state of mind	The last time I was in really bad state of mind, I used these five steps to get out of it. I’ve shared this with a few friends in a similar situation, and they said it helped. I hope it works for you too. 1. Ask myself what’s wrong in this very...	https://sive.rs/bad	2015-02-01 00:00:00	1
308	How to change or build your career	I get emails from many people wanting to change or build their career. I always recommend the best book on the subject: “So Good They Can’t Ignore You” by Cal Newport. Here are a few of its best points: Forget passion and purpose Forget “follow...	https://sive.rs/career	2014-10-06 00:00:00	1
309	Upcoming Changes to the AWX Project	By Matthew Jones, Chief Architect, Ansible Automation at Red Hat Back in 2013, a small team of engineers worked for over a year to make the first commercial release of Ansible Tower (before we expanded and evolved to Ansible Automation Platform)...	https://www.ansible.com/blog/upcoming-changes-to-the-awx-project/	2024-05-30 00:00:00	6
310	Ansible Contributor Summit, Durham 2023	Ansible Contributor Summit, Durham 2023 The Ansible Contributor Summit is a full day working session for community contributors to interact with one another and meet with the Ansible development teams behind the projects like AWX, Galaxy...	https://www.ansible.com/blog/ansible-contributor-summit-durham-2023/	2023-09-29 00:00:00	6
311	New Ansible Galaxy	New Ansible Galaxy For awhile, the Red Hat Ansible team behind the components Ansible automation hub and Ansible cloud automation hub at console.redhat.com have been on a special ops mission to enhance the galaxy_ng code base that serves the...	https://www.ansible.com/blog/new-ansible-galaxy/	2023-09-26 13:00:00	6
312	Welcome to the new Ansible Community Forum	Welcome to the new Ansible Community Forum Today, we're delighted to announce the launch of the new Ansible Community Forum - a single starting point for questions and help, development discussions, events, and much more. Everyone is invited,...	https://www.ansible.com/blog/welcome-to-the-new-ansible-community-forum/	2023-09-11 00:00:00	6
313	Ansible Community Day, Berlin 2023	Ansible Community Day, Berlin 2023   The Ansible Community Day is a new initiative by the Ansible Community Team at Red Hat to connect with the people using, contributing to, and developing the Ansible project worldwide. This new event complements...	https://www.ansible.com/blog/ansible-community-day-berlin-2023/	2023-08-24 00:00:00	6
314	Ansible data manipulation with a Filter	This year at Summit, an attendee posed a question about how to work with setting facts and changing data in Ansible. Many times we’ve come across people using task after task to manipulate data, to turn items into lists, filter our options, trying...	https://www.ansible.com/blog/ansible-data-manipulation-with-a-filter/	2023-08-03 13:00:00	6
315	Welcome to the Ansible Lightspeed with IBM Watson Code Assistant Technical Preview	Welcome to the Ansible Lightspeed with IBM Watson Code Assistant Technical Preview At Red Hat Summit and AnsibleFest 2023, we announced Ansible Lightspeed with IBM Watson Code Assistant, a new generative AI service for Ansible automation. Today, we...	https://www.ansible.com/blog/welcome-to-the-ansible-lightspeed-technical-preview/	2023-06-26 00:00:00	6
316	What's New with Cloud Automation with amazon.aws 6.0.0	What's New with Cloud Automation with amazon.aws 6.0.0 When it comes to Amazon Web Services (AWS) infrastructure automation, the latest release of the certified amazon.aws Collection for Red Hat Ansible Automation Platform brings a number...	https://www.ansible.com/blog/whats-new-cloud-automation-with-amazon.aws-6.0.0/	2023-06-22 00:00:00	6
317	Event-Driven Ansible is Here	As you may recall, we introduced Event-Driven Ansible in developer preview last fall at AnsibleFest. Since that time, much work has been done across the community, the Red Hat development teams, customers, and last but not least, Red Hat partners....	https://www.ansible.com/blog/event-driven-ansible-is-here/	2023-05-23 13:00:00	6
318	YOU are the community	YOU are the community New year, new role, new strategy...2023 is officially the year when I return to my roots. Back in 2014, I officially became part of the Ansible community. Admittingly, back then my focus was solely on figuring out how to best...	https://www.ansible.com/blog/you-are-the-community/	2023-05-22 00:00:00	6
319	System76 Pop!_OS Scheduler Now Detects Hyprland, Lands Various Fixes	In addition to System76 software engineers being busy working on their new COSMIC desktop environment, on Thursday they also released a new version of the System76 Scheduler that is used by Pop!_OS...	https://www.phoronix.com/news/PopOS-Scheduler-2.0.2	2024-08-23 04:00:00	7
320	NILFS2 File-System Seeing More Fixes, Additional Ioctls Wired Up Ahead Of Linux 6.12	While Bcachefs and Btrfs capture much of the Linux file-system spotlight these days when it comes to exciting developments, there is no shortage of alternative open-source file-systems. One that's been around for a long time but not seeing as much...	https://www.phoronix.com/news/NILFS2-Patches-Coming-6.12	2024-08-22 21:01:00	7
321	Several Newer Gaming Handheld Devices To See Linux Sensor Monitoring Support	The upstream Linux "oxp-sensors" driver began as a driver for supporting the sensors on the OneXPlayer handheld. With time this driver has been extended to support more handheld gaming consoles and a new patch enables support for several more...	https://www.phoronix.com/news/OXP-Sensors-More-Hardware	2024-08-22 20:03:30	7
322	KDE Gear 24.08 Brings Many App Enhancements & New Features	KDE Gear 24.08 has been released for this collection of KDE applications that pair with the Plasma desktop...	https://www.phoronix.com/news/KDE-Gear-24.08-Released	2024-08-22 16:16:14	7
323	Ubuntu Will Be Skipping Non-Critical Linux Kernel Updates For September	With the exception of critical security issues/bugs, Canonical will be skipping over shipping stable release updates for the Linux kernel in Ubuntu until early October...	https://www.phoronix.com/news/Ubuntu-Skipping-Kernel-SRU-Fix	2024-08-22 12:37:11	7
324	Mozilla Developing Whisperfile For Local Audio-To-Text Translation	The Mozilla Ocho group leads "innovation and experiments" at Mozilla. Following all of their work on Llamafile for easily distributing large language models as a single file that can be easily executed across different hardware/software, their...	https://www.phoronix.com/news/Mozilla-Whisperfile	2024-08-22 10:59:14	7
325	Intel Further Speeds Up strnlen() In The GNU C Library For Recent Intel/AMD CPUs	Intel software engineers are responsible for many of the great x86_64-related optimizations to the GNU C Library "glibc" over the years. While they've extensively tuned many Glibc functions for achieving peak performance on their modern CPUs, it's...	https://www.phoronix.com/news/Intel-EVEX-Faster-strnlen	2024-08-22 10:26:24	7
326	Fwupd 1.9.24 Adds Support For More Mediatek & Parade Tech Devices	While celebrating the 9th birthday of the Linux Vendor Firmware Service, LVFS/Fwupd lead developer Richard Hughes has released a new version of the Fwupd firmware updating utility...	https://www.phoronix.com/news/Fwupd-1.9.24-Released	2024-08-22 10:20:52	7
327	LibreOffice 24.8 Delivers Many Advancements To This Free Software Office Suite	LibreOffice 24.8 is officially out today as the latest major feature update to this open-source office suite that's the leading free software alternative to Microsoft Office. With LibreOffice 24.8 comes many new features throughout its various...	https://www.phoronix.com/news/LibreOffice-24.8-Released	2024-08-22 09:55:16	7
328	Chrome 128 Released With Isolated Web Apps, Standardized CSS Zoom	Google has promoted Chrome 128 to its stable channel across macOS, Windows, and Linux platforms...	https://www.phoronix.com/news/Google-Chrome-128-Released	2024-08-22 00:27:51	7
329	Intel Uncore Linux Driver Prepares ELC "Efficiency Latency Control" Feature	Intel's uncore Linux platform driver is preparing for a new feature found on newer SoCs: ELC, or Efficiency Latency Control. This ELC feature for the Intel uncore handling allows fine tuning efficiency versus latency characteristics...	https://www.phoronix.com/news/Intel-Uncore-Efficiency-ELC	2024-08-21 21:30:25	7
330	Intel Discontinues High-Speed, Open-Source H.265/HEVC Encoder Project	As part of Intel's Scalable Video Technology (SVT) initiative they had been developing SVT-HEVC as a BSD-licensed high performance H.265/HEVC video encoder optimized for Xeon Scalable and Xeon D processors. But recently they've changed course and...	https://www.phoronix.com/news/Intel-Discontinues-SVT-HEVC	2024-08-21 18:00:00	7
331	Over 9 Years LVFS Has Served Over 110 Million Firmware Files To Linux Systems	This week marks nine years since the Linux Vendor Firmware Service (LVFS) was started by Richard Hughes of Red Hat to ease the firmware updating/distribution process with the open-source Fwupd firmware updating utility...	https://www.phoronix.com/news/LVFS-9th-Birthday	2024-08-21 16:35:07	7
332	NVIDIA 560.35.03 Linux Driver Released With More Wayland Fixes	Building off the prior NVIDIA 560 beta driver releases, the NVIDIA 560.35.03 stable Linux driver was released today for providing the latest official NVIDIA graphics/compute support for Linux systems...	https://www.phoronix.com/news/NVIDIA-560.35.03-Linux-Driver	2024-08-21 14:28:18	7
333	Experimental Schedutil Patches Yield 30% Boost To Web Browser Benchmark On Linux	Google engineer Qais Yousef has posted a set of 16 patches for the "Schedutil" scheduler utilization code within the Linux kernel to better manage system response time. Schedutil is often used by default on many Linux distributions and with these...	https://www.phoronix.com/news/Schedutil-30p-Speedometer-Boost	2024-08-21 13:51:17	7
334	Linux Support Emerging For The Samsung Galaxy Book4 Edge X1 Elite Laptop	Following all of the Snapdragon X1 upstream enablement work over the past number of months by Qualcomm and then DeviceTree additions emerging for enabling the likes of the ASUS Vivobook S 15, Lenovo Yoga Slim 7x, Lenovo ThinkPad T14s Gen 6, and...	https://www.phoronix.com/news/Samsung-Galaxy-Book4-Edge-Linux	2024-08-21 12:46:58	7
335	Zed Code Editor Begins Adding AI Features Powered By Anthropic's Claude	Zed, the code/text editor being developed by former Atom editor developers, has continued to gain interest among developers since going open-source, being written in the Rust programming language, and native Linux builds taking shape. The latest...	https://www.phoronix.com/news/Zed-Adding-AI-Features	2024-08-21 10:30:05	7
336	SVT-AV1 2.2 Delivers More Performance Improvements	SVT-AV1 2.2 is now available for this leading open-source AV1 video encoder. With this new version comes yet more performance optimizations...	https://www.phoronix.com/news/SVT-AV1-2.2-Released	2024-08-21 10:13:03	7
337	VirtualBox 7.1 Beta 2 Released For This Big Oracle Virtualization Update	Released last month was the VirtualBox 7.1 Beta 1 virtualization software release from Oracle. This new version is bringing a modernized GUI, Wayland clipboard sharing, and other improvements. Released yesterday was the second beta of this big...	https://www.phoronix.com/news/VirtualBox-7.1-Beta-2	2024-08-21 10:04:12	7
338	GIMP 3.0 Enters String Freeze, Inching Closer To Release	Today marks the beginning of the string freeze for the long-awaited GIMP 3.0 open-source image editor release as one of the leading free software alternatives to Adobe Photoshop...	https://www.phoronix.com/news/GIMP-3.0-String-Freeze	2024-08-20 18:25:06	7
339	Linux Patches Work To Upstream Raspberry Pi's RP1 PCI Device Support	Andrea della Porta of SUSE has been working on upstreaming the Linux kernel support to boot the Raspberry Pi 5 on a mainline kernel. Over the past few months Andrea has posted a number of different patches derived in part from Raspberry Pi's...	https://www.phoronix.com/news/Raspberry-Pi-RP1-Linux-Patches	2024-08-20 16:47:00	7
340	Intel Continues To Show AMD The Importance Of Software Optimizations: 16% More Ryzen 9 9950X Performance	As part of my ongoing AMD Ryzen 9 9950X Linux testing, last week I provided a look at the AVX-512 benefits to Zen 5 and also the Windows vs. Linux performance for the Ryzen 9 9950X. For sharing today is a look at multiple Linux distributions up and...	https://www.phoronix.com/review/linux-os-amd-ryzen9-9950x	2024-08-20 14:30:00	7
341	Granite Rapids Idle/P-State Work For Linux 6.12 & An Important AMD Energy Reporting Fix	Queued yesterday into the Linux power management subsystem's "linux-next" branch ahead of the Linux 6.12 kernel are some important additions for Intel processors and also an important fix for AMD processors to enjoy package power monitoring...	https://www.phoronix.com/news/Linux-6.12-Intel-AMD-PM-Early	2024-08-20 13:36:17	7
342	Unigine 2.19 Rolls Out OpenXR Support, Multi-Threaded Renderer	While the Unigine SDK these days is more known for its simulation and engineering offerings rather than as a game engine, this engine remains visually impressive and continues advancing. Unigine 2.19 has been released that brings a number of...	https://www.phoronix.com/news/Unigine-2.19-Released	2024-08-20 12:29:00	7
343	Ubuntu Fixes Old NVIDIA Wayland Support For GNOME, Hiring More Desktop Engineers	There are a few interesting bits of information as part of this week's updates from the Ubuntu Desktop Team Integration Squad...	https://www.phoronix.com/news/Ubuntu-Fixes-EGLDevice-GNOME	2024-08-20 10:40:52	7
344	Proposed Vulkan Extension To Improve Memory Sharing With Apple's Metal	LunarG engineer Aitor Camacho Larrondo has proposed VK_EXT_external_memory_metal, a new extension for the Vulkan API to allow for more easily sharing memory objects from Vulkan with Apple's Metal...	https://www.phoronix.com/news/VK_EXT_external_memory_metal	2024-08-20 10:26:15	7
345	ASUS ROG Ally X & GT7868Q See HID Fixes With Linux 6.11	A new batch of HID subsystem fixes were merged today for the ongoing Linux 6.11 kernel development...	https://www.phoronix.com/news/Linux-6.11-HID-ROG-Ally-X-GT786	2024-08-19 19:32:17	7
346	AMD & FreeBSD Begin Collaborating Over OS Improvements	The FreeBSD open-source operating system project published their Q2'2024 status report that outlines some interesting work happening to this leading BSD project...	https://www.phoronix.com/news/FreeBSD-Q2-2024-Improvements	2024-08-19 16:51:00	7
347	NVIDIA RTX 2000 & RTX 4000 Ada Generation Linux Performance	NVIDIA recently sent over their RTX 2000 Ada Generation and RTX 4000 Ada Generation graphics cards suited for designers, engineers, and creative professionals. In my testing the past several weeks these professional graphics cards have been working...	https://www.phoronix.com/review/nvidia-rtx-2000-4000-ada	2024-08-19 15:00:00	7
348	Fedora 41 To Rely On PipeWire By Default For Firefox Camera Handling	Red Hat engineer Jan Grulich has provided an update today on PipeWire camera handling with the upcoming Fedora 41 release...	https://www.phoronix.com/news/Fedora-41-Firefox-PipeWire-Cam	2024-08-19 12:42:29	7
349	Feral's GameMode 1.8.2 Fixes Hybrid CPU Core Pinning	GameMode as the open-source daemon from Feral Interactive to optimize Linux system performance on-demand when running games is out with its first release of 2024...	https://www.phoronix.com/news/GameMode-1.8.2-Released	2024-08-19 12:26:45	7
350	Linux 6.11 Kernel Performance On The AMD Ryzen 9 9000 Series	If you are picking up one of the new AMD Ryzen 9000 series desktop processors soon for Linux use, you may be wondering whether it's worthwhile or even necessary moving to the latest Linux kernel code compared to the likes of Ubuntu 24.04 LTS that...	https://www.phoronix.com/news/Linux-6.11-AMD-Ryzen-9-9950X	2024-08-19 10:49:10	7
351	The sshd service needs to be restarted after upgrading to openssh-9.8p1	After upgrading to openssh-9.8p1, the existing SSH daemon will be unable to accept new connections (see https://gitlab.archlinux.org/archlinux/packaging/packages/openssh/-/issues/5). When upgrading remote hosts, please make sure to restart the sshd...	https://archlinux.org/news/the-sshd-service-needs-to-be-restarted-after-upgrading-to-openssh-98p1/	2024-07-01 16:40:26	11
352	Arch Linux 2024 Leader Election Results	Recently we held our leader election, and the previous Project Leader Levente "anthraxx" Polyák ran again while no other people were nominated for the role. As per our election rules he is re-elected for a new term. The role of of the project lead...	https://archlinux.org/news/arch-linux-2024-leader-election-results/	2024-04-15 06:56:46	11
353	Increasing the default vm.max_map_count value	The vm.max_map_count parameter will be increased from the default 65530 value to 1048576. This change should help address performance, crash or start-up issues for a number of memory intensive applications, particularly for (but not limited to)...	https://archlinux.org/news/increasing-the-default-vmmax_map_count-value/	2024-04-07 18:12:44	11
354	The xz package has been backdoored	Update: To our knowledge the malicious code which was distributed via the release tarball never made it into the Arch Linux provided binaries, as the build script was configured to only inject the bad code in Debian/Fedora based package build...	https://archlinux.org/news/the-xz-package-has-been-backdoored/	2024-03-29 18:55:55	11
355	mkinitcpio hook migration and early microcode	With the release of mkinitcpio v38, several hooks previously provided by Arch packages have been moved to the mkinitcpio upstream project. The hooks are: systemd, udev, encrypt, sd-encrypt, lvm2 and mdadm_udev. To ensure no breakage of users' setup...	https://archlinux.org/news/mkinitcpio-hook-migration-and-early-microcode/	2024-03-04 17:14:12	11
356	Making dbus-broker our default D-Bus daemon	We are making dbus-broker our default implementation of D-Bus, for improved performance, reliability and integration with systemd. For the foreseeable future we will still support the use of dbus-daemon, the previous implementation. Pacman will ask...	https://archlinux.org/news/making-dbus-broker-our-default-d-bus-daemon/	2024-01-09 16:59:30	11
357	Bugtracker migration to GitLab completed	We are happy to announce that the migration of the bugtracker to GitLab is done! 🥳 Thanks to everyone who has helped during the migration! This means the issue tracker and merge requests on the GitLab package repos are now enabled. The old...	https://archlinux.org/news/bugtracker-migration-to-gitlab-completed/	2023-12-03 23:01:42	11
358	Incoming changes in JDK / JRE 21 packages may require manual intervention	We are introducing a change in JDK/JRE packages of our distro. This is triggered from the way a JRE is build in modern versions of Java (>9). We are introducing this change in Java 21. To sum it up instead of having JDK and JRE packages coexist in...	https://archlinux.org/news/incoming-changes-in-jdk-jre-21-packages-may-require-manual-intervention/	2023-11-02 10:51:53	11
359	Changes to default password hashing algorithm and umask settings	With shadow >= 4.14.0, Arch Linux's default password hashing algorithm changed from SHA512 to yescrypt. Furthermore, the umask settings are now configured in /etc/login.defs instead of /etc/profile. This should not require any manual...	https://archlinux.org/news/changes-to-default-password-hashing-algorithm-and-umask-settings/	2023-09-22 20:26:30	11
360	ansible-core >= 2.15.3-1 update may require manual intervention	As of ansible-core 2.15.3, upstream moved documentation and examples to a separate dedicated repository (see the related changelogs). This means that, starting from version 2.15.3 the ansible-core package will stop shipping documentation and a...	https://archlinux.org/news/ansible-core-2153-1-update-may-require-manual-intervention/	2023-08-19 10:41:34	11
364	2 workers killed, 1 injured in tire explosion at a Delta Air Lines facility in Atlanta	Delta said the explosion occurred while wheel components were being disassembled for maintenance at a wheel and brake shop. The parts were not attached to a plane at the time, the airline said.	https://www.npr.org/2024/08/28/g-s1-19832/workers-killed-injured-delta-air-lines-atlanta	2024-08-28 06:16:43	8
365	Biden pushed Gaza pier over warning it would undercut other aid routes, watchdog says	President Biden ordered a temporary pier be built to deliver humanitarian aid to Gaza despite expressed concerns that the effort would be difficult to pull off, according to a USAID report.	https://www.npr.org/2024/08/28/g-s1-19828/biden-gaza-pier-warnings	2024-08-28 05:34:10	8
366	Quiz: Do you know your economic history?	Time to show your economic history skills based on what we’ve covered in Planet Money Summer School 2024: An Incomplete Economic History of the World. Make it through the quiz, and receive a — and we cannot stress this enough — totally fake (yet...	https://www.npr.org/2024/08/27/g-s1-19625/planet-money-summer-school-2024-final-exam-quiz	2024-08-28 03:45:20	8
367	Trump campaign staff had altercation with official at Arlington National Cemetery	The cemetery official tried to prevent Trump staffers from filming and photographing in a section where recent U.S. casualties are buried, a source with knowledge of the incident told NPR.	https://www.npr.org/2024/08/27/nx-s1-5091154/trump-arlington-cemetery	2024-08-27 22:55:03	8
368	Fed up with her mail being stolen, she sent herself an AirTag to catch the thieves	The Santa Barbara County, Calif., Sheriff’s Office said it arrested two suspects after they were tracked down using the device that the victim mailed to herself. They face several felony charges.	https://www.npr.org/2024/08/27/nx-s1-5091095/apple-airtag-mail-theft-arrest-california	2024-08-27 22:11:04	8
369	Boeing faces hard questions about Starliner and its future in space	Boeing’s Starliner will return to Earth as soon as next week — but the crew will stay in space into next year. It’s another blow for Boeing, and could have major implications for its space business.	https://www.npr.org/2024/08/27/nx-s1-5086709/boeing-starliner-spacex-space-future	2024-08-27 20:54:01	8
370	Leonard Riggio, who built Barnes & Noble into a bookselling empire, dies at 83	Leonard Riggio transformed the publishing industry by building Barnes & Noble into the country’s most powerful bookseller before his company was overtaken by the rise of Amazon.	https://www.npr.org/2024/08/27/nx-s1-5091174/barnes-noble-leonard-riggio-obituary	2024-08-27 20:46:57	8
371	The Tiny Island Nation Caught Between Two Superpowers	The island nation of Palau is at the center of tensions between the U.S., China, and Taiwan. We go there to see what the competition between superpowers looks like on the ground.	https://www.npr.org/2024/08/27/1196983338/the-tiny-island-nation-caught-between-two-superpowers	2024-08-27 20:14:59	8
372	Jack Smith files superseding indictment against Trump in Jan. 6 case	Special counsel Jack Smith has been consulting with other officials inside the Justice Department about the case, which accuses Donald Trump of leading a conspiracy to overturn the 2020 election.	https://www.npr.org/2024/08/27/nx-s1-5090925/trump-indictment-jan6	2024-08-27 20:08:49	8
373	Customs officers find $5M worth of meth disguised as watermelons at Mexico border	The driver was referred for a second examination by border patrol officers in San Diego, where customs agents discovered more than $5 million worth of meth.	https://www.npr.org/2024/08/27/nx-s1-5090995/watermelon-meth-5-million-san-diego-border-checkpoint	2024-08-27 19:33:02	8
436	Mesa's PanVK Vulkan Driver Prepares For Arm Mali Valhall Support	Mesa's PanVK driver that provides open-source Vulkan API support for Arm Mali graphics is preparing to support newer "Valhall" hardware...	https://www.phoronix.com/news/Mesa-PanVK-Valhall-Prep	2024-08-24 14:00:00	7
437	Linus Torvalds Begins Expressing Regrets Merging Bcachefs	There's been some Friday night kernel drama on the Linux kernel mailing list... Linus Torvalds has expressed regrets for merging the Bcachefs file-system and an ensuing back-and-forth between the file-system maintainer...	https://www.phoronix.com/news/Linus-Torvalds-Bcachefs-Regrets	2024-08-24 10:45:58	7
438	FreeBSD 13.4 Nears Release With Modernized DVD Package Set, Driver Updates	FreeBSD 13.4-RC1 has been released ahead of its planned official release in early September. While the FreeBSD 14 series delivers the latest and greatest, FreeBSD 13.4 is a nice incremental update for those still depending upon a FreeBSD 13 base...	https://www.phoronix.com/news/FreeBSD-13.4-RC1-Released	2024-08-24 10:31:34	7
439	KDE Lands Per-Monitor Brightness Controls & Better KWin HDR Tone Mapping	Ahead of the KDE Plasma 6.2 soft feature freeze happening next week, KDE developers have been preparing some last minut features for the desktop...	https://www.phoronix.com/news/Plasma-6.2-Monitor-Brightness	2024-08-24 10:10:57	7
440	Wine 9.16 Begins Working On Driver Store Implementation, Pbuffer Support For Wayland	Wine 9.16 is out as the newest bi-weekly development snapshot for this open-source software that enables running Windows games and applications on Linux...	https://www.phoronix.com/news/Wine-9.16-Released	2024-08-24 00:23:16	7
441	Google Making Progress On 16KB Page Size For Android	Google Android engineers have shared a status update on bringing support for 16KB page size handling to Android. In moving from a 4KB to 16KB page size, Google has found a 5~10% performance boost but at the cost of around ~9% additional RAM usage...	https://www.phoronix.com/news/Android-16KB-Page-Size-Progress	2024-08-23 17:19:01	7
442	Bochs DRM Linux Driver Being Modernized - Better Performance For QEMU Display	The Bochs Direct Rendering Manager (DRM) kernel driver is in the process of being modernized. The Bochs driver is important in that it's commonly used for virtual VGA output with QEMU for Linux virtualization...	https://www.phoronix.com/news/Bochs-DRM-Modernizing	2024-08-23 16:48:18	7
443	Vulkan 1.3.294 Introduces New Pipeline Binary Extension	Vulkan 1.3.294 is out today with a handful of fixes and clarifications to this high performance graphics and compute API. In addition to the maintenance work, Vulkan 1.3.294 introduces a new pipeline binary extension: VK_KHR_pipeline_binary...	https://www.phoronix.com/news/Vulkan-1.3.294	2024-08-23 12:40:00	7
444	Intel Preps More Xe2 Lunar Lake & Battlemage Driver Code For Linux 6.12	Intel's open-source Linux graphics driver engineers continue feverishly working on the Xe2 graphics support both for imminently-launching Lunar Lake laptops and then the Battlemage discrete graphics cards. This week more "missing bits" were...	https://www.phoronix.com/news/Intel-Preps-More-Xe2-Linux-6.12	2024-08-23 10:47:04	7
445	Big Video Encoding Rework Lands For AMD Open-Source Mesa 24.3 Driver	A set of a dozen patches have reworked the video encode handling within Mesa 24.3 for the Video Acceleration (VA) front-end and the RadeonSI/VCN driver code. This rework aims to enable new features moving forward, enhance the overall driver, and...	https://www.phoronix.com/news/Mesa-24.3-Video-Encode-Rework	2024-08-23 10:34:07	7
414	Microsoft Offloads The Mono Project To Wine	Coming as a surprise this afternoon is Microsoft deciding to contribute the Mono Project to be stewarded by the Wine development community...	https://www.phoronix.com/news/Microsoft-Gives-Mono-To-Wine	2024-08-27 19:45:23	7
415	AMD Ryzen 9 9950X DDR5-6000 / DDR5-6400 / DDR5-8000 Memory Performance	For those planning on upgrading to an AMD Ryzen 9 9900 series Zen 5 desktop for Linux use, here are some benchmarks I recently carried out of several different DDR5 memory kits with the AMD Ryzen 9 9950X while looking at the Linux performance under...	https://www.phoronix.com/review/amd-ryzen9-9950x-ddr5	2024-08-27 18:40:39	7
416	KDE's Calligra 4.0 Office/Graphics Suite Released With Improved UI & Qt6 Port	As the successor to KOffice, Calligra is KDE's office and graphics suite. Today marks the release of Calligra Office 4.0 with updates to the Words word processor, Sheets spreadsheet, Stage presentation, and Karbon vector graphics programs...	https://www.phoronix.com/news/KDE-Calligra-4.0-Released	2024-08-27 16:51:21	7
417	LinkedIn Migrates Their Servers From CentOS To Azure Linux	LinkedIn has replaced CentOS as their default server operating system choice with Azure Linux to power all of their server needs...	https://www.phoronix.com/news/LinkedIn-Switches-Azure-Linux	2024-08-27 12:40:04	7
418	AMD Developing New Heterogeneous CPU Core Driver For Linux Systems	AMD for months has already been working on heterogeneous core topology optimizations for Linux within the AMD P-State CPUFreq driver and other heterogeneous CPU topology improvements for dealing with Ryzen systems sporting a mix of "classic" (full)...	https://www.phoronix.com/news/AMD-Heterogeneous-Core-Driver	2024-08-27 12:23:21	7
419	AMD Graphics Driver Prepares For Per-Queue Resets & Process Isolation In Linux 6.12	A big set of patches have been submitted for DRM-Next of "new stuff" to the AMDGPU kernel graphics driver and the AMDKFD compute driver with the upcoming Linux 6.12 kernel cycle...	https://www.phoronix.com/news/AMDGPU-Per-Queue-Linux-6.12	2024-08-27 10:46:40	7
420	RADV Enables Vulkan Video By Default For RDNA3 / VCN4 GPUs	With Mesa's RADV driver supporting Vulkan Video for accelerated video encode/decode using this cross-platform, industry standard API it hasn't been exposed by default for RDNA3 graphics processors bearing VCN4 IP. That has now changed for Mesa 24.3...	https://www.phoronix.com/news/RADV-Vulkan-Video-VCN4	2024-08-27 10:34:06	7
421	Oracle Updates TrenchBoot For The Linux Kernel To Advance Boot Security & Integrity	Oracle engineers continue working on the TrenchBoot initiative to advance boot security and integrity for Linux. The tenth iteration of the TrenchBoot patches were posted this week as it works its way toward the mainline kernel...	https://www.phoronix.com/news/Oracle-TrenchBoot-v10	2024-08-27 09:00:00	7
422	Mir-Powered Miracle-WM Continues Tacking On New Features Ahead Of Fedora Miracle	Miracle-WM as the Mir-powered Wayland compositor inspired by i3 and Sway is out with another new release. It's rather ironic that while Miracle-WM is principally developed by a Canonical engineer associated with Ubuntu Linux, these recent...	https://www.phoronix.com/news/Miracle-WM-v0.3.3-Released	2024-08-27 07:00:00	7
423	Godot 4.4 Dev 1 Brings Renderer Improvements, Betsy Texture Compression	The Godot open-source, cross-platform game engine continues advancing wonderfully as an alternative to the more well established but proprietary and commercial-focused game engines. Godot 4.4 Dev 1 released today as the first tagged development...	https://www.phoronix.com/news/Godot-4.4-Dev-1-Engine	2024-08-27 00:32:30	7
424	Cemu 2.1 Emulator Released With Flatpaks & AppImage For Linux, Initial Wayland Support	Cemu is the Wii U emulator that went open-source and began building on Linux two years ago. Since then they've continued building up their Linux support and out today is the Cemu 2.1 emulator release with even better Linux support...	https://www.phoronix.com/news/Cemu-2.1-Released	2024-08-26 20:07:59	7
425	AmpereOne A192-32X Benchmarks: 192 Core ARM Server Performance & Power Efficiency	Last week an AmpereOne server finally arrived at Phoronix! Ampere Computing sent over a reviewer server of the AmpereOne A192-32X flagship AArch64 server processor with 192 custom cores and using a Supermicro ARS-211M-NR R13SPD platform. I have...	https://www.phoronix.com/review/ampereone-a192-32x	2024-08-26 14:45:40	7
426	Sovereign Tech Fund Announces Significant Investment Into FreeBSD	In addition to the recent news of AMD and FreeBSD Foundation collaborating over improvements, some more good news for this leading BSD open-source project is the Sovereign Tech Fund (STF) now beginning to invest in FreeBSD...	https://www.phoronix.com/news/Sovereign-Tech-Fund-FreeBSD	2024-08-26 14:08:36	7
427	AMD Kria Development Boards To Enjoy Wayland Support With Ubuntu 24.04 LTS	Ubuntu maker Canonical partnered with AMD for supporting Ubuntu Linux on the AMD-Xilinx Kria development boards for their UltraScale+ / Versal Adaptive SoC evaluation kit. Currently the official builds are based on Ubuntu 22.04 LTS but it appears...	https://www.phoronix.com/news/AMD-Kria-Wayland-Ubuntu-24.04	2024-08-26 12:30:00	7
428	More Intel AVX10.2 Enablement Lands In The GCC 15 Compiler	Earlier this month Intel compiler engineers began adding AVX10.2 support into the GCC 15 open-source compiler. Now as we approach the end of August, another big batch of AVX10.2 enablement has landed for this next GNU Compiler Collection release...	https://www.phoronix.com/news/GCC-15-More-AVX10.2-Instruct	2024-08-26 10:35:46	7
429	RadeonSI Gallium3D Driver Adds GL_KHR_shader_subgroup Support	It's not too often these days seeing new OpenGL extensions come to Mesa drivers given their already robust coverage and not many new OpenGL extensions being introduced compared to the still-expanding Vulkan APIs. Overnight though RadeonSI Gallium3D...	https://www.phoronix.com/news/RadeonSI-GL_KHR_shader_subgroup	2024-08-26 10:18:40	7
430	Intel Updates QAT Zstd Plugin For Accelerating Zstandard Compression	Released on Sunday night was a new version of the Intel QuickAssist Technology (QAT) Zstd plug-in for accelerating Zstandard compression with QAT-enabled adapters and modern Xeon Scalable processors sporting QAT accelerators...	https://www.phoronix.com/news/Intel-QAT-Zstd-Plugin-v0.2	2024-08-26 10:07:32	7
431	Linux 6.11 Kernel Features Deliver A Lot For New/Upcoming Intel & AMD Hardware	Linux 6.11 as often is the case each kernel cycle brings a lot of new improvements for recent/upcoming Intel and AMD platforms. There are big step forwards for AMD confidential computing, initial RDNA4 graphics support, new AMD P-State driver...	https://www.phoronix.com/review/linux-611-features	2024-08-25 13:12:15	7
432	Linux 6.11-rc5 Released With Slimmed Down Set Of Bcachefs Fixes	The Linux 6.11-rc5 kernel is already out as stable today, roughly a half-day ahead of time due to travels by Linus Torvalds...	https://www.phoronix.com/news/Linux-6.11-rc5-Released	2024-08-25 10:26:54	7
433	Codon 0.17 Released For LLVM-Based Python Implementation For 10~100x Speedups	Codon is an open-source project that leverages the LLVM compiler infrastructure and aims for super fast Python code with as much as 10~100x speedups. Released this week  was Codon 0.17 as the newest step forward for this alternative Python...	https://www.phoronix.com/news/Codon-0.17-Python-Released	2024-08-25 10:19:33	7
446	Jeff Goldblum was bullied growing up. It made him crave something 'finer'	Jeff Goldblum has a special brand of charisma — the kind that seeps its way into all of his roles. Whether it's in The Fly or Independence Day or Jurassic Park — or his newest show KAOS — every character feels like a version of Jeff Goldblum...	https://www.npr.org/2024/08/29/1244131022/jeff-goldblum-kaos-new-show-childhood	2024-08-29 07:00:59	8
447	Breaks in water pipeline for Grand Canyon prompt shutdown of overnight hotel stays	The restrictions will run throughout the Labor Day holiday when hotels are near or at capacity. It's an unprecedented move, even for a waterline that has experienced frequent failures.	https://www.npr.org/2024/08/29/g-s1-20001/breaks-water-pipeline-grand-canyon-hotel-stays	2024-08-29 05:25:16	8
448	Backpage founder Michael Lacey sentenced to 5 years in prison for money laundering	Michael Lacey, a founder of the classified site Backpage.com, was sentenced to five years in prison and fined $3 million in a money laundering case in a case involving allegations of sex trafficking.	https://www.npr.org/2024/08/29/g-s1-19995/backpage-founder-michael-lacey-prison-money-laundering	2024-08-29 04:11:39	8
449	Arlington National Cemetery’s Section 60 is a focus of controversy. What is the area?	Many U.S. servicemembers from Afghanistan and Iraq wars are interred in this solemn place. It made news after a cemetery official tried to prevent former President Trump’s campaign from taking photos.	https://www.npr.org/2024/08/28/nx-s1-5092041/arlington-trump-section60-veterans-altercation	2024-08-28 21:43:53	8
450	'Very demure, very mindful' trademark issue is 'handled,' TikTok influencer says	While Jools Lebron was captivating millions of people with her "very demure, very mindful" TikTok videos, at least two people submitted applications to trademark her catchphrases.	https://www.npr.org/2024/08/28/nx-s1-5090081/very-demure-very-mindful-jools-lebron-trademark	2024-08-28 21:31:29	8
451	Understanding Israel's Raids And Settler Expansion in the West Bank	On Wednesday Israel launched raids into the Occupied West Bank, they say to root out Hamas militants and prevent another attack like the one that occurred on October 7th. We hear the latest on those raids.  And Israelis who believe the West Bank...	https://www.npr.org/2024/08/28/1196983425/understanding-israels-raids-and-settler-expansion-in-the-west-bank	2024-08-28 21:01:38	8
452	Trump shooter saw rally as 'target of opportunity,' FBI says	The FBI says the gunman who targeted former President Donald Trump at a rally in Butler, Pa., in mid-July viewed it as a "target of opportunity."	https://www.npr.org/2024/08/28/g-s1-19944/trump-rally-assassination-motive-attack	2024-08-28 20:59:02	8
453	Supreme Court rebuffs Biden administration plea to restore SAVE student debt plan	The justices rejected an administration request to put most of the latest multibillion-dollar plan back into effect while lawsuits make their way through lower courts.	https://www.npr.org/2024/08/28/g-s1-19940/save-student-debt-plan-supreme-court-biden-administration	2024-08-28 20:15:05	8
454	Former elected official found guilty of murdering Las Vegas veteran reporter	An elected official in Las Vegas blamed his 2022 primary defeat on negative stories in the local newspaper. Now a jury has found him guilty of murdering the journalist who wrote them.	https://www.npr.org/2024/08/28/g-s1-19685/former-elected-official-found-guilty-of-murdering-las-vegas-veteran-reporter	2024-08-28 20:11:13	8
455	FAA grounds SpaceX ahead of historic Polaris Dawn commercial spacewalk	The Federal Aviation Administration opened the investigation after a rocket booster toppled aboard a drone ship after it was returning from lofting SpaceX's Starlink internet satellites into space.	https://www.npr.org/2024/08/28/g-s1-19934/faa-spacex-falcon9-grounded-polaris-dawn	2024-08-28 19:42:03	8
456	One Of The Rust Linux Kernel Maintainers Steps Down - Cites "Nontechnical Nonsense"	One of the several Rust for Linux kernel maintainers has decided to step away from the project. The move is being driven at least in part due to having to deal with increased "nontechnical nonsense" raised around Rust programming language use...	https://www.phoronix.com/news/Rust-Linux-Maintainer-Step-Down	2024-08-29 04:00:01	7
457	Mesa 24.2.1 Released, Mesa 24.1 Series Comes To An End	Mesa 24.2.1 was released today as the first bi-weekly point release to the newly-minted Mesa 24.2 stable series. This also marks the Mesa 24.1 series from last quarter drawing to a close with one last point release...	https://www.phoronix.com/news/Mesa-24.2.1-Released	2024-08-29 04:00:00	7
458	GNU Screen 5.0 Released With Rewritten Authentication Mechanism	The very useful GNU Screen program for multiplexing terminals between processes is out with a shiny new feature release...	https://www.phoronix.com/news/GNU-Screen-5.0	2024-08-29 01:38:04	7
459	Wireshark 4.4 Released For This Leading Network Protocol Analyzer	Wireshark 4.4 has been released as the newest version of this leading network protocol analyzer. Wireshark 4.4 brings many new and improved features...	https://www.phoronix.com/news/Wireshark-4.4-Released	2024-08-28 23:20:56	7
460	TUXEDO Sirius 16 Gen 2 Linux Laptop Pairs The AMD Ryzen 7 8845HS With Radeon RX 7600M XT	While AMD Ryzen AI 300 series laptops have begun appearing with Zen 5 CPU cores, to date the launched laptops have revolved around having either the integrated Radeon 890M RDNA3.5 graphics and/or NVIDIA GeForce discrete graphics. For those wanting...	https://www.phoronix.com/review/tuxedo-sirius16-gen2	2024-08-28 21:08:04	7
461	Microsoft Advances Its Open-Source Font For Developers With "Cascadia Next"	Back in 2019 Microsoft announced Cascadia Code as an open-source font designed for terminals and code editors. This monospaced font they view is great for developers like those using Visual Studio Code. Over the years Microsoft has further improved...	https://www.phoronix.com/news/Microsoft-Cascadia-Next	2024-08-28 19:11:30	7
462	Ubuntu 24.10 Prepares To Employ The Linux 6.11 Kernel	Thanks to the Canonical decision to commit to shipping the very latest upstream Linux kernels in Ubuntu releases moving forward, Ubuntu 24.10 shipping in October will have the Linux 6.11 kernel that is debuting as stable in mid-September....	https://www.phoronix.com/news/Ubuntu-24.10-Preps-Linux-6.11	2024-08-28 16:55:04	7
463	LLVM's Modern Fortran Compiler "Flang-New" Is Looking Good	The LLVM Fortran "Flang" compiler effort has been a long time coming over the years with this programming language continuing to be popular among some HPC codebases and other applications. The "Flang-New" compiler code has been maturing nicely and...	https://www.phoronix.com/news/LLVM-Flang-New-Looking-Good	2024-08-28 12:50:00	7
464	AMD PMC Driver Patches Submitted To Linux 6.11 Prepare For More Upcoming Zen 5 SoCs	The AMD PMC driver used for the SoC power management controller already supports the initial AMD Zen 5 SoCs but new patches coming in as "fixes" for the Linux 6.11 kernel extend the coverage for some upcoming AMD platforms...	https://www.phoronix.com/news/AMD-PMC-Linux-6.11-More-Zen-5	2024-08-28 11:00:00	7
465	Intel Posts New Patches For GPU Shared Virtual Memory With Xe Driver	Intel Linux graphics driver engineers continue to be very busy enabling the Xe Direct Rendering Manager that is becoming the default kernel graphics driver beginning with Xe2 Lunar Lake and Battlemage hardware (it currently works as an experimental...	https://www.phoronix.com/news/Intel-Xe-GPU-SVM-RFC-Patches	2024-08-28 10:40:00	7
466	Microsoft Azure Linux 3.0.20240824 Enables More Kernel Features, Adds XWayland	Azure Linux as Microsoft's in-house Linux operating system that is used for a variety of purposes is out with a new feature release...	https://www.phoronix.com/news/Azure-Linux-3.0.20240824	2024-08-28 10:10:15	7
467	Freedreno Gallium3D Enables Adreno 621 & 505 GPU Support	Being merged for Mesa 24.3 to the Freedreno open-source Gallium3D (OpenGL) driver for Qualcomm Adreno GPUs is now supporting the Adreno 621 and 505 graphics processors...	https://www.phoronix.com/news/Freedreno-Mesa-A505-A621	2024-08-28 09:45:28	7
488	Army says Arlington National Cemetery worker was 'pushed aside' by Trump aides	The statement Thursday comes in response to NPR's reporting on former President Donald Trump's visit to Arlington and an altercation his staff had with a cemetery employee.	https://www.npr.org/2024/08/29/nx-s1-5092087/trump-arlington-cemetery-altercation-video	2024-08-30 03:06:00	8
489	Trump said he'd vote for abortion rights in Florida. His campaign says not so fast	In an interview with NBC News, former President Donald Trump — the Republican nominee — indicated he will vote in favor of abortion rights in his home state of Florida, where it's on the ballot.	https://www.npr.org/2024/08/29/g-s1-20187/trump-ivf-funding-abortion-reproductive-rights-election-2024	2024-08-29 22:51:55	8
490	Should police be able to interrogate kids alone? A growing number of states say no	In most states, children and teenagers can waive their right to a lawyer during police questioning. Some states are now requiring that they speak to an attorney first.	https://www.npr.org/2024/08/29/nx-s1-4917976/juvenile-miranda-rights-police-interrogations	2024-08-29 21:48:56	8
491	Critics wary as China promises tighter fentanyl controls	Chinese factories churn out many of the chemicals used to make  fentanyl that kills 70,000 people each year in the U.S. China's government says new regulations are coming but critics are skeptical.	https://www.npr.org/2024/08/29/nx-s1-5089978/fentanyl-china-precursors	2024-08-29 21:20:00	8
492	Accusations that Amazon Mistreats Workers in India	Just like in the U.S., Amazon is a big e-commerce presence in India. And also like the U.S., Amazon's fulfillment centers in India have been the subject of complaints of unsafe conditions for workers. To understand what those conditions are like,...	https://www.npr.org/2024/08/29/1196983430/accusations-that-amazon-mistreats-workers-in-india	2024-08-29 20:33:59	8
493	Shohei Ohtani's dog 'throws out' 1st pitch at Dodgers game	To the delight of the sellout crowd, the star player’s pup Decoy “threw out” the ceremonial first pitch before a game at the Los Angeles stadium against the Baltimore Orioles.	https://www.npr.org/2024/08/29/nx-s1-5094463/shohei-ohtani-dog-first-pitch-dodgers	2024-08-29 19:48:00	8
494	Arlington National Cemetery meant to be 'neutral zone,' says military chaplain	Retired military chaplain David Peters, who has conducted services at Arlington National Cemetery, tells NPR's Michel Martin that the final resting place of some 400,000 U.S. service members is supposed to be free of politics.	https://www.npr.org/2024/08/29/nx-s1-5092074/retired-military-chaplain-reflects-on-trump-altercation-arlington-national-cemeterys-sacred-ground	2024-08-29 19:23:55	8
495	Where do different ideas of masculinity fit into the presidential election?	Richard Reeves, the author of ‘Of Boys and Men,’ offers insights on masculinity in politics.	https://www.npr.org/2024/08/29/nx-s1-5086473/richard-reeves-boys-men-masculinity-2024-elections	2024-08-29 18:34:19	8
496	FBI is still mishandling child sex crimes even after Nassar case, watchdog finds	The FBI's inspector general slammed the agency for not complying with reporting rules for child sex abuse, warning that failure to do so leads to continued abuse.	https://www.npr.org/2024/08/29/g-s1-20077/fbi-child-sex-abuse-larry-nassar	2024-08-29 18:13:49	8
497	When birds build nests, they're also building a culture	Nest-building isn’t just instinct. Birds can learn from others, letting groups within one species develop their own distinctive nest-building traditions.	https://www.npr.org/2024/08/29/nx-s1-5090967/birds-build-nests-tradition-culture-architecture	2024-08-29 18:00:24	8
498	Debian Orphans Bcachefs-Tools: "Impossible To Maintain In Debian Stable"	Even before the Bcachefs file-system driver was accepted into the mainline kernel, Debian for the past five years has offered a "bcachefs-tools" package to provide the user-space programs to this copy-on-write file-system. It was simple at first...	https://www.phoronix.com/news/Debian-Orphans-Bcachefs-Tools	2024-08-29 21:12:50	7
499	Ubuntu 24.04.1 LTS Released With All Stable Release Updates Included	Ubuntu 24.04.1 LTS has been released as the first point release of the current Long Term Support series that began in April with the "Noble Numbat" debut...	https://www.phoronix.com/news/Ubuntu-24.04.1-LTS-Released	2024-08-29 20:16:03	7
500	Linux 6.12 To Optionally Display A QR Code During Kernel Panics	Submitted today via DRM-Misc-Next to DRM-Next for staging ahead of the Linux 6.12 merge window in mid-September is optional support for displaying a QR code within the DRM Panic handler infrastructure when a Linux kernel panic occurs...	https://www.phoronix.com/news/Linux-6.12-DRM-Panic-QR-Code	2024-08-29 15:00:00	7
501	AmpereOne Performance Scaling From 32 To 192 Cores, Core-For-Core Benchmarks Against Ampere Altra Max	Earlier this week I began with AmpereOne A192-32X benchmarks and will continue for the next several weeks in finally having hands-on with the 192-core AArch64 server processor using a Supermicro ARS-211M-NR R13SPD 2U server platform. In today's...	https://www.phoronix.com/review/ampereone-benchmarks	2024-08-29 14:25:00	7
502	Intel Enables Xe2 Lunar Lake & Battlemage Graphics By Default With Linux 6.12	It's happening! The upcoming Linux 6.12 kernel cycle will be enabling the Xe2 graphics in Lunar Lake and Battlemage out-of-the-box / by-default. The Xe2 support within the open-source "Xe" kernel graphics driver appears to be stable enough now for...	https://www.phoronix.com/news/Linux-6.12-Intel-Xe2-Stable	2024-08-29 11:00:00	7
503	AMDVLK 2024.Q3.2 Brings "Strix 1" Support & Performance Tuning	Following the AMDVLK 2024.Q3.1 driver release from earlier in the month, AMDVLK 2024.Q3.2 is now available as the latest update to this official open-source AMD Radeon Vulkan driver for Linux systems...	https://www.phoronix.com/news/AMDVLK-2024.Q3.2-Released	2024-08-29 10:45:45	7
504	Intel's Current IAA & DSA Accelerators Aren't Safe For VMs Due To A Security Issue	With the Intel In-Memory Analytics Accelerator (IAA) and Data Streaming Accelerator (DSA) introduced first with Xeon Scalable "Sapphire Rapids" processors, they can be a big performance win for some workloads but can be a pain to setup and with...	https://www.phoronix.com/news/Intel-IAA-DSA-Security-VMs	2024-08-29 10:28:12	7
505	Mesa's Gallium3D Direct3D 9 "Nine" State Tracker To Be Retired	It's crazy that Gallium Nine is already a decade old for providing a Direct3D 9 (D3D9) state tracker implementation for Gallium3D hardware drivers. Gallium Nine was useful years ago for speeding up Direct3D 9 support when using Wine on Linux for...	https://www.phoronix.com/news/Mesa-Gallium3D-Nine-Sunset	2024-08-29 09:57:34	7
540	Israel recovers bodies of 6 hostages, including Israeli-American Hersh Goldberg-Polin	Hersh Goldberg-Polin became one of the most well-known captives held by Hamas as his parents met with world leaders and pressed for his release, including at the Democratic convention last month.	https://www.npr.org/2024/09/01/g-s1-20505/family-confirms-death-hersh-goldberg-polin	2024-09-01 04:32:13	8
541	Oasis says reunion tour tickets can only be resold at face value on official sites	Ticket prices for the U.K. tour have skyrocketed on resale sites since presale started Friday. The British rock band said tickets offered on the secondary market will be voided.	https://www.npr.org/2024/08/31/nx-s1-5096775/oasis-reunion-tour-tickets-resale-ticketmaster	2024-08-31 22:26:49	8
542	Over 17 million airline passengers head out for the busiest Labor Day weekend ever	This weekend caps a record-breaking season for travel, and those hitting the road will find lower gas prices than they did last year.	https://www.npr.org/2024/08/31/nx-s1-5096772/labor-day-travel-busy-flights-packed	2024-08-31 18:26:57	8
543	Mississippi bus crash kills 7 and injures 37	Seven people were killed and dozens were injured in Mississippi after a commercial bus overturned on Interstate 20 on Saturday morning. The bus was traveling near Bovina in Warren County.	https://www.npr.org/2024/08/31/nx-s1-5096784/fatal-mississippi-bus-crash	2024-08-31 17:43:41	8
544	As polio vaccinations begin in Gaza, U.N. says success hinges on a pause in fighting	Health care workers plan to reach more than 640,000 Palestinian children in a matter of days while Israel has agreed to staggered pauses in fighting.	https://www.npr.org/2024/08/31/nx-s1-5096742/gaza-polio-vaccination-israel-pause	2024-08-31 17:35:12	8
545	Children in Gaza who need medical care are not being allowed to evacuate, say aid groups	Aid groups that help families get a sick or injured child to another country for care say obtaining approval from Israel for the child and an adult companion to leave has become intensely difficult.	https://www.npr.org/sections/goats-and-soda/2024/08/31/g-s1-20287/children-in-gaza-who-need-medical-care-are-not-being-allowed-to-evacuate-say-aid-groups	2024-08-31 15:11:51	8
546	7 U.S. troops hurt in Iraq raid targeting Islamic State group militants that killed 15	The U.S. military and Iraq launched a joint raid targeting suspected Islamic State group militants that killed at least 15 people and saw seven U.S. troops hurt, officials said.	https://www.npr.org/2024/08/31/nx-s1-5096744/iraq-isis-us-military-raid	2024-08-31 12:45:10	8
547	Harris, Walz campaign in battleground of Georgia. Here's what it means for Trump	We look at how Vice President Kamala Harris and Tim Walz, are campaigning in the battleground state of Georgia, and what former President Trump will have to do to win back the state.	https://www.npr.org/2024/08/31/nx-s1-5094226/trump-georgia-harris-battleground	2024-08-31 11:51:39	8
548	Why the U.S. isn't ready for wars of the future, according to experts	These experts argue technological developments have changed warfare more in the past several years than the decades spanning from the introduction of the airplane.	https://www.npr.org/2024/08/31/g-s1-20106/us-war-warfare-drones-ai-pentagon-ukraine-gaza	2024-08-31 10:00:00	8
549	Too hot for trout: Why some anglers are rethinking their approach to fly fishing	As Western Montana's blue-ribbon trout waters warm due to climate change, anglers are increasingly wrestling with the ethics of their sport.	https://www.npr.org/2024/08/31/g-s1-19833/fishing-angling-trout-montana-water-climate-change-blackfoot-river	2024-08-31 09:15:00	8
550	Debian 12.7 Released With Many Security Updates	Debian 12.7 is out today as the latest stable release update for the Debian Bookworm series...	https://www.phoronix.com/news/Debian-12.7-Released	2024-08-31 17:46:53	7
551	Servo Browser Now Supports Tabbed Browsing, WAV Audio Files	The Rust-based, open-source Servo web engine had a very eventful month as the developers involved continue advancing this browser engine as well as their example/reference web browser...	https://www.phoronix.com/news/Servo-August-2024	2024-08-31 13:21:48	7
552	AMD Preferred Core Fix Lands Ahead Of Linux 6.11-rc6	This week's batch of power management fixes for the Linux 6.11 kernel are just a set of three patches for AMD processors...	https://www.phoronix.com/news/AMD-PM-Linux-6.11-rc6	2024-08-31 11:04:00	7
553	New AVX2 Code Helps FFmpeg With VVC Decoding Performance	A new AVX2 code path for FFmpeg's VVC decoding "vvcdec" is helping provide significant speed-ups for CPU-based H.266 decoding...	https://www.phoronix.com/news/FFmpeg-VVC-Decode-AVX2	2024-08-31 10:51:31	7
554	Wayland Protocols 1.37 Introduces Three New Protocols	Jonas Ådahl released Wayland-Protocols 1.37 as the newest update to this defined set of Wayland protocols. With the new release there are three new protocols added plus various other maintenance items addressed within the Wayland-Protocols...	https://www.phoronix.com/news/Wayland-Protocols-1.37	2024-08-31 10:32:15	7
555	KDE Desktop Will Remind You Yearly For Donations, Other Changes For Plasma 6.2	Plasma 6.2 this week entered its soft feature freeze ahead of the Plasma 6.2 stable release in October. The focus now is on bug-fixing for Plasma 6.2 and at the moment they are at 301 bug reports, which is their lowest amount going back to 2015....	https://www.phoronix.com/news/Plasma-6.2-Bug-Fixes-Start	2024-08-31 10:17:21	7
556	Intel Battlemage Battles More Linux 6.12 Kernel Graphics Driver Changes	Following the pull request from earlier this week that enables Intel Xe2 Lunar Lake and Battlemage graphics by default for Linux 6.12, a final set of feature updates for the Intel kernel graphics driver have been submitted ahead of this next kernel...	https://www.phoronix.com/news/Intel-Ends-Linux-612-Feature-Xe	2024-08-30 14:18:22	7
557	Vulkan 1.3.295 Released With Compute Shader Derivatives Extension	Following last week's Vulkan 1.3.294 with pipeline binary extension, Vulkan 1.3.295 is out today and it too introduces a prominent new extension...	https://www.phoronix.com/news/Vulkan-1.3.295-Released	2024-08-30 12:40:30	7
558	Microsoft Further Improves D3D12 Video Acceleration In Mesa	Microsoft engineers continue contributing to the open-source Mesa graphics driver code for benefiting Windows Subsystem for Linux (WSL) usage and other related use atop Windows 11. The latest contribution to Mesa is wiring up direct DPB management...	https://www.phoronix.com/news/Mesa-D3D12-Video-Direct-DPB	2024-08-30 10:53:02	7
559	Important Linux Patch Arriving For Intel Arrow Lake Graphics	While all of the focus recently when it comes to Intel's open-source Linux graphics driver has been around getting Lunar Lake and Battlemage graphics ready, there is an important last-minute fix that is also needed for ensuring Arrow Lake graphics...	https://www.phoronix.com/news/Intel-Require-Newer-ARL-GSC	2024-08-30 10:39:19	7
560	Rust Linux Developers Compared To Road Builders & Mapmakers	Longtime Direct Rendering Manager (DRM) subsystem maintainer David Airlie of Red Hat has written an interesting blog post providing an analogy to types of developers compared to road builders and hotels...	https://www.phoronix.com/news/Airlie-Rust-Linux-Dev-Compare	2024-08-30 10:23:34	7
561	VKD3D 1.13 Improves Direct3D 12 API Support Atop Vulkan	The Wine project has released VKD3D 1.13 as the newest version of this open-source code for mapping Microsoft's Direct3D 12 API atop the Vulkan API for helping to accelerate Windows games and applications on Linux...	https://www.phoronix.com/news/VKD3D-1.13-Released	2024-08-30 10:00:00	7
582	Linux 6.11-rc6 Released With More Bcachefs Fixes & Other Kernel Fixes	Like with last week's Linux 6.11-rc5 release, Linux 6.11-rc6 is out a half-day early due to Linus Torvalds' ongoing foreign travels. Linux 6.11-rc6 brings many more fixes to this kernel that will debut as stable in mid-September,..	https://www.phoronix.com/news/Linux-6.11-rc6-Released	2024-09-01 11:06:10	7
583	AMD Ryzen 9000 Series & Linux Kernel Drama Made For An Exciting August	August was a very busy month with the first AMD Ryzen 9000 series "Zen 5" desktop processors going on sale, finally having AmpereOne 192-core Arm processors in the lab, Linux kernel development continuing to advance at a brisk pace, and a variety...	https://www.phoronix.com/news/August-2024-Highlights	2024-09-01 10:58:30	7
584	FreeBSD 13.4-RC2 Brings Improvements For AMD Phoenix SoCs	FreeBSD 13.4 is due out in just over one week's time while this weekend brought FreeBSD 13.4-RC2 as the last planned test candidate...	https://www.phoronix.com/news/FreeBSD-13.4-RC2	2024-09-01 10:45:55	7
585	Panthor DRM Driver For Arm Mali Graphics Working On User Submission Handling	Arm engineer Mihail Atanassov proposed a set of "request for comments" patches this week for adding user submission support to the Panthor DRM driver that is used for handling newer Arm Mali graphics under Linux. This would allow user-space more...	https://www.phoronix.com/news/Panthor-Driver-User-Submission	2024-09-01 10:36:08	7
586	Intel oneVPL Preps For Battlemage, Adds AI-Based Super Resolution	Intel has released a new version of their open-source Video Processing Library (VPL) for hardware-accelerated video encode / decode / processing across Intel graphics hardware...	https://www.phoronix.com/news/Intel-oneVPL-2.13-Released	2024-09-01 10:28:03	7
624	Titanic research dive reveals discovery, decay and new photos	This summer, RMS Titanic, Inc. — the salvor-in-possession of the wreck — made its first unmanned dive to the wreck in 14 years. The team uncovered some rare finds — and losses.	https://www.npr.org/2024/09/02/nx-s1-5097403/titanic-dive-reveal-photo-research-discovery-statue	2024-09-02 13:00:00	8
625	Whatever happened to ... the Bolivian women who skateboard in Indigenous garb?	Skateboarding women of Bolivia wear Indigenous garb to pay homage to the strength of their mothers and grandmothers. Their motto: When you fall, you have the power to get back up.	https://www.npr.org/sections/goats-and-soda/2024/09/02/g-s1-20283/skateboard-bolivia-indigenous-women	2024-09-02 11:53:34	8
626	The labor movement could prove pivotal this election year	Younger generations are bringing fresh strategies to the U.S. labor movement. They could prove pivotal for the candidate who harnesses that energy.	https://www.npr.org/2024/09/02/g-s1-20539/labor-day-2024-election-gen-z	2024-09-02 11:00:00	8
627	This metabolic brain boost revives memory in Alzheimer’s mice	An experimental cancer drug that helps the brain turn glucose into energy was able to reverse memory loss in a mouse model of Alzheimer’s disease.	https://www.npr.org/sections/shots-health-news/2024/09/02/g-s1-20328/metabolic-brain-boost-revives-memory-alzheimers-mice	2024-09-02 11:00:00	8
628	5 takeaways from Germany's regional elections after far right makes historic gains	The Alternative for Germany party made huge gains in two eastern states, handing the German far right its best results since World War II.	https://www.npr.org/2024/09/02/nx-s1-5097895/5-takeaways-germanys-regional-elections	2024-09-02 10:38:23	8
629	'I got you, girl': A toll collector's unexpected reply to a driver's tears	When the toll collector asked Leahruth Jemilo how she was doing, she burst into tears. The collector's response has stayed with her ever since.	https://www.npr.org/2024/08/30/nx-s1-5096113/kindness-stranger-good-news-toll-collector	2024-09-02 10:00:00	8
630	Hear what the nation's top student podcasters have to say	In its sixth year, our contest handed over the mic to fourth graders for the very first time. We received nearly 2,000 entries from all around the country — and we've narrowed it down to 10 middle school and 10 high school finalists.	https://www.npr.org/2024/08/30/g-s1-19902/student-podcast-challenge-2024-finalists	2024-09-02 10:00:00	8
631	Wheelies look fun, but they're a serious skill for kids in wheelchairs	It takes skill and practice to navigate the world in a wheelchair. This summer program teaches kids how, one wheelie at a time.	https://www.npr.org/2024/09/02/g-s1-20071/wheelies-arent-just-fun-for-kids-in-wheelchairs-they-take-practice	2024-09-02 09:00:00	8
632	Israel's labor strike over hostages is called off after court order	A general strike in Israel to protest the government's failure to return hostages from Gaza led to some closures and disruptions. A major union said it was calling off the strike after a court order.	https://www.npr.org/2024/09/02/g-s1-20547/general-strike-in-israel-over-hostages-leads-to-uneven-closures	2024-09-02 08:19:17	8
633	The Darker Side of the Allies' D-Day Victory in France	In the summer of 1944, as American and Allied soldiers celebrated the liberation of France from the Nazis, one French family experienced a trauma that would be felt for generations. A murder and sexual assault so traumatic they are only now coming...	https://www.npr.org/2024/09/02/1197425307/the-darker-side-of-the-allies-d-day-victory-in-france	2024-09-02 07:00:00	8
614	A German far-right party wins its first state election	The far-right Alternative for Germany won a state election for the first time Sunday in the country's east, and was set to finish at least a very close second in a second vote, projections showed.	https://www.npr.org/2024/09/01/g-s1-20528/a-german-far-right-party-wins-its-first-state-election	2024-09-01 18:32:10	8
615	Israelis protest and workers' strike is planned after 6 more hostages die in Gaza	Israelis surged into the streets Sunday night to demand a cease-fire with Hamas after six hostages were found dead in Gaza. Israel's largest trade union also called a general strike for Monday.	https://www.npr.org/2024/09/01/g-s1-20521/protests-and-strike-are-planned-in-israel-after-hostage-deaths	2024-09-01 15:29:54	8
616	Russia says it downed over 150 drones in Ukrainian attack	Russian air defenses intercepted and destroyed 158 Ukrainian drones overnight, including two over Moscow and nine over the surrounding region, the Defense Ministry said Sunday.	https://www.npr.org/2024/09/01/g-s1-20509/russia-downed-drones-in-ukrainian-attack	2024-09-01 12:22:22	8
617	Whatever happened to ... the Rohingya refugee who won a U.N. award for his photos?	We catch up with Sahat Zia Hero, a winner last year of the Nansen Refugee Award for "outstanding work" helping displaced people. He is still making pictures: "This is a tough life."	https://www.npr.org/2024/09/01/g-s1-20025/whatever-happened-to-the-rohingya-refugee-who-won-a-u-n-award-for-his-photos	2024-09-01 11:19:28	8
618	2 years and counting. Inmate says medical delays still plague federal prison in Oregon	A federal prison in Oregon says it's made a dent in the backlog of prisoners' medical requests after a scathing DOJ report. One prisoner, Luke Thornhill, says that can't be farther from the truth.	https://www.npr.org/2024/08/29/nx-s1-5065930/sheridan-oregon-prison-medical-health-care-delays	2024-09-01 09:00:00	8
619	From lost followers to backlash in the comments, content creators reflect on the DNC	For the first time, the Democratic National Convention invited 200 content creators — including ones who never talk politics. Now that it's over, those creators and influencers have some notes.	https://www.npr.org/2024/09/01/nx-s1-5091076/dnc-content-creators-influencers-convention-tiktok-instagram	2024-09-01 09:00:00	8
634	AMD GCN3 / Fiji Support Being Retired From The GCC Compiler	The AMD GCN3 (GFX8) support and in particular the Fiji GPU support is being retired from the GNU Compiler Collection (GCC). The Fiji GPU support in the GCC compiler was already deprecated in part due to the LLVM compiler having already removed Fiji...	https://www.phoronix.com/news/AMD-GCN3-Fiji-GCC-Removal	2024-09-02 14:36:33	7
635	New Rust PHY Network Driver To Be Merged In Linux 6.12	One year ago the first Rust-written network PHY driver was merged for the Linux 6.8 kernel. Since then we've continued seeing steady progress on more Rust-written Linux network code. With the upcoming Linux 6.12 merge window another Rust PHY driver...	https://www.phoronix.com/news/New-Rust-PHY-Driver-Linux-6.12	2024-09-02 12:47:53	7
636	Intel Compute Runtime 24.31.30508.7 Brings Initial Xe2 Platform Support	Intel Compute Runtime 24.31.30508.7 was released this morning as the newest version of this OpenCL and oneAPI Level Zero compute stack used on both Windows and Linux platforms. Notable with the Intel Compute Runtime 24.31.30508.7 is having initial...	https://www.phoronix.com/news/Intel-Compute-24.31.30508.7	2024-09-02 11:00:00	7
637	GNOME Mutter 47.rc Ships Experimental Color Management Protocol	Ahead of this week's GNOME 47 release candidate announcement the "47.rc" versions of the GNOME Shell and Mutter were tagged on Sunday...	https://www.phoronix.com/news/GNOME-Mutter-47-RC	2024-09-02 10:34:59	7
638	Kdenlive 24.08 Video Editor Offers UI Improvements, Better Performance	Kdenlive as the KDE-aligned non-linear open-source video editing application is out with its newest feature release...	https://www.phoronix.com/news/Kdenlive-24.08-Released	2024-09-02 10:26:07	7
639	Armbian 24.8 Moves To Linux 6.10, Supports Newer ARM & RISC-V Boards	Armbian 24.8 has been released as the newest version of this Debian-based Linux distribution that began with a focus on ARM boards but has also expanded to include RISC-V as well as traditional x86_64 Intel/AMD systems too...	https://www.phoronix.com/news/Armbian-24.8-Released	2024-09-02 10:15:39	7
640	Steam On Linux Drops Below 2% For August 2024 Survey	With the start of the new month comes the Steam Survey results for the month prior. The August 2024 data is in and it points to the Steam on Linux statistics dipping back below 2%...	https://www.phoronix.com/news/Steam-Survey-August-2024	2024-09-02 00:49:34	7
676	How to sync Mac and Linux /home	the problem: My main computer is a Linux/BSD desktop, but I also use a Mac laptop for recording and travel. This created a problem keeping them in sync. I don’t like that the MacOS user’s home has directories like Movies and Pictures that we...	https://sive.rs/macx	2024-08-31 00:00:00	1
914	New Patches Bring Rust Linux Kernel Support To MIPS	When it comes to the Rust programming language support within the Linux kernel one of the limitations is that the CPU architecture support isn't as widespread. Currently Rust for Linux supports x86_64, AArch64 (ARM64) little-endian, LoongArch, and...	https://www.phoronix.com/news/Rust-Linux-Kernel-MIPS-Patches	2024-09-04 00:19:00	7
915	Android 15 Released To The Android Open-Source Project	Google announced today that the Android 15 source code has been released to the Android Open-Source Project (AOSP)...	https://www.phoronix.com/news/Android-15-AOSP-Release	2024-09-03 19:31:11	7
916	Debian Developers Figuring Out Plan For Removing More Unmaintained Packages	While there are more than 74k packages available within Debian's package management system for x86_64 systems, not all of the packages are well maintained and a portion of them haven't seen any maintenance/updates in ages. Debian developers have...	https://www.phoronix.com/news/Debian-Debates-Unmaintained-SW	2024-09-03 18:45:54	7
917	Intel Launches Core Ultra 200V "Lunar Lake" While Linux Support Settling	Intel formally announced their Core Ultra 200V series "Lunar Lake" laptop processors today in Berlin...	https://www.phoronix.com/news/Intel-Lunar-Lake-Launched	2024-09-03 16:30:17	7
918	AMD Zen 5 Tuning "Part Two" Merged For GCC Compiler	Merged today for the GCC 15 compiler in development and potentially for back-porting to the next GCC 14 point release is a second round of AMD Zen 5 "znver5" tuning...	https://www.phoronix.com/news/AMD-Zen-5-Tuning-Part-2-GCC	2024-09-03 14:30:02	7
919	Intel Battlemage OpenGL & Vulkan Driver Support Enabled By Default For Linux	Now that Linux 6.12 will enable Intel Battlemage and Lunar Lake graphics by default for the out-of-the-box kernel graphics driver support, the user-space Intel Mesa drivers with Iris Gallium3D (OpenGL) and ANV Vulkan are moving ahead to enable...	https://www.phoronix.com/news/Intel-Battlemage-Mesa-Default	2024-09-03 14:08:55	7
920	Samba 4.21 Released With LDAP TLS/SASL Channel Binding, Other Improvements	Samba 4.21 is out as the newest version of this SMB networking protocol implementation commonly used on Linux systems for file and print services interaction with Windows systems...	https://www.phoronix.com/news/Samba-4.21-Released	2024-09-03 13:48:36	7
921	Klp-build Proposed As A New Means Of Generating Linux Kernel Livepatch Modules	Posted today as a "request for comments" by longtime Linux developer Josh Poimboeuf of Red Hat is klp-build. The klp-build proposal is a new means of building livepatch modules for live-patching the Linux kernel to address bugs and security issues...	https://www.phoronix.com/news/Linux-Livepatch-klp-build	2024-09-03 12:41:33	7
922	F2FS Inline Tail Allows For Saving Space On Small Files & Reducing I/O	Patches posted to the Linux kernel mailing list today allow for inline tail support within the Flash-Friendly File-System (F2FS). This inline tail support allows for saving space when storing many small files and with reduced I/O can lead to faster...	https://www.phoronix.com/news/F2FS-Inline-Tail-Patches	2024-09-03 10:56:05	7
923	Power Profiles Daemon 0.22 Released With Several AMD Improvements	Power Profiles Daemon as the UPower project to make Linux laptop/system power profile handling via D-Bus is out with a new release. This is the Linux/open-source solution for exposing of power profiles to the Linux desktop and better managing the...	https://www.phoronix.com/news/Power-Profiles-Daemon-0.22	2024-09-03 10:41:32	7
924	Coreboot 24.08 Released With 31 New Motherboards, Initial Intel Panther Lake Support	Coreboot 24.08 debuted on Monday night as the newest feature release for this open-source system firmware project that allows replacing the proprietary BIOS/firmware on many different platforms. With Coreboot 24.08 comes more than 900 patches from...	https://www.phoronix.com/news/Coreboot-24.08-Released	2024-09-03 10:31:56	7
925	Google Increases AVIF Image Format Support With Google Search Support	While two years ago Google notably axed support for JPEG-XL within the Chrome web browser, they remain bullish on WebP and AVIF for imaging needs. This past week they finally announced Google Search is now supporting AVIF images...	https://www.phoronix.com/news/Google-Search-AVIF	2024-09-03 10:03:14	7
946	How to Read an RSS Feed with Java Using XOM	There are a lot of libraries for processing XML data with Java that can be used to read RSS feeds. One of the best is the open source library XOM created by the computer book author Elliotte Rusty Harold.As he wrote one of his 20 books about Java...	https://www.rssboard.org/news/221/read-rss-feed-java-using-xom	2023-08-02 03:25:57	14
947	The RSS Advisory Board Just Turned 20	"Tomorrow we will run faster, stretch out our arms farther."Today is the 20th birthday of the RSS Advisory Board, the group that publishes the RSS specification. It was formed on July 18, 2003, when the copyright of the specification was...	https://www.rssboard.org/news/220/rss-advisory-board-just-turned-20	2023-07-18 19:50:24	14
948	Downloading 50,000 Podcast Feeds to Analyze Their RSS	The software developer Niko Abeler has crawled 51,165 podcast feeds to study what RSS elements they contain. His comprehensive Podcast Feed Standard report looks at the usage of core RSS elements and namespace elements from Apple iTunes, Atom,...	https://www.rssboard.org/news/219/downloading-50000-podcast-feeds-analyze	2023-07-14 14:38:42	14
949	Tara Calishain Explains: What is RSS?	The exodus of users away from Twitter and Reddit has led many of those information refugees to discover the joy of subscribing to feeds in a reader. RSS and Atom feeds are an enormous open decentralized network that can never be ruined under new...	https://www.rssboard.org/news/218/tara-calishain-explains-rss	2023-07-13 01:45:48	14
950	Be Unique And Use RSS Guid Like Everybody Else	Winter scenes: Snowflakes by Theodor HorydczakIf you publish an RSS feed, you should do a solid for the developers of RSS readers by including a guid in each item. The guid's job is to be a unique identifier that helps software downloading your...	https://www.rssboard.org/news/217/unique-and-use-rss-guid-like-everybody	2023-07-11 02:30:01	14
951	Has the RSS Advisory Board Followed the Roadmap?	There has been recent discussion about the roadmap that was added to the RSS 2.0 specification in August 2002 announcing that there would be no new additions to RSS, freezing its set of elements and attributes forever and ever amen. The roadmap...	https://www.rssboard.org/news/216/has-rss-advisory-board-followed	2023-07-05 18:52:11	14
952	RSS Enclosure Support in Micro.Blog	An effort is underway to examine how feed publishers and feed consumers are handling the lack of clarity in the RSS 2.0 specification about whether an item can contain more than one enclosure. The RSS Best Practices Profile recommends that a feed...	https://www.rssboard.org/news/214/rss-enclosure-support-microblog	2023-07-03 03:35:33	14
953	Atom Feed Format Was Born 20 Years Ago	This month marks the 20th anniversary of the effort that became the Atom feed format. It all began on June 16, 2003, with a blog post from Apache Software Foundation contributor Sam Ruby asking for feedback about what constitutes a well-formed blog...	https://www.rssboard.org/news/213/atom-feed-format-born-20-years-ago	2023-06-29 20:39:54	14
954	How to Read an RSS Feed with PHP Using SimplePie	If you need to load an RSS feed with the PHP programming language, the open source library SimplePie greatly simplifies the process of pulling in items from a feed to present on a website, store in a database or do something else coooool with the...	https://www.rssboard.org/news/212/read-rss-feed-php-using	2023-06-26 19:08:40	14
955	Every Mastodon User Has an RSS Feed	The distributed social network Mastodon has grown to 12.8 million user accounts, supporting itself through user donations and a lot of effort by the volunteers running servers. There's no CEO changing the network at whim, no ads and no algorithms...	https://www.rssboard.org/news/211/every-mastodon-user-has-rss-feed	2023-06-24 12:34:48	14
956	RSS Enclosure Support in WordPress	One of the biggest challenges for a software developer implementing the RSS 2.0 specification is the issue of enclosures in a feed item. The specification is infamously unclear on whether an item allows one enclosure or multiple enclosures.The RSS...	https://www.rssboard.org/news/210/rss-enclosure-support-wordpress	2023-06-23 01:44:06	14
957	Where to Find the RSS Specification	The RSS Advisory Board has published the RSS 2.0 Specification for 20 years, releasing 10 revisions over that time. The current version of the specification can always be found at this URL:https://www.rssboard.org/rss-specificationThe revisions...	https://www.rssboard.org/news/209/find-rss-specification	2023-06-18 18:11:52	14
958	Should Feed Readers Count Unread Items?	Brent Simmons, the developer of the NetNewsWire RSS reader, is questioning his decision to put an unread count next to each feed, reasoning that it encourages people to be too obsessive about reading every item:Instead of a dozen bookmarks, people...	https://www.rssboard.org/news/208/should-feed-readers-count-unread-items	2014-04-02 15:12:53	14
959	WordPress Uses RSS as Blog Export Format	If you export your WordPress blog, it is delivered to you as an RSS feed that holds all of the blog's entries, pages and comments. WordPress makes use of five namespaces and calls the format WordPress eXtended RSS (WXR). I'm working on a Java...	https://www.rssboard.org/news/207/wordpress-uses-rss-blog-export-format	2014-03-11 20:18:14	14
960	Yahoo Groups Dropped RSS Feed Support	The RSS feeds of the RSS-Public and RSS-Board mailing lists are no longer available. Yahoo Groups used to offer feeds for each of its public lists, but Yahoo dropped support last year. A member of the service's product team said the feature was...	https://www.rssboard.org/news/206/yahoo-groups-dropped-rss-feed-support	2014-03-06 20:47:26	14
1025	Emma Navarro reaches her first Grand Slam at the U.S. Open with win over Paula Badosa	The 13th-seeded Navarro will next face Aryna Sabalenka, while Americans Taylor Fritz and Frances Tiafoe advanced to the semis on the men's side of the tournament.	https://www.npr.org/2024/09/04/g-s1-20727/emma-navarro-us-open-taylor-fritz-frances-tiafoe	2024-09-04 05:21:57	8
1026	Abuse claims trigger a reckoning in India's Mollywood	A report into sexual assault in one of India's most respected film industries has triggered a #MeToo-style reckoning.	https://www.npr.org/2024/09/03/nx-s1-5095743/abuse-claims-trigger-a-reckoning-in-indias-mollywood	2024-09-04 01:03:46	8
1027	Coastal flooding is getting more common, even on sunny days	High tide floods – when water collects in streets or even seeps into buildings on days without rain – are increasingly common in coastal areas as sea levels rise, a new report warns.	https://www.npr.org/2024/08/06/nx-s1-5057482/high-tide-floods-get-worse	2024-09-03 23:37:27	8
1028	U.S. charges Hamas leaders with terrorism over October attack in Israel	The Justice Department is charging six Hamas leaders with terrorism, including the architect of the group’s deadly Oct. 7 attack against Israel.	https://www.npr.org/2024/09/03/g-s1-20701/hamas-terrorism-us-israel-middle-east	2024-09-03 22:01:36	8
1029	Israel Mourns Dead Hostages; Gaza Civilians Don't Know Where to Go	Israel mourns six hostages, who were captured during the October 7th attacks by Hamas, and found by the Israeli military in Gaza, recently killed. We go to the funeral of one of the hostages, in Jerusalem.  And in Gaza, nearly all residents have...	https://www.npr.org/2024/09/03/1197477616/israel-mourns-dead-hostages-gaza-civilians-dont-know-where-to-go	2024-09-03 21:51:36	8
1030	5 things to know about the U.K.’s suspension of some arms exports to Israel	The U.K. exports explosive devices, guns and fighter jet components to Israel. But it's suspending some arms shipments, fearing Israel could used them in violation of international law.	https://www.npr.org/2024/09/03/nx-s1-5098300/uk-suspends-arms-israel	2024-09-03 21:09:42	8
1031	A new version of the 1977 Star Wars features a dub in a Native American language	A new version of the 1977 classic Star Wars opens in Minnesota theaters, now dubbed over in Ojibwe -- the indigenous language of one of the largest Native American tribes in the United States.	https://www.npr.org/2024/09/03/nx-s1-5094903-e1/encore-ojibwe-star-wars	2024-09-03 20:21:01	8
1032	Despite evidence, Trump calls Arlington Cemetery incident a 'made up story'	Meanwhile, members of Congress are asking for details about the incident, which was first reported by NPR.	https://www.npr.org/2024/09/03/g-s1-20680/trump-arlington-cemetery	2024-09-03 19:19:27	8
1033	'I want to write myself into existence,' says 'Colored Television' author	Danzy Senna was born in 1970, just a few years after Loving v. Virginia legalized interracial marriage. “Just merely existing as a family was a radical statement at that time,” she says.	https://www.npr.org/2024/09/03/nx-s1-5095921/colored-television-danzy-senna	2024-09-03 18:26:27	8
1034	Beloved 'Russian spy whale' Hvaldimir is found dead under mysterious circumstances	A beloved beluga whale with a mysterious past was found dead in the waters of Norway over the weekend. Admirers are paying tribute as authorities investigate.	https://www.npr.org/2024/09/03/nx-s1-5098968/hvaldimir-russian-spy-beluga-whale-dead	2024-09-03 17:34:13	8
1035	How Mozilla’s AI website creator, Solo, is shaking up a $2.1 billion industry	In the world of entrepreneurship, one business owner’s journey proves the power of simple technology. And group chats. When Richelle Samy founded Culture of Stamina, a coaching service, she set out to create an online presence that was elegant and...	https://blog.mozilla.org/en/mozilla/ai/mozilla-solo-artifical-intelligence-website-creator-ai/	2024-08-28 19:24:04	2
1036	Fakespot’s guide to trending back-to-school products	Back-to-school season is here, and TikTok is teeming with viral product recommendations. Gone are the days of battling crowded aisles and long checkout lines at big box stores. Now, with just a few clicks, you can have almost anything you want...	https://blog.mozilla.org/en/mozilla/news/fakespots-guide-to-trending-back-to-school-products/	2024-08-26 13:00:00	2
1045	Locale-sensitive text segmentation in JavaScript with Intl.Segmenter	Learn how to use Intl.Segmenter for locale-sensitive text segmentation in JavaScript to simplify localization, count words or sentences in different languages, and more.	https://developer.mozilla.org/en-US/blog/javascript-intl-segmenter-i18n/	2024-09-03 00:00:00	3
1046	Optimize your workflow with Git stash	Learn how to use Git stash to break down large commits. Discover a better approach for saving work when switching branches.	https://developer.mozilla.org/en-US/blog/optimize-your-workflow-git-stash/	2024-08-28 00:00:00	3
1125	VSE Workshop: August 2024	Write up on the workshop around the Video Sequence Editor that took place at the Blender HQ in August 2024.	https://code.blender.org/2024/08/vse-workshop-august-2024/	2024-08-26 13:26:41	9
882	Firefox 130 Now Available With WebCodecs API Enabled On The Desktop	Firefox 130 web browser binaries were published today ahead of the official release announcement going out on Tuesday. Firefox 130 isn't too particularly exciting but there are a few changes worth mentioning...	https://www.phoronix.com/news/Firefox-130	2024-09-03 00:22:13	7
\.


--
-- Data for Name: user_item; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.user_item (user_id, item_id, read, archived, read_at, archived_at) FROM stdin;
2	624	f	f	\N	\N
2	625	f	f	\N	\N
2	626	f	f	\N	\N
2	627	f	f	\N	\N
2	628	f	f	\N	\N
2	629	f	f	\N	\N
2	630	f	f	\N	\N
2	631	f	f	\N	\N
2	632	f	f	\N	\N
2	633	f	f	\N	\N
2	373	f	f	\N	\N
2	372	f	f	\N	\N
2	371	f	f	\N	\N
2	370	f	f	\N	\N
2	369	f	f	\N	\N
2	368	f	f	\N	\N
2	367	f	f	\N	\N
2	366	f	f	\N	\N
2	365	f	f	\N	\N
2	364	f	f	\N	\N
2	47	f	f	\N	\N
2	48	f	f	\N	\N
2	49	f	f	\N	\N
2	50	f	f	\N	\N
2	51	f	f	\N	\N
2	83	f	f	\N	\N
2	53	f	f	\N	\N
2	54	f	f	\N	\N
2	55	f	f	\N	\N
2	56	f	f	\N	\N
2	57	f	f	\N	\N
2	58	f	f	\N	\N
2	59	f	f	\N	\N
2	60	f	f	\N	\N
2	61	f	f	\N	\N
2	62	f	f	\N	\N
2	63	f	f	\N	\N
2	64	f	f	\N	\N
2	65	f	f	\N	\N
2	66	f	f	\N	\N
2	67	f	f	\N	\N
2	68	f	f	\N	\N
2	69	f	f	\N	\N
2	70	f	f	\N	\N
2	71	f	f	\N	\N
2	72	f	f	\N	\N
2	75	f	f	\N	\N
2	77	f	f	\N	\N
2	52	f	f	\N	\N
2	84	f	f	\N	\N
2	85	f	f	\N	\N
2	88	f	f	\N	\N
2	89	f	f	\N	\N
2	92	f	f	\N	\N
2	93	f	f	\N	\N
2	96	f	f	\N	\N
2	97	f	f	\N	\N
2	98	f	f	\N	\N
2	99	f	f	\N	\N
2	100	f	f	\N	\N
2	101	f	f	\N	\N
2	102	f	f	\N	\N
2	103	f	f	\N	\N
2	104	f	f	\N	\N
2	105	f	f	\N	\N
2	106	f	f	\N	\N
2	107	f	f	\N	\N
2	108	f	f	\N	\N
2	42	f	f	\N	\N
2	43	f	f	\N	\N
2	44	f	f	\N	\N
2	45	f	f	\N	\N
2	46	f	f	\N	\N
2	249	f	f	\N	\N
2	250	f	f	\N	\N
2	251	f	f	\N	\N
2	252	f	f	\N	\N
2	253	f	f	\N	\N
2	254	f	f	\N	\N
2	255	f	f	\N	\N
2	256	f	f	\N	\N
2	257	f	f	\N	\N
2	258	f	f	\N	\N
2	259	f	f	\N	\N
2	260	f	f	\N	\N
2	261	f	f	\N	\N
2	262	f	f	\N	\N
2	263	f	f	\N	\N
2	264	f	f	\N	\N
2	265	f	f	\N	\N
2	266	f	f	\N	\N
2	267	f	f	\N	\N
2	268	f	f	\N	\N
2	269	f	f	\N	\N
2	270	f	f	\N	\N
2	271	f	f	\N	\N
2	272	f	f	\N	\N
2	273	f	f	\N	\N
2	274	f	f	\N	\N
2	275	f	f	\N	\N
2	276	f	f	\N	\N
2	277	f	f	\N	\N
2	278	f	f	\N	\N
2	279	f	f	\N	\N
2	280	f	f	\N	\N
2	281	f	f	\N	\N
2	282	f	f	\N	\N
2	283	f	f	\N	\N
2	284	f	f	\N	\N
2	285	f	f	\N	\N
2	286	f	f	\N	\N
2	287	f	f	\N	\N
2	288	f	f	\N	\N
2	289	f	f	\N	\N
2	290	f	f	\N	\N
2	291	f	f	\N	\N
2	292	f	f	\N	\N
2	293	f	f	\N	\N
2	294	f	f	\N	\N
2	295	f	f	\N	\N
2	296	f	f	\N	\N
2	297	f	f	\N	\N
2	298	f	f	\N	\N
2	299	f	f	\N	\N
2	300	f	f	\N	\N
2	301	f	f	\N	\N
2	302	f	f	\N	\N
2	303	f	f	\N	\N
2	304	f	f	\N	\N
2	305	f	f	\N	\N
2	306	f	f	\N	\N
2	307	f	f	\N	\N
2	308	f	f	\N	\N
2	131	f	f	\N	\N
2	109	f	f	\N	\N
2	110	f	f	\N	\N
2	111	f	f	\N	\N
2	112	f	f	\N	\N
2	113	f	f	\N	\N
2	114	f	f	\N	\N
2	115	f	f	\N	\N
2	116	f	f	\N	\N
2	117	f	f	\N	\N
2	118	f	f	\N	\N
2	119	f	f	\N	\N
2	120	f	f	\N	\N
2	121	f	f	\N	\N
2	122	f	f	\N	\N
2	123	f	f	\N	\N
2	124	f	f	\N	\N
2	125	f	f	\N	\N
2	126	f	f	\N	\N
2	127	f	f	\N	\N
2	128	f	f	\N	\N
2	129	f	f	\N	\N
2	130	f	f	\N	\N
2	132	f	f	\N	\N
2	133	f	f	\N	\N
2	134	f	f	\N	\N
2	135	f	f	\N	\N
2	136	f	f	\N	\N
2	137	f	f	\N	\N
2	138	f	f	\N	\N
2	139	f	f	\N	\N
2	140	f	f	\N	\N
2	141	f	f	\N	\N
2	142	f	f	\N	\N
2	143	f	f	\N	\N
2	144	f	f	\N	\N
2	145	f	f	\N	\N
2	146	f	f	\N	\N
2	147	f	f	\N	\N
2	148	f	f	\N	\N
2	149	f	f	\N	\N
2	150	f	f	\N	\N
2	151	f	f	\N	\N
2	152	f	f	\N	\N
2	153	f	f	\N	\N
2	154	f	f	\N	\N
2	155	f	f	\N	\N
2	156	f	f	\N	\N
2	157	f	f	\N	\N
2	158	f	f	\N	\N
2	159	f	f	\N	\N
2	160	f	f	\N	\N
2	617	f	f	\N	\N
2	618	f	f	\N	\N
2	619	f	f	\N	\N
2	614	f	f	\N	\N
2	615	f	f	\N	\N
2	616	f	f	\N	\N
2	161	f	f	\N	\N
2	162	f	f	\N	\N
2	163	f	f	\N	\N
2	164	f	f	\N	\N
2	165	f	f	\N	\N
2	166	f	f	\N	\N
2	167	f	f	\N	\N
2	168	f	f	\N	\N
2	169	f	f	\N	\N
2	170	f	f	\N	\N
2	171	f	f	\N	\N
2	172	f	f	\N	\N
2	173	f	f	\N	\N
2	174	f	f	\N	\N
2	175	f	f	\N	\N
2	176	f	f	\N	\N
2	177	f	f	\N	\N
2	178	f	f	\N	\N
2	179	f	f	\N	\N
2	180	f	f	\N	\N
2	181	f	f	\N	\N
2	182	f	f	\N	\N
2	183	f	f	\N	\N
2	184	f	f	\N	\N
2	185	f	f	\N	\N
2	186	f	f	\N	\N
2	187	f	f	\N	\N
2	188	f	f	\N	\N
2	189	f	f	\N	\N
2	190	f	f	\N	\N
2	191	f	f	\N	\N
2	192	f	f	\N	\N
2	193	f	f	\N	\N
2	194	f	f	\N	\N
2	195	f	f	\N	\N
2	196	f	f	\N	\N
2	197	f	f	\N	\N
2	198	f	f	\N	\N
2	199	f	f	\N	\N
2	200	f	f	\N	\N
2	201	f	f	\N	\N
2	202	f	f	\N	\N
2	203	f	f	\N	\N
2	204	f	f	\N	\N
2	205	f	f	\N	\N
2	206	f	f	\N	\N
2	207	f	f	\N	\N
2	208	f	f	\N	\N
2	209	f	f	\N	\N
2	210	f	f	\N	\N
2	211	f	f	\N	\N
2	212	f	f	\N	\N
2	213	f	f	\N	\N
2	214	f	f	\N	\N
2	215	f	f	\N	\N
2	216	f	f	\N	\N
2	217	f	f	\N	\N
2	218	f	f	\N	\N
2	219	f	f	\N	\N
2	220	f	f	\N	\N
2	221	f	f	\N	\N
2	222	f	f	\N	\N
2	223	f	f	\N	\N
2	224	f	f	\N	\N
2	225	f	f	\N	\N
2	226	f	f	\N	\N
2	227	f	f	\N	\N
2	228	f	f	\N	\N
2	229	f	f	\N	\N
2	230	f	f	\N	\N
2	231	f	f	\N	\N
2	232	f	f	\N	\N
2	233	f	f	\N	\N
2	234	f	f	\N	\N
2	235	f	f	\N	\N
2	236	f	f	\N	\N
2	237	f	f	\N	\N
2	238	f	f	\N	\N
2	239	f	f	\N	\N
2	240	f	f	\N	\N
2	241	f	f	\N	\N
2	242	f	f	\N	\N
2	243	f	f	\N	\N
2	244	f	f	\N	\N
2	245	f	f	\N	\N
2	246	f	f	\N	\N
2	247	f	f	\N	\N
2	248	f	f	\N	\N
2	421	f	f	\N	\N
2	340	f	f	\N	\N
2	341	f	f	\N	\N
2	342	f	f	\N	\N
2	343	f	f	\N	\N
2	344	f	f	\N	\N
2	345	f	f	\N	\N
2	346	f	f	\N	\N
2	347	f	f	\N	\N
2	348	f	f	\N	\N
2	349	f	f	\N	\N
2	350	f	f	\N	\N
2	351	f	f	\N	\N
2	352	f	f	\N	\N
2	353	f	f	\N	\N
2	354	f	f	\N	\N
2	355	f	f	\N	\N
2	356	f	f	\N	\N
2	357	f	f	\N	\N
2	358	f	f	\N	\N
2	359	f	f	\N	\N
2	360	f	f	\N	\N
2	338	f	f	\N	\N
2	337	f	f	\N	\N
2	336	f	f	\N	\N
2	335	f	f	\N	\N
2	334	f	f	\N	\N
2	333	f	f	\N	\N
2	332	f	f	\N	\N
2	331	f	f	\N	\N
2	330	f	f	\N	\N
2	329	f	f	\N	\N
2	414	f	f	\N	\N
2	434	f	f	\N	\N
2	435	f	f	\N	\N
2	436	f	f	\N	\N
2	437	f	f	\N	\N
2	438	f	f	\N	\N
2	439	f	f	\N	\N
2	440	f	f	\N	\N
2	441	f	f	\N	\N
2	328	f	f	\N	\N
2	327	f	f	\N	\N
2	326	f	f	\N	\N
2	325	f	f	\N	\N
2	324	f	f	\N	\N
2	323	f	f	\N	\N
2	322	f	f	\N	\N
2	321	f	f	\N	\N
2	320	f	f	\N	\N
2	319	f	f	\N	\N
2	318	f	f	\N	\N
2	317	f	f	\N	\N
2	316	f	f	\N	\N
2	315	f	f	\N	\N
2	314	f	f	\N	\N
2	313	f	f	\N	\N
2	312	f	f	\N	\N
2	311	f	f	\N	\N
2	310	f	f	\N	\N
2	309	f	f	\N	\N
2	582	f	f	\N	\N
2	586	f	f	\N	\N
2	585	f	f	\N	\N
2	584	f	f	\N	\N
2	583	f	f	\N	\N
2	415	f	f	\N	\N
2	416	f	f	\N	\N
2	417	f	f	\N	\N
2	418	f	f	\N	\N
2	419	f	f	\N	\N
2	420	f	f	\N	\N
2	339	f	f	\N	\N
2	422	f	f	\N	\N
2	423	f	f	\N	\N
2	424	f	f	\N	\N
2	425	f	f	\N	\N
2	426	f	f	\N	\N
2	427	f	f	\N	\N
2	428	f	f	\N	\N
2	429	f	f	\N	\N
2	430	f	f	\N	\N
2	431	f	f	\N	\N
2	432	f	f	\N	\N
2	433	f	f	\N	\N
2	634	f	f	\N	\N
2	635	f	f	\N	\N
3	635	f	f	\N	\N
2	636	f	f	\N	\N
3	636	f	f	\N	\N
2	1	f	f	\N	\N
2	2	f	f	\N	\N
2	3	f	f	\N	\N
2	4	f	f	\N	\N
2	5	f	f	\N	\N
2	6	f	f	\N	\N
2	7	f	f	\N	\N
2	8	f	f	\N	\N
2	9	f	f	\N	\N
2	10	f	f	\N	\N
2	11	f	f	\N	\N
2	12	f	f	\N	\N
2	13	f	f	\N	\N
2	14	f	f	\N	\N
2	15	f	f	\N	\N
2	16	f	f	\N	\N
2	17	f	f	\N	\N
2	18	f	f	\N	\N
2	19	f	f	\N	\N
2	20	f	f	\N	\N
2	21	f	f	\N	\N
2	22	f	f	\N	\N
2	23	f	f	\N	\N
2	24	f	f	\N	\N
2	25	f	f	\N	\N
2	26	f	f	\N	\N
2	27	f	f	\N	\N
2	28	f	f	\N	\N
2	29	f	f	\N	\N
2	30	f	f	\N	\N
2	31	f	f	\N	\N
2	32	f	f	\N	\N
2	33	f	f	\N	\N
2	34	f	f	\N	\N
2	35	f	f	\N	\N
2	36	f	f	\N	\N
2	37	f	f	\N	\N
2	38	f	f	\N	\N
2	39	f	f	\N	\N
2	40	f	f	\N	\N
2	41	f	f	\N	\N
3	414	f	f	\N	\N
3	415	f	f	\N	\N
3	582	f	f	\N	\N
3	416	f	f	\N	\N
3	417	f	f	\N	\N
3	418	f	f	\N	\N
3	419	f	f	\N	\N
3	420	f	f	\N	\N
3	421	f	f	\N	\N
3	422	f	f	\N	\N
3	423	f	f	\N	\N
3	424	f	f	\N	\N
3	425	f	f	\N	\N
3	426	f	f	\N	\N
3	427	f	f	\N	\N
3	428	f	f	\N	\N
3	429	f	f	\N	\N
3	430	f	f	\N	\N
3	431	f	f	\N	\N
3	462	f	f	\N	\N
3	432	f	f	\N	\N
3	559	f	f	\N	\N
3	433	f	f	\N	\N
3	463	f	f	\N	\N
3	434	f	f	\N	\N
3	503	f	f	\N	\N
3	435	f	f	\N	\N
3	464	f	f	\N	\N
3	436	f	f	\N	\N
3	552	f	f	\N	\N
3	437	f	f	\N	\N
3	465	f	f	\N	\N
3	438	f	f	\N	\N
3	504	f	f	\N	\N
3	439	f	f	\N	\N
3	466	f	f	\N	\N
3	440	f	f	\N	\N
3	557	f	f	\N	\N
3	441	f	f	\N	\N
3	467	f	f	\N	\N
3	442	f	f	\N	\N
3	505	f	f	\N	\N
3	443	f	f	\N	\N
3	553	f	f	\N	\N
3	444	f	f	\N	\N
3	586	f	f	\N	\N
3	445	f	f	\N	\N
3	561	f	f	\N	\N
3	585	f	f	\N	\N
3	554	f	f	\N	\N
3	584	f	f	\N	\N
3	558	f	f	\N	\N
3	583	f	f	\N	\N
2	637	f	f	\N	\N
3	637	f	f	\N	\N
2	638	f	f	\N	\N
3	638	f	f	\N	\N
2	639	f	f	\N	\N
3	639	f	f	\N	\N
2	640	f	f	\N	\N
3	640	f	f	\N	\N
2	676	f	f	\N	\N
2	540	f	f	\N	\N
2	549	f	f	\N	\N
2	548	f	f	\N	\N
2	547	f	f	\N	\N
2	546	f	f	\N	\N
2	545	f	f	\N	\N
2	544	f	f	\N	\N
2	543	f	f	\N	\N
2	542	f	f	\N	\N
2	541	f	f	\N	\N
2	497	f	f	\N	\N
2	496	f	f	\N	\N
2	495	f	f	\N	\N
2	494	f	f	\N	\N
2	493	f	f	\N	\N
2	492	f	f	\N	\N
2	491	f	f	\N	\N
2	490	f	f	\N	\N
2	489	f	f	\N	\N
2	488	f	f	\N	\N
2	455	f	f	\N	\N
2	454	f	f	\N	\N
2	453	f	f	\N	\N
2	452	f	f	\N	\N
2	451	f	f	\N	\N
2	450	f	f	\N	\N
2	449	f	f	\N	\N
2	448	f	f	\N	\N
2	447	f	f	\N	\N
2	446	f	f	\N	\N
2	442	f	f	\N	\N
2	443	f	f	\N	\N
2	444	f	f	\N	\N
2	445	f	f	\N	\N
2	456	f	f	\N	\N
2	457	f	f	\N	\N
2	458	f	f	\N	\N
2	459	f	f	\N	\N
2	460	f	f	\N	\N
2	461	f	f	\N	\N
2	462	f	f	\N	\N
2	463	f	f	\N	\N
2	464	f	f	\N	\N
2	465	f	f	\N	\N
2	466	f	f	\N	\N
2	467	f	f	\N	\N
2	498	f	f	\N	\N
2	499	f	f	\N	\N
2	500	f	f	\N	\N
2	501	f	f	\N	\N
2	502	f	f	\N	\N
2	503	f	f	\N	\N
2	504	f	f	\N	\N
2	505	f	f	\N	\N
2	550	f	f	\N	\N
2	551	f	f	\N	\N
2	552	f	f	\N	\N
2	553	f	f	\N	\N
2	554	f	f	\N	\N
2	555	f	f	\N	\N
2	556	f	f	\N	\N
2	557	f	f	\N	\N
2	558	f	f	\N	\N
2	559	f	f	\N	\N
2	560	f	f	\N	\N
2	561	f	f	\N	\N
3	555	f	f	\N	\N
3	498	f	f	\N	\N
3	560	f	f	\N	\N
3	499	f	f	\N	\N
3	456	f	f	\N	\N
3	550	f	f	\N	\N
3	457	f	f	\N	\N
3	500	f	f	\N	\N
3	458	f	f	\N	\N
3	556	f	f	\N	\N
3	459	f	f	\N	\N
3	501	f	f	\N	\N
3	460	f	f	\N	\N
3	551	f	f	\N	\N
3	461	f	f	\N	\N
3	502	f	f	\N	\N
2	882	f	f	\N	\N
3	882	f	f	\N	\N
2	914	f	f	\N	\N
3	914	f	f	\N	\N
2	915	f	f	\N	\N
3	915	f	f	\N	\N
2	916	f	f	\N	\N
3	916	f	f	\N	\N
2	917	f	f	\N	\N
3	917	f	f	\N	\N
2	918	f	f	\N	\N
3	918	f	f	\N	\N
2	919	f	f	\N	\N
3	919	f	f	\N	\N
2	920	f	f	\N	\N
3	920	f	f	\N	\N
2	921	f	f	\N	\N
3	921	f	f	\N	\N
2	922	f	f	\N	\N
3	922	f	f	\N	\N
2	923	f	f	\N	\N
3	923	f	f	\N	\N
2	924	f	f	\N	\N
3	924	f	f	\N	\N
2	925	f	f	\N	\N
3	925	f	f	\N	\N
3	946	f	f	\N	\N
3	947	f	f	\N	\N
3	948	f	f	\N	\N
3	949	f	f	\N	\N
3	950	f	f	\N	\N
3	951	f	f	\N	\N
3	952	f	f	\N	\N
3	953	f	f	\N	\N
3	954	f	f	\N	\N
3	955	f	f	\N	\N
3	956	f	f	\N	\N
3	957	f	f	\N	\N
3	958	f	f	\N	\N
3	959	f	f	\N	\N
3	960	f	f	\N	\N
3	634	f	f	\N	\N
2	1025	f	f	\N	\N
2	1026	f	f	\N	\N
2	1027	f	f	\N	\N
2	1028	f	f	\N	\N
2	1029	f	f	\N	\N
2	1030	f	f	\N	\N
2	1031	f	f	\N	\N
2	1032	f	f	\N	\N
2	1033	f	f	\N	\N
2	1034	f	f	\N	\N
2	1035	f	f	\N	\N
2	1036	f	f	\N	\N
2	1045	f	f	\N	\N
2	1046	f	f	\N	\N
2	1125	f	f	\N	\N
\.


--
-- Data for Name: collection_useritem; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.collection_useritem (collection_id, user_id, item_id) FROM stdin;
43	2	624
43	2	625
43	2	626
43	2	627
43	2	628
43	2	629
43	2	630
43	2	631
43	2	632
43	2	633
43	2	373
43	2	372
43	2	371
43	2	370
43	2	369
43	2	368
43	2	367
43	2	366
43	2	365
43	2	364
40	2	47
40	2	48
40	2	49
40	2	50
40	2	51
40	2	83
40	2	53
40	2	54
40	2	55
40	2	56
40	2	57
40	2	58
40	2	59
40	2	60
40	2	61
40	2	62
40	2	63
40	2	64
40	2	65
40	2	66
40	2	67
40	2	68
40	2	69
40	2	70
40	2	71
40	2	72
40	2	75
40	2	77
40	2	52
40	2	84
40	2	85
40	2	88
40	2	89
40	2	92
40	2	93
40	2	96
40	2	97
40	2	98
40	2	99
40	2	100
40	2	101
40	2	102
40	2	103
40	2	104
40	2	105
40	2	106
40	2	107
40	2	108
40	2	42
40	2	43
40	2	44
40	2	45
40	2	46
42	2	249
42	2	250
42	2	251
42	2	252
42	2	253
42	2	254
42	2	255
42	2	256
42	2	257
42	2	258
42	2	259
42	2	260
42	2	261
42	2	262
42	2	263
42	2	264
42	2	265
42	2	266
42	2	267
42	2	268
42	2	269
42	2	270
42	2	271
42	2	272
42	2	273
42	2	274
42	2	275
42	2	276
42	2	277
42	2	278
42	2	279
42	2	280
42	2	281
42	2	282
42	2	283
42	2	284
42	2	285
42	2	286
42	2	287
42	2	288
42	2	289
42	2	290
42	2	291
42	2	292
42	2	293
42	2	294
42	2	295
42	2	296
42	2	297
42	2	298
42	2	299
42	2	300
42	2	301
42	2	302
42	2	303
42	2	304
42	2	305
42	2	306
42	2	307
42	2	308
42	2	131
42	2	109
42	2	110
42	2	111
42	2	112
42	2	113
42	2	114
42	2	115
42	2	116
42	2	117
42	2	118
42	2	119
42	2	120
42	2	121
42	2	122
42	2	123
42	2	124
42	2	125
42	2	126
42	2	127
42	2	128
42	2	129
42	2	130
42	2	132
42	2	133
42	2	134
42	2	135
42	2	136
42	2	137
42	2	138
42	2	139
42	2	140
42	2	141
42	2	142
42	2	143
42	2	144
42	2	145
42	2	146
42	2	147
42	2	148
42	2	149
42	2	150
42	2	151
42	2	152
42	2	153
42	2	154
42	2	155
42	2	156
42	2	157
42	2	158
42	2	159
42	2	160
43	2	617
43	2	618
43	2	619
43	2	614
43	2	615
43	2	616
42	2	161
42	2	162
42	2	163
42	2	164
42	2	165
42	2	166
42	2	167
42	2	168
42	2	169
42	2	170
42	2	171
42	2	172
42	2	173
42	2	174
42	2	175
42	2	176
42	2	177
42	2	178
42	2	179
42	2	180
42	2	181
42	2	182
42	2	183
42	2	184
42	2	185
42	2	186
42	2	187
42	2	188
42	2	189
42	2	190
42	2	191
42	2	192
42	2	193
42	2	194
42	2	195
42	2	196
42	2	197
42	2	198
42	2	199
42	2	200
42	2	201
42	2	202
42	2	203
42	2	204
42	2	205
42	2	206
42	2	207
42	2	208
42	2	209
42	2	210
42	2	211
42	2	212
42	2	213
42	2	214
42	2	215
42	2	216
42	2	217
42	2	218
42	2	219
42	2	220
42	2	221
42	2	222
42	2	223
42	2	224
42	2	225
42	2	226
42	2	227
42	2	228
42	2	229
42	2	230
42	2	231
42	2	232
42	2	233
42	2	234
42	2	235
42	2	236
42	2	237
42	2	238
42	2	239
42	2	240
42	2	241
42	2	242
42	2	243
42	2	244
42	2	245
42	2	246
42	2	247
42	2	248
41	2	421
41	2	340
41	2	341
41	2	342
41	2	343
41	2	344
41	2	345
41	2	346
41	2	347
41	2	348
41	2	349
41	2	350
41	2	351
41	2	352
41	2	353
41	2	354
41	2	355
41	2	356
41	2	357
41	2	358
41	2	359
41	2	360
41	2	338
41	2	337
41	2	336
41	2	335
41	2	334
41	2	333
41	2	332
41	2	331
41	2	330
41	2	329
41	2	414
41	2	434
41	2	435
41	2	436
41	2	437
41	2	438
41	2	439
41	2	440
41	2	441
41	2	328
41	2	327
41	2	326
41	2	325
41	2	324
41	2	323
41	2	322
41	2	321
41	2	320
41	2	319
41	2	318
41	2	317
41	2	316
41	2	315
41	2	314
41	2	313
41	2	312
41	2	311
41	2	310
41	2	309
41	2	582
41	2	586
41	2	585
41	2	584
41	2	583
41	2	415
41	2	416
41	2	417
41	2	418
41	2	419
41	2	420
41	2	339
41	2	422
41	2	423
41	2	424
41	2	425
41	2	426
41	2	427
41	2	428
41	2	429
41	2	430
41	2	431
41	2	432
41	2	433
41	2	634
41	3	634
41	2	635
41	3	635
41	2	636
41	3	636
43	2	1
43	2	2
43	2	3
43	2	4
43	2	5
43	2	6
43	2	7
43	2	8
43	2	9
43	2	10
40	2	11
40	2	12
40	2	13
40	2	14
40	2	15
40	2	16
40	2	17
40	2	18
40	2	19
40	2	20
40	2	21
40	2	22
40	2	23
40	2	24
40	2	25
40	2	26
40	2	27
40	2	28
40	2	29
40	2	30
40	2	31
40	2	32
40	2	33
40	2	34
40	2	35
40	2	36
40	2	37
40	2	38
40	2	39
40	2	40
40	2	41
44	3	414
44	3	415
44	3	582
44	3	416
44	3	417
44	3	418
44	3	419
44	3	420
44	3	421
44	3	422
44	3	423
44	3	424
44	3	425
44	3	426
44	3	427
44	3	428
44	3	429
44	3	430
44	3	431
44	3	462
44	3	432
44	3	559
44	3	433
44	3	463
44	3	434
44	3	503
44	3	435
44	3	464
44	3	436
44	3	552
44	3	437
44	3	465
44	3	438
44	3	504
44	3	439
44	3	466
44	3	440
44	3	557
44	3	441
44	3	467
44	3	442
44	3	505
44	3	443
44	3	553
44	3	444
44	3	586
44	3	445
44	3	561
44	3	585
44	3	554
44	3	584
44	3	558
44	3	583
41	2	637
41	3	637
41	2	638
41	3	638
41	2	639
41	3	639
41	2	640
41	3	640
42	2	676
43	2	540
43	2	549
43	2	548
43	2	547
43	2	546
43	2	545
43	2	544
43	2	543
43	2	542
43	2	541
43	2	497
43	2	496
43	2	495
43	2	494
43	2	493
43	2	492
43	2	491
43	2	490
43	2	489
43	2	488
43	2	455
43	2	454
43	2	453
43	2	452
43	2	451
43	2	450
43	2	449
43	2	448
43	2	447
43	2	446
41	2	442
41	2	443
41	2	444
41	2	445
41	2	456
41	2	457
41	2	458
41	2	459
41	2	460
41	2	461
41	2	462
41	2	463
41	2	464
41	2	465
41	2	466
41	2	467
41	2	498
41	2	499
41	2	500
41	2	501
41	2	502
41	2	503
41	2	504
41	2	505
41	2	550
41	2	551
41	2	552
41	2	553
41	2	554
41	2	555
41	2	556
41	2	557
41	2	558
41	2	559
41	2	560
41	2	561
44	3	555
44	3	498
44	3	560
44	3	499
44	3	456
44	3	550
44	3	457
44	3	500
44	3	458
44	3	556
44	3	459
44	3	501
44	3	460
44	3	551
44	3	461
44	3	502
44	2	882
44	3	882
44	2	914
44	3	914
44	2	915
44	3	915
44	2	916
44	3	916
44	2	917
44	3	917
44	2	918
44	3	918
44	2	919
44	3	919
44	2	920
44	3	920
44	2	921
44	3	921
44	2	922
44	3	922
44	2	923
44	3	923
44	2	924
44	3	924
44	2	925
44	3	925
52	3	946
52	3	947
52	3	948
52	3	949
52	3	950
52	3	951
52	3	952
52	3	953
52	3	954
52	3	955
52	3	956
52	3	957
52	3	958
52	3	959
52	3	960
43	2	1025
43	2	1026
43	2	1027
43	2	1028
43	2	1029
43	2	1030
43	2	1031
43	2	1032
43	2	1033
43	2	1034
40	2	1035
40	2	1036
40	2	1045
40	2	1046
40	2	1125
\.


--
-- Data for Name: user_feed; Type: TABLE DATA; Schema: public; Owner: inflow
--

COPY public.user_feed (user_id, feed_id, title, description, collection_id) FROM stdin;
2	10	\N	\N	39
2	9	\N	\N	40
2	4	\N	\N	40
2	3	\N	\N	40
2	2	\N	\N	40
2	11	\N	\N	41
2	7	\N	\N	41
2	6	\N	\N	41
2	5	\N	\N	42
2	1	\N	\N	42
2	8	\N	\N	43
3	7	\N	\N	44
3	11	\N	\N	44
3	14	\N	\N	52
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inflow
--

SELECT pg_catalog.setval('public.category_id_seq', 52, true);


--
-- Name: feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inflow
--

SELECT pg_catalog.setval('public.feed_id_seq', 15, true);


--
-- Name: feeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inflow
--

SELECT pg_catalog.setval('public.feeditem_id_seq', 1144, true);


--
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: inflow
--

SELECT pg_catalog.setval('public.user_account_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

