SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Create schemas
DROP SCHEMA IF EXISTS staging;
DROP SCHEMA IF EXISTS statistics;

CREATE SCHEMA IF NOT EXISTS staging AUTHORIZATION postgres;

CREATE SCHEMA IF NOT EXISTS statistics AUTHORIZATION postgres;

-- Create tables
DROP TABLE IF EXISTS statistics.county;
DROP TABLE IF EXISTS statistics.county_metric;
DROP TABLE IF EXISTS statistics.state;

CREATE TABLE IF NOT EXISTS statistics.county
(
    county_fips integer,
    state_code character(2) COLLATE pg_catalog."default",
    county_name character varying(50) COLLATE pg_catalog."default"
);

ALTER TABLE IF EXISTS statistics.county OWNER to postgres;


CREATE TABLE IF NOT EXISTS statistics.county_metric
(
    county_fips integer,
    year smallint,
    bea_total_income bigint,
    population bigint,
    bls_labor_force bigint,
    bls_employed bigint
);

ALTER TABLE IF EXISTS statistics.county_metric OWNER to postgres;


CREATE TABLE IF NOT EXISTS statistics.state
(
    state_code character(2) COLLATE pg_catalog."default",
    state_name character varying(50) COLLATE pg_catalog."default"
);

ALTER TABLE IF EXISTS statistics.state OWNER to postgres;

-- Copy data

COPY statistics.county (county_fips, state_code, county_name) FROM stdin;
1001	AL	Autauga
1003	AL	Baldwin
1005	AL	Barbour
1007	AL	Bibb
1009	AL	Blount
1011	AL	Bullock
1013	AL	Butler
1015	AL	Calhoun
1017	AL	Chambers
1019	AL	Cherokee
1021	AL	Chilton
1023	AL	Choctaw
1025	AL	Clarke
1027	AL	Clay
1029	AL	Cleburne
1031	AL	Coffee
1033	AL	Colbert
1035	AL	Conecuh
1037	AL	Coosa
1039	AL	Covington
1041	AL	Crenshaw
1043	AL	Cullman
1045	AL	Dale
1047	AL	Dallas
1049	AL	DeKalb
1051	AL	Elmore
1053	AL	Escambia
1055	AL	Etowah
1057	AL	Fayette
1059	AL	Franklin
1061	AL	Geneva
1063	AL	Greene
1065	AL	Hale
1067	AL	Henry
1069	AL	Houston
1071	AL	Jackson
1073	AL	Jefferson
1075	AL	Lamar
1077	AL	Lauderdale
1079	AL	Lawrence
1081	AL	Lee
1083	AL	Limestone
1085	AL	Lowndes
1087	AL	Macon
1089	AL	Madison
1091	AL	Marengo
1093	AL	Marion
1095	AL	Marshall
1097	AL	Mobile
1099	AL	Monroe
1101	AL	Montgomery
1103	AL	Morgan
1105	AL	Perry
1107	AL	Pickens
1109	AL	Pike
1111	AL	Randolph
1113	AL	Russell
1115	AL	St. Clair
1117	AL	Shelby
1119	AL	Sumter
1121	AL	Talladega
1123	AL	Tallapoosa
1125	AL	Tuscaloosa
1127	AL	Walker
1129	AL	Washington
1131	AL	Wilcox
1133	AL	Winston
1999	AL	Unknown Or Undefined
2013	AK	Aleutians East
2016	AK	Aleutians West
2020	AK	Anchorage
2050	AK	Bethel
2060	AK	Bristol Bay
2063	AK	Chugach
2066	AK	Copper River
2068	AK	Denali
2070	AK	Dillingham
2090	AK	Fairbanks North Star
2100	AK	Haines
2105	AK	Hoonah-Angoon
2110	AK	Juneau
2122	AK	Kenai Peninsula
2130	AK	Ketchikan Gateway
2150	AK	Kodiak Island
2158	AK	Kusilvak
2164	AK	Lake and Peninsula
2170	AK	Matanuska-Susitna
2180	AK	Nome
2185	AK	North Slope
2188	AK	Northwest Arctic
2195	AK	Petersburg
2198	AK	Prince of Wales-Hyder
2220	AK	Sitka
2230	AK	Skagway
2240	AK	Southeast Fairbanks
2275	AK	Wrangell
2282	AK	Yakutat
2290	AK	Yukon-Koyukuk
2999	AK	Unknown Or Undefined
4001	AZ	Apache
4003	AZ	Cochise
4005	AZ	Coconino
4007	AZ	Gila
4009	AZ	Graham
4011	AZ	Greenlee
4012	AZ	La Paz
4013	AZ	Maricopa
4015	AZ	Mohave
4017	AZ	Navajo
4019	AZ	Pima
4021	AZ	Pinal
4023	AZ	Santa Cruz
4025	AZ	Yavapai
4027	AZ	Yuma
4999	AZ	Unknown Or Undefined
5001	AR	Arkansas
5003	AR	Ashley
5005	AR	Baxter
5007	AR	Benton
5009	AR	Boone
5011	AR	Bradley
5013	AR	Calhoun
5015	AR	Carroll
5017	AR	Chicot
5019	AR	Clark
5021	AR	Clay
5023	AR	Cleburne
5025	AR	Cleveland
5027	AR	Columbia
5029	AR	Conway
5031	AR	Craighead
5033	AR	Crawford
5035	AR	Crittenden
5037	AR	Cross
5039	AR	Dallas
5041	AR	Desha
5043	AR	Drew
5045	AR	Faulkner
5047	AR	Franklin
5049	AR	Fulton
5051	AR	Garland
5053	AR	Grant
5055	AR	Greene
5057	AR	Hempstead
5059	AR	Hot Spring
5061	AR	Howard
5063	AR	Independence
5065	AR	Izard
5067	AR	Jackson
5069	AR	Jefferson
5071	AR	Johnson
5073	AR	Lafayette
5075	AR	Lawrence
5077	AR	Lee
5079	AR	Lincoln
5081	AR	Little River
5083	AR	Logan
5085	AR	Lonoke
5087	AR	Madison
5089	AR	Marion
5091	AR	Miller
5093	AR	Mississippi
5095	AR	Monroe
5097	AR	Montgomery
5099	AR	Nevada
5101	AR	Newton
5103	AR	Ouachita
5105	AR	Perry
5107	AR	Phillips
5109	AR	Pike
5111	AR	Poinsett
5113	AR	Polk
5115	AR	Pope
5117	AR	Prairie
5119	AR	Pulaski
5121	AR	Randolph
5123	AR	St. Francis
5125	AR	Saline
5127	AR	Scott
5129	AR	Searcy
5131	AR	Sebastian
5133	AR	Sevier
5135	AR	Sharp
5137	AR	Stone
5139	AR	Union
5141	AR	Van Buren
5143	AR	Washington
5145	AR	White
5147	AR	Woodruff
5149	AR	Yell
5999	AR	Unknown Or Undefined
6001	CA	Alameda
6003	CA	Alpine
6005	CA	Amador
6007	CA	Butte
6009	CA	Calaveras
6011	CA	Colusa
6013	CA	Contra Costa
6015	CA	Del Norte
6017	CA	El Dorado
6019	CA	Fresno
6021	CA	Glenn
6023	CA	Humboldt
6025	CA	Imperial
6027	CA	Inyo
6029	CA	Kern
6031	CA	Kings
6033	CA	Lake
6035	CA	Lassen
6037	CA	Los Angeles
6039	CA	Madera
6041	CA	Marin
6043	CA	Mariposa
6045	CA	Mendocino
6047	CA	Merced
6049	CA	Modoc
6051	CA	Mono
6053	CA	Monterey
6055	CA	Napa
6057	CA	Nevada
6059	CA	Orange
6061	CA	Placer
6063	CA	Plumas
6065	CA	Riverside
6067	CA	Sacramento
6069	CA	San Benito
6071	CA	San Bernardino
6073	CA	San Diego
6075	CA	San Francisco
6077	CA	San Joaquin
6079	CA	San Luis Obispo
6081	CA	San Mateo
6083	CA	Santa Barbara
6085	CA	Santa Clara
6087	CA	Santa Cruz
6089	CA	Shasta
6091	CA	Sierra
6093	CA	Siskiyou
6095	CA	Solano
6097	CA	Sonoma
6099	CA	Stanislaus
6101	CA	Sutter
6103	CA	Tehama
6105	CA	Trinity
6107	CA	Tulare
6109	CA	Tuolumne
6111	CA	Ventura
6113	CA	Yolo
6115	CA	Yuba
6999	CA	Unknown Or Undefined
8001	CO	Adams
8003	CO	Alamosa
8005	CO	Arapahoe
8007	CO	Archuleta
8009	CO	Baca
8011	CO	Bent
8013	CO	Boulder
8014	CO	Broomfield
8015	CO	Chaffee
8017	CO	Cheyenne
8019	CO	Clear Creek
8021	CO	Conejos
8023	CO	Costilla
8025	CO	Crowley
8027	CO	Custer
8029	CO	Delta
8031	CO	Denver
8033	CO	Dolores
8035	CO	Douglas
8037	CO	Eagle
8039	CO	Elbert
8041	CO	El Paso
8043	CO	Fremont
8045	CO	Garfield
8047	CO	Gilpin
8049	CO	Grand
8051	CO	Gunnison
8053	CO	Hinsdale
8055	CO	Huerfano
8057	CO	Jackson
8059	CO	Jefferson
8061	CO	Kiowa
8063	CO	Kit Carson
8065	CO	Lake
8067	CO	La Plata
8069	CO	Larimer
8071	CO	Las Animas
8073	CO	Lincoln
8075	CO	Logan
8077	CO	Mesa
8079	CO	Mineral
8081	CO	Moffat
8083	CO	Montezuma
8085	CO	Montrose
8087	CO	Morgan
8089	CO	Otero
8091	CO	Ouray
8093	CO	Park
8095	CO	Phillips
8097	CO	Pitkin
8099	CO	Prowers
8101	CO	Pueblo
8103	CO	Rio Blanco
8105	CO	Rio Grande
8107	CO	Routt
8109	CO	Saguache
8111	CO	San Juan
8113	CO	San Miguel
8115	CO	Sedgwick
8117	CO	Summit
8119	CO	Teller
8121	CO	Washington
8123	CO	Weld
8125	CO	Yuma
8999	CO	Unknown Or Undefined
9001	CT	Fairfield
9003	CT	Hartford
9005	CT	Litchfield
9007	CT	Middlesex
9009	CT	New Haven
9011	CT	New London
9013	CT	Tolland
9015	CT	Windham
9999	CT	Unknown Or Undefined
10001	DE	Kent
10003	DE	New Castle
10005	DE	Sussex
10999	DE	Unknown Or Undefined
11001	DC	District of Columbia
11999	DC	Unknown Or Undefined
12001	FL	Alachua
12003	FL	Baker
12005	FL	Bay
12007	FL	Bradford
12009	FL	Brevard
12011	FL	Broward
12013	FL	Calhoun
12015	FL	Charlotte
12017	FL	Citrus
12019	FL	Clay
12021	FL	Collier
12023	FL	Columbia
12027	FL	DeSoto
12029	FL	Dixie
12031	FL	Duval
12033	FL	Escambia
12035	FL	Flagler
12037	FL	Franklin
12039	FL	Gadsden
12041	FL	Gilchrist
12043	FL	Glades
12045	FL	Gulf
12047	FL	Hamilton
12049	FL	Hardee
12051	FL	Hendry
12053	FL	Hernando
12055	FL	Highlands
12057	FL	Hillsborough
12059	FL	Holmes
12061	FL	Indian River
12063	FL	Jackson
12065	FL	Jefferson
12067	FL	Lafayette
12069	FL	Lake
12071	FL	Lee
12073	FL	Leon
12075	FL	Levy
12077	FL	Liberty
12079	FL	Madison
12081	FL	Manatee
12083	FL	Marion
12085	FL	Martin
12086	FL	Miami-Dade
12087	FL	Monroe
12089	FL	Nassau
12091	FL	Okaloosa
12093	FL	Okeechobee
12095	FL	Orange
12097	FL	Osceola
12099	FL	Palm Beach
12101	FL	Pasco
12103	FL	Pinellas
12105	FL	Polk
12107	FL	Putnam
12109	FL	St. Johns
12111	FL	St. Lucie
12113	FL	Santa Rosa
12115	FL	Sarasota
12117	FL	Seminole
12119	FL	Sumter
12121	FL	Suwannee
12123	FL	Taylor
12125	FL	Union
12127	FL	Volusia
12129	FL	Wakulla
12131	FL	Walton
12133	FL	Washington
12999	FL	Unknown Or Undefined
13001	GA	Appling
13003	GA	Atkinson
13005	GA	Bacon
13007	GA	Baker
13009	GA	Baldwin
13011	GA	Banks
13013	GA	Barrow
13015	GA	Bartow
13017	GA	Ben Hill
13019	GA	Berrien
13021	GA	Bibb
13023	GA	Bleckley
13025	GA	Brantley
13027	GA	Brooks
13029	GA	Bryan
13031	GA	Bulloch
13033	GA	Burke
13035	GA	Butts
13037	GA	Calhoun
13039	GA	Camden
13043	GA	Candler
13045	GA	Carroll
13047	GA	Catoosa
13049	GA	Charlton
13051	GA	Chatham
13053	GA	Chattahoochee
13055	GA	Chattooga
13057	GA	Cherokee
13059	GA	Clarke
13061	GA	Clay
13063	GA	Clayton
13065	GA	Clinch
13067	GA	Cobb
13069	GA	Coffee
13071	GA	Colquitt
13073	GA	Columbia
13075	GA	Cook
13077	GA	Coweta
13079	GA	Crawford
13081	GA	Crisp
13083	GA	Dade
13085	GA	Dawson
13087	GA	Decatur
13089	GA	DeKalb
13091	GA	Dodge
13093	GA	Dooly
13095	GA	Dougherty
13097	GA	Douglas
13099	GA	Early
13101	GA	Echols
13103	GA	Effingham
13105	GA	Elbert
13107	GA	Emanuel
13109	GA	Evans
13111	GA	Fannin
13113	GA	Fayette
13115	GA	Floyd
13117	GA	Forsyth
13119	GA	Franklin
13121	GA	Fulton
13123	GA	Gilmer
13125	GA	Glascock
13127	GA	Glynn
13129	GA	Gordon
13131	GA	Grady
13133	GA	Greene
13135	GA	Gwinnett
13137	GA	Habersham
13139	GA	Hall
13141	GA	Hancock
13143	GA	Haralson
13145	GA	Harris
13147	GA	Hart
13149	GA	Heard
13151	GA	Henry
13153	GA	Houston
13155	GA	Irwin
13157	GA	Jackson
13159	GA	Jasper
13161	GA	Jeff Davis
13163	GA	Jefferson
13165	GA	Jenkins
13167	GA	Johnson
13169	GA	Jones
13171	GA	Lamar
13173	GA	Lanier
13175	GA	Laurens
13177	GA	Lee
13179	GA	Liberty
13181	GA	Lincoln
13183	GA	Long
13185	GA	Lowndes
13187	GA	Lumpkin
13189	GA	McDuffie
13191	GA	McIntosh
13193	GA	Macon
13195	GA	Madison
13197	GA	Marion
13199	GA	Meriwether
13201	GA	Miller
13205	GA	Mitchell
13207	GA	Monroe
13209	GA	Montgomery
13211	GA	Morgan
13213	GA	Murray
13215	GA	Muscogee
13217	GA	Newton
13219	GA	Oconee
13221	GA	Oglethorpe
13223	GA	Paulding
13225	GA	Peach
13227	GA	Pickens
13229	GA	Pierce
13231	GA	Pike
13233	GA	Polk
13235	GA	Pulaski
13237	GA	Putnam
13239	GA	Quitman
13241	GA	Rabun
13243	GA	Randolph
13245	GA	Richmond
13247	GA	Rockdale
13249	GA	Schley
13251	GA	Screven
13253	GA	Seminole
13255	GA	Spalding
13257	GA	Stephens
13259	GA	Stewart
13261	GA	Sumter
13263	GA	Talbot
13265	GA	Taliaferro
13267	GA	Tattnall
13269	GA	Taylor
13271	GA	Telfair
13273	GA	Terrell
13275	GA	Thomas
13277	GA	Tift
13279	GA	Toombs
13281	GA	Towns
13283	GA	Treutlen
13285	GA	Troup
13287	GA	Turner
13289	GA	Twiggs
13291	GA	Union
13293	GA	Upson
13295	GA	Walker
13297	GA	Walton
13299	GA	Ware
13301	GA	Warren
13303	GA	Washington
13305	GA	Wayne
13307	GA	Webster
13309	GA	Wheeler
13311	GA	White
13313	GA	Whitfield
13315	GA	Wilcox
13317	GA	Wilkes
13319	GA	Wilkinson
13321	GA	Worth
13999	GA	Unknown Or Undefined
15001	HI	Hawaii
15003	HI	Honolulu
15005	HI	Kalawao
15007	HI	Kauai
15009	HI	Maui
15999	HI	Unknown Or Undefined
16001	ID	Ada
16003	ID	Adams
16005	ID	Bannock
16007	ID	Bear Lake
16009	ID	Benewah
16011	ID	Bingham
16013	ID	Blaine
16015	ID	Boise
16017	ID	Bonner
16019	ID	Bonneville
16021	ID	Boundary
16023	ID	Butte
16025	ID	Camas
16027	ID	Canyon
16029	ID	Caribou
16031	ID	Cassia
16033	ID	Clark
16035	ID	Clearwater
16037	ID	Custer
16039	ID	Elmore
16041	ID	Franklin
16043	ID	Fremont
16045	ID	Gem
16047	ID	Gooding
16049	ID	Idaho
16051	ID	Jefferson
16053	ID	Jerome
16055	ID	Kootenai
16057	ID	Latah
16059	ID	Lemhi
16061	ID	Lewis
16063	ID	Lincoln
16065	ID	Madison
16067	ID	Minidoka
16069	ID	Nez Perce
16071	ID	Oneida
16073	ID	Owyhee
16075	ID	Payette
16077	ID	Power
16079	ID	Shoshone
16081	ID	Teton
16083	ID	Twin Falls
16085	ID	Valley
16087	ID	Washington
16999	ID	Unknown Or Undefined
17001	IL	Adams
17003	IL	Alexander
17005	IL	Bond
17007	IL	Boone
17009	IL	Brown
17011	IL	Bureau
17013	IL	Calhoun
17015	IL	Carroll
17017	IL	Cass
17019	IL	Champaign
17021	IL	Christian
17023	IL	Clark
17025	IL	Clay
17027	IL	Clinton
17029	IL	Coles
17031	IL	Cook
17033	IL	Crawford
17035	IL	Cumberland
17037	IL	DeKalb
17039	IL	De Witt
17041	IL	Douglas
17043	IL	DuPage
17045	IL	Edgar
17047	IL	Edwards
17049	IL	Effingham
17051	IL	Fayette
17053	IL	Ford
17055	IL	Franklin
17057	IL	Fulton
17059	IL	Gallatin
17061	IL	Greene
17063	IL	Grundy
17065	IL	Hamilton
17067	IL	Hancock
17069	IL	Hardin
17071	IL	Henderson
17073	IL	Henry
17075	IL	Iroquois
17077	IL	Jackson
17079	IL	Jasper
17081	IL	Jefferson
17083	IL	Jersey
17085	IL	Jo Daviess
17087	IL	Johnson
17089	IL	Kane
17091	IL	Kankakee
17093	IL	Kendall
17095	IL	Knox
17097	IL	Lake
17099	IL	LaSalle
17101	IL	Lawrence
17103	IL	Lee
17105	IL	Livingston
17107	IL	Logan
17109	IL	McDonough
17111	IL	McHenry
17113	IL	McLean
17115	IL	Macon
17117	IL	Macoupin
17119	IL	Madison
17121	IL	Marion
17123	IL	Marshall
17125	IL	Mason
17127	IL	Massac
17129	IL	Menard
17131	IL	Mercer
17133	IL	Monroe
17135	IL	Montgomery
17137	IL	Morgan
17139	IL	Moultrie
17141	IL	Ogle
17143	IL	Peoria
17145	IL	Perry
17147	IL	Piatt
17149	IL	Pike
17151	IL	Pope
17153	IL	Pulaski
17155	IL	Putnam
17157	IL	Randolph
17159	IL	Richland
17161	IL	Rock Island
17163	IL	St. Clair
17165	IL	Saline
17167	IL	Sangamon
17169	IL	Schuyler
17171	IL	Scott
17173	IL	Shelby
17175	IL	Stark
17177	IL	Stephenson
17179	IL	Tazewell
17181	IL	Union
17183	IL	Vermilion
17185	IL	Wabash
17187	IL	Warren
17189	IL	Washington
17191	IL	Wayne
17193	IL	White
17195	IL	Whiteside
17197	IL	Will
17199	IL	Williamson
17201	IL	Winnebago
17203	IL	Woodford
17999	IL	Unknown Or Undefined
18001	IN	Adams
18003	IN	Allen
18005	IN	Bartholomew
18007	IN	Benton
18009	IN	Blackford
18011	IN	Boone
18013	IN	Brown
18015	IN	Carroll
18017	IN	Cass
18019	IN	Clark
18021	IN	Clay
18023	IN	Clinton
18025	IN	Crawford
18027	IN	Daviess
18029	IN	Dearborn
18031	IN	Decatur
18033	IN	DeKalb
18035	IN	Delaware
18037	IN	Dubois
18039	IN	Elkhart
18041	IN	Fayette
18043	IN	Floyd
18045	IN	Fountain
18047	IN	Franklin
18049	IN	Fulton
18051	IN	Gibson
18053	IN	Grant
18055	IN	Greene
18057	IN	Hamilton
18059	IN	Hancock
18061	IN	Harrison
18063	IN	Hendricks
18065	IN	Henry
18067	IN	Howard
18069	IN	Huntington
18071	IN	Jackson
18073	IN	Jasper
18075	IN	Jay
18077	IN	Jefferson
18079	IN	Jennings
18081	IN	Johnson
18083	IN	Knox
18085	IN	Kosciusko
18087	IN	LaGrange
18089	IN	Lake
18091	IN	LaPorte
18093	IN	Lawrence
18095	IN	Madison
18097	IN	Marion
18099	IN	Marshall
18101	IN	Martin
18103	IN	Miami
18105	IN	Monroe
18107	IN	Montgomery
18109	IN	Morgan
18111	IN	Newton
18113	IN	Noble
18115	IN	Ohio
18117	IN	Orange
18119	IN	Owen
18121	IN	Parke
18123	IN	Perry
18125	IN	Pike
18127	IN	Porter
18129	IN	Posey
18131	IN	Pulaski
18133	IN	Putnam
18135	IN	Randolph
18137	IN	Ripley
18139	IN	Rush
18141	IN	St. Joseph
18143	IN	Scott
18145	IN	Shelby
18147	IN	Spencer
18149	IN	Starke
18151	IN	Steuben
18153	IN	Sullivan
18155	IN	Switzerland
18157	IN	Tippecanoe
18159	IN	Tipton
18161	IN	Union
18163	IN	Vanderburgh
18165	IN	Vermillion
18167	IN	Vigo
18169	IN	Wabash
18171	IN	Warren
18173	IN	Warrick
18175	IN	Washington
18177	IN	Wayne
18179	IN	Wells
18181	IN	White
18183	IN	Whitley
18999	IN	Unknown Or Undefined
19001	IA	Adair
19003	IA	Adams
19005	IA	Allamakee
19007	IA	Appanoose
19009	IA	Audubon
19011	IA	Benton
19013	IA	Black Hawk
19015	IA	Boone
19017	IA	Bremer
19019	IA	Buchanan
19021	IA	Buena Vista
19023	IA	Butler
19025	IA	Calhoun
19027	IA	Carroll
19029	IA	Cass
19031	IA	Cedar
19033	IA	Cerro Gordo
19035	IA	Cherokee
19037	IA	Chickasaw
19039	IA	Clarke
19041	IA	Clay
19043	IA	Clayton
19045	IA	Clinton
19047	IA	Crawford
19049	IA	Dallas
19051	IA	Davis
19053	IA	Decatur
19055	IA	Delaware
19057	IA	Des Moines
19059	IA	Dickinson
19061	IA	Dubuque
19063	IA	Emmet
19065	IA	Fayette
19067	IA	Floyd
19069	IA	Franklin
19071	IA	Fremont
19073	IA	Greene
19075	IA	Grundy
19077	IA	Guthrie
19079	IA	Hamilton
19081	IA	Hancock
19083	IA	Hardin
19085	IA	Harrison
19087	IA	Henry
19089	IA	Howard
19091	IA	Humboldt
19093	IA	Ida
19095	IA	Iowa
19097	IA	Jackson
19099	IA	Jasper
19101	IA	Jefferson
19103	IA	Johnson
19105	IA	Jones
19107	IA	Keokuk
19109	IA	Kossuth
19111	IA	Lee
19113	IA	Linn
19115	IA	Louisa
19117	IA	Lucas
19119	IA	Lyon
19121	IA	Madison
19123	IA	Mahaska
19125	IA	Marion
19127	IA	Marshall
19129	IA	Mills
19131	IA	Mitchell
19133	IA	Monona
19135	IA	Monroe
19137	IA	Montgomery
19139	IA	Muscatine
19141	IA	O'Brien
19143	IA	Osceola
19145	IA	Page
19147	IA	Palo Alto
19149	IA	Plymouth
19151	IA	Pocahontas
19153	IA	Polk
19155	IA	Pottawattamie
19157	IA	Poweshiek
19159	IA	Ringgold
19161	IA	Sac
19163	IA	Scott
19165	IA	Shelby
19167	IA	Sioux
19169	IA	Story
19171	IA	Tama
19173	IA	Taylor
19175	IA	Union
19177	IA	Van Buren
19179	IA	Wapello
19181	IA	Warren
19183	IA	Washington
19185	IA	Wayne
19187	IA	Webster
19189	IA	Winnebago
19191	IA	Winneshiek
19193	IA	Woodbury
19195	IA	Worth
19197	IA	Wright
19999	IA	Unknown Or Undefined
20001	KS	Allen
20003	KS	Anderson
20005	KS	Atchison
20007	KS	Barber
20009	KS	Barton
20011	KS	Bourbon
20013	KS	Brown
20015	KS	Butler
20017	KS	Chase
20019	KS	Chautauqua
20021	KS	Cherokee
20023	KS	Cheyenne
20025	KS	Clark
20027	KS	Clay
20029	KS	Cloud
20031	KS	Coffey
20033	KS	Comanche
20035	KS	Cowley
20037	KS	Crawford
20039	KS	Decatur
20041	KS	Dickinson
20043	KS	Doniphan
20045	KS	Douglas
20047	KS	Edwards
20049	KS	Elk
20051	KS	Ellis
20053	KS	Ellsworth
20055	KS	Finney
20057	KS	Ford
20059	KS	Franklin
20061	KS	Geary
20063	KS	Gove
20065	KS	Graham
20067	KS	Grant
20069	KS	Gray
20071	KS	Greeley
20073	KS	Greenwood
20075	KS	Hamilton
20077	KS	Harper
20079	KS	Harvey
20081	KS	Haskell
20083	KS	Hodgeman
20085	KS	Jackson
20087	KS	Jefferson
20089	KS	Jewell
20091	KS	Johnson
20093	KS	Kearny
20095	KS	Kingman
20097	KS	Kiowa
20099	KS	Labette
20101	KS	Lane
20103	KS	Leavenworth
20105	KS	Lincoln
20107	KS	Linn
20109	KS	Logan
20111	KS	Lyon
20113	KS	McPherson
20115	KS	Marion
20117	KS	Marshall
20119	KS	Meade
20121	KS	Miami
20123	KS	Mitchell
20125	KS	Montgomery
20127	KS	Morris
20129	KS	Morton
20131	KS	Nemaha
20133	KS	Neosho
20135	KS	Ness
20137	KS	Norton
20139	KS	Osage
20141	KS	Osborne
20143	KS	Ottawa
20145	KS	Pawnee
20147	KS	Phillips
20149	KS	Pottawatomie
20151	KS	Pratt
20153	KS	Rawlins
20155	KS	Reno
20157	KS	Republic
20159	KS	Rice
20161	KS	Riley
20163	KS	Rooks
20165	KS	Rush
20167	KS	Russell
20169	KS	Saline
20171	KS	Scott
20173	KS	Sedgwick
20175	KS	Seward
20177	KS	Shawnee
20179	KS	Sheridan
20181	KS	Sherman
20183	KS	Smith
20185	KS	Stafford
20187	KS	Stanton
20189	KS	Stevens
20191	KS	Sumner
20193	KS	Thomas
20195	KS	Trego
20197	KS	Wabaunsee
20199	KS	Wallace
20201	KS	Washington
20203	KS	Wichita
20205	KS	Wilson
20207	KS	Woodson
20209	KS	Wyandotte
20999	KS	Unknown Or Undefined
21001	KY	Adair
21003	KY	Allen
21005	KY	Anderson
21007	KY	Ballard
21009	KY	Barren
21011	KY	Bath
21013	KY	Bell
21015	KY	Boone
21017	KY	Bourbon
21019	KY	Boyd
21021	KY	Boyle
21023	KY	Bracken
21025	KY	Breathitt
21027	KY	Breckinridge
21029	KY	Bullitt
21031	KY	Butler
21033	KY	Caldwell
21035	KY	Calloway
21037	KY	Campbell
21039	KY	Carlisle
21041	KY	Carroll
21043	KY	Carter
21045	KY	Casey
21047	KY	Christian
21049	KY	Clark
21051	KY	Clay
21053	KY	Clinton
21055	KY	Crittenden
21057	KY	Cumberland
21059	KY	Daviess
21061	KY	Edmonson
21063	KY	Elliott
21065	KY	Estill
21067	KY	Fayette
21069	KY	Fleming
21071	KY	Floyd
21073	KY	Franklin
21075	KY	Fulton
21077	KY	Gallatin
21079	KY	Garrard
21081	KY	Grant
21083	KY	Graves
21085	KY	Grayson
21087	KY	Green
21089	KY	Greenup
21091	KY	Hancock
21093	KY	Hardin
21095	KY	Harlan
21097	KY	Harrison
21099	KY	Hart
21101	KY	Henderson
21103	KY	Henry
21105	KY	Hickman
21107	KY	Hopkins
21109	KY	Jackson
21111	KY	Jefferson
21113	KY	Jessamine
21115	KY	Johnson
21117	KY	Kenton
21119	KY	Knott
21121	KY	Knox
21123	KY	Larue
21125	KY	Laurel
21127	KY	Lawrence
21129	KY	Lee
21131	KY	Leslie
21133	KY	Letcher
21135	KY	Lewis
21137	KY	Lincoln
21139	KY	Livingston
21141	KY	Logan
21143	KY	Lyon
21145	KY	McCracken
21147	KY	McCreary
21149	KY	McLean
21151	KY	Madison
21153	KY	Magoffin
21155	KY	Marion
21157	KY	Marshall
21159	KY	Martin
21161	KY	Mason
21163	KY	Meade
21165	KY	Menifee
21167	KY	Mercer
21169	KY	Metcalfe
21171	KY	Monroe
21173	KY	Montgomery
21175	KY	Morgan
21177	KY	Muhlenberg
21179	KY	Nelson
21181	KY	Nicholas
21183	KY	Ohio
21185	KY	Oldham
21187	KY	Owen
21189	KY	Owsley
21191	KY	Pendleton
21193	KY	Perry
21195	KY	Pike
21197	KY	Powell
21199	KY	Pulaski
21201	KY	Robertson
21203	KY	Rockcastle
21205	KY	Rowan
21207	KY	Russell
21209	KY	Scott
21211	KY	Shelby
21213	KY	Simpson
21215	KY	Spencer
21217	KY	Taylor
21219	KY	Todd
21221	KY	Trigg
21223	KY	Trimble
21225	KY	Union
21227	KY	Warren
21229	KY	Washington
21231	KY	Wayne
21233	KY	Webster
21235	KY	Whitley
21237	KY	Wolfe
21239	KY	Woodford
21999	KY	Unknown Or Undefined
22001	LA	Acadia
22003	LA	Allen
22005	LA	Ascension
22007	LA	Assumption
22009	LA	Avoyelles
22011	LA	Beauregard
22013	LA	Bienville
22015	LA	Bossier
22017	LA	Caddo
22019	LA	Calcasieu
22021	LA	Caldwell
22023	LA	Cameron
22025	LA	Catahoula
22027	LA	Claiborne
22029	LA	Concordia
22031	LA	De Soto
22033	LA	East Baton Rouge
22035	LA	East Carroll
22037	LA	East Feliciana
22039	LA	Evangeline
22041	LA	Franklin
22043	LA	Grant
22045	LA	Iberia
22047	LA	Iberville
22049	LA	Jackson
22051	LA	Jefferson
22053	LA	Jefferson Davis
22055	LA	Lafayette
22057	LA	Lafourche
22059	LA	LaSalle
22061	LA	Lincoln
22063	LA	Livingston
22065	LA	Madison
22067	LA	Morehouse
22069	LA	Natchitoches
22071	LA	Orleans
22073	LA	Ouachita
22075	LA	Plaquemines
22077	LA	Pointe Coupee
22079	LA	Rapides
22081	LA	Red River
22083	LA	Richland
22085	LA	Sabine
22087	LA	St. Bernard
22089	LA	St. Charles
22091	LA	St. Helena
22093	LA	St. James
22095	LA	St. John the Baptist
22097	LA	St. Landry
22099	LA	St. Martin
22101	LA	St. Mary
22103	LA	St. Tammany
22105	LA	Tangipahoa
22107	LA	Tensas
22109	LA	Terrebonne
22111	LA	Union
22113	LA	Vermilion
22115	LA	Vernon
22117	LA	Washington
22119	LA	Webster
22121	LA	West Baton Rouge
22123	LA	West Carroll
22125	LA	West Feliciana
22127	LA	Winn
22999	LA	Unknown Or Undefined
23001	ME	Androscoggin
23003	ME	Aroostook
23005	ME	Cumberland
23007	ME	Franklin
23009	ME	Hancock
23011	ME	Kennebec
23013	ME	Knox
23015	ME	Lincoln
23017	ME	Oxford
23019	ME	Penobscot
23021	ME	Piscataquis
23023	ME	Sagadahoc
23025	ME	Somerset
23027	ME	Waldo
23029	ME	Washington
23031	ME	York
23999	ME	Unknown Or Undefined
24001	MD	Allegany
24003	MD	Anne Arundel
24005	MD	Baltimore
24009	MD	Calvert
24011	MD	Caroline
24013	MD	Carroll
24015	MD	Cecil
24017	MD	Charles
24019	MD	Dorchester
24021	MD	Frederick
24023	MD	Garrett
24025	MD	Harford
24027	MD	Howard
24029	MD	Kent
24031	MD	Montgomery
24033	MD	Prince George's
24035	MD	Queen Anne's
24037	MD	St. Mary's
24039	MD	Somerset
24041	MD	Talbot
24043	MD	Washington
24045	MD	Wicomico
24047	MD	Worcester
24510	MD	Baltimore
24999	MD	Unknown Or Undefined
25001	MA	Barnstable
25003	MA	Berkshire
25005	MA	Bristol
25007	MA	Dukes
25009	MA	Essex
25011	MA	Franklin
25013	MA	Hampden
25015	MA	Hampshire
25017	MA	Middlesex
25019	MA	Nantucket
25021	MA	Norfolk
25023	MA	Plymouth
25025	MA	Suffolk
25027	MA	Worcester
25999	MA	Unknown Or Undefined
26001	MI	Alcona
26003	MI	Alger
26005	MI	Allegan
26007	MI	Alpena
26009	MI	Antrim
26011	MI	Arenac
26013	MI	Baraga
26015	MI	Barry
26017	MI	Bay
26019	MI	Benzie
26021	MI	Berrien
26023	MI	Branch
26025	MI	Calhoun
26027	MI	Cass
26029	MI	Charlevoix
26031	MI	Cheboygan
26033	MI	Chippewa
26035	MI	Clare
26037	MI	Clinton
26039	MI	Crawford
26041	MI	Delta
26043	MI	Dickinson
26045	MI	Eaton
26047	MI	Emmet
26049	MI	Genesee
26051	MI	Gladwin
26053	MI	Gogebic
26055	MI	Grand Traverse
26057	MI	Gratiot
26059	MI	Hillsdale
26061	MI	Houghton
26063	MI	Huron
26065	MI	Ingham
26067	MI	Ionia
26069	MI	Iosco
26071	MI	Iron
26073	MI	Isabella
26075	MI	Jackson
26077	MI	Kalamazoo
26079	MI	Kalkaska
26081	MI	Kent
26083	MI	Keweenaw
26085	MI	Lake
26087	MI	Lapeer
26089	MI	Leelanau
26091	MI	Lenawee
26093	MI	Livingston
26095	MI	Luce
26097	MI	Mackinac
26099	MI	Macomb
26101	MI	Manistee
26103	MI	Marquette
26105	MI	Mason
26107	MI	Mecosta
26109	MI	Menominee
26111	MI	Midland
26113	MI	Missaukee
26115	MI	Monroe
26117	MI	Montcalm
26119	MI	Montmorency
26121	MI	Muskegon
26123	MI	Newaygo
26125	MI	Oakland
26127	MI	Oceana
26129	MI	Ogemaw
26131	MI	Ontonagon
26133	MI	Osceola
26135	MI	Oscoda
26137	MI	Otsego
26139	MI	Ottawa
26141	MI	Presque Isle
26143	MI	Roscommon
26145	MI	Saginaw
26147	MI	St. Clair
26149	MI	St. Joseph
26151	MI	Sanilac
26153	MI	Schoolcraft
26155	MI	Shiawassee
26157	MI	Tuscola
26159	MI	Van Buren
26161	MI	Washtenaw
26163	MI	Wayne
26165	MI	Wexford
26999	MI	Unknown Or Undefined
27001	MN	Aitkin
27003	MN	Anoka
27005	MN	Becker
27007	MN	Beltrami
27009	MN	Benton
27011	MN	Big Stone
27013	MN	Blue Earth
27015	MN	Brown
27017	MN	Carlton
27019	MN	Carver
27021	MN	Cass
27023	MN	Chippewa
27025	MN	Chisago
27027	MN	Clay
27029	MN	Clearwater
27031	MN	Cook
27033	MN	Cottonwood
27035	MN	Crow Wing
27037	MN	Dakota
27039	MN	Dodge
27041	MN	Douglas
27043	MN	Faribault
27045	MN	Fillmore
27047	MN	Freeborn
27049	MN	Goodhue
27051	MN	Grant
27053	MN	Hennepin
27055	MN	Houston
27057	MN	Hubbard
27059	MN	Isanti
27061	MN	Itasca
27063	MN	Jackson
27065	MN	Kanabec
27067	MN	Kandiyohi
27069	MN	Kittson
27071	MN	Koochiching
27073	MN	Lac qui Parle
27075	MN	Lake
27077	MN	Lake of the Woods
27079	MN	Le Sueur
27081	MN	Lincoln
27083	MN	Lyon
27085	MN	McLeod
27087	MN	Mahnomen
27089	MN	Marshall
27091	MN	Martin
27093	MN	Meeker
27095	MN	Mille Lacs
27097	MN	Morrison
27099	MN	Mower
27101	MN	Murray
27103	MN	Nicollet
27105	MN	Nobles
27107	MN	Norman
27109	MN	Olmsted
27111	MN	Otter Tail
27113	MN	Pennington
27115	MN	Pine
27117	MN	Pipestone
27119	MN	Polk
27121	MN	Pope
27123	MN	Ramsey
27125	MN	Red Lake
27127	MN	Redwood
27129	MN	Renville
27131	MN	Rice
27133	MN	Rock
27135	MN	Roseau
27137	MN	St. Louis
27139	MN	Scott
27141	MN	Sherburne
27143	MN	Sibley
27145	MN	Stearns
27147	MN	Steele
27149	MN	Stevens
27151	MN	Swift
27153	MN	Todd
27155	MN	Traverse
27157	MN	Wabasha
27159	MN	Wadena
27161	MN	Waseca
27163	MN	Washington
27165	MN	Watonwan
27167	MN	Wilkin
27169	MN	Winona
27171	MN	Wright
27173	MN	Yellow Medicine
27999	MN	Unknown Or Undefined
28001	MS	Adams
28003	MS	Alcorn
28005	MS	Amite
28007	MS	Attala
28009	MS	Benton
28011	MS	Bolivar
28013	MS	Calhoun
28015	MS	Carroll
28017	MS	Chickasaw
28019	MS	Choctaw
28021	MS	Claiborne
28023	MS	Clarke
28025	MS	Clay
28027	MS	Coahoma
28029	MS	Copiah
28031	MS	Covington
28033	MS	DeSoto
28035	MS	Forrest
28037	MS	Franklin
28039	MS	George
28041	MS	Greene
28043	MS	Grenada
28045	MS	Hancock
28047	MS	Harrison
28049	MS	Hinds
28051	MS	Holmes
28053	MS	Humphreys
28055	MS	Issaquena
28057	MS	Itawamba
28059	MS	Jackson
28061	MS	Jasper
28063	MS	Jefferson
28065	MS	Jefferson Davis
28067	MS	Jones
28069	MS	Kemper
28071	MS	Lafayette
28073	MS	Lamar
28075	MS	Lauderdale
28077	MS	Lawrence
28079	MS	Leake
28081	MS	Lee
28083	MS	Leflore
28085	MS	Lincoln
28087	MS	Lowndes
28089	MS	Madison
28091	MS	Marion
28093	MS	Marshall
28095	MS	Monroe
28097	MS	Montgomery
28099	MS	Neshoba
28101	MS	Newton
28103	MS	Noxubee
28105	MS	Oktibbeha
28107	MS	Panola
28109	MS	Pearl River
28111	MS	Perry
28113	MS	Pike
28115	MS	Pontotoc
28117	MS	Prentiss
28119	MS	Quitman
28121	MS	Rankin
28123	MS	Scott
28125	MS	Sharkey
28127	MS	Simpson
28129	MS	Smith
28131	MS	Stone
28133	MS	Sunflower
28135	MS	Tallahatchie
28137	MS	Tate
28139	MS	Tippah
28141	MS	Tishomingo
28143	MS	Tunica
28145	MS	Union
28147	MS	Walthall
28149	MS	Warren
28151	MS	Washington
28153	MS	Wayne
28155	MS	Webster
28157	MS	Wilkinson
28159	MS	Winston
28161	MS	Yalobusha
28163	MS	Yazoo
28999	MS	Unknown Or Undefined
29001	MO	Adair
29003	MO	Andrew
29005	MO	Atchison
29007	MO	Audrain
29009	MO	Barry
29011	MO	Barton
29013	MO	Bates
29015	MO	Benton
29017	MO	Bollinger
29019	MO	Boone
29021	MO	Buchanan
29023	MO	Butler
29025	MO	Caldwell
29027	MO	Callaway
29029	MO	Camden
29031	MO	Cape Girardeau
29033	MO	Carroll
29035	MO	Carter
29037	MO	Cass
29039	MO	Cedar
29041	MO	Chariton
29043	MO	Christian
29045	MO	Clark
29047	MO	Clay
29049	MO	Clinton
29051	MO	Cole
29053	MO	Cooper
29055	MO	Crawford
29057	MO	Dade
29059	MO	Dallas
29061	MO	Daviess
29063	MO	DeKalb
29065	MO	Dent
29067	MO	Douglas
29069	MO	Dunklin
29071	MO	Franklin
29073	MO	Gasconade
29075	MO	Gentry
29077	MO	Greene
29079	MO	Grundy
29081	MO	Harrison
29083	MO	Henry
29085	MO	Hickory
29087	MO	Holt
29089	MO	Howard
29091	MO	Howell
29093	MO	Iron
29095	MO	Jackson
29097	MO	Jasper
29099	MO	Jefferson
29101	MO	Johnson
29103	MO	Knox
29105	MO	Laclede
29107	MO	Lafayette
29109	MO	Lawrence
29111	MO	Lewis
29113	MO	Lincoln
29115	MO	Linn
29117	MO	Livingston
29119	MO	McDonald
29121	MO	Macon
29123	MO	Madison
29125	MO	Maries
29127	MO	Marion
29129	MO	Mercer
29131	MO	Miller
29133	MO	Mississippi
29135	MO	Moniteau
29137	MO	Monroe
29139	MO	Montgomery
29141	MO	Morgan
29143	MO	New Madrid
29145	MO	Newton
29147	MO	Nodaway
29149	MO	Oregon
29151	MO	Osage
29153	MO	Ozark
29155	MO	Pemiscot
29157	MO	Perry
29159	MO	Pettis
29161	MO	Phelps
29163	MO	Pike
29165	MO	Platte
29167	MO	Polk
29169	MO	Pulaski
29171	MO	Putnam
29173	MO	Ralls
29175	MO	Randolph
29177	MO	Ray
29179	MO	Reynolds
29181	MO	Ripley
29183	MO	St. Charles
29185	MO	St. Clair
29186	MO	Ste. Genevieve
29187	MO	St. Francois
29189	MO	St. Louis
29195	MO	Saline
29197	MO	Schuyler
29199	MO	Scotland
29201	MO	Scott
29203	MO	Shannon
29205	MO	Shelby
29207	MO	Stoddard
29209	MO	Stone
29211	MO	Sullivan
29213	MO	Taney
29215	MO	Texas
29217	MO	Vernon
29219	MO	Warren
29221	MO	Washington
29223	MO	Wayne
29225	MO	Webster
29227	MO	Worth
29229	MO	Wright
29510	MO	St. Louis
29999	MO	Unknown Or Undefined
30001	MT	Beaverhead
30003	MT	Big Horn
30005	MT	Blaine
30007	MT	Broadwater
30009	MT	Carbon
30011	MT	Carter
30013	MT	Cascade
30015	MT	Chouteau
30017	MT	Custer
30019	MT	Daniels
30021	MT	Dawson
30023	MT	Deer Lodge
30025	MT	Fallon
30027	MT	Fergus
30029	MT	Flathead
30031	MT	Gallatin
30033	MT	Garfield
30035	MT	Glacier
30037	MT	Golden Valley
30039	MT	Granite
30041	MT	Hill
30043	MT	Jefferson
30045	MT	Judith Basin
30047	MT	Lake
30049	MT	Lewis and Clark
30051	MT	Liberty
30053	MT	Lincoln
30055	MT	McCone
30057	MT	Madison
30059	MT	Meagher
30061	MT	Mineral
30063	MT	Missoula
30065	MT	Musselshell
30067	MT	Park
30069	MT	Petroleum
30071	MT	Phillips
30073	MT	Pondera
30075	MT	Powder River
30077	MT	Powell
30079	MT	Prairie
30081	MT	Ravalli
30083	MT	Richland
30085	MT	Roosevelt
30087	MT	Rosebud
30089	MT	Sanders
30091	MT	Sheridan
30093	MT	Silver Bow
30095	MT	Stillwater
30097	MT	Sweet Grass
30099	MT	Teton
30101	MT	Toole
30103	MT	Treasure
30105	MT	Valley
30107	MT	Wheatland
30109	MT	Wibaux
30111	MT	Yellowstone
30999	MT	Unknown Or Undefined
31001	NE	Adams
31003	NE	Antelope
31005	NE	Arthur
31007	NE	Banner
31009	NE	Blaine
31011	NE	Boone
31013	NE	Box Butte
31015	NE	Boyd
31017	NE	Brown
31019	NE	Buffalo
31021	NE	Burt
31023	NE	Butler
31025	NE	Cass
31027	NE	Cedar
31029	NE	Chase
31031	NE	Cherry
31033	NE	Cheyenne
31035	NE	Clay
31037	NE	Colfax
31039	NE	Cuming
31041	NE	Custer
31043	NE	Dakota
31045	NE	Dawes
31047	NE	Dawson
31049	NE	Deuel
31051	NE	Dixon
31053	NE	Dodge
31055	NE	Douglas
31057	NE	Dundy
31059	NE	Fillmore
31061	NE	Franklin
31063	NE	Frontier
31065	NE	Furnas
31067	NE	Gage
31069	NE	Garden
31071	NE	Garfield
31073	NE	Gosper
31075	NE	Grant
31077	NE	Greeley
31079	NE	Hall
31081	NE	Hamilton
31083	NE	Harlan
31085	NE	Hayes
31087	NE	Hitchcock
31089	NE	Holt
31091	NE	Hooker
31093	NE	Howard
31095	NE	Jefferson
31097	NE	Johnson
31099	NE	Kearney
31101	NE	Keith
31103	NE	Keya Paha
31105	NE	Kimball
31107	NE	Knox
31109	NE	Lancaster
31111	NE	Lincoln
31113	NE	Logan
31115	NE	Loup
31117	NE	McPherson
31119	NE	Madison
31121	NE	Merrick
31123	NE	Morrill
31125	NE	Nance
31127	NE	Nemaha
31129	NE	Nuckolls
31131	NE	Otoe
31133	NE	Pawnee
31135	NE	Perkins
31137	NE	Phelps
31139	NE	Pierce
31141	NE	Platte
31143	NE	Polk
31145	NE	Red Willow
31147	NE	Richardson
31149	NE	Rock
31151	NE	Saline
31153	NE	Sarpy
31155	NE	Saunders
31157	NE	Scotts Bluff
31159	NE	Seward
31161	NE	Sheridan
31163	NE	Sherman
31165	NE	Sioux
31167	NE	Stanton
31169	NE	Thayer
31171	NE	Thomas
31173	NE	Thurston
31175	NE	Valley
31177	NE	Washington
31179	NE	Wayne
31181	NE	Webster
31183	NE	Wheeler
31185	NE	York
31999	NE	Unknown Or Undefined
32001	NV	Churchill
32003	NV	Clark
32005	NV	Douglas
32007	NV	Elko
32009	NV	Esmeralda
32011	NV	Eureka
32013	NV	Humboldt
32015	NV	Lander
32017	NV	Lincoln
32019	NV	Lyon
32021	NV	Mineral
32023	NV	Nye
32027	NV	Pershing
32029	NV	Storey
32031	NV	Washoe
32033	NV	White Pine
32510	NV	Carson City
32999	NV	Unknown Or Undefined
33001	NH	Belknap
33003	NH	Carroll
33005	NH	Cheshire
33007	NH	Coos
33009	NH	Grafton
33011	NH	Hillsborough
33013	NH	Merrimack
33015	NH	Rockingham
33017	NH	Strafford
33019	NH	Sullivan
33999	NH	Unknown Or Undefined
34001	NJ	Atlantic
34003	NJ	Bergen
34005	NJ	Burlington
34007	NJ	Camden
34009	NJ	Cape May
34011	NJ	Cumberland
34013	NJ	Essex
34015	NJ	Gloucester
34017	NJ	Hudson
34019	NJ	Hunterdon
34021	NJ	Mercer
34023	NJ	Middlesex
34025	NJ	Monmouth
34027	NJ	Morris
34029	NJ	Ocean
34031	NJ	Passaic
34033	NJ	Salem
34035	NJ	Somerset
34037	NJ	Sussex
34039	NJ	Union
34041	NJ	Warren
34999	NJ	Unknown Or Undefined
35001	NM	Bernalillo
35003	NM	Catron
35005	NM	Chaves
35006	NM	Cibola
35007	NM	Colfax
35009	NM	Curry
35011	NM	De Baca
35013	NM	Doña Ana
35015	NM	Eddy
35017	NM	Grant
35019	NM	Guadalupe
35021	NM	Harding
35023	NM	Hidalgo
35025	NM	Lea
35027	NM	Lincoln
35028	NM	Los Alamos
35029	NM	Luna
35031	NM	McKinley
35033	NM	Mora
35035	NM	Otero
35037	NM	Quay
35039	NM	Rio Arriba
35041	NM	Roosevelt
35043	NM	Sandoval
35045	NM	San Juan
35047	NM	San Miguel
35049	NM	Santa Fe
35051	NM	Sierra
35053	NM	Socorro
35055	NM	Taos
35057	NM	Torrance
35059	NM	Union
35061	NM	Valencia
35999	NM	Unknown Or Undefined
36001	NY	Albany
36003	NY	Allegany
36005	NY	Bronx
36007	NY	Broome
36009	NY	Cattaraugus
36011	NY	Cayuga
36013	NY	Chautauqua
36015	NY	Chemung
36017	NY	Chenango
36019	NY	Clinton
36021	NY	Columbia
36023	NY	Cortland
36025	NY	Delaware
36027	NY	Dutchess
36029	NY	Erie
36031	NY	Essex
36033	NY	Franklin
36035	NY	Fulton
36037	NY	Genesee
36039	NY	Greene
36041	NY	Hamilton
36043	NY	Herkimer
36045	NY	Jefferson
36047	NY	Kings
36049	NY	Lewis
36051	NY	Livingston
36053	NY	Madison
36055	NY	Monroe
36057	NY	Montgomery
36059	NY	Nassau
36061	NY	New York
36063	NY	Niagara
36065	NY	Oneida
36067	NY	Onondaga
36069	NY	Ontario
36071	NY	Orange
36073	NY	Orleans
36075	NY	Oswego
36077	NY	Otsego
36079	NY	Putnam
36081	NY	Queens
36083	NY	Rensselaer
36085	NY	Richmond
36087	NY	Rockland
36089	NY	St. Lawrence
36091	NY	Saratoga
36093	NY	Schenectady
36095	NY	Schoharie
36097	NY	Schuyler
36099	NY	Seneca
36101	NY	Steuben
36103	NY	Suffolk
36105	NY	Sullivan
36107	NY	Tioga
36109	NY	Tompkins
36111	NY	Ulster
36113	NY	Warren
36115	NY	Washington
36117	NY	Wayne
36119	NY	Westchester
36121	NY	Wyoming
36123	NY	Yates
36999	NY	Unknown Or Undefined
37001	NC	Alamance
37003	NC	Alexander
37005	NC	Alleghany
37007	NC	Anson
37009	NC	Ashe
37011	NC	Avery
37013	NC	Beaufort
37015	NC	Bertie
37017	NC	Bladen
37019	NC	Brunswick
37021	NC	Buncombe
37023	NC	Burke
37025	NC	Cabarrus
37027	NC	Caldwell
37029	NC	Camden
37031	NC	Carteret
37033	NC	Caswell
37035	NC	Catawba
37037	NC	Chatham
37039	NC	Cherokee
37041	NC	Chowan
37043	NC	Clay
37045	NC	Cleveland
37047	NC	Columbus
37049	NC	Craven
37051	NC	Cumberland
37053	NC	Currituck
37055	NC	Dare
37057	NC	Davidson
37059	NC	Davie
37061	NC	Duplin
37063	NC	Durham
37065	NC	Edgecombe
37067	NC	Forsyth
37069	NC	Franklin
37071	NC	Gaston
37073	NC	Gates
37075	NC	Graham
37077	NC	Granville
37079	NC	Greene
37081	NC	Guilford
37083	NC	Halifax
37085	NC	Harnett
37087	NC	Haywood
37089	NC	Henderson
37091	NC	Hertford
37093	NC	Hoke
37095	NC	Hyde
37097	NC	Iredell
37099	NC	Jackson
37101	NC	Johnston
37103	NC	Jones
37105	NC	Lee
37107	NC	Lenoir
37109	NC	Lincoln
37111	NC	McDowell
37113	NC	Macon
37115	NC	Madison
37117	NC	Martin
37119	NC	Mecklenburg
37121	NC	Mitchell
37123	NC	Montgomery
37125	NC	Moore
37127	NC	Nash
37129	NC	New Hanover
37131	NC	Northampton
37133	NC	Onslow
37135	NC	Orange
37137	NC	Pamlico
37139	NC	Pasquotank
37141	NC	Pender
37143	NC	Perquimans
37145	NC	Person
37147	NC	Pitt
37149	NC	Polk
37151	NC	Randolph
37153	NC	Richmond
37155	NC	Robeson
37157	NC	Rockingham
37159	NC	Rowan
37161	NC	Rutherford
37163	NC	Sampson
37165	NC	Scotland
37167	NC	Stanly
37169	NC	Stokes
37171	NC	Surry
37173	NC	Swain
37175	NC	Transylvania
37177	NC	Tyrrell
37179	NC	Union
37181	NC	Vance
37183	NC	Wake
37185	NC	Warren
37187	NC	Washington
37189	NC	Watauga
37191	NC	Wayne
37193	NC	Wilkes
37195	NC	Wilson
37197	NC	Yadkin
37199	NC	Yancey
37999	NC	Unknown Or Undefined
38001	ND	Adams
38003	ND	Barnes
38005	ND	Benson
38007	ND	Billings
38009	ND	Bottineau
38011	ND	Bowman
38013	ND	Burke
38015	ND	Burleigh
38017	ND	Cass
38019	ND	Cavalier
38021	ND	Dickey
38023	ND	Divide
38025	ND	Dunn
38027	ND	Eddy
38029	ND	Emmons
38031	ND	Foster
38033	ND	Golden Valley
38035	ND	Grand Forks
38037	ND	Grant
38039	ND	Griggs
38041	ND	Hettinger
38043	ND	Kidder
38045	ND	LaMoure
38047	ND	Logan
38049	ND	McHenry
38051	ND	McIntosh
38053	ND	McKenzie
38055	ND	McLean
38057	ND	Mercer
38059	ND	Morton
38061	ND	Mountrail
38063	ND	Nelson
38065	ND	Oliver
38067	ND	Pembina
38069	ND	Pierce
38071	ND	Ramsey
38073	ND	Ransom
38075	ND	Renville
38077	ND	Richland
38079	ND	Rolette
38081	ND	Sargent
38083	ND	Sheridan
38085	ND	Sioux
38087	ND	Slope
38089	ND	Stark
38091	ND	Steele
38093	ND	Stutsman
38095	ND	Towner
38097	ND	Traill
38099	ND	Walsh
38101	ND	Ward
38103	ND	Wells
38105	ND	Williams
38999	ND	Unknown Or Undefined
39001	OH	Adams
39003	OH	Allen
39005	OH	Ashland
39007	OH	Ashtabula
39009	OH	Athens
39011	OH	Auglaize
39013	OH	Belmont
39015	OH	Brown
39017	OH	Butler
39019	OH	Carroll
39021	OH	Champaign
39023	OH	Clark
39025	OH	Clermont
39027	OH	Clinton
39029	OH	Columbiana
39031	OH	Coshocton
39033	OH	Crawford
39035	OH	Cuyahoga
39037	OH	Darke
39039	OH	Defiance
39041	OH	Delaware
39043	OH	Erie
39045	OH	Fairfield
39047	OH	Fayette
39049	OH	Franklin
39051	OH	Fulton
39053	OH	Gallia
39055	OH	Geauga
39057	OH	Greene
39059	OH	Guernsey
39061	OH	Hamilton
39063	OH	Hancock
39065	OH	Hardin
39067	OH	Harrison
39069	OH	Henry
39071	OH	Highland
39073	OH	Hocking
39075	OH	Holmes
39077	OH	Huron
39079	OH	Jackson
39081	OH	Jefferson
39083	OH	Knox
39085	OH	Lake
39087	OH	Lawrence
39089	OH	Licking
39091	OH	Logan
39093	OH	Lorain
39095	OH	Lucas
39097	OH	Madison
39099	OH	Mahoning
39101	OH	Marion
39103	OH	Medina
39105	OH	Meigs
39107	OH	Mercer
39109	OH	Miami
39111	OH	Monroe
39113	OH	Montgomery
39115	OH	Morgan
39117	OH	Morrow
39119	OH	Muskingum
39121	OH	Noble
39123	OH	Ottawa
39125	OH	Paulding
39127	OH	Perry
39129	OH	Pickaway
39131	OH	Pike
39133	OH	Portage
39135	OH	Preble
39137	OH	Putnam
39139	OH	Richland
39141	OH	Ross
39143	OH	Sandusky
39145	OH	Scioto
39147	OH	Seneca
39149	OH	Shelby
39151	OH	Stark
39153	OH	Summit
39155	OH	Trumbull
39157	OH	Tuscarawas
39159	OH	Union
39161	OH	Van Wert
39163	OH	Vinton
39165	OH	Warren
39167	OH	Washington
39169	OH	Wayne
39171	OH	Williams
39173	OH	Wood
39175	OH	Wyandot
39999	OH	Unknown Or Undefined
40001	OK	Adair
40003	OK	Alfalfa
40005	OK	Atoka
40007	OK	Beaver
40009	OK	Beckham
40011	OK	Blaine
40013	OK	Bryan
40015	OK	Caddo
40017	OK	Canadian
40019	OK	Carter
40021	OK	Cherokee
40023	OK	Choctaw
40025	OK	Cimarron
40027	OK	Cleveland
40029	OK	Coal
40031	OK	Comanche
40033	OK	Cotton
40035	OK	Craig
40037	OK	Creek
40039	OK	Custer
40041	OK	Delaware
40043	OK	Dewey
40045	OK	Ellis
40047	OK	Garfield
40049	OK	Garvin
40051	OK	Grady
40053	OK	Grant
40055	OK	Greer
40057	OK	Harmon
40059	OK	Harper
40061	OK	Haskell
40063	OK	Hughes
40065	OK	Jackson
40067	OK	Jefferson
40069	OK	Johnston
40071	OK	Kay
40073	OK	Kingfisher
40075	OK	Kiowa
40077	OK	Latimer
40079	OK	Le Flore
40081	OK	Lincoln
40083	OK	Logan
40085	OK	Love
40087	OK	McClain
40089	OK	McCurtain
40091	OK	McIntosh
40093	OK	Major
40095	OK	Marshall
40097	OK	Mayes
40099	OK	Murray
40101	OK	Muskogee
40103	OK	Noble
40105	OK	Nowata
40107	OK	Okfuskee
40109	OK	Oklahoma
40111	OK	Okmulgee
40113	OK	Osage
40115	OK	Ottawa
40117	OK	Pawnee
40119	OK	Payne
40121	OK	Pittsburg
40123	OK	Pontotoc
40125	OK	Pottawatomie
40127	OK	Pushmataha
40129	OK	Roger Mills
40131	OK	Rogers
40133	OK	Seminole
40135	OK	Sequoyah
40137	OK	Stephens
40139	OK	Texas
40141	OK	Tillman
40143	OK	Tulsa
40145	OK	Wagoner
40147	OK	Washington
40149	OK	Washita
40151	OK	Woods
40153	OK	Woodward
40999	OK	Unknown Or Undefined
41001	OR	Baker
41003	OR	Benton
41005	OR	Clackamas
41007	OR	Clatsop
41009	OR	Columbia
41011	OR	Coos
41013	OR	Crook
41015	OR	Curry
41017	OR	Deschutes
41019	OR	Douglas
41021	OR	Gilliam
41023	OR	Grant
41025	OR	Harney
41027	OR	Hood River
41029	OR	Jackson
41031	OR	Jefferson
41033	OR	Josephine
41035	OR	Klamath
41037	OR	Lake
41039	OR	Lane
41041	OR	Lincoln
41043	OR	Linn
41045	OR	Malheur
41047	OR	Marion
41049	OR	Morrow
41051	OR	Multnomah
41053	OR	Polk
41055	OR	Sherman
41057	OR	Tillamook
41059	OR	Umatilla
41061	OR	Union
41063	OR	Wallowa
41065	OR	Wasco
41067	OR	Washington
41069	OR	Wheeler
41071	OR	Yamhill
41999	OR	Unknown Or Undefined
42001	PA	Adams
42003	PA	Allegheny
42005	PA	Armstrong
42007	PA	Beaver
42009	PA	Bedford
42011	PA	Berks
42013	PA	Blair
42015	PA	Bradford
42017	PA	Bucks
42019	PA	Butler
42021	PA	Cambria
42023	PA	Cameron
42025	PA	Carbon
42027	PA	Centre
42029	PA	Chester
42031	PA	Clarion
42033	PA	Clearfield
42035	PA	Clinton
42037	PA	Columbia
42039	PA	Crawford
42041	PA	Cumberland
42043	PA	Dauphin
42045	PA	Delaware
42047	PA	Elk
42049	PA	Erie
42051	PA	Fayette
42053	PA	Forest
42055	PA	Franklin
42057	PA	Fulton
42059	PA	Greene
42061	PA	Huntingdon
42063	PA	Indiana
42065	PA	Jefferson
42067	PA	Juniata
42069	PA	Lackawanna
42071	PA	Lancaster
42073	PA	Lawrence
42075	PA	Lebanon
42077	PA	Lehigh
42079	PA	Luzerne
42081	PA	Lycoming
42083	PA	McKean
42085	PA	Mercer
42087	PA	Mifflin
42089	PA	Monroe
42091	PA	Montgomery
42093	PA	Montour
42095	PA	Northampton
42097	PA	Northumberland
42099	PA	Perry
42101	PA	Philadelphia
42103	PA	Pike
42105	PA	Potter
42107	PA	Schuylkill
42109	PA	Snyder
42111	PA	Somerset
42113	PA	Sullivan
42115	PA	Susquehanna
42117	PA	Tioga
42119	PA	Union
42121	PA	Venango
42123	PA	Warren
42125	PA	Washington
42127	PA	Wayne
42129	PA	Westmoreland
42131	PA	Wyoming
42133	PA	York
42999	PA	Unknown Or Undefined
44001	RI	Bristol
44003	RI	Kent
44005	RI	Newport
44007	RI	Providence
44009	RI	Washington
44999	RI	Unknown Or Undefined
45001	SC	Abbeville
45003	SC	Aiken
45005	SC	Allendale
45007	SC	Anderson
45009	SC	Bamberg
45011	SC	Barnwell
45013	SC	Beaufort
45015	SC	Berkeley
45017	SC	Calhoun
45019	SC	Charleston
45021	SC	Cherokee
45023	SC	Chester
45025	SC	Chesterfield
45027	SC	Clarendon
45029	SC	Colleton
45031	SC	Darlington
45033	SC	Dillon
45035	SC	Dorchester
45037	SC	Edgefield
45039	SC	Fairfield
45041	SC	Florence
45043	SC	Georgetown
45045	SC	Greenville
45047	SC	Greenwood
45049	SC	Hampton
45051	SC	Horry
45053	SC	Jasper
45055	SC	Kershaw
45057	SC	Lancaster
45059	SC	Laurens
45061	SC	Lee
45063	SC	Lexington
45065	SC	McCormick
45067	SC	Marion
45069	SC	Marlboro
45071	SC	Newberry
45073	SC	Oconee
45075	SC	Orangeburg
45077	SC	Pickens
45079	SC	Richland
45081	SC	Saluda
45083	SC	Spartanburg
45085	SC	Sumter
45087	SC	Union
45089	SC	Williamsburg
45091	SC	York
45999	SC	Unknown Or Undefined
46003	SD	Aurora
46005	SD	Beadle
46007	SD	Bennett
46009	SD	Bon Homme
46011	SD	Brookings
46013	SD	Brown
46015	SD	Brule
46017	SD	Buffalo
46019	SD	Butte
46021	SD	Campbell
46023	SD	Charles Mix
46025	SD	Clark
46027	SD	Clay
46029	SD	Codington
46031	SD	Corson
46033	SD	Custer
46035	SD	Davison
46037	SD	Day
46039	SD	Deuel
46041	SD	Dewey
46043	SD	Douglas
46045	SD	Edmunds
46047	SD	Fall River
46049	SD	Faulk
46051	SD	Grant
46053	SD	Gregory
46055	SD	Haakon
46057	SD	Hamlin
46059	SD	Hand
46061	SD	Hanson
46063	SD	Harding
46065	SD	Hughes
46067	SD	Hutchinson
46069	SD	Hyde
46071	SD	Jackson
46073	SD	Jerauld
46075	SD	Jones
46077	SD	Kingsbury
46079	SD	Lake
46081	SD	Lawrence
46083	SD	Lincoln
46085	SD	Lyman
46087	SD	McCook
46089	SD	McPherson
46091	SD	Marshall
46093	SD	Meade
46095	SD	Mellette
46097	SD	Miner
46099	SD	Minnehaha
46101	SD	Moody
46102	SD	Oglala Lakota
46103	SD	Pennington
46105	SD	Perkins
46107	SD	Potter
46109	SD	Roberts
46111	SD	Sanborn
46115	SD	Spink
46117	SD	Stanley
46119	SD	Sully
46121	SD	Todd
46123	SD	Tripp
46125	SD	Turner
46127	SD	Union
46129	SD	Walworth
46135	SD	Yankton
46137	SD	Ziebach
46999	SD	Unknown Or Undefined
47001	TN	Anderson
47003	TN	Bedford
47005	TN	Benton
47007	TN	Bledsoe
47009	TN	Blount
47011	TN	Bradley
47013	TN	Campbell
47015	TN	Cannon
47017	TN	Carroll
47019	TN	Carter
47021	TN	Cheatham
47023	TN	Chester
47025	TN	Claiborne
47027	TN	Clay
47029	TN	Cocke
47031	TN	Coffee
47033	TN	Crockett
47035	TN	Cumberland
47037	TN	Davidson
47039	TN	Decatur
47041	TN	DeKalb
47043	TN	Dickson
47045	TN	Dyer
47047	TN	Fayette
47049	TN	Fentress
47051	TN	Franklin
47053	TN	Gibson
47055	TN	Giles
47057	TN	Grainger
47059	TN	Greene
47061	TN	Grundy
47063	TN	Hamblen
47065	TN	Hamilton
47067	TN	Hancock
47069	TN	Hardeman
47071	TN	Hardin
47073	TN	Hawkins
47075	TN	Haywood
47077	TN	Henderson
47079	TN	Henry
47081	TN	Hickman
47083	TN	Houston
47085	TN	Humphreys
47087	TN	Jackson
47089	TN	Jefferson
47091	TN	Johnson
47093	TN	Knox
47095	TN	Lake
47097	TN	Lauderdale
47099	TN	Lawrence
47101	TN	Lewis
47103	TN	Lincoln
47105	TN	Loudon
47107	TN	McMinn
47109	TN	McNairy
47111	TN	Macon
47113	TN	Madison
47115	TN	Marion
47117	TN	Marshall
47119	TN	Maury
47121	TN	Meigs
47123	TN	Monroe
47125	TN	Montgomery
47127	TN	Moore
47129	TN	Morgan
47131	TN	Obion
47133	TN	Overton
47135	TN	Perry
47137	TN	Pickett
47139	TN	Polk
47141	TN	Putnam
47143	TN	Rhea
47145	TN	Roane
47147	TN	Robertson
47149	TN	Rutherford
47151	TN	Scott
47153	TN	Sequatchie
47155	TN	Sevier
47157	TN	Shelby
47159	TN	Smith
47161	TN	Stewart
47163	TN	Sullivan
47165	TN	Sumner
47167	TN	Tipton
47169	TN	Trousdale
47171	TN	Unicoi
47173	TN	Union
47175	TN	Van Buren
47177	TN	Warren
47179	TN	Washington
47181	TN	Wayne
47183	TN	Weakley
47185	TN	White
47187	TN	Williamson
47189	TN	Wilson
47999	TN	Unknown Or Undefined
48001	TX	Anderson
48003	TX	Andrews
48005	TX	Angelina
48007	TX	Aransas
48009	TX	Archer
48011	TX	Armstrong
48013	TX	Atascosa
48015	TX	Austin
48017	TX	Bailey
48019	TX	Bandera
48021	TX	Bastrop
48023	TX	Baylor
48025	TX	Bee
48027	TX	Bell
48029	TX	Bexar
48031	TX	Blanco
48033	TX	Borden
48035	TX	Bosque
48037	TX	Bowie
48039	TX	Brazoria
48041	TX	Brazos
48043	TX	Brewster
48045	TX	Briscoe
48047	TX	Brooks
48049	TX	Brown
48051	TX	Burleson
48053	TX	Burnet
48055	TX	Caldwell
48057	TX	Calhoun
48059	TX	Callahan
48061	TX	Cameron
48063	TX	Camp
48065	TX	Carson
48067	TX	Cass
48069	TX	Castro
48071	TX	Chambers
48073	TX	Cherokee
48075	TX	Childress
48077	TX	Clay
48079	TX	Cochran
48081	TX	Coke
48083	TX	Coleman
48085	TX	Collin
48087	TX	Collingsworth
48089	TX	Colorado
48091	TX	Comal
48093	TX	Comanche
48095	TX	Concho
48097	TX	Cooke
48099	TX	Coryell
48101	TX	Cottle
48103	TX	Crane
48105	TX	Crockett
48107	TX	Crosby
48109	TX	Culberson
48111	TX	Dallam
48113	TX	Dallas
48115	TX	Dawson
48117	TX	Deaf Smith
48119	TX	Delta
48121	TX	Denton
48123	TX	DeWitt
48125	TX	Dickens
48127	TX	Dimmit
48129	TX	Donley
48131	TX	Duval
48133	TX	Eastland
48135	TX	Ector
48137	TX	Edwards
48139	TX	Ellis
48141	TX	El Paso
48143	TX	Erath
48145	TX	Falls
48147	TX	Fannin
48149	TX	Fayette
48151	TX	Fisher
48153	TX	Floyd
48155	TX	Foard
48157	TX	Fort Bend
48159	TX	Franklin
48161	TX	Freestone
48163	TX	Frio
48165	TX	Gaines
48167	TX	Galveston
48169	TX	Garza
48171	TX	Gillespie
48173	TX	Glasscock
48175	TX	Goliad
48177	TX	Gonzales
48179	TX	Gray
48181	TX	Grayson
48183	TX	Gregg
48185	TX	Grimes
48187	TX	Guadalupe
48189	TX	Hale
48191	TX	Hall
48193	TX	Hamilton
48195	TX	Hansford
48197	TX	Hardeman
48199	TX	Hardin
48201	TX	Harris
48203	TX	Harrison
48205	TX	Hartley
48207	TX	Haskell
48209	TX	Hays
48211	TX	Hemphill
48213	TX	Henderson
48215	TX	Hidalgo
48217	TX	Hill
48219	TX	Hockley
48221	TX	Hood
48223	TX	Hopkins
48225	TX	Houston
48227	TX	Howard
48229	TX	Hudspeth
48231	TX	Hunt
48233	TX	Hutchinson
48235	TX	Irion
48237	TX	Jack
48239	TX	Jackson
48241	TX	Jasper
48243	TX	Jeff Davis
48245	TX	Jefferson
48247	TX	Jim Hogg
48249	TX	Jim Wells
48251	TX	Johnson
48253	TX	Jones
48255	TX	Karnes
48257	TX	Kaufman
48259	TX	Kendall
48261	TX	Kenedy
48263	TX	Kent
48265	TX	Kerr
48267	TX	Kimble
48269	TX	King
48271	TX	Kinney
48273	TX	Kleberg
48275	TX	Knox
48277	TX	Lamar
48279	TX	Lamb
48281	TX	Lampasas
48283	TX	La Salle
48285	TX	Lavaca
48287	TX	Lee
48289	TX	Leon
48291	TX	Liberty
48293	TX	Limestone
48295	TX	Lipscomb
48297	TX	Live Oak
48299	TX	Llano
48301	TX	Loving
48303	TX	Lubbock
48305	TX	Lynn
48307	TX	McCulloch
48309	TX	McLennan
48311	TX	McMullen
48313	TX	Madison
48315	TX	Marion
48317	TX	Martin
48319	TX	Mason
48321	TX	Matagorda
48323	TX	Maverick
48325	TX	Medina
48327	TX	Menard
48329	TX	Midland
48331	TX	Milam
48333	TX	Mills
48335	TX	Mitchell
48337	TX	Montague
48339	TX	Montgomery
48341	TX	Moore
48343	TX	Morris
48345	TX	Motley
48347	TX	Nacogdoches
48349	TX	Navarro
48351	TX	Newton
48353	TX	Nolan
48355	TX	Nueces
48357	TX	Ochiltree
48359	TX	Oldham
48361	TX	Orange
48363	TX	Palo Pinto
48365	TX	Panola
48367	TX	Parker
48369	TX	Parmer
48371	TX	Pecos
48373	TX	Polk
48375	TX	Potter
48377	TX	Presidio
48379	TX	Rains
48381	TX	Randall
48383	TX	Reagan
48385	TX	Real
48387	TX	Red River
48389	TX	Reeves
48391	TX	Refugio
48393	TX	Roberts
48395	TX	Robertson
48397	TX	Rockwall
48399	TX	Runnels
48401	TX	Rusk
48403	TX	Sabine
48405	TX	San Augustine
48407	TX	San Jacinto
48409	TX	San Patricio
48411	TX	San Saba
48413	TX	Schleicher
48415	TX	Scurry
48417	TX	Shackelford
48419	TX	Shelby
48421	TX	Sherman
48423	TX	Smith
48425	TX	Somervell
48427	TX	Starr
48429	TX	Stephens
48431	TX	Sterling
48433	TX	Stonewall
48435	TX	Sutton
48437	TX	Swisher
48439	TX	Tarrant
48441	TX	Taylor
48443	TX	Terrell
48445	TX	Terry
48447	TX	Throckmorton
48449	TX	Titus
48451	TX	Tom Green
48453	TX	Travis
48455	TX	Trinity
48457	TX	Tyler
48459	TX	Upshur
48461	TX	Upton
48463	TX	Uvalde
48465	TX	Val Verde
48467	TX	Van Zandt
48469	TX	Victoria
48471	TX	Walker
48473	TX	Waller
48475	TX	Ward
48477	TX	Washington
48479	TX	Webb
48481	TX	Wharton
48483	TX	Wheeler
48485	TX	Wichita
48487	TX	Wilbarger
48489	TX	Willacy
48491	TX	Williamson
48493	TX	Wilson
48495	TX	Winkler
48497	TX	Wise
48499	TX	Wood
48501	TX	Yoakum
48503	TX	Young
48505	TX	Zapata
48507	TX	Zavala
48999	TX	Unknown Or Undefined
49001	UT	Beaver
49003	UT	Box Elder
49005	UT	Cache
49007	UT	Carbon
49009	UT	Daggett
49011	UT	Davis
49013	UT	Duchesne
49015	UT	Emery
49017	UT	Garfield
49019	UT	Grand
49021	UT	Iron
49023	UT	Juab
49025	UT	Kane
49027	UT	Millard
49029	UT	Morgan
49031	UT	Piute
49033	UT	Rich
49035	UT	Salt Lake
49037	UT	San Juan
49039	UT	Sanpete
49041	UT	Sevier
49043	UT	Summit
49045	UT	Tooele
49047	UT	Uintah
49049	UT	Utah
49051	UT	Wasatch
49053	UT	Washington
49055	UT	Wayne
49057	UT	Weber
49999	UT	Unknown Or Undefined
50001	VT	Addison
50003	VT	Bennington
50005	VT	Caledonia
50007	VT	Chittenden
50009	VT	Essex
50011	VT	Franklin
50013	VT	Grand Isle
50015	VT	Lamoille
50017	VT	Orange
50019	VT	Orleans
50021	VT	Rutland
50023	VT	Washington
50025	VT	Windham
50027	VT	Windsor
50999	VT	Unknown Or Undefined
51001	VA	Accomack
51003	VA	Albemarle
51005	VA	Alleghany
51007	VA	Amelia
51009	VA	Amherst
51011	VA	Appomattox
51013	VA	Arlington
51015	VA	Augusta
51017	VA	Bath
51019	VA	Bedford
51021	VA	Bland
51023	VA	Botetourt
51025	VA	Brunswick
51027	VA	Buchanan
51029	VA	Buckingham
51031	VA	Campbell
51033	VA	Caroline
51035	VA	Carroll
51036	VA	Charles City
51037	VA	Charlotte
51041	VA	Chesterfield
51043	VA	Clarke
51045	VA	Craig
51047	VA	Culpeper
51049	VA	Cumberland
51051	VA	Dickenson
51053	VA	Dinwiddie
51057	VA	Essex
51059	VA	Fairfax
51061	VA	Fauquier
51063	VA	Floyd
51065	VA	Fluvanna
51067	VA	Franklin
51069	VA	Frederick
51071	VA	Giles
51073	VA	Gloucester
51075	VA	Goochland
51077	VA	Grayson
51079	VA	Greene
51081	VA	Greensville
51083	VA	Halifax
51085	VA	Hanover
51087	VA	Henrico
51089	VA	Henry
51091	VA	Highland
51093	VA	Isle of Wight
51095	VA	James City
51097	VA	King and Queen
51099	VA	King George
51101	VA	King William
51103	VA	Lancaster
51105	VA	Lee
51107	VA	Loudoun
51109	VA	Louisa
51111	VA	Lunenburg
51113	VA	Madison
51115	VA	Mathews
51117	VA	Mecklenburg
51119	VA	Middlesex
51121	VA	Montgomery
51125	VA	Nelson
51127	VA	New Kent
51131	VA	Northampton
51133	VA	Northumberland
51135	VA	Nottoway
51137	VA	Orange
51139	VA	Page
51141	VA	Patrick
51143	VA	Pittsylvania
51145	VA	Powhatan
51147	VA	Prince Edward
51149	VA	Prince George
51153	VA	Prince William
51155	VA	Pulaski
51157	VA	Rappahannock
51159	VA	Richmond
51161	VA	Roanoke
51163	VA	Rockbridge
51165	VA	Rockingham
51167	VA	Russell
51169	VA	Scott
51171	VA	Shenandoah
51173	VA	Smyth
51175	VA	Southampton
51177	VA	Spotsylvania
51179	VA	Stafford
51181	VA	Surry
51183	VA	Sussex
51185	VA	Tazewell
51187	VA	Warren
51191	VA	Washington
51193	VA	Westmoreland
51195	VA	Wise
51197	VA	Wythe
51199	VA	York
51510	VA	Alexandria
51520	VA	Bristol
51530	VA	Buena Vista
51540	VA	Charlottesville
51550	VA	Chesapeake
51570	VA	Colonial Heights
51580	VA	Covington
51590	VA	Danville
51595	VA	Emporia
51600	VA	Fairfax
51610	VA	Falls Church
51620	VA	Franklin
51630	VA	Fredericksburg
51640	VA	Galax
51650	VA	Hampton
51660	VA	Harrisonburg
51670	VA	Hopewell
51678	VA	Lexington
51680	VA	Lynchburg
51683	VA	Manassas
51685	VA	Manassas Park
51690	VA	Martinsville
51700	VA	Newport News
51710	VA	Norfolk
51720	VA	Norton
51730	VA	Petersburg
51735	VA	Poquoson
51740	VA	Portsmouth
51750	VA	Radford
51760	VA	Richmond
51770	VA	Roanoke
51775	VA	Salem
51790	VA	Staunton
51800	VA	Suffolk
51810	VA	Virginia Beach
51820	VA	Waynesboro
51830	VA	Williamsburg
51840	VA	Winchester
51999	VA	Unknown Or Undefined
53001	WA	Adams
53003	WA	Asotin
53005	WA	Benton
53007	WA	Chelan
53009	WA	Clallam
53011	WA	Clark
53013	WA	Columbia
53015	WA	Cowlitz
53017	WA	Douglas
53019	WA	Ferry
53021	WA	Franklin
53023	WA	Garfield
53025	WA	Grant
53027	WA	Grays Harbor
53029	WA	Island
53031	WA	Jefferson
53033	WA	King
53035	WA	Kitsap
53037	WA	Kittitas
53039	WA	Klickitat
53041	WA	Lewis
53043	WA	Lincoln
53045	WA	Mason
53047	WA	Okanogan
53049	WA	Pacific
53051	WA	Pend Oreille
53053	WA	Pierce
53055	WA	San Juan
53057	WA	Skagit
53059	WA	Skamania
53061	WA	Snohomish
53063	WA	Spokane
53065	WA	Stevens
53067	WA	Thurston
53069	WA	Wahkiakum
53071	WA	Walla Walla
53073	WA	Whatcom
53075	WA	Whitman
53077	WA	Yakima
53999	WA	Unknown Or Undefined
54001	WV	Barbour
54003	WV	Berkeley
54005	WV	Boone
54007	WV	Braxton
54009	WV	Brooke
54011	WV	Cabell
54013	WV	Calhoun
54015	WV	Clay
54017	WV	Doddridge
54019	WV	Fayette
54021	WV	Gilmer
54023	WV	Grant
54025	WV	Greenbrier
54027	WV	Hampshire
54029	WV	Hancock
54031	WV	Hardy
54033	WV	Harrison
54035	WV	Jackson
54037	WV	Jefferson
54039	WV	Kanawha
54041	WV	Lewis
54043	WV	Lincoln
54045	WV	Logan
54047	WV	McDowell
54049	WV	Marion
54051	WV	Marshall
54053	WV	Mason
54055	WV	Mercer
54057	WV	Mineral
54059	WV	Mingo
54061	WV	Monongalia
54063	WV	Monroe
54065	WV	Morgan
54067	WV	Nicholas
54069	WV	Ohio
54071	WV	Pendleton
54073	WV	Pleasants
54075	WV	Pocahontas
54077	WV	Preston
54079	WV	Putnam
54081	WV	Raleigh
54083	WV	Randolph
54085	WV	Ritchie
54087	WV	Roane
54089	WV	Summers
54091	WV	Taylor
54093	WV	Tucker
54095	WV	Tyler
54097	WV	Upshur
54099	WV	Wayne
54101	WV	Webster
54103	WV	Wetzel
54105	WV	Wirt
54107	WV	Wood
54109	WV	Wyoming
54999	WV	Unknown Or Undefined
55001	WI	Adams
55003	WI	Ashland
55005	WI	Barron
55007	WI	Bayfield
55009	WI	Brown
55011	WI	Buffalo
55013	WI	Burnett
55015	WI	Calumet
55017	WI	Chippewa
55019	WI	Clark
55021	WI	Columbia
55023	WI	Crawford
55025	WI	Dane
55027	WI	Dodge
55029	WI	Door
55031	WI	Douglas
55033	WI	Dunn
55035	WI	Eau Claire
55037	WI	Florence
55039	WI	Fond du Lac
55041	WI	Forest
55043	WI	Grant
55045	WI	Green
55047	WI	Green Lake
55049	WI	Iowa
55051	WI	Iron
55053	WI	Jackson
55055	WI	Jefferson
55057	WI	Juneau
55059	WI	Kenosha
55061	WI	Kewaunee
55063	WI	La Crosse
55065	WI	Lafayette
55067	WI	Langlade
55069	WI	Lincoln
55071	WI	Manitowoc
55073	WI	Marathon
55075	WI	Marinette
55077	WI	Marquette
55078	WI	Menominee
55079	WI	Milwaukee
55081	WI	Monroe
55083	WI	Oconto
55085	WI	Oneida
55087	WI	Outagamie
55089	WI	Ozaukee
55091	WI	Pepin
55093	WI	Pierce
55095	WI	Polk
55097	WI	Portage
55099	WI	Price
55101	WI	Racine
55103	WI	Richland
55105	WI	Rock
55107	WI	Rusk
55109	WI	St. Croix
55111	WI	Sauk
55113	WI	Sawyer
55115	WI	Shawano
55117	WI	Sheboygan
55119	WI	Taylor
55121	WI	Trempealeau
55123	WI	Vernon
55125	WI	Vilas
55127	WI	Walworth
55129	WI	Washburn
55131	WI	Washington
55133	WI	Waukesha
55135	WI	Waupaca
55137	WI	Waushara
55139	WI	Winnebago
55141	WI	Wood
55999	WI	Unknown Or Undefined
56001	WY	Albany
56003	WY	Big Horn
56005	WY	Campbell
56007	WY	Carbon
56009	WY	Converse
56011	WY	Crook
56013	WY	Fremont
56015	WY	Goshen
56017	WY	Hot Springs
56019	WY	Johnson
56021	WY	Laramie
56023	WY	Lincoln
56025	WY	Natrona
56027	WY	Niobrara
56029	WY	Park
56031	WY	Platte
56033	WY	Sheridan
56035	WY	Sublette
56037	WY	Sweetwater
56039	WY	Teton
56041	WY	Uinta
56043	WY	Washakie
56045	WY	Weston
56999	WY	Unknown Or Undefined
\.

COPY statistics.county_metric (county_fips, year, bea_total_income, population, bls_labor_force, bls_employed) FROM stdin;
1001	2020	2659457000	58902	26350	24955
1001	2021	2896204000	59210	26429	25698
1001	2022	2951555000	59759	26656	26065
1003	2020	11947762000	233219	98695	92639
1003	2021	13371784000	239361	99520	96619
1003	2022	13984484000	246435	102280	99930
1005	2020	926302000	24960	8659	7995
1005	2021	1001067000	24539	8243	7787
1005	2022	1002082000	24706	8139	7813
1007	2020	775032000	22183	8692	8063
1007	2021	831602000	22370	8604	8312
1007	2022	825481000	22005	8688	8476
1009	2020	2253760000	59102	25065	23944
1009	2021	2531922000	59085	25268	24674
1009	2022	2603321000	59512	25685	25128
1011	2020	313972000	10296	4866	4577
1011	2021	338240000	10280	4617	4436
1011	2022	320278000	10202	4541	4416
1013	2020	752367000	19031	9211	8335
1013	2021	852499000	18855	8781	8332
1013	2022	874977000	18650	8811	8518
1015	2020	4601998000	116239	46910	43315
1015	2021	4979361000	115677	46166	44307
1015	2022	4924818000	115788	45733	44371
1017	2020	1255880000	34645	16055	14866
1017	2021	1340950000	34446	15722	15155
1017	2022	1325192000	34088	15906	15508
1019	2020	998154000	24972	11649	11060
1019	2021	1116709000	25026	11635	11341
1019	2022	1135638000	25302	11723	11457
1021	2020	1735895000	45051	19894	18817
1021	2021	1901425000	45259	19918	19360
1021	2022	1937737000	45884	20180	19732
1023	2020	511455000	12619	4686	4345
1023	2021	543231000	12549	4547	4351
1023	2022	577667000	12439	4325	4164
1025	2020	947607000	22981	7875	7108
1025	2021	1017276000	22715	7702	7255
1025	2022	1017200000	22515	7676	7302
1027	2020	498363000	14211	6128	5858
1027	2021	550148000	14190	6021	5858
1027	2022	566161000	14198	6106	5971
1029	2020	571310000	15063	5840	5549
1029	2021	647993000	15148	5888	5737
1029	2022	678830000	15346	6133	5989
1031	2020	2411713000	53547	21963	20913
1031	2021	2710078000	54171	21530	20927
1031	2022	2780219000	54805	21624	21090
1033	2020	2294959000	57299	23837	22125
1033	2021	2522700000	57619	23506	22592
1033	2022	2557002000	58033	23749	23047
1035	2020	428621000	11553	4570	4209
1035	2021	458091000	11320	4371	4165
1035	2022	452451000	11206	4252	4106
1037	2020	372279000	10341	4418	4151
1037	2021	399089000	10366	4352	4220
1037	2022	402750000	10166	4463	4353
1039	2020	1422508000	37507	15308	14483
1039	2021	1564704000	37542	15166	14711
1039	2022	1562086000	37602	15080	14692
1041	2020	525744000	13165	6357	5964
1041	2021	595160000	13056	6103	5903
1041	2022	623658000	13025	5965	5805
1043	2020	3717435000	88131	38785	36947
1043	2021	4190757000	89618	38763	37857
1043	2022	4453657000	90665	39477	38688
1045	2020	1983112000	49253	20883	19769
1045	2021	2179098000	49412	20883	20228
1045	2022	2178403000	49544	21026	20490
1047	2020	1499041000	38174	14791	13076
1047	2021	1583677000	37565	13902	12921
1047	2022	1537291000	36767	13733	13058
1049	2020	2478755000	71648	31225	29685
1049	2021	2878038000	71829	30867	30085
1049	2022	2920072000	71998	30958	30249
1051	2020	3921440000	87853	37583	35614
1051	2021	4298599000	88737	37708	36702
1051	2022	4394906000	89563	38045	37230
1053	2020	1334403000	36680	14569	13595
1053	2021	1457874000	36658	14081	13518
1053	2022	1424022000	36666	14198	13769
1055	2020	4097213000	103447	41310	37867
1055	2021	4390748000	103139	39267	37701
1055	2022	4427730000	103088	39123	37967
1057	2020	624163000	16330	6650	6286
1057	2021	676738000	16155	6612	6411
1057	2022	677542000	16118	6583	6408
1059	2020	1170652000	32075	14537	13827
1059	2021	1281396000	31996	14289	13930
1059	2022	1343049000	31932	14532	14200
1061	2020	1019276000	26696	11007	10508
1061	2021	1113896000	26667	11020	10715
1061	2022	1105684000	26783	11187	10925
1063	2020	282090000	7702	3084	2725
1063	2021	301103000	7592	2888	2700
1063	2022	282808000	7422	2757	2641
1065	2020	608503000	14768	6147	5522
1065	2021	652744000	14737	5888	5566
1065	2022	630777000	14595	5940	5714
1067	2020	816757000	17175	6894	6527
1067	2021	897658000	17434	6899	6682
1067	2022	918858000	17655	7003	6817
1069	2020	5077303000	107286	47116	44343
1069	2021	5503234000	107453	46988	45422
1069	2022	5522370000	108079	47661	46452
1071	2020	2044238000	52545	23039	21700
1071	2021	2269063000	52694	22972	22319
1071	2022	2288835000	52891	23233	22666
1073	2020	39180917000	674675	319645	298089
1073	2021	42883620000	669997	318929	307640
1073	2022	44146370000	665409	321927	313808
1075	2020	513477000	13956	5775	5467
1075	2021	543900000	13740	5682	5514
1075	2022	537237000	13705	5711	5561
1077	2020	3967729000	94025	42555	39978
1077	2021	4224245000	94862	42181	40869
1077	2022	4324777000	95878	42754	41654
1079	2020	1221548000	33089	14497	13719
1079	2021	1393865000	33123	14441	14025
1079	2022	1379110000	33214	14691	14346
1081	2020	7221431000	174742	76367	72003
1081	2021	8002677000	177655	76870	74721
1081	2022	8440449000	180773	78872	77053
1083	2020	4983548000	104190	45800	43673
1083	2021	5677871000	107381	46779	45648
1083	2022	5982430000	110900	48438	47454
1085	2020	433618000	10273	3710	3178
1085	2021	469355000	9926	3570	3261
1085	2022	455991000	9777	3486	3309
1087	2020	677119000	19473	8162	7318
1087	2021	717400000	18906	7902	7446
1087	2022	706110000	18516	7824	7533
1089	2020	21971488000	390502	189236	179653
1089	2021	23874287000	396593	193037	188008
1089	2022	24719104000	403565	199682	195558
1091	2020	843654000	19266	7845	7310
1091	2021	888074000	18961	7610	7292
1091	2022	877241000	18745	7626	7374
1093	2020	1082048000	29166	13262	12530
1093	2021	1196892000	29006	13430	13055
1093	2022	1234162000	29156	13786	13452
1095	2020	4019939000	97696	44695	42649
1095	2021	4453479000	98316	44704	43644
1095	2022	4562769000	99423	45445	44538
1097	2020	17575062000	414353	194559	177944
1097	2021	19565291000	413017	189877	181128
1097	2022	19577510000	411411	189712	183641
1099	2020	763078000	19704	7605	6935
1099	2021	823450000	19557	7336	6933
1099	2022	798999000	19404	7267	6976
1101	2020	10529239000	228322	108049	98928
1101	2021	11158054000	226953	106859	101883
1101	2022	11136712000	226361	106639	103432
1103	2020	5279542000	123288	59616	56703
1103	2021	5707082000	123403	59526	58008
1103	2022	5738903000	124211	60647	59410
1105	2020	318879000	8458	3442	3035
1105	2021	332635000	8317	3192	2941
1105	2022	307674000	8035	3071	2914
1107	2020	744224000	18922	7670	7120
1107	2021	795575000	18615	7513	7211
1107	2022	797687000	18697	7658	7415
1109	2020	1347047000	32906	15806	14958
1109	2021	1487372000	32740	16014	15508
1109	2022	1543917000	33014	15988	15559
1111	2020	806492000	22092	9551	9052
1111	2021	924518000	22199	9449	9192
1111	2022	957371000	22479	9628	9397
1113	2020	2123480000	59259	23767	22420
1113	2021	2322303000	58668	23339	22629
1113	2022	2251542000	58555	23359	22759
1115	2020	3980621000	91652	41303	39102
1115	2021	4374641000	92903	41422	40350
1115	2022	4514142000	93932	42036	41134
1117	2020	13278982000	223881	117653	112759
1117	2021	14674268000	227428	118888	116385
1117	2022	15510946000	230115	120856	118695
1119	2020	436901000	12196	4768	4405
1119	2021	465273000	11961	4530	4331
1119	2022	456786000	11853	4568	4411
1121	2020	3080474000	81428	36349	33565
1121	2021	3320410000	80483	35758	34312
1121	2022	3327474000	80704	36207	35115
1123	2020	1842218000	41286	18161	16802
1123	2021	1972411000	41132	17903	17197
1123	2022	1998208000	40977	17517	17028
1125	2020	9061640000	231534	103541	96111
1125	2021	9653895000	235668	101242	97672
1125	2022	9762993000	236780	103171	100623
1127	2020	2791266000	65132	25153	23555
1127	2021	2972551000	64629	25213	24318
1127	2022	3004530000	64339	25457	24772
1129	2020	617100000	15327	6803	6212
1129	2021	667400000	15234	6518	6221
1129	2022	660167000	15122	6514	6282
1131	2020	375180000	10432	2909	2446
1131	2021	408462000	10331	2620	2346
1131	2022	401160000	10059	2529	2337
1133	2020	925106000	23488	10248	9722
1133	2021	995778000	23672	10072	9796
1133	2022	1040110000	23755	10121	9878
2013	2020	195259000	3425	2508	2404
2013	2021	201226000	3424	2433	2373
2013	2022	217059000	3398	2400	2351
2016	2020	326850000	5222	3826	3645
2016	2021	327531000	5155	3502	3368
2016	2022	354746000	5122	3433	3322
2020	2020	19710277000	290866	147063	135425
2020	2021	20881987000	288702	149263	140525
2020	2022	21681255000	287145	149832	144596
2050	2020	853520000	18673	6982	6120
2050	2021	865498000	18599	6848	5959
2050	2022	889120000	18257	6621	6007
2060	2020	115645000	829	393	362
2060	2021	131155000	841	444	419
2060	2022	136277000	865	417	399
2063	2020	434744000	7077	3249	2967
2063	2021	477000000	6943	3165	3087
2063	2022	486137000	6874	3380	3280
2066	2020	128246000	2616	1291	1152
2066	2021	149295000	2611	1241	1200
2066	2022	155928000	2589	1406	1271
2068	2020	142936000	1614	647	534
2068	2021	171779000	1594	807	723
2068	2022	191269000	1585	991	926
2070	2020	278108000	4835	1720	1567
2070	2021	275473000	4774	1680	1541
2070	2022	287650000	4723	1656	1559
2090	2020	5758789000	95328	44532	41534
2090	2021	6232535000	95528	44863	42563
2090	2022	6464225000	95356	45088	43353
2100	2020	158166000	2086	1023	855
2100	2021	163065000	2074	1026	912
2100	2022	176124000	2056	1064	991
2105	2020	130677000	2362	1056	907
2105	2021	137918000	2339	1147	1041
2105	2022	152994000	2287	1248	1176
2110	2020	2275370000	32202	16287	15139
2110	2021	2393279000	31965	16724	15927
2110	2022	2491441000	31685	17267	16765
2122	2020	3290347000	58927	26615	24064
2122	2021	3568705000	59851	27646	25639
2122	2022	3718013000	60690	27944	26624
2130	2020	920562000	13918	6477	5813
2130	2021	953478000	13810	6537	6058
2130	2022	1003045000	13741	6763	6496
2150	2020	854037000	13047	6058	5653
2150	2021	877176000	12864	5947	5557
2150	2022	910664000	12720	5941	5671
2158	2020	273324000	8373	2288	1811
2158	2021	297238000	8398	2351	1895
2158	2022	303572000	8278	2245	1942
2164	2020	84425000	1452	613	542
2164	2021	89975000	1419	652	595
2164	2022	92958000	1381	647	609
2170	2020	5667829000	107515	48358	44112
2170	2021	6113659000	111059	49168	45812
2170	2022	6578302000	113325	49476	47084
2180	2020	540688000	10028	3937	3500
2180	2021	564588000	9908	4019	3630
2180	2022	609392000	9835	4093	3798
2185	2020	838974000	11002	3158	2963
2185	2021	773763000	11011	2893	2706
2185	2022	806608000	10805	2950	2794
2188	2020	382656000	7790	2938	2563
2188	2021	392062000	7560	2853	2527
2188	2022	410390000	7423	2722	2462
2195	2020	234363000	3405	1431	1300
2195	2021	256700000	3373	1600	1488
2195	2022	245791000	3360	1423	1336
2198	2020	295823000	5739	2835	2556
2198	2021	294497000	5734	2772	2547
2198	2022	300429000	5650	2680	2526
2220	2020	571616000	8425	4116	3815
2220	2021	637662000	8410	4437	4234
2220	2022	672672000	8382	4509	4379
2230	2020	71872000	1240	642	503
2230	2021	77059000	1142	638	552
2230	2022	81664000	1081	769	717
2240	2020	363247000	6820	2943	2714
2240	2021	411879000	7005	3205	2993
2240	2022	423797000	7021	3214	3039
2275	2020	120221000	2127	956	867
2275	2021	124196000	2100	937	867
2275	2022	126186000	2070	875	828
2282	2020	40187000	684	279	255
2282	2021	43628000	709	310	288
2282	2022	44826000	700	313	297
2290	2020	307562000	5296	2334	2037
2290	2021	323944000	5280	2419	2123
2290	2022	337133000	5179	2325	2132
4001	2020	2780944000	65911	19585	17107
4001	2021	2995738000	65385	18890	17159
4001	2022	2985841000	65432	18361	16938
4003	2020	5878777000	125522	50273	46793
4003	2021	6218395000	125763	48938	46465
4003	2022	6307666000	125663	48730	46597
4005	2020	7678620000	145180	72320	65377
4005	2021	8067791000	142780	71748	67327
4005	2022	8489905000	144060	73616	70437
4007	2020	2400356000	53351	20433	18884
4007	2021	2635887000	53521	20410	19355
4007	2022	2723317000	53922	20361	19518
4009	2020	1388249000	38638	15470	14506
4009	2021	1516956000	38882	15707	15030
4009	2022	1589220000	38779	16158	15585
4011	2020	411614000	9526	4324	4094
4011	2021	451908000	9377	4358	4177
4011	2022	504346000	9302	4645	4510
4012	2020	766060000	16575	8757	8140
4012	2021	850647000	16391	8609	8149
4012	2022	891281000	16506	8869	8454
4013	2020	248760469000	4440232	2266436	2100745
4013	2021	274211492000	4494693	2317304	2210303
4013	2022	288842282000	4551524	2371901	2293121
4015	2020	8616065000	214176	86304	77778
4015	2021	9280769000	216957	87286	82304
4015	2022	9858399000	220816	89078	85048
4017	2020	4123196000	106762	39347	35406
4017	2021	4531048000	107621	39362	36745
4017	2022	4573766000	108650	39515	37479
4019	2020	51841647000	1045175	481338	444682
4019	2021	55627320000	1048895	482454	457762
4019	2022	57601036000	1057597	486536	468109
4021	2020	17841594000	429446	188749	174818
4021	2021	19975536000	448144	192902	183440
4021	2022	21327852000	464154	198462	190831
4023	2020	2059709000	47705	18862	16724
4023	2021	2263306000	48034	18888	17221
4023	2022	2335466000	48759	18708	17298
4025	2020	11138173000	237216	103882	96224
4025	2021	12125489000	242193	105074	100533
4025	2022	12739608000	246191	107069	103377
4027	2020	8626323000	204528	95258	78941
4027	2021	9133418000	206241	93520	81293
4027	2022	9313549000	207842	97522	85370
5001	2020	889787000	17107	9269	8891
5001	2021	986456000	16683	9251	8934
5001	2022	954705000	16512	9199	8904
5003	2020	755635000	18962	7057	6386
5003	2021	805232000	18649	6696	6208
5003	2022	820289000	18354	6658	6299
5005	2020	1711844000	41687	16289	15297
5005	2021	1854314000	42171	16066	15453
5005	2022	1884203000	42435	16365	15796
5007	2020	23837710000	286586	141573	135231
5007	2021	27734350000	294337	143812	139771
5007	2022	29929592000	302863	151087	147613
5009	2020	1441937000	37383	15579	14742
5009	2021	1609353000	37890	15589	15114
5009	2022	1621982000	38284	15719	15278
5011	2020	452701000	10488	4291	4034
5011	2021	484062000	10332	4029	3836
5011	2022	493979000	10135	4059	3863
5013	2020	201548000	4738	2372	2246
5013	2021	217459000	4737	2348	2268
5013	2022	220763000	4695	2345	2274
5015	2020	985862000	28242	12514	11792
5015	2021	1164909000	28480	12522	12089
5015	2022	1199428000	28742	12370	12015
5017	2020	450882000	10157	3160	2823
5017	2021	489973000	10071	3007	2750
5017	2022	448138000	9873	2971	2792
5019	2020	890633000	21387	9102	8550
5019	2021	908431000	21217	8674	8258
5019	2022	899714000	21250	8436	8066
5021	2020	572509000	14528	5449	5113
5021	2021	641056000	14370	5332	5117
5021	2022	621016000	14265	5400	5191
5023	2020	1113788000	24696	9037	8337
5023	2021	1193094000	25044	8863	8447
5023	2022	1225404000	25284	8909	8543
5025	2020	318937000	7550	3200	3003
5025	2021	358307000	7490	3077	2952
5025	2022	382501000	7467	3069	2954
5027	2020	941364000	22742	8903	8282
5027	2021	990615000	22510	8668	8200
5027	2022	1006341000	22216	8691	8321
5029	2020	869822000	20729	8276	7766
5029	2021	961031000	20911	8198	7853
5029	2022	997242000	21046	8333	8030
5031	2020	4722967000	111603	55666	52654
5031	2021	5225662000	111788	55855	54022
5031	2022	5240992000	113017	57007	55481
5033	2020	2312530000	60147	26200	24751
5033	2021	2495071000	60423	25762	24830
5033	2022	2548937000	61075	26156	25343
5035	2020	1992354000	48086	20752	18983
5035	2021	2147119000	47475	20182	19080
5035	2022	2074083000	47061	20422	19620
5037	2020	674797000	16796	7138	6694
5037	2021	714507000	16693	6908	6602
5037	2022	682241000	16601	6903	6656
5039	2020	281645000	6442	2771	2619
5039	2021	292289000	6306	2731	2617
5039	2022	291264000	6191	2696	2591
5041	2020	505934000	11320	5200	4826
5041	2021	551776000	11050	4876	4584
5041	2022	519235000	10771	4885	4633
5043	2020	741649000	17314	7583	7048
5043	2021	787625000	17070	7395	7018
5043	2022	786634000	16911	7369	7054
5045	2020	5524890000	123811	61106	57714
5045	2021	5953499000	125645	61215	59082
5045	2022	6148429000	127665	63082	61301
5047	2020	613609000	17135	7361	6938
5047	2021	696902000	17166	7205	6934
5047	2022	726190000	17271	7361	7122
5049	2020	392261000	12057	4843	4589
5049	2021	422282000	12156	4859	4678
5049	2022	421076000	12382	4948	4785
5051	2020	4524202000	100249	41027	37708
5051	2021	4794647000	100386	41120	39100
5051	2022	4855065000	100089	41483	39936
5053	2020	776128000	18022	8167	7736
5053	2021	822901000	18149	8172	7908
5053	2022	832590000	18160	8457	8205
5055	2020	1788393000	45864	19282	18110
5055	2021	1925991000	46349	19102	18432
5055	2022	1930354000	46448	19555	18936
5057	2020	711708000	19981	9458	8956
5057	2021	797397000	19679	9021	8697
5057	2022	835478000	19453	9259	8965
5059	2020	1155253000	33075	13869	13049
5059	2021	1243249000	33108	13721	13184
5059	2022	1250402000	33203	13683	13216
5061	2020	460065000	12755	5456	5176
5061	2021	549620000	12676	5402	5222
5061	2022	593830000	12557	5334	5161
5063	2020	1463218000	37936	16445	15479
5063	2021	1624713000	37742	16182	15545
5063	2022	1677784000	37945	16433	15897
5065	2020	446722000	13597	4576	4182
5065	2021	479722000	13928	4364	4126
5065	2022	486899000	14048	4437	4214
5067	2020	704723000	16755	5751	5328
5067	2021	740685000	16780	5512	5217
5067	2022	763307000	16624	5435	5173
5069	2020	2563739000	66833	26872	24662
5069	2021	2711383000	65649	25836	24153
5069	2022	2620357000	64246	25461	24176
5071	2020	819712000	25722	9965	9323
5071	2021	911526000	25977	9694	9230
5071	2022	923172000	26001	9966	9565
5073	2020	255543000	6299	2378	2192
5073	2021	291415000	6155	2289	2156
5073	2022	303143000	6101	2289	2183
5075	2020	634030000	16212	6690	6270
5075	2021	659532000	16316	6637	6351
5075	2022	684995000	16205	6757	6522
5077	2020	281931000	8528	2701	2490
5077	2021	338841000	8559	2520	2377
5077	2022	299580000	8364	2552	2439
5079	2020	380907000	12889	3805	3575
5079	2021	437200000	13151	3691	3519
5079	2022	426771000	12916	3680	3521
5081	2020	455785000	11975	5261	4911
5081	2021	488942000	11954	5131	4895
5081	2022	492826000	11821	5140	4947
5083	2020	751733000	21103	8526	7947
5083	2021	828606000	21207	8259	7907
5083	2022	868001000	21253	8232	7927
5085	2020	3344635000	74046	33270	31393
5085	2021	3587415000	74766	33232	32116
5085	2022	3643342000	75225	34233	33300
5087	2020	581400000	16546	7281	6990
5087	2021	728676000	16936	7447	7214
5087	2022	776295000	17486	7763	7577
5089	2020	570560000	16877	6157	5752
5089	2021	629846000	16970	6012	5750
5089	2022	633539000	17254	6205	5979
5091	2020	1601509000	42579	19011	17671
5091	2021	1718347000	42499	18561	17645
5091	2022	1701140000	42552	18528	17824
5093	2020	1535387000	40544	16982	15414
5093	2021	1798038000	39577	16060	14920
5093	2022	1690235000	38896	16167	15340
5095	2020	266730000	6774	2675	2494
5095	2021	284617000	6660	2583	2443
5095	2022	263367000	6564	2520	2411
5097	2020	295907000	8488	2911	2705
5097	2021	323885000	8638	2852	2711
5097	2022	324465000	8556	2846	2714
5099	2020	292888000	8285	3484	3274
5099	2021	320541000	8195	3315	3177
5099	2022	331338000	8181	3408	3278
5101	2020	255603000	7193	3131	2968
5101	2021	274661000	7164	3144	3045
5101	2022	267799000	7078	3167	3075
5103	2020	982695000	22614	9668	9072
5103	2021	1048265000	22344	9543	9162
5103	2022	1060554000	22049	9550	9188
5105	2020	406292000	10000	4072	3839
5105	2021	432755000	9989	4102	3932
5105	2022	445440000	10063	4219	4072
5107	2020	660447000	16443	6196	5617
5107	2021	735350000	15822	5767	5324
5107	2022	678609000	15304	5475	5137
5109	2020	360001000	10172	4196	3942
5109	2021	409559000	10121	4155	3970
5109	2022	420273000	10179	4028	3883
5111	2020	897929000	22952	9638	9091
5111	2021	982637000	22730	9697	9318
5111	2022	956842000	22495	9880	9555
5113	2020	651887000	19187	7866	7330
5113	2021	734452000	19331	7640	7294
5113	2022	766743000	19337	7779	7502
5115	2020	2395561000	63403	27387	25735
5115	2021	2639042000	63756	26850	25759
5115	2022	2671080000	64065	27351	26322
5117	2020	337175000	8246	3551	3357
5117	2021	358569000	8094	3504	3374
5117	2022	351242000	8069	3504	3403
5119	2020	22224069000	399246	186410	172305
5119	2021	24069176000	398069	185396	176355
5119	2022	24577444000	399145	189421	183068
5121	2020	687895000	18590	7320	6877
5121	2021	756971000	18842	7193	6903
5121	2022	771640000	18837	7147	6911
5123	2020	772479000	23013	7886	7251
5123	2021	839301000	22701	7544	7077
5123	2022	800581000	22451	7542	7186
5125	2020	5853561000	123815	57931	54956
5125	2021	6415223000	125319	58094	56254
5125	2022	6664373000	127357	59981	58390
5127	2020	333388000	9828	4272	4077
5127	2021	371120000	9795	4132	3991
5127	2022	391170000	9805	4184	4070
5129	2020	247417000	7842	2827	2642
5129	2021	272791000	7880	2858	2733
5129	2022	266175000	7918	2826	2702
5131	2020	5785033000	127800	55436	52065
5131	2021	6143094000	128425	54271	52239
5131	2022	6244050000	129059	54978	53329
5133	2020	562182000	15779	5446	5122
5133	2021	656462000	15709	5282	5043
5133	2022	703523000	15686	5355	5152
5135	2020	642272000	17319	5618	5208
5135	2021	727498000	17660	5574	5296
5135	2022	778798000	17810	5767	5536
5137	2020	420786000	12350	4545	4216
5137	2021	463067000	12432	4466	4238
5137	2022	463480000	12575	4505	4322
5139	2020	1966644000	38926	15352	14046
5139	2021	1912584000	38364	14775	13875
5139	2022	1932163000	37752	14663	13979
5141	2020	566489000	15801	5672	5259
5141	2021	615155000	15751	5763	5480
5141	2022	619122000	16102	5906	5661
5143	2020	11075145000	246756	125428	119568
5143	2021	12289180000	251692	127316	123612
5143	2022	12491671000	256054	133513	130518
5145	2020	3136841000	76851	33449	31311
5145	2021	3334976000	77157	33347	31988
5145	2022	3388120000	77755	33928	32772
5147	2020	284717000	6228	2777	2612
5147	2021	310727000	6153	2721	2583
5147	2022	304344000	6049	2773	2678
5149	2020	744752000	20214	7794	7387
5149	2021	845734000	20152	7714	7399
5149	2022	886286000	20129	7841	7548
6001	2020	147136291000	1680380	818093	745114
6001	2021	162176203000	1643837	811171	761786
6001	2022	159241119000	1628997	819817	792342
6003	2020	89202000	1204	514	454
6003	2021	86288000	1235	512	470
6003	2022	80386000	1190	495	467
6005	2020	1919536000	40532	14474	13118
6005	2021	2056386000	41144	14367	13362
6005	2022	2006939000	41412	14281	13640
6007	2020	10781637000	210135	93234	84510
6007	2021	11548920000	206190	92013	85667
6007	2022	11396345000	207303	91513	87374
6009	2020	2452765000	45346	21353	19688
6009	2021	2621697000	46219	21558	20311
6009	2022	2607568000	46563	22093	21275
6011	2020	1225922000	21858	10622	8877
6011	2021	1295098000	21913	10645	9310
6011	2022	1216260000	21914	10199	9000
6013	2020	100692971000	1165986	546310	497173
6013	2021	110320394000	1163298	542794	508168
6013	2022	109965993000	1156966	547625	528017
6015	2020	1144798000	27601	9429	8519
6015	2021	1231849000	27553	9330	8621
6015	2022	1182855000	27082	9286	8801
6017	2020	14187909000	191220	90888	83202
6017	2021	15436024000	193590	91675	86361
6017	2022	15808893000	192646	92350	89173
6019	2020	48552515000	1009503	445633	393753
6019	2021	52363942000	1012992	443526	402977
6019	2022	51316407000	1015190	450096	420893
6021	2020	1430189000	28896	12760	11612
6021	2021	1497724000	28664	12601	11715
6021	2022	1446856000	28339	12756	12062
6023	2020	6850029000	136261	59754	54656
6023	2021	7310048000	134836	58777	55072
6023	2022	7296395000	135010	59089	56694
6025	2020	8183274000	179595	71538	55364
6025	2021	8643247000	179215	68865	56838
6025	2022	8075656000	178713	69936	59517
6027	2020	1134595000	19001	8319	7656
6027	2021	1153492000	18927	8240	7750
6027	2022	1151182000	18718	8158	7849
6029	2020	40300516000	905828	386344	336819
6029	2021	42561996000	912351	384999	346802
6029	2022	41098858000	916108	389174	361729
6031	2020	6292586000	152790	57004	50252
6031	2021	6690054000	152679	55335	49971
6031	2022	6505590000	152981	56169	52180
6033	2020	3001704000	68195	28458	25682
6033	2021	3213324000	68584	28383	26217
6033	2022	3111067000	68191	28370	26937
6035	2020	1230010000	32317	9412	8718
6035	2021	1309137000	31813	9135	8579
6035	2022	1217102000	29904	8701	8297
6037	2020	673306158000	9992236	4974673	4363337
6037	2021	720046822000	9811842	5007551	4558859
6037	2022	720740528000	9721138	5013363	4764528
6039	2020	6940713000	156343	61945	55065
6039	2021	7553475000	158910	62092	56630
6039	2022	7436909000	160256	62934	59007
6041	2020	37796487000	261282	130647	121786
6041	2021	42936183000	259162	129192	123315
6041	2022	43824350000	256018	131097	127573
6043	2020	979407000	17118	7203	6402
6043	2021	1036419000	17107	7036	6479
6043	2022	1042143000	17020	7252	6923
6045	2020	4794385000	91361	37159	33785
6045	2021	5159935000	91003	36740	34427
6045	2022	5145470000	89783	36991	35444
6047	2020	12445651000	281814	115496	101032
6047	2021	13532782000	284458	114952	103082
6047	2022	13395227000	290014	115390	106429
6049	2020	459764000	8663	3181	2901
6049	2021	476942000	8571	3188	2959
6049	2022	481376000	8511	3176	3000
6051	2020	798867000	13226	7883	6932
6051	2021	834235000	13261	8286	7719
6051	2022	847409000	12978	8611	8284
6053	2020	26398134000	438390	214206	190346
6053	2021	28333347000	437249	211753	194236
6053	2022	28189179000	432858	217156	203927
6055	2020	11260752000	137485	68890	62735
6055	2021	11907435000	136206	68404	64252
6055	2022	11665710000	134300	70453	68149
6057	2020	6796594000	102249	46778	42981
6057	2021	7333293000	103457	47263	44592
6057	2022	7442705000	102293	48062	46383
6059	2020	240734263000	3185516	1563811	1424333
6059	2021	257834298000	3161005	1557249	1464099
6059	2022	263290135000	3151184	1579268	1528545
6061	2020	30054657000	405889	187003	173074
6061	2021	32903884000	412789	189159	179558
6061	2022	34170169000	417772	191660	185671
6063	2020	1079139000	19749	7628	6787
6063	2021	1170312000	19940	7464	6761
6063	2022	1149201000	19351	7353	6866
6065	2020	116939915000	2422847	1118880	1006179
6065	2021	126261006000	2453178	1130544	1047722
6065	2022	127195983000	2473902	1145702	1097218
6067	2020	90813891000	1586465	710803	643643
6067	2021	98105641000	1588106	718133	668371
6067	2022	97517936000	1584169	720302	691493
6069	2020	3864377000	64521	32548	29328
6069	2021	4143744000	66675	31761	29441
6069	2022	4169135000	67579	32217	30578
6071	2020	100359889000	2183239	972807	879264
6071	2021	108700135000	2192882	990040	916582
6071	2022	108081645000	2193656	1002951	961203
6073	2020	222600097000	3296045	1544298	1399329
6073	2021	240216669000	3274954	1544408	1444339
6073	2022	243506541000	3276208	1578463	1523260
6075	2020	117292346000	870393	559015	514683
6075	2021	129774521000	811253	547402	519636
6075	2022	125970097000	808437	567632	552887
6077	2020	40056124000	780558	334765	296348
6077	2021	43999624000	788140	336140	307273
6077	2022	42979635000	793229	342165	323905
6079	2020	17765128000	281879	134154	123695
6079	2021	19192484000	279298	135129	127925
6079	2022	19162980000	282013	135812	131625
6081	2020	108186874000	762511	438610	408287
6081	2021	129090019000	739060	432429	412404
6081	2022	127657596000	729181	449439	438377
6083	2020	30839511000	448244	218513	200743
6083	2021	33642845000	437434	219384	206705
6083	2022	33607554000	443837	216446	208544
6085	2020	240677946000	1931026	1023652	950754
6085	2021	272711739000	1886595	1010149	961615
6085	2022	270162197000	1870945	1031488	1003697
6087	2020	21176826000	270462	134838	121753
6087	2021	23183258000	260495	132830	123628
6087	2022	22832350000	264370	132690	126244
6089	2020	9325879000	181984	73261	66741
6089	2021	9926304000	181981	72834	67802
6089	2022	9791945000	180930	72482	69099
6091	2020	145880000	3228	1286	1179
6091	2021	154098000	3295	1305	1225
6091	2022	154021000	3217	1312	1257
6093	2020	2168815000	43991	16967	15269
6093	2021	2310238000	44026	16667	15315
6093	2022	2261048000	43660	16531	15573
6095	2020	25816822000	452698	201823	182148
6095	2021	26963798000	450350	200230	185378
6095	2022	26149679000	448747	200869	192263
6097	2020	35091038000	488281	245738	225996
6097	2021	38047053000	484315	243140	229659
6097	2022	37598558000	482650	246535	238693
6099	2020	26848535000	553217	242015	215474
6099	2021	28820142000	552851	239670	219675
6099	2022	28123096000	551275	240829	227552
6101	2020	4927076000	99464	45513	40347
6101	2021	5289376000	99038	45275	41225
6101	2022	5122683000	98503	45931	42859
6103	2020	2947996000	65682	25674	23343
6103	2021	3121904000	65380	25560	23720
6103	2022	3087088000	65245	25538	24277
6105	2020	538535000	16089	4541	4168
6105	2021	565409000	16061	4546	4257
6105	2022	573075000	15781	4515	4303
6107	2020	21572811000	473891	202466	175249
6107	2021	23191982000	476946	200785	179494
6107	2022	22585661000	477544	206681	189562
6109	2020	2749488000	55374	20184	18045
6109	2021	2930342000	55065	20058	18601
6109	2022	2879540000	54531	19725	18829
6111	2020	57575258000	843310	410076	374275
6111	2021	62554527000	839358	406566	381392
6111	2022	63589878000	832605	411125	395761
6113	2020	13043398000	216291	104826	96690
6113	2021	14126183000	213039	106426	100109
6113	2022	14277264000	222115	107815	103368
6115	2020	3745504000	81994	30713	27444
6115	2021	4078703000	83216	30911	28306
6115	2022	4064114000	84310	31276	29515
8001	2020	25292075000	520479	269887	249638
8001	2021	27847450000	523592	277847	260499
8001	2022	28848586000	527575	281314	271745
8003	2020	665499000	16377	8297	7806
8003	2021	728631000	16563	8075	7593
8003	2022	714630000	16592	8101	7801
8005	2020	45295999000	655207	359400	333007
8005	2021	47612390000	656557	369326	347843
8005	2022	50041017000	655808	374389	362728
8007	2020	680737000	13425	7028	6534
8007	2021	746141000	13798	6919	6554
8007	2022	771848000	14003	6880	6659
8009	2020	156544000	3482	2081	2035
8009	2021	174455000	3487	2033	1986
8009	2022	156700000	3432	2047	2011
8011	2020	166536000	5478	1786	1715
8011	2021	187311000	5337	1768	1651
8011	2022	178050000	5399	1755	1692
8013	2020	27027395000	330922	190477	179548
8013	2021	30572385000	327075	197273	188538
8013	2022	32273001000	327468	200348	195221
8014	2020	5477555000	74484	40347	37893
8014	2021	6118620000	75375	41430	39535
8014	2022	6617214000	76121	42376	41261
8015	2020	1094482000	19477	9627	9058
8015	2021	1235869000	19711	9644	9218
8015	2022	1305609000	20223	9725	9457
8017	2020	78993000	1744	1082	1058
8017	2021	117909000	1716	1059	1033
8017	2022	91153000	1732	1043	1023
8019	2020	645814000	9393	5954	5473
8019	2021	690334000	9445	6058	5720
8019	2022	724589000	9355	6143	5961
8021	2020	307011000	7458	3997	3788
8021	2021	345123000	7578	3903	3702
8021	2022	328167000	7579	3931	3802
8023	2020	138338000	3501	1809	1687
8023	2021	147919000	3595	1793	1678
8023	2022	142574000	3603	1768	1694
8025	2020	128764000	5694	1438	1364
8025	2021	143559000	5731	1384	1306
8025	2022	124853000	5614	1356	1304
8027	2020	225385000	4719	2082	1985
8027	2021	258290000	5064	2226	2130
8027	2022	270913000	5335	2280	2211
8029	2020	1328211000	31051	14132	13267
8029	2021	1450878000	31383	13634	12854
8029	2022	1504032000	31602	13311	12828
8031	2020	62300101000	717556	419155	387125
8031	2021	73394068000	711323	429780	404326
8031	2022	80091302000	713252	435257	421655
8033	2020	91513000	2332	1133	1061
8033	2021	96582000	2370	1118	1062
8033	2022	95651000	2455	1136	1102
8035	2020	30173610000	360303	195819	185433
8035	2021	33449724000	369825	202037	193618
8035	2022	37286156000	375988	207198	201951
8037	2020	4902584000	55665	35321	32191
8037	2021	5769133000	55773	34515	32848
8037	2022	6282742000	55285	34657	33739
8039	2020	1724302000	26207	14979	14334
8039	2021	1948630000	27133	15566	14960
8039	2022	2120057000	27799	15958	15567
8041	2020	39915623000	732342	341374	318334
8041	2021	44024239000	737228	353414	333220
8041	2022	45230988000	740567	357312	345539
8043	2020	1874391000	48878	15192	14099
8043	2021	2062979000	49234	14878	13763
8043	2022	2108860000	49621	14292	13609
8045	2020	3566217000	61792	31348	29365
8045	2021	3818447000	62195	30378	28830
8045	2022	4088503000	62271	30770	29835
8047	2020	322917000	5824	3923	3500
8047	2021	368774000	5899	3899	3661
8047	2022	390485000	5891	3922	3813
8049	2020	881856000	15748	9228	8502
8049	2021	1015699000	15870	9134	8716
8049	2022	1073329000	15769	9242	8991
8051	2020	951157000	16945	11277	10582
8051	2021	1082691000	17309	11177	10728
8051	2022	1136116000	17267	11316	11031
8053	2020	42703000	788	422	406
8053	2021	43544000	773	422	406
8053	2022	47340000	775	424	413
8055	2020	303737000	6827	2591	2362
8055	2021	343658000	6922	2543	2324
8055	2022	349901000	7082	2445	2294
8057	2020	78529000	1378	933	897
8057	2021	82116000	1357	949	915
8057	2022	82583000	1302	956	935
8059	2020	40220750000	583050	327035	305322
8059	2021	44091942000	580926	336123	319017
8059	2022	45948024000	576143	342198	332572
8061	2020	76132000	1452	952	931
8061	2021	98697000	1446	923	891
8061	2022	73733000	1424	885	868
8063	2020	292303000	7066	4206	4096
8063	2021	364873000	6936	4062	3932
8063	2022	304939000	6961	4087	4006
8065	2020	325508000	7404	4795	4432
8065	2021	359097000	7397	4655	4432
8065	2022	380731000	7327	4772	4646
8067	2020	3397149000	55675	30869	28885
8067	2021	3714788000	56187	30300	28617
8067	2022	3894248000	56607	30534	29602
8069	2020	21508425000	359899	200965	189141
8069	2021	23757935000	362713	207134	197282
8069	2022	24885632000	366778	210007	204240
8071	2020	608739000	14482	6386	5945
8071	2021	638366000	14318	6179	5745
8071	2022	637524000	14327	6072	5787
8073	2020	186938000	5665	2337	2240
8073	2021	207582000	5477	2236	2134
8073	2022	191078000	5510	2197	2134
8075	2020	924324000	21204	10853	10381
8075	2021	1047129000	21122	10343	9851
8075	2022	1035652000	20823	10105	9821
8077	2020	7573662000	156005	74581	69397
8077	2021	8374551000	157434	76799	72302
8077	2022	8670085000	158636	76276	73644
8079	2020	56440000	871	463	438
8079	2021	58839000	929	442	418
8079	2022	63205000	931	454	441
8081	2020	571405000	13264	7147	6746
8081	2021	609149000	13155	6876	6520
8081	2022	626210000	13177	6802	6584
8083	2020	1216110000	25883	12596	11755
8083	2021	1353859000	26216	12445	11696
8083	2022	1336853000	26468	12213	11746
8085	2020	1963643000	42817	21446	20125
8085	2021	2186806000	43230	21128	19976
8085	2022	2227688000	43811	21117	20399
8087	2020	1368442000	29072	15878	15083
8087	2021	1509677000	28995	15400	14586
8087	2022	1480655000	29239	15366	14864
8089	2020	737015000	18667	8165	7698
8089	2021	781868000	18536	7959	7435
8089	2022	760183000	18303	7766	7437
8091	2020	366759000	4881	2475	2289
8091	2021	421317000	5059	2556	2430
8091	2022	449771000	5100	2476	2398
8093	2020	941577000	17419	10954	10366
8093	2021	1030432000	17758	11344	10867
8093	2022	1098411000	17939	11595	11293
8095	2020	198022000	4531	2457	2395
8095	2021	231109000	4508	2398	2324
8095	2022	213977000	4449	2417	2366
8097	2020	2986019000	17354	11101	10013
8097	2021	3388439000	17350	10498	9871
8097	2022	3670234000	16876	10553	10200
8099	2020	493304000	12010	6107	5854
8099	2021	546513000	11994	5981	5689
8099	2022	536071000	11854	6068	5893
8101	2020	7281133000	168325	76006	70203
8101	2021	7938790000	169332	77154	70974
8101	2022	8003899000	169544	75978	72567
8103	2020	323911000	6524	2900	2753
8103	2021	360001000	6453	2794	2627
8103	2022	371692000	6569	2791	2684
8105	2020	589391000	11538	5348	4991
8105	2021	634260000	11388	5289	4922
8105	2022	617364000	11325	5251	5025
8107	2020	2281291000	24829	15896	14723
8107	2021	2731620000	25056	15192	14494
8107	2022	2982787000	25007	15543	15144
8109	2020	255719000	6393	3399	3175
8109	2021	280723000	6505	3343	3134
8109	2022	246690000	6623	3333	3217
8111	2020	38435000	710	518	486
8111	2021	42114000	740	565	543
8111	2022	42697000	803	555	540
8113	2020	811449000	8054	5414	4863
8113	2021	1013665000	8074	5396	5097
8113	2022	1109497000	8003	5531	5355
8115	2020	97909000	2390	1153	1115
8115	2021	120309000	2331	1133	1088
8115	2022	101101000	2295	1063	1034
8117	2020	2412349000	30994	21925	19904
8117	2021	2672458000	30971	21211	20288
8117	2022	2886032000	30565	21528	21042
8119	2020	1405985000	24747	12812	11919
8119	2021	1566698000	24939	13176	12515
8119	2022	1625621000	24857	13358	12954
8121	2020	194514000	4808	2841	2758
8121	2021	230363000	4850	2714	2620
8121	2022	207396000	4812	2728	2663
8123	2020	17207773000	331427	164591	153885
8123	2021	19230730000	339811	166304	156666
8123	2022	20611438000	350176	168186	162674
8125	2020	406736000	9979	5547	5402
8125	2021	495408000	9943	5440	5279
8125	2022	444942000	9899	5484	5371
9001	2020	110675438000	955261	467274	429824
9001	2021	115548981000	963050	462307	433514
9001	2022	120546115000	962946	482886	463244
9003	2020	59570992000	896666	476699	437651
9003	2021	62417323000	898265	465207	434149
9003	2022	63219541000	898783	478497	458424
9005	2020	13112258000	184818	102177	95106
9005	2021	14144655000	185799	100853	95177
9005	2022	14879454000	186116	104825	100839
9007	2020	11602416000	163970	92019	85953
9007	2021	12135126000	166051	90374	85564
9007	2022	12422202000	166537	93975	90628
9009	2020	52231213000	863234	456690	419869
9009	2021	55275981000	869138	450375	420297
9009	2022	56370422000	869527	468085	448259
9011	2020	16360343000	267680	132133	119335
9011	2021	17220107000	268300	128510	119592
9011	2022	17423249000	268681	133574	128015
9013	2020	8956330000	149443	84821	79530
9013	2021	9405669000	155971	83229	78861
9013	2022	9618519000	156405	86461	83265
9015	2020	5864614000	116290	62440	57547
9015	2021	6223096000	116781	61314	57388
9015	2022	6271246000	117210	63708	60996
10001	2020	8398176000	182362	79832	73234
10001	2021	9092417000	184371	80995	75841
10001	2022	9569448000	186946	80608	76631
10003	2020	33466625000	570873	299663	277563
10003	2021	34767059000	572714	301478	285111
10003	2022	38211010000	575494	304425	291869
10005	2020	13473606000	238879	107207	99528
10005	2021	15312853000	247722	111155	105672
10005	2022	16626139000	255956	112168	107494
11001	2020	60178636000	670868	386235	355694
11001	2021	65205559000	668791	377737	352029
11001	2022	64472803000	671803	388387	369952
12001	2020	13331166000	279742	134241	126615
12001	2021	14665785000	281817	137830	132540
12001	2022	14938197000	284030	140531	136444
12003	2020	1098394000	28115	11634	11017
12003	2021	1206199000	28673	12100	11637
12003	2022	1244548000	27803	12545	12186
12005	2020	8737281000	174506	82521	77333
12005	2021	9807417000	179498	85542	82138
12005	2022	10046785000	185134	86867	84437
12007	2020	1057441000	28224	10692	10016
12007	2021	1126010000	28050	10762	10301
12007	2022	1134893000	27313	10954	10597
12009	2020	31173262000	608713	280910	261234
12009	2021	34552679000	617742	289016	277025
12009	2022	35833890000	630693	296446	287747
12011	2020	108977966000	1943266	1018269	922908
12011	2021	123536513000	1935729	1029880	978952
12011	2022	128520356000	1947026	1059496	1028099
12013	2020	453500000	13703	4735	4478
12013	2021	491498000	13514	4823	4598
12013	2022	488616000	13464	4803	4640
12015	2020	9103928000	188013	71222	65747
12015	2021	10288088000	194934	73271	69982
12015	2022	10786996000	202661	76142	73427
12017	2020	6430151000	154565	46463	42339
12017	2021	7179333000	158113	47534	44780
12017	2022	7367510000	162529	49070	46969
12019	2020	10468337000	218933	104392	98484
12019	2021	11754540000	222533	108108	104188
12019	2022	12166702000	226589	112112	109041
12021	2020	41877033000	377293	175944	163099
12021	2021	48804286000	387241	180781	173957
12021	2022	52200912000	397994	186959	181535
12023	2020	2786225000	69737	29375	27530
12023	2021	3075087000	69902	29290	27932
12023	2022	3105848000	71908	29366	28388
12027	2020	1042810000	34087	14323	13545
12027	2021	1141445000	34340	13592	13013
12027	2022	1161519000	35312	13075	12608
12029	2020	551081000	16690	5834	5494
12029	2021	600796000	16905	5825	5561
12029	2022	601705000	17124	5833	5636
12031	2020	49788119000	997604	479337	444744
12031	2021	55468854000	1002252	492434	470041
12031	2022	57096971000	1016536	508205	492202
12033	2020	15315679000	322551	143319	133076
12033	2021	16819313000	323480	145321	138590
12033	2022	16977017000	324878	149271	144613
12035	2020	6371859000	116030	46980	43252
12035	2021	7081613000	120904	48392	46092
12035	2022	7639215000	126705	49941	48188
12037	2020	483956000	12463	4643	4379
12037	2021	545014000	12175	4701	4517
12037	2022	569671000	12498	4720	4583
12039	2020	1771996000	43402	18167	16836
12039	2021	1939818000	43554	18592	17540
12039	2022	1918876000	43403	18541	17789
12041	2020	711358000	17883	7023	6660
12041	2021	773159000	18306	7256	6976
12041	2022	801000000	18992	7309	7078
12043	2020	371673000	12068	5061	4754
12043	2021	394663000	12268	4953	4736
12043	2022	391184000	12454	5202	5031
12045	2020	651140000	14264	5064	4753
12045	2021	725870000	14452	5258	5062
12045	2022	743555000	15314	5351	5200
12047	2020	433342000	13733	4199	3855
12047	2021	453306000	13082	4192	3937
12047	2022	450144000	13217	4108	3934
12049	2020	817961000	25331	8407	7829
12049	2021	897656000	25307	8834	8395
12049	2022	896743000	25645	8672	8321
12051	2020	1488421000	39725	15244	13903
12051	2021	1625765000	40212	15307	14325
12051	2022	1622515000	41339	15489	14732
12053	2020	8353344000	195627	71770	65713
12053	2021	9257931000	200649	73653	69825
12053	2022	9639456000	206896	76437	73603
12055	2020	3923391000	101345	34535	31715
12055	2021	4306675000	103295	35146	33044
12055	2022	4419585000	105618	36311	34756
12057	2020	77916960000	1466160	752317	695452
12057	2021	85956960000	1484455	770606	737239
12057	2022	90064452000	1513301	800950	777996
12059	2020	684460000	19569	6801	6405
12059	2021	742874000	19295	6907	6615
12059	2022	758929000	19651	6958	6736
12061	2020	13975880000	160439	64001	59012
12061	2021	16301881000	163814	65481	62328
12061	2022	17613769000	167352	68086	65703
12063	2020	1778782000	47079	17090	16102
12063	2021	1914602000	47154	17084	16280
12063	2022	1912479000	48211	16850	16296
12065	2020	670334000	14390	5402	5083
12065	2021	721171000	14476	5544	5302
12065	2022	741794000	15042	5642	5453
12067	2020	239459000	8214	2765	2639
12067	2021	256042000	7958	2803	2689
12067	2022	263970000	7786	2823	2734
12069	2020	17648620000	386194	156379	141967
12069	2021	20235358000	396242	159486	151886
12069	2022	21446695000	410139	171178	165847
12071	2020	44505846000	765504	344331	317679
12071	2021	49641402000	790676	358017	342740
12071	2022	52281287000	822453	369688	357585
12073	2020	14448894000	293948	150391	141101
12073	2021	15942096000	296081	154908	148276
12073	2022	16130473000	297369	157537	152653
12075	2020	1766821000	43059	16445	15394
12075	2021	1949851000	44158	16815	16040
12075	2022	1985692000	45260	17095	16483
12077	2020	244538000	7805	2587	2456
12077	2021	255173000	7308	2597	2484
12077	2022	247264000	7603	2574	2488
12079	2020	677061000	17866	7529	7040
12079	2021	722340000	18069	7665	7277
12079	2022	741163000	18198	7965	7700
12081	2020	21622623000	401593	175309	162762
12081	2021	24337490000	413474	180190	172818
12081	2022	25614913000	429125	185845	180356
12083	2020	15436434000	377459	138630	128309
12083	2021	17332265000	385084	142765	135609
12083	2022	17648907000	396415	147268	142006
12085	2020	15495382000	158658	71216	66660
12085	2021	16605201000	160249	73467	70770
12085	2022	17875112000	162006	75433	73320
12086	2020	151581814000	2695501	1274721	1170373
12086	2021	176108492000	2670421	1315586	1242688
12086	2022	183105933000	2673837	1356496	1320709
12087	2020	7857445000	82852	44353	40716
12087	2021	9038740000	82265	45872	44480
12087	2022	9734563000	81708	48583	47641
12089	2020	6020074000	91027	41478	39025
12089	2021	6903654000	94393	42767	41260
12089	2022	7483635000	97899	44353	43179
12091	2020	11390057000	212071	95065	89575
12091	2021	12673881000	213647	99417	96009
12091	2022	12981628000	216482	101777	99183
12093	2020	1419846000	39642	17058	16085
12093	2021	1570481000	40044	17295	16551
12093	2022	1636787000	40412	17574	17017
12095	2020	69902737000	1431573	739656	656635
12095	2021	78145165000	1427928	742676	704238
12095	2022	80442532000	1452726	791669	768184
12097	2020	15360005000	391118	189497	162790
12097	2021	17782078000	404020	186100	174483
12097	2022	18737344000	422545	196911	190025
12099	2020	137765798000	1494173	713727	656392
12099	2021	155274911000	1503223	733220	700893
12099	2022	165598174000	1518477	757239	734400
12101	2020	26407283000	566126	240185	222125
12101	2021	30044982000	584927	246924	235791
12101	2022	32023475000	608794	257288	249181
12103	2020	58259307000	959465	475622	440021
12103	2021	63695153000	959046	487896	467997
12103	2022	66015819000	961739	508116	494211
12105	2020	29793992000	730111	318841	288372
12105	2021	33163312000	755179	327390	309533
12105	2022	34033970000	787404	336044	323912
12107	2020	2742226000	73376	26326	24104
12107	2021	2937775000	74059	27539	25862
12107	2022	2947402000	74731	27312	26165
12109	2020	21083655000	277085	137436	129978
12109	2021	24437614000	293175	142432	137978
12109	2022	27121048000	306841	148051	144464
12111	2020	15052018000	331428	146560	134632
12111	2021	17509015000	344283	150432	142911
12111	2022	18782752000	358704	154276	148810
12113	2020	9548060000	188989	82717	78203
12113	2021	10796688000	193783	84714	81680
12113	2022	11388515000	198268	87584	85165
12115	2020	32323965000	436207	183596	170379
12115	2021	36760681000	448550	189065	181481
12115	2022	38848199000	462286	194996	189193
12117	2020	24951749000	471428	237058	219044
12117	2021	27387727000	471009	245205	235031
12117	2022	28525642000	478772	263731	256483
12119	2020	7768479000	130298	32577	29868
12119	2021	9241610000	134867	34873	32977
12119	2022	10035455000	144970	37225	35663
12121	2020	1639387000	43517	17602	16545
12121	2021	1801950000	44092	17294	16495
12121	2022	1891585000	45411	17168	16583
12123	2020	741594000	21739	8134	7585
12123	2021	787022000	20786	8069	7650
12123	2022	788005000	21283	8021	7743
12125	2020	377281000	15417	4525	4298
12125	2021	413851000	15825	4483	4309
12125	2022	410241000	15460	4483	4347
12127	2020	26599303000	555764	248134	228207
12127	2021	29637611000	565988	255678	243617
12127	2022	31021130000	579192	263761	255130
12129	2020	1416481000	33895	14970	14268
12129	2021	1608870000	34274	15383	14879
12129	2022	1680776000	35178	15729	15315
12131	2020	5578170000	75937	32288	30313
12131	2021	6796994000	79988	33787	32560
12131	2022	7349744000	83304	34536	33616
12133	2020	857925000	25313	9419	8840
12133	2021	927184000	24877	9559	9119
12133	2022	923256000	25414	9614	9292
13001	2020	718738000	18366	9202	8772
13001	2021	786029000	18411	9268	8935
13001	2022	803501000	18428	9693	9346
13003	2020	268353000	8311	4457	4283
13003	2021	294289000	8358	4415	4284
13003	2022	299679000	8183	4316	4193
13005	2020	415977000	11108	4850	4625
13005	2021	432401000	11071	4809	4651
13005	2022	447330000	11191	4848	4700
13007	2020	128468000	2851	1127	1060
13007	2021	142017000	2827	1121	1066
13007	2022	138553000	2788	1116	1070
13009	2020	1648563000	43794	17676	16463
13009	2021	1840486000	43671	17555	16702
13009	2022	1844435000	43635	17648	16918
13011	2020	709470000	18082	9832	9413
13011	2021	784815000	18538	10265	10001
13011	2022	870837000	19328	11183	10932
13013	2020	3516367000	83975	40875	38816
13013	2021	3967924000	86672	42008	40766
13013	2022	4195228000	89299	42983	41863
13015	2020	4773757000	109296	50054	46962
13015	2021	5280719000	110901	51121	49313
13015	2022	5478879000	112816	52182	50633
13017	2020	601658000	17168	5499	5123
13017	2021	672621000	17152	5538	5243
13017	2022	658831000	17069	5593	5343
13019	2020	684299000	18148	7430	7004
13019	2021	721215000	18128	7607	7319
13019	2022	726205000	18214	7752	7498
13021	2020	6770022000	157025	67271	62261
13021	2021	7417094000	155985	66695	63306
13021	2022	7215671000	156197	65086	62563
13023	2020	493869000	12524	4512	4221
13023	2021	521083000	12255	4585	4348
13023	2022	503001000	12257	4567	4366
13025	2020	582885000	18043	7023	6649
13025	2021	636311000	18121	7233	6964
13025	2022	634522000	18183	7388	7124
13027	2020	614077000	16268	6749	6395
13027	2021	652060000	16285	6733	6477
13027	2022	642000000	16253	6651	6435
13029	2020	2339176000	45035	19116	18132
13029	2021	2630744000	46963	19755	19178
13029	2022	2773891000	48225	20117	19579
13031	2020	2873476000	79918	37201	34790
13031	2021	3175042000	80637	37858	36289
13031	2022	3189203000	83059	38395	37053
13033	2020	972043000	24633	9041	8396
13033	2021	1018382000	24333	9069	8537
13033	2022	989917000	24388	8999	8516
13035	2020	961449000	25551	10851	10189
13035	2021	1077266000	26114	11101	10696
13035	2022	1109543000	26649	11307	10983
13037	2020	178877000	5573	2238	2123
13037	2021	194904000	5534	2204	2114
13037	2022	185403000	5469	2235	2163
13039	2020	2184378000	54925	21120	20112
13039	2021	2443748000	55754	21426	20733
13039	2022	2487008000	57013	21813	21139
13043	2020	403926000	11022	5735	5485
13043	2021	446617000	11000	5981	5798
13043	2022	446759000	11000	6027	5876
13045	2020	5350583000	119484	54733	51291
13045	2021	5973464000	121592	55987	53911
13045	2022	6288841000	124592	57136	55328
13047	2020	2644032000	68006	32626	31202
13047	2021	2883884000	68420	32718	31799
13047	2022	2912414000	68826	33434	32512
13049	2020	364057000	12532	4876	4690
13049	2021	396115000	12813	4933	4774
13049	2022	401087000	12781	5051	4888
13051	2020	15156296000	295064	139788	129191
13051	2021	16807312000	295656	142815	136632
13051	2022	17067423000	301107	144022	139525
13053	2020	328463000	9481	1920	1799
13053	2021	348469000	9044	1898	1811
13053	2022	320173000	8819	1882	1793
13055	2020	833555000	24922	9762	8949
13055	2021	918424000	24828	9437	8984
13055	2022	923997000	24936	9282	8881
13057	2020	15381129000	268175	135154	128714
13057	2021	17360944000	274839	139044	135364
13057	2022	18629170000	281278	142420	138955
13059	2020	4848271000	128550	58035	54328
13059	2021	5284963000	129185	58275	56010
13059	2022	5320928000	129875	57972	55998
13061	2020	110838000	2830	901	791
13061	2021	112610000	2859	876	789
13061	2022	104842000	2845	828	771
13063	2020	9451619000	297623	138780	124510
13063	2021	10279907000	297318	139603	130752
13063	2022	9736416000	296564	139968	134296
13065	2020	275847000	6725	2964	2848
13065	2021	280710000	6698	3016	2926
13065	2022	277886000	6662	3034	2948
13067	2020	47937085000	766374	412387	388183
13067	2021	52344154000	766691	421931	408135
13067	2022	53984067000	771952	430506	419024
13069	2020	1532731000	43052	18954	17857
13069	2021	1754739000	42997	18672	17903
13069	2022	1682506000	43172	18560	17875
13071	2020	1731615000	45900	21877	20901
13071	2021	1879929000	45757	22074	21351
13071	2022	1883754000	45762	21895	21252
13073	2020	8717682000	156849	75359	72222
13073	2021	9382281000	159636	75787	73694
13073	2022	9564735000	162419	75689	73484
13075	2020	629025000	17234	8105	7720
13075	2021	690086000	17266	8130	7848
13075	2022	677998000	17404	8226	7963
13077	2020	7827799000	146725	74466	69922
13077	2021	8653873000	149925	76009	73451
13077	2022	9167864000	152882	77557	75424
13079	2020	451820000	12103	5418	5142
13079	2021	488187000	12139	5432	5225
13079	2022	488241000	12140	5340	5167
13081	2020	841467000	20050	9719	8847
13081	2021	917739000	20024	9999	9137
13081	2022	878613000	19708	9731	9305
13083	2020	615790000	16235	7789	7467
13083	2021	662085000	16230	7881	7668
13083	2022	674122000	16081	8038	7822
13085	2020	1403810000	27056	12675	12090
13085	2021	1648638000	28475	13079	12724
13085	2022	1840431000	30138	13388	13047
13087	2020	1103968000	29324	11329	10786
13087	2021	1228918000	29045	11395	10976
13087	2022	1194748000	28982	11716	11322
13089	2020	42804261000	764420	393700	362554
13089	2021	47518656000	759231	399247	381058
13089	2022	47777254000	762820	404413	391314
13091	2020	689082000	19874	6926	6512
13091	2021	743509000	19675	6952	6652
13091	2022	717031000	19802	6854	6588
13093	2020	453019000	11165	4978	4532
13093	2021	482223000	10881	4910	4543
13093	2022	473550000	10572	4726	4531
13095	2020	3488155000	85153	37503	34272
13095	2021	3810380000	82267	36994	34651
13095	2022	3706964000	82966	36387	34767
13097	2020	5876686000	144552	72454	67134
13097	2021	6386496000	145628	73771	70569
13097	2022	6430585000	147316	74978	72462
13099	2020	438575000	10799	4421	4167
13099	2021	466013000	10651	4322	4107
13099	2022	445365000	10574	4252	4088
13101	2020	124326000	3720	1883	1809
13101	2021	126227000	3708	1874	1821
13101	2022	120469000	3686	1857	1810
13103	2020	2904582000	65158	31899	30335
13103	2021	3212722000	66746	33040	32056
13103	2022	3329387000	69041	33627	32741
13105	2020	762374000	19667	7936	7391
13105	2021	817678000	19554	7779	7401
13105	2022	842830000	19814	7844	7543
13107	2020	868661000	22887	8574	7977
13107	2021	913481000	22887	8634	8181
13107	2022	895134000	22929	8684	8318
13109	2020	398623000	10790	5011	4754
13109	2021	432689000	10711	5107	4925
13109	2022	433829000	10695	5032	4880
13111	2020	1092306000	25434	11139	10614
13111	2021	1242788000	25763	11694	11356
13111	2022	1276391000	25737	11927	11599
13113	2020	8131840000	119483	56635	53605
13113	2021	8778997000	120681	58021	56316
13113	2022	9188067000	122030	59436	57837
13115	2020	4036097000	98575	43156	40465
13115	2021	4363897000	98499	43311	41687
13115	2022	4388071000	99443	44672	43261
13117	2020	17561482000	252878	123063	117533
13117	2021	19524896000	260721	126707	123515
13117	2022	21213681000	267237	129933	126811
13119	2020	843482000	23468	9899	9320
13119	2021	956576000	23503	9939	9565
13119	2022	1063523000	24128	9983	9656
13121	2020	99449827000	1069370	559104	514890
13121	2021	108046686000	1062531	567128	541109
13121	2022	108123538000	1074634	574466	555616
13123	2020	1207547000	31428	12029	11468
13123	2021	1386816000	32090	12269	11889
13123	2022	1467735000	32407	12505	12113
13125	2020	112725000	2894	1247	1197
13125	2021	117075000	2906	1240	1206
13125	2022	115635000	2939	1248	1208
13127	2020	4452568000	84471	38323	35744
13127	2021	4956371000	84705	38853	37374
13127	2022	5107513000	85079	39564	38360
13129	2020	2212830000	57716	28115	26595
13129	2021	2503290000	58253	28614	27684
13129	2022	2640753000	58954	28906	28062
13131	2020	931031000	26222	10629	10166
13131	2021	1009580000	25879	10951	10602
13131	2022	1000979000	26008	10878	10540
13133	2020	1222957000	19021	7196	6779
13133	2021	1453728000	19553	7207	6935
13133	2022	1529099000	20139	7353	7113
13135	2020	44004864000	958005	480566	450320
13135	2021	48373745000	965145	490748	473609
13135	2022	49612195000	975353	500085	486171
13137	2020	1702508000	46138	18735	17725
13137	2021	1842081000	46740	18422	17757
13137	2022	1906344000	47475	18689	18094
13139	2020	10188484000	203735	102396	97607
13139	2021	11442825000	207393	104084	101262
13139	2022	12211909000	212692	107053	104415
13141	2020	286967000	8708	2541	2318
13141	2021	303145000	8664	2501	2343
13141	2022	297911000	8387	2499	2372
13143	2020	1229441000	30037	12378	11659
13143	2021	1358895000	30579	12716	12266
13143	2022	1414419000	31337	12994	12588
13145	2020	1846403000	34896	16857	16097
13145	2021	2032543000	35605	16755	16266
13145	2022	2128495000	36276	16571	16098
13147	2020	1066906000	25871	11336	10725
13147	2021	1160497000	26340	11581	11126
13147	2022	1234090000	26909	12097	11721
13149	2020	417330000	11448	5111	4781
13149	2021	469587000	11529	5225	5021
13149	2022	492071000	11725	5316	5152
13151	2020	10380170000	241848	116487	108034
13151	2021	11432024000	245023	118339	113384
13151	2022	11653480000	248364	120416	116498
13153	2020	7465184000	164343	70532	66854
13153	2021	8226526000	167156	70943	68314
13153	2022	8156163000	169631	70326	68062
13155	2020	362231000	9650	3486	3291
13155	2021	397566000	9375	3540	3378
13155	2022	386492000	9126	3528	3384
13157	2020	3640245000	76717	40087	38345
13157	2021	4173799000	80317	41953	40924
13157	2022	4606427000	83936	48197	47224
13159	2020	643185000	14666	6822	6491
13159	2021	703656000	15259	7045	6817
13159	2022	756536000	15951	7186	6993
13161	2020	518886000	14799	6138	5824
13161	2021	556400000	14848	6080	5836
13161	2022	546576000	14889	6148	5919
13163	2020	603383000	15678	6678	6231
13163	2021	662398000	15494	6640	6315
13163	2022	635919000	15314	6556	6283
13165	2020	306536000	8666	3190	2989
13165	2021	325869000	8776	3178	3026
13165	2022	319812000	8689	3286	3141
13167	2020	285347000	9186	4004	3807
13167	2021	307247000	9034	4110	3962
13167	2022	293170000	9242	4023	3904
13169	2020	1156633000	28397	13374	12770
13169	2021	1262799000	28409	13413	12989
13169	2022	1229747000	28472	13245	12842
13171	2020	722184000	18551	7989	7488
13171	2021	810344000	18684	8228	7881
13171	2022	851373000	19467	8370	8087
13173	2020	330681000	9926	3805	3605
13173	2021	356282000	10052	3800	3651
13173	2022	344127000	10171	3753	3620
13175	2020	1985256000	49544	19293	18011
13175	2021	2170321000	49527	19628	18779
13175	2022	2125024000	49660	19257	18496
13177	2020	1557926000	33215	15036	14352
13177	2021	1703303000	33194	14986	14515
13177	2022	1750469000	33642	15010	14563
13179	2020	2479263000	65317	25725	24125
13179	2021	2720026000	66844	26119	25072
13179	2022	2690112000	68030	26025	25141
13181	2020	347264000	7701	3510	3322
13181	2021	366988000	7750	3525	3382
13181	2022	364368000	7841	3500	3374
13183	2020	590642000	16269	8191	7834
13183	2021	685099000	17089	8395	8135
13183	2022	731846000	18348	8428	8157
13185	2020	4902670000	118415	51525	48417
13185	2021	5288975000	118914	51007	48900
13185	2022	5257374000	119739	50175	48471
13187	2020	1402501000	33631	16569	15780
13187	2021	1571590000	32890	17517	17032
13187	2022	1636065000	34796	17974	17510
13189	2020	882495000	21603	8555	7882
13189	2021	946209000	21636	8472	8027
13189	2022	921944000	21713	8389	8005
13191	2020	490149000	10987	5949	5614
13191	2021	527494000	11051	6075	5849
13191	2022	532420000	11180	6192	5994
13193	2020	433628000	12021	4655	4303
13193	2021	468551000	11832	4662	4357
13193	2022	507301000	11765	4523	4328
13195	2020	1204059000	30269	13226	12560
13195	2021	1349637000	30883	13395	12976
13195	2022	1463043000	31473	13371	12973
13197	2020	270149000	7530	3241	3077
13197	2021	284571000	7426	3234	3114
13197	2022	283589000	7449	3201	3083
13199	2020	836558000	20606	8747	7996
13199	2021	914910000	20715	8862	8402
13199	2022	916757000	20845	8969	8616
13201	2020	285584000	5988	2772	2662
13201	2021	308176000	5886	2791	2706
13201	2022	296695000	5807	2854	2776
13205	2020	898473000	21668	8292	7751
13205	2021	931121000	21266	8176	7760
13205	2022	932130000	21116	8231	7894
13207	2020	1369031000	28055	12907	12261
13207	2021	1550360000	28729	12901	12490
13207	2022	1594794000	29427	12721	12350
13209	2020	305819000	8574	3833	3627
13209	2021	330668000	8654	3808	3648
13209	2022	321677000	8655	3820	3668
13211	2020	1079548000	20198	9228	8737
13211	2021	1199120000	20654	9490	9180
13211	2022	1271372000	21031	9673	9404
13213	2020	1328722000	40012	15390	14239
13213	2021	1484203000	40032	15312	14644
13213	2022	1515954000	40472	15366	14735
13215	2020	9122974000	206998	77262	71264
13215	2021	9857601000	205024	75992	71972
13215	2022	9735501000	202616	74408	71202
13217	2020	4386908000	112843	52157	48479
13217	2021	4822049000	115318	53257	50917
13217	2022	4897580000	117621	54193	52281
13219	2020	2990617000	42013	19623	18905
13219	2021	3280760000	43025	19981	19529
13219	2022	3482763000	43588	19998	19524
13221	2020	600486000	14867	6849	6526
13221	2021	674498000	15142	6922	6719
13221	2022	727871000	15469	6913	6719
13223	2020	7342190000	169570	86866	82294
13223	2021	8154198000	173921	89125	86423
13223	2022	8589653000	178421	91217	88756
13225	2020	1162207000	28040	11842	11109
13225	2021	1263515000	28245	11943	11362
13225	2022	1253641000	28562	11789	11325
13227	2020	1743770000	33339	15041	14328
13227	2021	1990869000	33990	15494	15056
13227	2022	2111029000	34826	15881	15460
13229	2020	791597000	19746	8519	8135
13229	2021	833900000	19975	8600	8329
13229	2022	840253000	20168	8675	8424
13231	2020	853925000	18936	8703	8276
13231	2021	959701000	19534	8957	8701
13231	2022	1013739000	19990	9181	8926
13233	2020	1564986000	42923	18293	17210
13233	2021	1702948000	43332	18366	17705
13233	2022	1732708000	43709	18596	18008
13235	2020	374990000	9873	3955	3769
13235	2021	408097000	9582	4009	3856
13235	2022	409323000	9984	3980	3844
13237	2020	1088482000	22163	8294	7761
13237	2021	1215432000	22643	8620	8271
13237	2022	1251652000	22984	8752	8439
13239	2020	88269000	2228	796	746
13239	2021	83209000	2236	763	726
13239	2022	82382000	2249	728	691
13241	2020	771120000	16914	7240	6858
13241	2021	890129000	17088	7519	7280
13241	2022	901473000	17206	7799	7566
13243	2020	259790000	6368	2467	2321
13243	2021	272476000	6253	2358	2234
13243	2022	256801000	6116	2374	2265
13245	2020	8496216000	206526	84106	77707
13245	2021	8975404000	205358	83574	79122
13245	2022	8738700000	206640	82486	78895
13247	2020	3651077000	93644	43642	40347
13247	2021	3945253000	93961	44444	42407
13247	2022	3916237000	94984	45162	43544
13249	2020	185056000	4534	2147	2055
13249	2021	193633000	4476	2123	2042
13249	2022	195373000	4496	2141	2058
13251	2020	530440000	14078	5050	4641
13251	2021	573188000	14055	5075	4790
13251	2022	558094000	13977	4997	4772
13253	2020	412420000	9131	3097	2943
13253	2021	435233000	9142	3071	2955
13253	2022	421362000	9127	3095	2982
13255	2020	2591600000	67455	28356	26221
13255	2021	2907730000	67699	28889	27547
13255	2022	2891746000	68919	29289	28282
13257	2020	1054278000	26820	10436	9774
13257	2021	1169075000	26765	10390	9936
13257	2022	1201602000	26767	10559	10169
13259	2020	162164000	5304	2514	2374
13259	2021	162801000	4914	2543	2446
13259	2022	165777000	4648	2592	2494
13261	2020	1182918000	29516	12593	11659
13261	2021	1262860000	28978	12254	11553
13261	2022	1236864000	28877	12162	11645
13263	2020	248459000	5726	2757	2571
13263	2021	265471000	5746	2772	2646
13263	2022	266379000	5747	2786	2680
13265	2020	59552000	1562	533	495
13265	2021	63467000	1560	533	506
13265	2022	69838000	1600	542	519
13267	2020	754171000	24316	9677	9264
13267	2021	835734000	24132	9503	9192
13267	2022	883400000	24064	9373	9080
13269	2020	275026000	7819	2770	2571
13269	2021	307633000	7754	2889	2713
13269	2022	294774000	7737	2591	2457
13271	2020	348435000	12465	3801	3428
13271	2021	372632000	12330	3710	3447
13271	2022	350763000	12354	3575	3364
13273	2020	390425000	9138	3529	3266
13273	2021	416872000	8904	3527	3304
13273	2022	396406000	8754	3477	3315
13275	2020	2174344000	45785	17007	15954
13275	2021	2439247000	45815	17358	16621
13275	2022	2440985000	45561	17042	16421
13277	2020	1715085000	41374	20546	19509
13277	2021	1866192000	41123	21013	20283
13277	2022	1845599000	41412	21063	20461
13279	2020	1066567000	27081	12167	11379
13279	2021	1148086000	26873	12014	11469
13279	2022	1118365000	26837	12003	11529
13281	2020	553646000	12545	3874	3619
13281	2021	613699000	12867	4020	3857
13281	2022	617733000	12972	4047	3876
13283	2020	225889000	6396	2660	2499
13283	2021	240610000	6382	2617	2503
13283	2022	231515000	6365	2618	2511
13285	2020	2860001000	69323	37612	34919
13285	2021	3124400000	69479	37044	35410
13285	2022	3136986000	70191	36794	35671
13287	2020	307064000	8983	3262	3026
13287	2021	341616000	8931	3252	3044
13287	2022	326384000	8842	3169	3036
13289	2020	329619000	8011	2789	2581
13289	2021	353603000	7899	2758	2613
13289	2022	341636000	7680	2712	2582
13291	2020	1037486000	24798	10554	10094
13291	2021	1157869000	25560	11066	10760
13291	2022	1176665000	26388	11401	11086
13293	2020	1034999000	27740	11375	10632
13293	2021	1148121000	27673	11549	11081
13293	2022	1151922000	28086	11644	11261
13295	2020	2561183000	67742	30583	29083
13295	2021	2842877000	68405	30617	29630
13295	2022	2915143000	68915	31259	30289
13297	2020	4535554000	97153	45583	43150
13297	2021	5046385000	99808	46823	45319
13297	2022	5329194000	103065	47915	46539
13299	2020	1320150000	36225	15312	14465
13299	2021	1389220000	35547	15365	14795
13299	2022	1368274000	35614	15454	14968
13301	2020	210010000	5208	2641	2463
13301	2021	215477000	5214	2674	2548
13301	2022	207151000	5155	2693	2587
13303	2020	796742000	19948	6928	6487
13303	2021	806723000	19766	6845	6503
13303	2022	795748000	19738	6927	6646
13305	2020	1078933000	30145	11565	10923
13305	2021	1176399000	30246	11812	11364
13305	2022	1170006000	30896	11847	11465
13307	2020	93854000	2352	1016	959
13307	2021	95148000	2356	989	944
13307	2022	91934000	2328	986	948
13309	2020	165809000	7447	1612	1496
13309	2021	180195000	7748	1621	1531
13309	2022	172210000	7314	1629	1543
13311	2020	1227037000	28108	16259	15555
13311	2021	1361263000	28393	16538	16111
13311	2022	1421023000	28806	16922	16504
13313	2020	4415975000	102776	43144	40038
13313	2021	4614950000	102688	42901	41192
13313	2022	4671780000	103132	43138	41447
13315	2020	253127000	8792	2756	2590
13315	2021	283689000	8746	2709	2577
13315	2022	291976000	8761	2660	2558
13317	2020	407916000	9556	3644	3399
13317	2021	453084000	9516	3643	3472
13317	2022	507945000	9599	3710	3556
13319	2020	352289000	8824	3803	3602
13319	2021	375722000	8791	3640	3487
13319	2022	374169000	8681	3485	3353
13321	2020	793376000	20738	8819	8340
13321	2021	859128000	20557	8782	8426
13321	2022	836736000	20424	8736	8455
15001	2020	9142151000	200712	92138	81651
15001	2021	10308749000	203792	93904	88505
15001	2022	10207652000	206315	93707	90508
15003	2020	61014686000	1012305	452023	405728
15003	2021	64493233000	1004673	452683	427572
15003	2022	64652972000	995638	455432	440638
15007	2020	3880680000	73186	36458	30567
15007	2021	4204857000	73791	36215	33295
15007	2022	4184827000	73810	36491	35256
16001	2020	28973682000	498260	263395	248859
16001	2021	32884534000	512914	271828	263088
16001	2022	35054504000	518907	280810	274032
16003	2020	175330000	4425	1890	1713
16003	2021	196855000	4632	1905	1785
16003	2022	210649000	4817	1882	1778
16005	2020	3711040000	87270	42333	40215
16005	2021	4096069000	88349	42819	41298
16005	2022	4248231000	89517	43563	42289
16007	2020	284226000	6367	2700	2575
16007	2021	302640000	6559	2732	2642
16007	2022	326058000	6722	2882	2795
16009	2020	411719000	9576	4374	4042
16009	2021	438981000	9941	4293	4061
16009	2022	451798000	10370	4290	4103
16011	2020	1974516000	48106	22634	21718
16011	2021	2211080000	48898	22994	22235
16011	2022	2341794000	49923	23582	22910
16013	2020	3040772000	24342	12990	11958
16013	2021	3631300000	24767	13115	12647
16013	2022	4118807000	24866	13489	13136
16015	2020	387869000	7662	3840	3533
16015	2021	415030000	8121	3914	3710
16015	2022	446871000	8333	4016	3859
16017	2020	2309012000	47402	21362	19706
16017	2021	2542120000	49617	21858	20825
16017	2022	2672495000	51414	22144	21296
16019	2020	7480548000	124716	59122	56680
16019	2021	7909120000	128045	61411	59648
16019	2022	8156227000	129496	63378	61809
16021	2020	507777000	12137	5392	5046
16021	2021	582468000	12635	5482	5241
16021	2022	605761000	13345	5555	5328
16023	2020	127886000	2583	1086	1040
16023	2021	132267000	2650	1132	1083
16023	2022	144107000	2684	1168	1123
16025	2020	56809000	1083	521	491
16025	2021	61534000	1129	531	511
16025	2022	71300000	1153	552	533
16027	2020	9150027000	232998	107851	101384
16027	2021	10647019000	243774	111134	106780
16027	2022	11401315000	251065	114743	111203
16029	2020	334500000	7012	3602	3461
16029	2021	326631000	7110	3589	3469
16029	2022	348331000	7190	3625	3509
16031	2020	1207766000	24760	11682	11228
16031	2021	1277826000	25249	11825	11469
16031	2022	1401707000	25655	12113	11795
16033	2020	36996000	791	470	454
16033	2021	32743000	793	458	445
16033	2022	38100000	806	481	466
16035	2020	346606000	8752	3427	3148
16035	2021	379852000	8917	3396	3189
16035	2022	392503000	9015	3404	3231
16037	2020	196576000	4265	2112	2001
16037	2021	216209000	4434	2153	2053
16037	2022	231390000	4506	2142	2065
16039	2020	1112084000	28669	12016	11422
16039	2021	1232163000	28941	12129	11677
16039	2022	1273214000	29403	12285	11904
16041	2020	572678000	14284	6726	6472
16041	2021	646273000	14676	6908	6727
16041	2022	672495000	15189	7123	6946
16043	2020	557178000	13414	7405	7118
16043	2021	605644000	13606	7687	7458
16043	2022	651528000	13978	7870	7657
16045	2020	813365000	19274	8112	7614
16045	2021	899984000	19832	8353	8003
16045	2022	957519000	20418	8600	8332
16047	2020	983421000	15643	7892	7575
16047	2021	1000532000	15725	7926	7668
16047	2022	1146332000	15715	8102	7873
16049	2020	649099000	16588	7209	6728
16049	2021	752543000	17053	7267	6924
16049	2022	779628000	17593	7308	7027
16051	2020	1252451000	31077	14145	13645
16051	2021	1407308000	32253	14654	14253
16051	2022	1516845000	33428	15142	14782
16053	2020	1007758000	24268	11587	11093
16053	2021	1068935000	24745	11742	11336
16053	2022	1155833000	25311	11916	11560
16055	2020	8982647000	172790	83063	77160
16055	2021	10385723000	180146	84312	80740
16055	2022	11101780000	183578	85447	82545
16057	2020	1867148000	39629	19679	18716
16057	2021	2075512000	40397	19913	19249
16057	2022	2156551000	40978	20273	19742
16059	2020	377812000	7958	4002	3737
16059	2021	422424000	8136	4041	3836
16059	2022	445372000	8240	4066	3913
16061	2020	202853000	3528	1652	1521
16061	2021	218810000	3709	1655	1562
16061	2022	227586000	3763	1656	1587
16063	2020	222620000	5129	2325	2176
16063	2021	238709000	5260	2371	2259
16063	2022	275471000	5329	2465	2363
16065	2020	1312858000	52929	22277	21655
16065	2021	1472562000	54114	23320	22801
16065	2022	1530319000	54976	23873	23408
16067	2020	969940000	21666	11338	10883
16067	2021	994044000	21945	11479	11113
16067	2022	1063854000	22194	11749	11436
16069	2020	2001346000	42141	21102	20052
16069	2021	2207202000	42509	21256	20566
16069	2022	2340338000	43004	21501	20917
16071	2020	190617000	4562	2035	1940
16071	2021	208875000	4588	2267	2204
16071	2022	220047000	4712	2376	2307
16073	2020	498658000	11994	5309	4980
16073	2021	552385000	12348	5361	5125
16073	2022	608582000	12613	5539	5342
16075	2020	1103641000	25583	11238	10610
16075	2021	1219239000	26377	11315	10847
16075	2022	1311203000	26956	11485	11099
16077	2020	360790000	7877	3780	3615
16077	2021	336139000	7959	3772	3620
16077	2022	384176000	8068	3933	3802
16079	2020	551377000	13195	5717	5186
16079	2021	614271000	13659	5726	5362
16079	2022	634891000	14012	5668	5393
16081	2020	582484000	11735	6658	6271
16081	2021	705379000	12294	7104	6896
16081	2022	780156000	12544	7645	7477
16083	2020	3933366000	90361	43182	40877
16083	2021	4360820000	92357	43875	42348
16083	2022	4592839000	93696	44202	42962
16085	2020	647735000	11842	6108	5618
16085	2021	754591000	12264	6193	5880
16085	2022	805994000	12464	6232	5996
16087	2020	420951000	10559	4470	4214
16087	2021	449640000	10887	4525	4320
16087	2022	481361000	11087	4646	4477
17001	2020	3371833000	65612	31166	29178
17001	2021	3653183000	65146	30993	29740
17001	2022	3638723000	64725	30667	29599
17003	2020	237736000	5173	1835	1647
17003	2021	250379000	5032	1831	1682
17003	2022	236784000	4858	1798	1679
17005	2020	684746000	16688	7402	6886
17005	2021	755091000	16633	7470	7121
17005	2022	751538000	16566	7451	7155
17007	2020	2696225000	53334	25325	22454
17007	2021	2949546000	53199	24956	22770
17007	2022	2950716000	53154	24845	23183
17009	2020	261405000	6233	2984	2868
17009	2021	286306000	6443	3004	2923
17009	2022	295998000	6330	3058	2986
17011	2020	1549407000	33172	16387	15132
17011	2021	1725141000	32961	16380	15546
17011	2022	1693355000	32828	16074	15327
17013	2020	222449000	4404	2177	2002
17013	2021	241918000	4385	2177	2071
17013	2022	241708000	4360	2168	2078
17015	2020	709982000	15667	7441	6902
17015	2021	803948000	15674	7529	7197
17015	2022	804214000	15529	7319	7023
17017	2020	573407000	12985	5819	5425
17017	2021	630895000	12798	5674	5385
17017	2022	633226000	12657	5702	5452
17019	2020	10313936000	205629	106938	99877
17019	2021	11290127000	206708	108559	103107
17019	2022	11283959000	206542	109288	104979
17021	2020	1484429000	33950	13500	12396
17021	2021	1649181000	33721	13371	12621
17021	2022	1640122000	33436	13396	12755
17023	2020	694721000	15423	7316	6709
17023	2021	785878000	15354	7302	6919
17023	2022	778589000	15229	7290	6971
17025	2020	574300000	13271	6195	5609
17025	2021	658139000	13154	5915	5575
17025	2022	642114000	13047	5696	5417
17027	2020	1965355000	36913	19677	18512
17027	2021	2132588000	36886	19872	19159
17027	2022	2172764000	36909	19860	19245
17029	2020	2247773000	46761	23067	21345
17029	2021	2469209000	46809	22822	21621
17029	2022	2416871000	46334	22640	21639
17031	2020	352248526000	5261249	2591782	2317178
17031	2021	377858556000	5177606	2597767	2416765
17031	2022	372197013000	5109292	2659157	2528507
17033	2020	906136000	18648	8399	7801
17033	2021	968150000	18691	8404	7965
17033	2022	967349000	18536	8288	7933
17035	2020	822197000	10429	5932	5590
17035	2021	903145000	10343	5928	5674
17035	2022	923247000	10324	5930	5719
17037	2020	4723052000	100253	52911	48520
17037	2021	5115754000	100472	53143	50067
17037	2022	5112381000	100232	53769	51381
17039	2020	795020000	15450	7004	6532
17039	2021	885972000	15379	7103	6743
17039	2022	876805000	15310	7304	6999
17041	2020	1084399000	19758	9970	9405
17041	2021	1209402000	19740	10138	9747
17041	2022	1244405000	19755	10107	9759
17043	2020	73479072000	931244	496192	458446
17043	2021	80389863000	926448	500812	478123
17043	2022	81580608000	920901	518658	500306
17045	2020	806397000	16796	8899	8289
17045	2021	918501000	16589	8935	8558
17045	2022	925069000	16433	9072	8746
17047	2020	280344000	6208	2670	2430
17047	2021	306830000	6086	2534	2396
17047	2022	302385000	6071	2425	2315
17049	2020	1912414000	34695	19185	17915
17049	2021	2108422000	34531	19470	18699
17049	2022	2139161000	34325	19655	19042
17051	2020	858607000	21483	9715	8976
17051	2021	966081000	21447	9806	9287
17051	2022	949210000	21305	9730	9296
17053	2020	761278000	13517	6165	5755
17053	2021	841799000	13491	6213	5926
17053	2022	852796000	13249	6282	6018
17055	2020	1588814000	37685	15942	14251
17055	2021	1721364000	37498	15736	14668
17055	2022	1685604000	37242	15794	14942
17057	2020	1450086000	33488	14569	13309
17057	2021	1577027000	33313	14504	13661
17057	2022	1583833000	33021	14564	13827
17059	2020	223542000	4938	2018	1822
17059	2021	265138000	4907	1961	1838
17059	2022	264979000	4855	2003	1898
17061	2020	529060000	11936	5898	5499
17061	2021	615540000	11851	5915	5622
17061	2022	621687000	11651	5837	5584
17063	2020	3111576000	52517	25010	22875
17063	2021	3171817000	52929	25188	23848
17063	2022	3233600000	53041	26209	24957
17065	2020	376689000	7997	4226	3924
17065	2021	427896000	7923	4241	4041
17065	2022	426377000	7984	4260	4106
17067	2020	865644000	17547	8062	7506
17067	2021	986719000	17388	8053	7698
17067	2022	967853000	17244	7941	7617
17069	2020	152478000	3641	1296	1167
17069	2021	164378000	3650	1359	1263
17069	2022	165512000	3597	1434	1357
17071	2020	298231000	6334	3533	3287
17071	2021	346362000	6304	3547	3402
17071	2022	353813000	6151	3501	3355
17073	2020	2495038000	49172	23724	21841
17073	2021	2734241000	48868	23663	22472
17073	2022	2716245000	48419	23568	22525
17075	2020	1335258000	26977	13553	12702
17075	2021	1498254000	26761	12950	12318
17075	2022	1519305000	26473	12688	12103
17077	2020	2275564000	52906	27164	25040
17077	2021	2483501000	52666	27165	25639
17077	2022	2434579000	52617	26949	25771
17079	2020	452049000	9240	4574	4296
17079	2021	521898000	9204	4740	4534
17079	2022	520533000	9212	4797	4612
17081	2020	1630233000	36998	16965	15243
17081	2021	1768676000	36882	16548	15494
17081	2022	1716377000	36400	16307	15513
17083	2020	1030037000	21495	10582	9784
17083	2021	1119484000	21370	10607	10135
17083	2022	1113783000	21246	10559	10172
17085	2020	1124952000	22057	10444	9573
17085	2021	1264855000	21932	10565	10086
17085	2022	1264432000	21758	10481	10078
17087	2020	496035000	13322	4092	3717
17087	2021	536145000	13471	4102	3848
17087	2022	526701000	13381	4071	3843
17089	2020	30082987000	516141	261366	237204
17089	2021	32567874000	516183	260478	244824
17089	2022	32850823000	514182	263858	251431
17091	2020	5085534000	107250	53935	49107
17091	2021	5513016000	106652	52437	48936
17091	2022	5414861000	106074	51704	48849
17093	2020	7102654000	132348	69257	63726
17093	2021	7744025000	134948	69729	66423
17093	2022	8054542000	137254	72451	69607
17095	2020	2149773000	49799	21060	19227
17095	2021	2344929000	49347	20522	19155
17095	2022	2285624000	48640	19876	18800
17097	2020	58141304000	713251	364341	334715
17097	2021	64849838000	712160	364965	345268
17097	2022	66675939000	709150	362741	346849
17099	2020	5334994000	109421	52719	47696
17099	2021	5765815000	109139	52728	49520
17099	2022	5763289000	108078	51828	49181
17101	2020	538134000	15258	5807	5234
17101	2021	610507000	15216	5529	5165
17101	2022	587178000	14914	5114	4817
17103	2020	1593293000	34051	17091	15917
17103	2021	1769621000	34166	16913	16124
17103	2022	1763575000	33848	16636	15948
17105	2020	1800101000	35779	15888	14806
17105	2021	2034347000	35741	15463	14676
17105	2022	2016951000	35521	15570	14931
17107	2020	1187098000	27899	12068	11242
17107	2021	1341366000	27970	11860	11272
17107	2022	1331744000	27591	11561	11053
17109	2020	1201484000	27097	12783	11861
17109	2021	1305871000	26848	12731	12085
17109	2022	1291768000	26861	12697	12147
17111	2020	18529544000	309886	162389	149337
17111	2021	20005025000	311592	163502	155728
17111	2022	20515181000	311747	169534	162925
17113	2020	9392021000	170954	84856	79040
17113	2021	10141996000	171190	85723	81673
17113	2022	9956632000	171141	88311	85015
17115	2020	5340725000	103756	47088	42400
17115	2021	5793197000	102649	46349	42753
17115	2022	5761622000	101483	45550	42920
17117	2020	2068565000	44845	21912	20381
17117	2021	2280730000	44545	22127	21096
17117	2022	2258553000	44245	22044	21181
17119	2020	13578471000	265610	130987	120728
17119	2021	14741217000	264898	131692	125084
17119	2022	14774127000	263864	130805	125657
17121	2020	1751939000	37639	17055	15463
17121	2021	1877317000	37378	16836	15829
17121	2022	1846895000	36914	16733	15928
17123	2020	576288000	11706	5057	4687
17123	2021	643493000	11686	5093	4804
17123	2022	664272000	11678	5083	4836
17125	2020	619504000	13057	5910	5436
17125	2021	705411000	12859	5914	5590
17125	2022	716106000	12748	5896	5617
17127	2020	588872000	14138	5419	4873
17127	2021	636480000	13966	5385	5065
17127	2022	624663000	13896	5350	5081
17129	2020	614991000	12271	6049	5655
17129	2021	695806000	12184	6149	5887
17129	2022	695107000	12121	6216	5983
17131	2020	813076000	15627	7600	6981
17131	2021	914012000	15568	7556	7178
17131	2022	917618000	15504	7517	7193
17133	2020	2137644000	34952	18391	17360
17133	2021	2400297000	34993	18583	17980
17133	2022	2408943000	35033	18614	18066
17135	2020	1116751000	28203	11441	10437
17135	2021	1238438000	28154	11307	10673
17135	2022	1217574000	28020	11262	10731
17137	2020	1484890000	32838	15863	14767
17137	2021	1635227000	32599	15732	14925
17137	2022	1611329000	32209	15623	14970
17139	2020	999800000	14476	7258	6880
17139	2021	980157000	14509	7376	7104
17139	2022	1077448000	14323	7316	7069
17141	2020	2546397000	51694	24110	22134
17141	2021	2785023000	51474	23700	22295
17141	2022	2811498000	51351	23788	22594
17143	2020	9598994000	181322	83503	74797
17143	2021	10273265000	179764	82746	76726
17143	2022	10231423000	178383	81717	77416
17145	2020	848692000	20882	8082	7309
17145	2021	920471000	21033	7959	7471
17145	2022	883689000	20588	7801	7397
17147	2020	967193000	16674	8358	7899
17147	2021	1104309000	16781	8501	8144
17147	2022	1121053000	16723	8590	8282
17149	2020	715613000	14641	6734	6332
17149	2021	849576000	14609	6812	6524
17149	2022	798456000	14484	6746	6453
17151	2020	133999000	3758	1625	1508
17151	2021	141648000	3770	1681	1599
17151	2022	137641000	3770	1752	1669
17153	2020	217298000	5160	1760	1551
17153	2021	238372000	5073	1696	1534
17153	2022	229054000	4991	1645	1525
17155	2020	335155000	5631	2939	2693
17155	2021	374000000	5596	2970	2818
17155	2022	373078000	5572	2958	2812
17157	2020	1310706000	30086	13740	12759
17157	2021	1421619000	30219	13701	13087
17157	2022	1396478000	30068	13378	12874
17159	2020	717464000	15778	7356	6853
17159	2021	800023000	15685	7062	6745
17159	2022	803101000	15435	7158	6878
17161	2020	6686987000	144359	68527	62003
17161	2021	7063052000	142992	67732	63864
17161	2022	6904685000	141527	67025	64009
17163	2020	12921177000	256823	124156	112752
17163	2021	14002910000	255022	124544	116837
17163	2022	13812583000	252671	122897	117355
17165	2020	996128000	23688	9514	8572
17165	2021	1087190000	23348	9295	8661
17165	2022	1079445000	23087	9304	8815
17167	2020	10268906000	196122	96628	88597
17167	2021	11309474000	195422	97863	92314
17167	2022	11120910000	194534	98051	93886
17169	2020	332692000	6871	3133	2933
17169	2021	358158000	6822	3160	3027
17169	2022	360283000	6746	3104	2971
17171	2020	232696000	4941	2348	2191
17171	2021	267834000	4855	2306	2185
17171	2022	266535000	4790	2295	2180
17173	2020	963533000	20924	10235	9553
17173	2021	1090815000	20861	10164	9715
17173	2022	1092348000	20761	9945	9523
17175	2020	271744000	5391	2355	2181
17175	2021	323444000	5296	2364	2232
17175	2022	334983000	5345	2370	2249
17177	2020	2104615000	44493	21077	19520
17177	2021	2293834000	44071	20829	19649
17177	2022	2305508000	43627	20630	19656
17179	2020	6792891000	131073	61893	56830
17179	2021	7227530000	130563	61425	58277
17179	2022	7341183000	129911	61433	58802
17181	2020	782594000	17182	7181	6594
17181	2021	826345000	16937	7135	6717
17181	2022	807422000	16767	7057	6683
17183	2020	3276479000	74001	31919	28937
17183	2021	3586194000	73263	31572	29444
17183	2022	3552142000	72337	31697	30031
17185	2020	525472000	11315	5758	5200
17185	2021	582998000	11210	5494	5229
17185	2022	578426000	11087	5684	5484
17187	2020	770846000	16828	8064	7552
17187	2021	875434000	16595	7806	7428
17187	2022	905728000	16354	7786	7469
17189	2020	740468000	13731	9537	9032
17189	2021	830003000	13651	9600	9299
17189	2022	826575000	13643	9707	9461
17191	2020	692863000	16125	6770	6199
17191	2021	772089000	15967	6796	6460
17191	2022	781353000	15872	6892	6611
17193	2020	680569000	13807	6107	5613
17193	2021	777751000	13768	5966	5664
17193	2022	773991000	13614	5993	5749
17195	2020	2660750000	55553	27633	25404
17195	2021	2889461000	55342	27350	25986
17195	2022	2860852000	54658	27280	26121
17197	2020	40179443000	695844	353824	321502
17197	2021	43769242000	697985	355539	335156
17197	2022	44350465000	696757	367649	351136
17199	2020	3270322000	67113	31373	28627
17199	2021	3492095000	66943	31091	29315
17199	2022	3456206000	66695	30848	29471
17201	2020	13248214000	284928	135573	120013
17201	2021	14341065000	283559	133172	121739
17201	2022	14086828000	282188	131982	123942
17203	2020	2166015000	38395	17973	16855
17203	2021	2352409000	38210	18023	17281
17203	2022	2410480000	38128	18080	17430
18001	2020	1525950000	35852	16801	15847
18001	2021	1704186000	35939	16765	16358
18001	2022	1754820000	36068	17014	16632
18003	2020	19345409000	386082	185777	171154
18003	2021	21710667000	389112	184769	177280
18003	2022	22408673000	391449	188044	182543
18005	2020	4590932000	82216	43746	40833
18005	2021	4956752000	82730	42928	41573
18005	2022	5172771000	83540	43791	42729
18007	2020	410693000	8716	4169	3942
18007	2021	469208000	8714	4222	4096
18007	2022	469450000	8719	4378	4269
18009	2020	477762000	12111	4838	4445
18009	2021	528282000	12056	4684	4493
18009	2022	530227000	11919	4753	4585
18011	2020	5523255000	71134	36161	34582
18011	2021	6259253000	73006	37031	36169
18011	2022	6780022000	74164	37946	37162
18013	2020	812467000	15482	7545	7025
18013	2021	894391000	15573	7661	7386
18013	2022	921811000	15570	7850	7572
18015	2020	954156000	20331	9424	8825
18015	2021	1037035000	20502	9564	9245
18015	2022	1039074000	20555	9905	9614
18017	2020	1621960000	37791	17666	16436
18017	2021	1781854000	37579	17288	16593
18017	2022	1782141000	37540	17251	16681
18019	2020	5917365000	121353	61771	57233
18019	2021	6402767000	122847	61828	59645
18019	2022	6624458000	124237	62544	60809
18021	2020	1082849000	26419	11613	10837
18021	2021	1185654000	26370	11513	11062
18021	2022	1171886000	26379	11570	11175
18023	2020	1378391000	33174	16765	15801
18023	2021	1506611000	33025	16777	16266
18023	2022	1512131000	32843	17091	16647
18025	2020	401700000	10525	4878	4520
18025	2021	436252000	10491	4810	4615
18025	2022	436091000	10536	4793	4622
18027	2020	1615557000	33366	16573	15925
18027	2021	1797339000	33381	16431	16007
18027	2022	1945759000	33418	16608	16219
18029	2020	2636426000	50754	25403	23612
18029	2021	2885810000	50946	25422	24587
18029	2022	2948608000	51138	25802	25112
18031	2020	1256977000	26465	14980	13835
18031	2021	1373261000	26322	14761	14293
18031	2022	1376301000	26416	14478	14099
18033	2020	2094328000	43297	22247	20691
18033	2021	2342476000	43369	22079	21415
18033	2022	2403325000	43731	22316	21713
18035	2020	4658228000	111763	52566	48643
18035	2021	5048854000	111981	51201	48944
18035	2022	5093482000	112031	50967	49121
18037	2020	2529164000	43643	22631	21585
18037	2021	2743333000	43625	22044	21460
18037	2022	2867550000	43632	21833	21335
18039	2020	10211653000	206983	110701	102206
18039	2021	11692033000	207066	115620	112377
18039	2022	12117622000	206890	117325	114309
18041	2020	1026570000	23362	8617	7761
18041	2021	1107094000	23376	8413	8002
18041	2022	1110661000	23349	8316	7942
18043	2020	4566920000	80509	41394	38654
18043	2021	4800464000	80606	41540	40264
18043	2022	4930089000	80714	42122	41057
18045	2020	743521000	16483	7727	7208
18045	2021	822430000	16466	7678	7435
18045	2022	840915000	16574	7958	7734
18047	2020	1164049000	22793	11339	10657
18047	2021	1275576000	22857	11225	10887
18047	2022	1282078000	23028	11275	10968
18049	2020	935974000	20469	9693	9043
18049	2021	1013063000	20380	9455	9107
18049	2022	1017922000	20327	9494	9199
18051	2020	1667849000	33055	19608	18371
18051	2021	1777597000	32954	19221	18690
18051	2022	1813261000	32993	19762	19307
18053	2020	2820022000	66475	31656	29612
18053	2021	3109139000	66203	31266	29974
18053	2022	3176166000	66022	31378	30332
18055	2020	1413400000	30804	13290	12448
18055	2021	1549405000	30826	13377	12863
18055	2022	1579149000	31006	13508	12983
18057	2020	28069488000	348966	185235	176424
18057	2021	32135791000	357330	189089	184488
18057	2022	34943598000	364921	193855	189632
18059	2020	4434667000	80187	40833	38490
18059	2021	4836683000	81855	41411	40235
18059	2022	5115843000	83070	42473	41356
18061	2020	1927622000	39662	19999	18718
18061	2021	2102387000	39817	20098	19506
18061	2022	2160018000	39851	20406	19886
18063	2020	9352229000	175575	90395	85742
18063	2021	10368123000	179555	92170	89609
18063	2022	10997447000	182534	94458	92134
18065	2020	2068956000	48903	21920	20452
18065	2021	2259915000	49036	21771	20983
18065	2022	2271779000	48915	22073	21361
18067	2020	3661971000	83588	37213	33099
18067	2021	3963612000	83642	34989	32606
18067	2022	3960413000	83574	33950	32246
18069	2020	1652628000	36646	18090	16874
18069	2021	1848775000	36792	18061	17464
18069	2022	1890945000	36834	18285	17791
18071	2020	2045631000	46461	23141	21452
18071	2021	2235916000	46285	23303	22529
18071	2022	2286235000	46300	23405	22749
18073	2020	1672817000	32892	15563	14442
18073	2021	1860243000	33113	15488	14888
18073	2022	1934819000	33281	15859	15322
18075	2020	863611000	20476	8829	8239
18075	2021	991599000	20309	8760	8499
18075	2022	1088991000	20198	8840	8598
18077	2020	1552529000	33100	14981	13849
18077	2021	1666776000	33119	14910	14389
18077	2022	1694501000	32946	15000	14573
18079	2020	1229577000	27581	13582	12520
18079	2021	1341358000	27507	13391	12849
18079	2022	1354168000	27536	13534	13083
18081	2020	8494055000	162224	83128	78361
18081	2021	9385226000	164418	84300	81882
18081	2022	9833398000	165782	86284	84183
18083	2020	1787708000	36248	18301	17192
18083	2021	1935565000	35964	18099	17529
18083	2022	1936158000	35789	17983	17494
18085	2020	4174128000	80155	41439	38835
18085	2021	4541756000	80323	40517	39278
18085	2022	4656130000	80826	40564	39520
18087	2020	1807624000	40530	19327	18065
18087	2021	2140301000	40538	20460	20012
18087	2022	2280995000	40866	21442	20970
18089	2020	23837938000	498932	226716	202901
18089	2021	26200210000	499327	225113	210391
18089	2022	26546880000	499689	226746	216160
18091	2020	5050741000	112276	47462	42814
18091	2021	5528009000	112486	46656	44118
18091	2022	5582895000	111675	46784	45021
18093	2020	2103020000	45012	20719	19243
18093	2021	2321905000	45045	20743	19945
18093	2022	2366223000	45222	20524	19820
18095	2020	5494472000	130195	58554	53809
18095	2021	6035585000	130979	58894	56223
18095	2022	6121584000	131744	59833	57800
18097	2020	58426998000	976631	493768	453683
18097	2021	64434913000	971647	498953	474680
18097	2022	64469236000	969466	504140	487842
18099	2020	2139460000	46076	22724	21234
18099	2021	2377368000	46175	22523	21860
18099	2022	2438168000	46332	22943	22342
18101	2020	441420000	9803	5416	5179
18101	2021	488296000	9799	5406	5253
18101	2022	516337000	9803	5425	5274
18103	2020	1334970000	35913	15207	13942
18103	2021	1469358000	36032	14741	14020
18103	2022	1438852000	35674	14358	13762
18105	2020	6770492000	139571	68032	64164
18105	2021	7384606000	140135	68591	66353
18105	2022	7602108000	139745	70162	68140
18107	2020	1690768000	37942	18639	17650
18107	2021	1876052000	38061	18468	17933
18107	2022	1911453000	38273	18819	18338
18109	2020	3419057000	71848	35540	33564
18109	2021	3777410000	72260	36300	35132
18109	2022	3875931000	72236	37147	36091
18111	2020	630458000	13786	6568	6106
18111	2021	704960000	13793	6580	6310
18111	2022	714562000	13823	6735	6487
18113	2020	2086026000	47453	22895	20947
18113	2021	2313103000	47419	22010	21221
18113	2022	2377318000	47367	21792	21163
18115	2020	292175000	5922	3165	2927
18115	2021	319610000	5992	3141	3053
18115	2022	332882000	6114	3187	3116
18117	2020	804766000	19848	8523	7560
18117	2021	872251000	19812	8180	7792
18117	2022	897238000	19623	8194	7909
18119	2020	946525000	21314	9032	8445
18119	2021	1044473000	21432	9089	8728
18119	2022	1061369000	21482	9265	8962
18121	2020	703248000	16155	6864	6480
18121	2021	795259000	16486	6940	6717
18121	2022	819759000	16369	7062	6844
18123	2020	759506000	19151	9095	8489
18123	2021	843099000	19317	8827	8524
18123	2022	848842000	19183	8760	8485
18125	2020	546288000	12247	6181	5814
18125	2021	574690000	12178	5813	5589
18125	2022	579498000	12168	5873	5683
18127	2020	9746755000	173295	84471	77512
18127	2021	10684546000	174517	83921	80389
18127	2022	11109181000	174791	85433	82584
18129	2020	1397747000	25173	12794	12148
18129	2021	1467039000	25129	12872	12499
18129	2022	1482974000	25063	12948	12635
18131	2020	614445000	12523	6412	6015
18131	2021	668188000	12370	6296	6092
18131	2022	686720000	12485	6543	6371
18133	2020	1558151000	36679	16215	15170
18133	2021	1721268000	37016	16401	15845
18133	2022	1764144000	37301	16819	16289
18135	2020	1057065000	24409	11213	10463
18135	2021	1242272000	24437	11753	11365
18135	2022	1257281000	24437	11624	11274
18137	2020	1333026000	28968	13945	13036
18137	2021	1471402000	29017	13534	13115
18137	2022	1467601000	29087	12808	12411
18139	2020	818747000	16767	8781	8222
18139	2021	915864000	16699	8781	8511
18139	2022	918466000	16673	8869	8646
18141	2020	13654333000	272672	133759	122232
18141	2021	15067647000	272341	131347	125288
18141	2022	15432451000	272234	132073	127495
18143	2020	1002571000	24371	10483	9579
18143	2021	1081437000	24437	10422	9972
18143	2022	1087511000	24588	10531	10170
18145	2020	2125128000	45058	23058	21363
18145	2021	2322184000	45025	23093	22324
18145	2022	2357553000	44991	23545	22948
18147	2020	973955000	19835	10354	9764
18147	2021	1067780000	19875	10455	10136
18147	2022	1083278000	19967	10483	10201
18149	2020	888926000	23380	9765	8963
18149	2021	979927000	23378	9567	9117
18149	2022	976058000	23258	9530	9164
18151	2020	1662753000	34453	19939	18668
18151	2021	1858262000	34666	20042	19483
18151	2022	1897673000	34725	20697	20244
18153	2020	812614000	20819	7979	7415
18153	2021	899327000	20781	7869	7535
18153	2022	891580000	20670	7931	7625
18155	2020	377846000	9742	4815	4419
18155	2021	409036000	9849	4684	4508
18155	2022	416314000	10006	4716	4582
18157	2020	7925549000	186369	91931	85829
18157	2021	8674110000	187566	93872	90443
18157	2022	8944819000	188717	96898	94095
18159	2020	753206000	15386	9041	8473
18159	2021	794603000	15393	8993	8694
18159	2022	794208000	15361	8981	8722
18161	2020	310755000	7081	3475	3279
18161	2021	341707000	7014	3492	3401
18161	2022	338309000	6952	3567	3478
18163	2020	9129768000	180331	92325	85615
18163	2021	9984843000	180267	91878	88204
18163	2022	10170757000	179744	91922	89072
18165	2020	653622000	15409	6610	6104
18165	2021	708079000	15440	6511	6221
18165	2022	707244000	15451	6534	6291
18167	2020	4478176000	106119	46297	42592
18167	2021	4857881000	106084	45673	43521
18167	2022	4873618000	106006	45594	43935
18169	2020	1431155000	30936	14495	13592
18169	2021	1597982000	30897	14426	13956
18169	2022	1603245000	30828	14524	14120
18171	2020	408357000	8424	3969	3748
18171	2021	447784000	8459	3992	3878
18171	2022	452071000	8461	4102	3995
18173	2020	3944989000	63996	31868	30104
18173	2021	4287949000	64623	31989	31066
18173	2022	4449808000	65185	32210	31359
18175	2020	1208991000	28242	13581	12621
18175	2021	1345974000	28151	13570	13102
18175	2022	1400966000	28224	13746	13374
18177	2020	3012187000	66513	30178	28099
18177	2021	3263001000	66490	29614	28447
18177	2022	3285178000	66273	29783	28843
18179	2020	1295200000	28167	13893	13072
18179	2021	1432834000	28177	13890	13493
18179	2022	1454800000	28335	14240	13905
18181	2020	1165404000	24668	13188	12504
18181	2021	1282707000	24662	13148	12760
18181	2022	1294657000	24598	13273	12934
18183	2020	1708073000	34338	17299	16249
18183	2021	1857664000	34492	17304	16789
18183	2022	1911166000	34627	17738	17301
19001	2020	401259000	7494	4204	4042
19001	2021	488333000	7538	4300	4177
19001	2022	507103000	7494	4317	4223
19003	2020	194366000	3710	2040	1964
19003	2021	234343000	3642	2044	1989
19003	2022	244311000	3611	2101	2058
19005	2020	684221000	14068	7039	6689
19005	2021	747795000	13968	7049	6756
19005	2022	768013000	13960	7092	6818
19007	2020	525619000	12285	5885	5577
19007	2021	576515000	12266	5972	5739
19007	2022	577838000	12094	5973	5795
19009	2020	291378000	5681	3000	2899
19009	2021	365739000	5665	3051	2963
19009	2022	386851000	5598	3085	3014
19011	2020	1422891000	25534	12808	12169
19011	2021	1630582000	25719	12933	12410
19011	2022	1785113000	25711	13104	12698
19013	2020	6453677000	131034	67261	63188
19013	2021	6847762000	130606	67169	64359
19013	2022	6965825000	130274	67499	65462
19015	2020	1325357000	26700	14458	13882
19015	2021	1433049000	26776	14612	14148
19015	2022	1438527000	26609	14840	14494
19017	2020	1321464000	25003	13669	13146
19017	2021	1447881000	25122	13795	13388
19017	2022	1503963000	25259	13930	13598
19019	2020	1050017000	20606	11115	10617
19019	2021	1192733000	20697	11212	10832
19019	2022	1244022000	20714	11250	10927
19021	2020	921706000	20809	11641	11222
19021	2021	1023166000	20767	11573	11235
19021	2022	1119428000	20600	11905	11621
19023	2020	693994000	14332	7676	7326
19023	2021	823384000	14362	7884	7614
19023	2022	857359000	14269	8189	7954
19025	2020	485679000	9882	4068	3905
19025	2021	588417000	9884	4084	3937
19025	2022	625123000	9725	4147	4038
19027	2020	1128741000	20721	10523	10114
19027	2021	1255429000	20752	10587	10288
19027	2022	1331815000	20567	10700	10482
19029	2020	651822000	13118	6745	6488
19029	2021	740764000	13065	6776	6548
19029	2022	773968000	13104	6826	6651
19031	2020	1026633000	18491	10381	9937
19031	2021	1155897000	18444	10382	10025
19031	2022	1201891000	18399	10483	10196
19033	2020	2251509000	43023	23068	21888
19033	2021	2622857000	42761	22536	21651
19033	2022	2874347000	42409	22259	21620
19035	2020	632271000	11663	6183	5953
19035	2021	781329000	11532	6142	5952
19035	2022	956526000	11491	6112	5968
19037	2020	676585000	11990	6274	5987
19037	2021	869387000	11899	6395	6186
19037	2022	1044891000	11716	6545	6375
19039	2020	416575000	9726	4765	4513
19039	2021	446437000	9756	4909	4718
19039	2022	468275000	9692	4958	4809
19041	2020	875578000	16335	8368	7999
19041	2021	975367000	16428	8502	8217
19041	2022	1021016000	16475	8538	8301
19043	2020	923167000	17030	9657	9119
19043	2021	1034767000	17047	9642	9193
19043	2022	1098576000	17027	9546	9171
19045	2020	2200713000	46432	22002	20548
19045	2021	2394872000	46526	21947	20886
19045	2022	2439029000	46344	22148	21352
19047	2020	731781000	16490	7923	7515
19047	2021	860812000	16243	7808	7438
19047	2022	882106000	16123	7793	7467
19049	2020	7111800000	100473	50683	48911
19049	2021	7993870000	104069	52067	50687
19049	2022	8634580000	108016	53951	52836
19051	2020	366363000	9112	4114	3952
19051	2021	419754000	9146	4184	4056
19051	2022	472043000	9130	4289	4182
19053	2020	296623000	7605	4197	4039
19053	2021	332782000	7660	4286	4154
19053	2022	342139000	7683	4376	4268
19055	2020	906895000	17456	10383	9979
19055	2021	1014153000	17531	10422	10105
19055	2022	1070746000	17568	10491	10242
19057	2020	2090958000	38816	18574	17216
19057	2021	2257358000	38507	18440	17380
19057	2022	2321193000	38293	18370	17583
19059	2020	1112517000	17766	9771	9283
19059	2021	1272619000	17852	10190	9825
19059	2022	1336943000	18028	10739	10433
19061	2020	5243002000	99291	55031	51877
19061	2021	5733915000	98815	55164	52947
19061	2022	5929463000	98677	56127	54482
19063	2020	416674000	9335	5033	4788
19063	2021	478922000	9318	4932	4749
19063	2022	496592000	9176	4907	4762
19065	2020	891618000	19445	10237	9688
19065	2021	978283000	19309	10191	9754
19065	2022	1016144000	19294	10448	10113
19067	2020	759162000	15590	8230	7744
19067	2021	868330000	15449	8232	7909
19067	2022	908602000	15337	8310	8059
19069	2020	489368000	9997	5582	5375
19069	2021	613010000	9952	5644	5452
19069	2022	644545000	9916	5599	5452
19071	2020	348756000	6567	3693	3581
19071	2021	403158000	6575	3733	3634
19071	2022	404208000	6464	3717	3625
19073	2020	445741000	8752	5306	5084
19073	2021	523891000	8733	5347	5179
19073	2022	540269000	8741	5377	5262
19075	2020	670451000	12334	6285	6016
19075	2021	774987000	12371	6337	6125
19075	2022	805622000	12356	6371	6206
19077	2020	612655000	10613	5387	5123
19077	2021	691423000	10586	5505	5292
19077	2022	724175000	10647	5639	5476
19079	2020	743014000	15008	6771	6478
19079	2021	874321000	14883	6819	6555
19079	2022	942440000	14820	6950	6752
19081	2020	548180000	10757	5749	5486
19081	2021	658888000	10685	5734	5535
19081	2022	711644000	10685	5728	5592
19083	2020	820225000	16820	7769	7417
19083	2021	1022919000	16719	7809	7512
19083	2022	1142814000	16567	7819	7580
19085	2020	706499000	14564	6967	6687
19085	2021	821155000	14683	7046	6795
19085	2022	854318000	14658	7114	6918
19087	2020	922657000	20451	9452	8959
19087	2021	1006013000	20390	9498	9134
19087	2022	1011973000	20196	9593	9309
19089	2020	467510000	9492	5094	4872
19089	2021	568831000	9500	5134	4954
19089	2022	602024000	9533	5242	5074
19091	2020	480358000	9595	4933	4729
19091	2021	551038000	9637	4956	4799
19091	2022	579710000	9572	4927	4803
19093	2020	381784000	7019	3974	3835
19093	2021	479733000	6974	3978	3863
19093	2022	530218000	6888	3972	3881
19095	2020	913193000	16654	10053	9618
19095	2021	990038000	16574	9954	9608
19095	2022	999150000	16475	9787	9535
19097	2020	949642000	19452	10582	9949
19097	2021	1046925000	19397	10614	10132
19097	2022	1073188000	19324	10673	10321
19099	2020	1720835000	37810	19168	18167
19099	2021	1901168000	37874	19194	18437
19099	2022	1916650000	37938	18561	17983
19101	2020	762150000	15693	9787	9257
19101	2021	841378000	15762	9954	9578
19101	2022	863056000	15698	10365	10109
19103	2020	8636861000	153042	84503	80507
19103	2021	9445679000	155016	84706	81824
19103	2022	9745262000	156420	86408	84386
19105	2020	979406000	20653	10218	9647
19105	2021	1091048000	20839	10250	9834
19105	2022	1117060000	20848	10385	10044
19107	2020	479766000	10012	5140	4891
19107	2021	541180000	9924	5197	4988
19107	2022	548002000	9904	5192	5031
19109	2020	755056000	14794	8099	7798
19109	2021	917913000	14524	8160	7917
19109	2022	962831000	14475	8289	8093
19111	2020	1556266000	33520	15629	14622
19111	2021	1640881000	33208	15299	14471
19111	2022	1639615000	32840	14890	14193
19113	2020	12746463000	230411	119332	111888
19113	2021	13695124000	229458	119547	114116
19113	2022	13954488000	229033	120784	116971
19115	2020	504393000	10821	5936	5649
19115	2021	554343000	10747	5881	5650
19115	2022	565162000	10677	5901	5713
19117	2020	384750000	8620	4606	4441
19117	2021	420536000	8696	4607	4475
19117	2022	428276000	8689	4630	4527
19119	2020	674872000	11927	6830	6662
19119	2021	790319000	12061	6972	6825
19119	2022	874515000	12179	7078	6946
19121	2020	878674000	16628	8350	7881
19121	2021	962239000	16789	8510	8160
19121	2022	993855000	17036	8767	8486
19123	2020	1003676000	22147	11832	11278
19123	2021	1099114000	21944	12010	11605
19123	2022	1126076000	21946	12327	12020
19125	2020	1763057000	33408	17929	17189
19125	2021	1937298000	33444	18571	18038
19125	2022	2008914000	33642	19129	18720
19127	2020	1817459000	40093	17508	16294
19127	2021	1951003000	39899	17332	16321
19127	2022	1944324000	39879	17356	16420
19129	2020	883956000	14399	6954	6680
19129	2021	972373000	14464	7013	6789
19129	2022	1030831000	14553	7091	6922
19131	2020	607915000	10588	6047	5845
19131	2021	795506000	10563	5828	5667
19131	2022	1011860000	10532	5858	5733
19133	2020	413280000	8746	4364	4161
19133	2021	491858000	8595	4418	4242
19133	2022	513297000	8486	4432	4302
19135	2020	374982000	7597	3943	3742
19135	2021	408466000	7595	3955	3806
19135	2022	414852000	7550	4067	3951
19137	2020	451094000	10330	4849	4627
19137	2021	504257000	10325	4884	4700
19137	2022	513754000	10205	4995	4869
19139	2020	2178545000	43141	21277	20042
19139	2021	2282520000	42688	20853	19957
19139	2022	2300932000	42377	20985	20341
19141	2020	764552000	14154	8083	7816
19141	2021	854431000	14062	8105	7881
19141	2022	913447000	14060	8152	7971
19143	2020	294431000	6202	3497	3398
19143	2021	353525000	6163	3532	3454
19143	2022	394785000	6036	3610	3544
19145	2020	691004000	15196	6188	5884
19145	2021	796653000	15215	6317	6080
19145	2022	806133000	15143	6459	6296
19147	2020	427314000	8989	4545	4340
19147	2021	517039000	8909	4518	4380
19147	2022	570359000	8764	4512	4395
19149	2020	1452613000	25689	14310	13804
19149	2021	1620696000	25714	14494	14093
19149	2022	1730842000	25681	14787	14468
19151	2020	337782000	7067	4207	4062
19151	2021	416669000	7057	4225	4107
19151	2022	447653000	7053	4233	4139
19153	2020	28240630000	492997	264046	248404
19153	2021	30809824000	497675	268498	257537
19153	2022	31394821000	501089	276399	268724
19155	2020	4454964000	93670	47020	44576
19155	2021	4800483000	93434	47134	45301
19155	2022	4879388000	93173	47609	46252
19157	2020	884253000	18628	9751	9280
19157	2021	986753000	18603	10006	9599
19157	2022	1038364000	18467	10239	9949
19159	2020	230448000	4642	2369	2279
19159	2021	267801000	4626	2395	2321
19159	2022	267800000	4670	2365	2310
19161	2020	532738000	9794	5162	4983
19161	2021	657213000	9745	5218	5060
19161	2022	753850000	9673	5277	5145
19163	2020	9899085000	174596	86696	80925
19163	2021	10697219000	174278	87108	82818
19163	2022	10968288000	173924	88315	85390
19165	2020	617566000	11723	6336	6112
19165	2021	742588000	11773	6362	6175
19165	2022	774884000	11645	6441	6293
19167	2020	1953931000	35887	21131	20584
19167	2021	2130142000	35991	21896	21413
19167	2022	2427942000	36050	22783	22353
19169	2020	4423033000	98645	56620	54611
19169	2021	4825898000	99666	57416	55849
19169	2022	4958542000	99673	59305	58067
19171	2020	834842000	17077	9215	8752
19171	2021	960413000	16874	9137	8748
19171	2022	978981000	16903	9181	8872
19173	2020	268438000	5865	3068	2958
19173	2021	326712000	5873	3109	3019
19173	2022	337367000	5858	3137	3073
19175	2020	526856000	12132	6153	5800
19175	2021	591916000	12036	6057	5810
19175	2022	594749000	11887	6067	5895
19177	2020	296775000	7217	3664	3499
19177	2021	342479000	7261	3643	3516
19177	2022	348256000	7256	3706	3599
19179	2020	1501128000	35330	17316	16299
19179	2021	1595141000	35283	16911	16143
19179	2022	1604810000	35043	16876	16311
19181	2020	2870242000	52588	27696	26458
19181	2021	3176942000	53487	28386	27417
19181	2022	3287573000	54327	29315	28579
19183	2020	1322067000	22540	11388	10929
19183	2021	1604354000	22494	11496	11103
19183	2022	1781497000	22571	11710	11398
19185	2020	288603000	6504	2786	2664
19185	2021	340888000	6511	2828	2735
19185	2022	343753000	6467	2915	2838
19187	2020	1722390000	36985	18622	17662
19187	2021	1911213000	37178	18555	17775
19187	2022	1959778000	36626	18741	18162
19189	2020	468059000	10662	5036	4720
19189	2021	548486000	10664	4978	4787
19189	2022	584073000	10617	5011	4872
19191	2020	1086417000	20037	11108	10576
19191	2021	1178441000	19915	11400	10968
19191	2022	1219250000	19974	11453	11086
19193	2020	4892678000	105904	54453	51635
19193	2021	5271919000	105816	54915	52763
19193	2022	5392308000	105671	55989	54405
19195	2020	332080000	7435	4082	3866
19195	2021	395971000	7380	4010	3855
19195	2022	405607000	7319	3999	3889
19197	2020	607875000	12915	6960	6689
19197	2021	741796000	12811	6668	6412
19197	2022	892998000	12681	6564	6390
20001	2020	557713000	12532	6430	6086
20001	2021	605841000	12526	6486	6280
20001	2022	587764000	12579	6306	6127
20003	2020	351233000	7843	4304	4130
20003	2021	425599000	7800	4632	4512
20003	2022	366989000	7776	4358	4260
20005	2020	684515000	16318	6889	6426
20005	2021	724379000	16257	6771	6505
20005	2022	691194000	16108	6789	6555
20007	2020	209169000	4203	2323	2249
20007	2021	222693000	4099	2302	2256
20007	2022	208239000	4122	2281	2235
20009	2020	1290658000	25419	13708	13084
20009	2021	1339513000	25239	13328	12925
20009	2022	1386180000	25080	13116	12775
20011	2020	647416000	14333	6727	6344
20011	2021	692540000	14336	6493	6243
20011	2022	721018000	14493	6255	6039
20013	2020	461057000	9482	5163	4937
20013	2021	489633000	9453	5133	4990
20013	2022	442031000	9364	5059	4941
20015	2020	3374412000	67390	32562	30435
20015	2021	3550635000	67958	32514	31338
20015	2022	3659856000	68240	32661	31763
20017	2020	148453000	2574	1459	1380
20017	2021	157175000	2598	1377	1343
20017	2022	151218000	2548	1396	1366
20019	2020	140216000	3385	1488	1397
20019	2021	148755000	3391	1463	1403
20019	2022	142956000	3415	1424	1384
20021	2020	911750000	19297	10027	9507
20021	2021	985455000	19208	9894	9593
20021	2022	1001442000	19088	9905	9650
20023	2020	145618000	2615	1307	1279
20023	2021	174987000	2624	1294	1269
20023	2022	140851000	2583	1259	1229
20025	2020	113284000	1974	1141	1118
20025	2021	109373000	1958	1131	1110
20025	2022	112375000	1933	1109	1088
20027	2020	383570000	8122	3827	3658
20027	2021	421758000	8091	3782	3681
20027	2022	382182000	8043	3735	3639
20029	2020	399844000	9008	3861	3705
20029	2021	425886000	8954	3893	3780
20029	2022	398416000	8946	3810	3709
20031	2020	477366000	8356	3954	3752
20031	2021	496594000	8343	3972	3839
20031	2022	460556000	8280	3792	3663
20033	2020	77474000	1680	870	841
20033	2021	83602000	1660	895	875
20033	2022	72955000	1681	868	849
20035	2020	1448931000	34524	16868	15774
20035	2021	1506778000	34652	16673	16081
20035	2022	1504368000	34453	16415	15935
20037	2020	1677091000	38951	19033	17991
20037	2021	1764393000	39033	18898	18276
20037	2022	1771794000	39078	19116	18569
20039	2020	149403000	2765	1231	1187
20039	2021	160192000	2764	1205	1173
20039	2022	163308000	2689	1189	1156
20041	2020	847962000	18368	8913	8489
20041	2021	911382000	18483	9051	8772
20041	2022	873520000	18430	8669	8431
20043	2020	347184000	7463	4157	3967
20043	2021	381418000	7442	4089	3971
20043	2022	350551000	7440	4023	3921
20045	2020	5781592000	118777	64306	60493
20045	2021	6195233000	119480	64691	62591
20045	2022	6334017000	119964	65477	63789
20047	2020	175053000	2883	1466	1423
20047	2021	194469000	2800	1460	1428
20047	2022	160329000	2739	1390	1359
20049	2020	101145000	2474	1173	1116
20049	2021	105006000	2431	1156	1121
20049	2022	97178000	2441	1176	1145
20051	2020	1474369000	28943	17117	16543
20051	2021	1572392000	28897	17151	16803
20051	2022	1621173000	28941	17065	16733
20053	2020	285740000	6369	2717	2633
20053	2021	304810000	6320	2682	2619
20053	2022	290387000	6355	2630	2570
20055	2020	1725146000	38302	20655	19974
20055	2021	1839724000	38066	20306	19858
20055	2022	1869130000	37650	20521	20102
20057	2020	1516250000	34208	17341	16773
20057	2021	1606870000	34121	17654	17260
20057	2022	1596931000	33848	17849	17482
20059	2020	1199050000	26008	14294	13531
20059	2021	1281376000	26021	14539	14072
20059	2022	1257354000	25992	14824	14465
20061	2020	1759108000	36751	11702	10885
20061	2021	1832634000	36112	11418	10916
20061	2022	1796125000	35691	11342	10921
20063	2020	174893000	2707	1467	1429
20063	2021	221322000	2735	1458	1429
20063	2022	198325000	2717	1370	1341
20065	2020	131465000	2408	1140	1089
20065	2021	147955000	2408	1134	1100
20065	2022	123848000	2411	1191	1164
20067	2020	326435000	7326	3113	2988
20067	2021	334370000	7318	2952	2858
20067	2022	292800000	7197	2806	2726
20069	2020	375433000	5646	3250	3180
20069	2021	376467000	5672	3222	3164
20069	2022	377624000	5729	3174	3113
20071	2020	110595000	1274	822	808
20071	2021	129239000	1280	825	814
20071	2022	107805000	1223	789	777
20073	2020	276343000	5965	3120	2957
20073	2021	283122000	5922	3032	2944
20073	2022	254727000	5939	3040	2968
20075	2020	188568000	2489	1622	1596
20075	2021	179817000	2468	1629	1606
20075	2022	193141000	2430	1630	1603
20077	2020	307989000	5465	2797	2675
20077	2021	322529000	5329	2762	2687
20077	2022	310366000	5323	2782	2724
20079	2020	1613477000	33998	16855	15965
20079	2021	1702085000	33827	16948	16433
20079	2022	1716155000	33801	17066	16638
20081	2020	248551000	3759	2251	2200
20081	2021	269530000	3646	2228	2186
20081	2022	212136000	3576	2167	2126
20083	2020	113457000	1739	1020	994
20083	2021	117595000	1750	1033	1014
20083	2022	109152000	1755	1021	1000
20085	2020	619918000	13241	7270	6884
20085	2021	668732000	13270	7269	7073
20085	2022	653062000	13286	7280	7111
20087	2020	918083000	18320	10286	9794
20087	2021	989988000	18419	10379	10060
20087	2022	982500000	18344	10373	10098
20089	2020	162389000	2936	1255	1218
20089	2021	183914000	2946	1235	1206
20089	2022	135319000	2898	1194	1164
20091	2020	48330559000	611101	343296	326064
20091	2021	51037119000	614848	345165	335576
20091	2022	56039311000	619195	349354	341423
20093	2020	231691000	3961	2034	1983
20093	2021	241702000	3892	2040	2005
20093	2022	213528000	3855	2004	1966
20095	2020	362753000	7412	3266	3094
20095	2021	387192000	7280	3276	3173
20095	2022	358107000	7193	3267	3188
20097	2020	125970000	2452	1251	1212
20097	2021	134109000	2408	1229	1203
20097	2022	105008000	2404	1207	1181
20099	2020	919203000	20165	9701	9158
20099	2021	952147000	19929	9423	9090
20099	2022	944695000	19757	9441	9157
20101	2020	115484000	1569	759	737
20101	2021	125314000	1572	747	731
20101	2022	110586000	1556	725	704
20103	2020	3845598000	81953	36823	34703
20103	2021	4067522000	82322	36978	35712
20103	2022	4144804000	82892	37437	36362
20105	2020	155373000	2948	1742	1692
20105	2021	152937000	2907	1687	1649
20105	2022	136899000	2899	1683	1644
20107	2020	435319000	9586	4354	4044
20107	2021	462715000	9730	4346	4154
20107	2022	448178000	9796	4370	4201
20109	2020	163142000	2743	1615	1577
20109	2021	180112000	2710	1618	1591
20109	2022	161932000	2705	1624	1595
20111	2020	1418358000	32107	16696	15925
20111	2021	1499259000	31987	16930	16429
20111	2022	1492489000	31898	17072	16647
20113	2020	1657220000	30180	17244	16662
20113	2021	1732882000	30137	17175	16797
20113	2022	1727414000	30012	17407	17078
20115	2020	545853000	11778	5979	5740
20115	2021	572051000	11756	5999	5849
20115	2022	534082000	11868	5978	5835
20117	2020	477231000	10026	5507	5342
20117	2021	504738000	10010	5422	5312
20117	2022	454312000	9982	5330	5226
20119	2020	273611000	4054	2159	2100
20119	2021	305629000	3989	2176	2127
20119	2022	270003000	3897	2123	2083
20121	2020	1854984000	34232	17661	16787
20121	2021	2022497000	34665	17812	17273
20121	2022	2064878000	34867	18029	17574
20123	2020	399144000	5772	3442	3352
20123	2021	394298000	5757	3429	3358
20123	2022	364168000	5738	3358	3293
20125	2020	1268060000	31393	14946	13855
20125	2021	1353306000	31202	14701	14108
20125	2022	1361109000	30996	14585	14141
20127	2020	268884000	5367	3092	2971
20127	2021	279767000	5362	3075	3000
20127	2022	265455000	5349	3007	2938
20129	2020	131398000	2697	1134	1100
20129	2021	150972000	2669	1135	1105
20129	2022	106218000	2599	1130	1101
20131	2020	599131000	10265	5606	5450
20131	2021	627552000	10216	5567	5464
20131	2022	597310000	10115	5625	5523
20133	2020	695998000	15905	6252	5856
20133	2021	730092000	15779	6108	5840
20133	2022	709861000	15606	6070	5855
20135	2020	162501000	2667	1354	1309
20135	2021	180304000	2651	1315	1285
20135	2022	161329000	2645	1324	1296
20137	2020	265234000	5453	2656	2588
20137	2021	284654000	5369	2664	2615
20137	2022	274763000	5301	2613	2564
20139	2020	738444000	15746	7991	7586
20139	2021	786466000	15746	8038	7791
20139	2022	760480000	15654	8025	7803
20141	2020	179943000	3497	1982	1928
20141	2021	198250000	3485	1965	1927
20141	2022	171970000	3490	1899	1860
20143	2020	265142000	5728	2986	2864
20143	2021	298666000	5834	2965	2879
20143	2022	283619000	5795	3009	2934
20145	2020	286059000	6261	2864	2761
20145	2021	307677000	6246	2824	2758
20145	2022	271602000	6179	2712	2648
20147	2020	287513000	4977	2654	2567
20147	2021	321803000	4845	2634	2575
20147	2022	290881000	4809	2644	2585
20149	2020	1445352000	25411	12192	11688
20149	2021	1561494000	25860	12276	11955
20149	2022	1622038000	26273	12484	12186
20151	2020	476670000	9148	4945	4770
20151	2021	522267000	9180	4895	4781
20151	2022	482906000	9067	4888	4785
20153	2020	170649000	2565	1551	1512
20153	2021	203641000	2559	1622	1596
20153	2022	193282000	2528	1530	1502
20155	2020	2816376000	61887	29892	28277
20155	2021	2920660000	61510	29673	28690
20155	2022	2935983000	61516	29161	28347
20157	2020	225233000	4677	2325	2250
20157	2021	247392000	4682	2354	2298
20157	2022	214874000	4642	2385	2335
20159	2020	447206000	9385	5107	4897
20159	2021	466771000	9406	5291	5157
20159	2022	455320000	9407	5444	5322
20161	2020	3286694000	72013	33725	32091
20161	2021	3509887000	71849	33832	32848
20161	2022	3573936000	71108	34527	33610
20163	2020	225316000	4895	2514	2416
20163	2021	241808000	4870	2449	2387
20163	2022	207537000	4813	2407	2346
20165	2020	169420000	2938	1580	1508
20165	2021	184845000	2925	1582	1543
20165	2022	152027000	2927	1616	1581
20167	2020	334394000	6670	3323	3187
20167	2021	364549000	6677	3345	3260
20167	2022	350762000	6639	3295	3221
20169	2020	2778394000	54253	29640	28040
20169	2021	2968227000	53899	29423	28512
20169	2022	3054904000	53596	30133	29412
20171	2020	308109000	5138	2837	2769
20171	2021	321593000	5121	2835	2789
20171	2022	307684000	5014	2740	2690
20173	2020	27864880000	524786	259084	236433
20173	2021	30082214000	524481	255502	243576
20173	2022	31411750000	525525	255008	247091
20175	2020	922013000	21854	9846	9434
20175	2021	994827000	21747	9884	9598
20175	2022	1012698000	21358	9805	9558
20177	2020	9026141000	178698	91572	86272
20177	2021	9601458000	178367	91670	88732
20177	2022	9844071000	177480	91821	89329
20179	2020	139836000	2451	1472	1438
20179	2021	142630000	2452	1462	1434
20179	2022	137344000	2425	1448	1421
20181	2020	292114000	5895	2883	2789
20181	2021	325292000	5911	2859	2784
20181	2022	301049000	5830	2784	2721
20183	2020	198651000	3552	2000	1948
20183	2021	228308000	3555	2007	1970
20183	2022	191564000	3533	1960	1921
20185	2020	201756000	4055	2032	1959
20185	2021	207651000	4008	1967	1921
20185	2022	190325000	3993	1921	1876
20187	2020	175295000	2083	1081	1057
20187	2021	185553000	2041	1097	1075
20187	2022	152800000	1963	1088	1067
20189	2020	262431000	5246	2816	2740
20189	2021	290849000	5299	2872	2809
20189	2022	262351000	5175	2949	2892
20191	2020	980055000	22342	10907	10015
20191	2021	1060608000	22386	10754	10301
20191	2022	1021966000	22473	10742	10425
20193	2020	396412000	7933	4253	4137
20193	2021	438556000	7942	4249	4166
20193	2022	431531000	7893	4234	4154
20195	2020	157361000	2805	1454	1405
20195	2021	169934000	2792	1422	1390
20195	2022	147802000	2752	1364	1331
20197	2020	370387000	6885	3693	3543
20197	2021	396379000	6969	3728	3633
20197	2022	392158000	7019	3733	3642
20199	2020	91211000	1517	840	823
20199	2021	96274000	1514	887	871
20199	2022	78957000	1488	850	833
20201	2020	292430000	5532	3077	3005
20201	2021	306511000	5526	3068	3013
20201	2022	258820000	5501	3002	2944
20203	2020	129389000	2149	1248	1224
20203	2021	122434000	2081	1176	1153
20203	2022	112875000	2064	1120	1098
20205	2020	386201000	8576	3926	3622
20205	2021	420037000	8537	3820	3662
20205	2022	408806000	8622	3729	3613
20207	2020	132378000	3091	1570	1476
20207	2021	141083000	3076	1525	1470
20207	2022	122007000	3109	1523	1470
20209	2020	6112730000	168904	78124	71985
20209	2021	6417759000	167290	77820	74089
20209	2022	6340203000	165746	78170	75480
21001	2020	709273000	18880	6979	6488
21001	2021	779780000	18953	7172	6831
21001	2022	773154000	19067	7139	6802
21003	2020	765367000	20573	8613	8146
21003	2021	843290000	20828	8787	8445
21003	2022	870042000	21275	8878	8522
21005	2020	992327000	23870	11696	11001
21005	2021	1091234000	24043	11746	11297
21005	2022	1103802000	24224	11905	11517
21007	2020	342968000	7712	3305	3093
21007	2021	382833000	7690	3398	3234
21007	2022	380848000	7650	3464	3291
21009	2020	1782871000	44502	17969	16643
21009	2021	1942469000	44599	17720	16821
21009	2022	1918830000	44854	17796	17047
21011	2020	437913000	12716	4511	4145
21011	2021	483441000	12774	4592	4341
21011	2022	476815000	12829	4701	4450
21013	2020	886913000	23984	8136	7517
21013	2021	963762000	23765	8084	7641
21013	2022	934836000	23568	8074	7653
21015	2020	7305348000	136465	70172	66475
21015	2021	7927896000	137760	70755	68210
21015	2022	8168867000	139093	71775	69447
21017	2020	1021332000	20290	9511	8966
21017	2021	1135895000	20218	9560	9204
21017	2022	1149144000	20093	9546	9202
21019	2020	2060759000	48197	17365	15948
21019	2021	2206929000	47767	16989	15989
21019	2022	2210415000	48110	17134	16232
21021	2020	1297036000	30753	12489	11597
21021	2021	1391140000	30649	12513	11917
21021	2022	1399390000	30904	12664	12150
21023	2020	351214000	8402	3693	3469
21023	2021	376483000	8446	3733	3566
21023	2022	369156000	8452	3768	3603
21025	2020	478466000	13694	3233	2909
21025	2021	526070000	13527	3207	2947
21025	2022	511685000	13351	3180	2940
21027	2020	780003000	20443	7773	7220
21027	2021	877101000	20652	7939	7546
21027	2022	869526000	20943	7896	7523
21029	2020	3818899000	82355	41908	39294
21029	2021	4191222000	83076	42250	40357
21029	2022	4292245000	83836	42782	40998
21031	2020	482957000	12318	4830	4498
21031	2021	540131000	12279	4888	4671
21031	2022	529889000	12295	4947	4738
21033	2020	508958000	12634	5551	5218
21033	2021	571022000	12644	5875	5638
21033	2022	561386000	12570	5974	5762
21035	2020	1561216000	37145	17671	16599
21035	2021	1682179000	37489	17358	16607
21035	2022	1657525000	37685	17340	16633
21037	2020	5071530000	93129	49276	46611
21037	2021	5587120000	92856	49751	47841
21037	2022	5750551000	93300	50439	48704
21039	2020	221650000	4806	2149	2051
21039	2021	257305000	4760	2243	2160
21039	2022	253742000	4720	2248	2162
21041	2020	444778000	10836	5261	4958
21041	2021	491616000	10884	5337	5129
21041	2022	507411000	10938	5629	5445
21043	2020	952044000	26607	9470	8579
21043	2021	1034999000	26432	9506	8812
21043	2022	1015485000	26395	9617	8919
21045	2020	582189000	15924	6616	6214
21045	2021	640848000	15951	6686	6421
21045	2022	629984000	15920	6623	6365
21047	2020	2977257000	72768	24321	22426
21047	2021	3275064000	73221	24372	23017
21047	2022	3131878000	73037	24674	23451
21049	2020	1616786000	37037	16861	15784
21049	2021	1765683000	36925	16881	16171
21049	2022	1762708000	37061	17156	16527
21051	2020	704917000	20310	5139	4711
21051	2021	781562000	20184	5108	4780
21051	2022	756537000	19913	5034	4742
21053	2020	369313000	9232	3927	3732
21053	2021	403318000	9288	3908	3740
21053	2022	397825000	9123	3611	3432
21055	2020	345905000	9002	3652	3454
21055	2021	380050000	8939	3770	3613
21055	2022	373304000	8981	3800	3638
21057	2020	275635000	5860	3235	3081
21057	2021	296183000	5892	3263	3152
21057	2022	294319000	5946	3362	3252
21059	2020	4792290000	103391	45588	42883
21059	2021	5135546000	103140	45723	43841
21059	2022	5076400000	103222	45401	43578
21061	2020	453956000	12153	4564	4220
21061	2021	493042000	12213	4601	4374
21061	2022	488426000	12269	4695	4461
21063	2020	197473000	7333	1940	1750
21063	2021	210661000	7375	1861	1714
21063	2022	199853000	7293	1875	1719
21065	2020	519229000	14161	5109	4731
21065	2021	559813000	14090	5049	4800
21065	2022	547708000	14044	5148	4890
21067	2020	17937674000	322613	170797	161205
21067	2021	18769963000	320473	171431	165047
21067	2022	19105723000	320347	174535	168997
21069	2020	582069000	15098	6073	5638
21069	2021	627983000	15268	6007	5726
21069	2022	617296000	15288	5993	5718
21071	2020	1403131000	35804	10584	9644
21071	2021	1523539000	35300	10664	9956
21071	2022	1519284000	34978	10824	10175
21073	2020	2366180000	51589	24586	23017
21073	2021	2554794000	51683	24673	23641
21073	2022	2553065000	51607	24961	24096
21075	2020	230492000	6512	1973	1845
21075	2021	270025000	6513	2058	1954
21075	2022	261853000	6382	2108	2011
21077	2020	337136000	8672	3927	3696
21077	2021	378028000	8766	3960	3796
21077	2022	376966000	8763	3986	3838
21079	2020	694193000	16965	7472	7012
21079	2021	756395000	17385	7539	7216
21079	2022	766028000	17589	7806	7497
21081	2020	1041554000	25014	11527	10731
21081	2021	1158920000	25302	11511	11019
21081	2022	1161629000	25502	11639	11185
21083	2020	1571794000	36527	15468	14574
21083	2021	1777647000	36634	15707	15040
21083	2022	1827643000	36412	15417	14695
21085	2020	1032271000	26454	10582	9777
21085	2021	1117962000	26582	10377	9825
21085	2022	1107384000	26631	10366	9878
21087	2020	447444000	11130	5116	4847
21087	2021	477671000	11308	5097	4915
21087	2022	462414000	11365	5052	4861
21089	2020	1585720000	35887	13072	11932
21089	2021	1689693000	35682	12803	11965
21089	2022	1685995000	35403	12901	12132
21091	2020	373272000	9105	3790	3564
21091	2021	449973000	9083	3801	3643
21091	2022	486710000	9021	3787	3621
21093	2020	5321930000	110816	47386	44082
21093	2021	5857855000	111766	46527	44413
21093	2022	5897842000	111862	46808	44821
21095	2020	912858000	26752	6472	5727
21095	2021	994916000	26177	6367	5860
21095	2022	967772000	25662	6306	5897
21097	2020	777523000	18718	8622	8103
21097	2021	824376000	18964	8667	8347
21097	2022	813501000	19103	8766	8470
21099	2020	714543000	19289	7595	7111
21099	2021	783271000	19485	7586	7267
21099	2022	777402000	19600	7608	7299
21101	2020	2011818000	44668	20542	19301
21101	2021	2202861000	44417	20505	19629
21101	2022	2154053000	44046	20479	19676
21103	2020	706145000	15697	7975	7524
21103	2021	775785000	15704	8050	7739
21103	2022	780935000	15771	8089	7790
21105	2020	189376000	4530	1707	1619
21105	2021	237871000	4430	1709	1637
21105	2022	249873000	4422	1653	1580
21107	2020	1914132000	45366	17918	16619
21107	2021	2094859000	45096	17868	16993
21107	2022	2098803000	44812	18224	17409
21109	2020	455609000	12962	4015	3677
21109	2021	486397000	12987	4029	3788
21109	2022	477073000	12973	4114	3875
21111	2020	44075731000	782783	387214	361264
21111	2021	49066095000	777378	388934	371132
21111	2022	49555898000	773399	392345	377003
21113	2020	2744427000	53016	25780	24363
21113	2021	3058993000	53609	25952	24960
21113	2022	3156340000	54254	26424	25540
21115	2020	817450000	22644	6546	5996
21115	2021	887787000	22539	6548	6097
21115	2022	873167000	22244	6584	6183
21117	2020	10368680000	169246	85512	80682
21117	2021	11597451000	169734	86198	82788
21117	2022	11836384000	170313	87314	84312
21119	2020	520580000	14163	4263	3909
21119	2021	576423000	14033	4229	3944
21119	2022	565272000	13874	4228	3963
21121	2020	1055285000	30183	9819	9030
21121	2021	1153476000	30019	9827	9245
21121	2022	1108105000	29791	9868	9329
21123	2020	603411000	14877	5808	5397
21123	2021	654856000	15024	5731	5462
21123	2022	643576000	15163	5730	5469
21125	2020	2343075000	62728	24775	23096
21125	2021	2572544000	62592	24718	23644
21125	2022	2540449000	62885	24935	23867
21127	2020	563857000	16303	5176	4757
21127	2021	615772000	16268	5286	4962
21127	2022	611385000	16109	5582	5276
21129	2020	237023000	7372	2031	1893
21129	2021	261056000	7454	2001	1894
21129	2022	250632000	7261	2069	1954
21131	2020	367227000	10471	2564	2292
21131	2021	403226000	10298	2502	2314
21131	2022	392621000	10093	2494	2325
21133	2020	761787000	21465	6030	5433
21133	2021	837711000	21245	5959	5535
21133	2022	820265000	20893	5891	5521
21135	2020	474227000	13082	4627	4197
21135	2021	515805000	13006	4609	4276
21135	2022	494697000	12954	4549	4212
21137	2020	903490000	24249	9158	8447
21137	2021	973558000	24227	9166	8679
21137	2022	974593000	24360	9297	8843
21139	2020	390420000	8873	3479	3221
21139	2021	412039000	8984	3574	3367
21139	2022	410423000	8963	3626	3447
21141	2020	1104895000	27515	12031	11379
21141	2021	1260387000	27815	12149	11706
21141	2022	1233895000	27877	12222	11779
21143	2020	335535000	8678	3037	2879
21143	2021	360539000	8436	3079	2947
21143	2022	361416000	9101	3139	3001
21145	2020	3465970000	67911	28577	26594
21145	2021	3867263000	67612	29219	27814
21145	2022	3931515000	67490	29715	28486
21147	2020	525475000	16857	4795	4456
21147	2021	594446000	16681	4782	4519
21147	2022	568796000	16701	4679	4428
21149	2020	375798000	9134	3940	3721
21149	2021	448318000	9127	3972	3809
21149	2022	467961000	9105	3939	3759
21151	2020	3760630000	92983	45571	42876
21151	2021	4121437000	93473	45866	44054
21151	2022	4221520000	95187	46298	44569
21153	2020	450076000	11604	3164	2668
21153	2021	483299000	11476	3168	2800
21153	2022	469478000	11357	3179	2836
21155	2020	793716000	19588	9163	8459
21155	2021	871158000	19758	9181	8801
21155	2022	861269000	19775	9296	8972
21157	2020	1444921000	31685	14712	13825
21157	2021	1530406000	31820	14274	13640
21157	2022	1539415000	31777	14524	13917
21159	2020	367911000	11249	2462	2182
21159	2021	362602000	11157	2314	2114
21159	2022	354550000	11095	2204	2036
21161	2020	750856000	17130	6814	6283
21161	2021	835080000	16965	6672	6320
21161	2022	814880000	16930	6523	6200
21163	2020	1288346000	30030	11682	10868
21163	2021	1416548000	30132	11535	10953
21163	2022	1404411000	30001	11561	11034
21165	2020	229939000	6135	2238	2043
21165	2021	251805000	6209	2289	2140
21165	2022	248212000	6250	2365	2226
21167	2020	889471000	22652	9807	9109
21167	2021	994676000	22872	9815	9389
21167	2022	1014389000	22902	10028	9644
21169	2020	353957000	10286	3960	3657
21169	2021	391868000	10363	3911	3710
21169	2022	379092000	10370	3898	3718
21171	2020	449592000	11316	4531	4293
21171	2021	494854000	11269	4590	4416
21171	2022	507138000	11355	4572	4416
21173	2020	1120268000	28104	11260	10382
21173	2021	1202632000	28231	11452	10877
21173	2022	1202854000	28367	11852	11301
21175	2020	423243000	13729	4369	4079
21175	2021	462479000	13682	4238	4007
21175	2022	447733000	14120	4165	3942
21177	2020	1130437000	30886	9859	9022
21177	2021	1227117000	30072	9719	9112
21177	2022	1223969000	30455	9784	9211
21179	2020	2253279000	46784	22567	21026
21179	2021	2496257000	47149	22884	21929
21179	2022	2527317000	47392	23469	22549
21181	2020	284017000	7540	3252	3031
21181	2021	309482000	7750	3279	3145
21181	2022	307055000	7805	3279	3141
21183	2020	855145000	23746	9220	8570
21183	2021	936128000	23730	8946	8478
21183	2022	943115000	23527	9033	8576
21185	2020	4586996000	67692	32249	30718
21185	2021	5056281000	68232	32688	31567
21185	2022	5345328000	69431	33115	32000
21187	2020	410337000	11304	5057	4740
21187	2021	453413000	11307	5069	4862
21187	2022	446235000	11290	5194	5013
21189	2020	165106000	4031	1073	972
21189	2021	181540000	3967	1048	977
21189	2022	177503000	3929	1069	993
21191	2020	680823000	14652	6722	6379
21191	2021	742027000	14611	6825	6555
21191	2022	756474000	14676	6892	6641
21193	2020	1112742000	28360	8087	7384
21193	2021	1202833000	27906	7915	7449
21193	2022	1179481000	27361	7909	7499
21195	2020	2325617000	58443	18991	17439
21195	2021	2472358000	57362	18860	17726
21195	2022	2452130000	56286	18891	17889
21197	2020	454339000	13095	5015	4653
21197	2021	493137000	13110	5072	4839
21197	2022	489048000	13083	5215	4993
21199	2020	2772997000	65104	25576	23738
21199	2021	3056606000	65561	25492	24291
21199	2022	3030478000	65795	25205	24026
21201	2020	84821000	2181	782	736
21201	2021	92224000	2250	794	762
21201	2022	87702000	2229	811	769
21203	2020	602246000	16064	6335	5880
21203	2021	648721000	16151	6345	6042
21203	2022	642169000	16242	6415	6109
21205	2020	858694000	24716	9909	9186
21205	2021	926830000	24586	9886	9392
21205	2022	912279000	24388	10069	9591
21207	2020	755499000	17995	6033	5545
21207	2021	858556000	18195	6041	5725
21207	2022	924092000	18178	6220	5904
21209	2020	2768595000	57520	29699	27887
21209	2021	3020820000	58312	29584	28552
21209	2022	3109938000	59099	30159	29218
21211	2020	2453480000	48243	25260	23916
21211	2021	2709688000	48580	25521	24584
21211	2022	2761100000	48886	25734	24825
21213	2020	796582000	19626	8468	7866
21213	2021	873717000	19716	8704	8354
21213	2022	861071000	19949	8793	8486
21215	2020	996320000	19510	10281	9703
21215	2021	1085945000	19895	10396	9972
21215	2022	1136761000	20204	10539	10111
21217	2020	1015745000	26000	12896	12141
21217	2021	1074066000	26158	12204	11745
21217	2022	1051567000	26407	12183	11720
21219	2020	504136000	12289	5360	5108
21219	2021	584043000	12321	5480	5290
21219	2022	586189000	12404	5671	5484
21221	2020	602891000	14080	5931	5526
21221	2021	654139000	14202	5963	5673
21221	2022	637149000	14332	6027	5747
21223	2020	372749000	8461	3760	3510
21223	2021	410293000	8553	3783	3608
21223	2022	412732000	8539	3812	3642
21225	2020	582154000	13665	5889	5521
21225	2021	670259000	13166	5879	5628
21225	2022	633146000	12961	5809	5553
21227	2020	5573301000	135013	63077	59022
21227	2021	6156417000	137148	63741	61144
21227	2022	6449072000	139843	64985	62587
21229	2020	514074000	12042	6045	5673
21229	2021	552011000	12091	6099	5873
21229	2022	545012000	12061	6107	5890
21231	2020	675203000	19542	7301	6838
21231	2021	744517000	19569	7263	6908
21231	2022	723632000	19681	7004	6644
21233	2020	534425000	13017	5379	5040
21233	2021	609200000	12857	5309	5086
21233	2022	628885000	12726	5195	4986
21235	2020	1440280000	36695	13712	12758
21235	2021	1559327000	36699	13709	13049
21235	2022	1555071000	36873	13816	13194
21237	2020	256867000	6556	2067	1913
21237	2021	290165000	6491	2196	2071
21237	2022	280408000	6400	2175	2048
21239	2020	1473999000	26902	14761	14039
21239	2021	1641454000	27090	14893	14413
21239	2022	1690519000	27062	14907	14451
22001	2020	2525821000	57472	23197	21408
22001	2021	2642988000	57262	23428	22228
22001	2022	2591557000	56744	23726	22861
22003	2020	942305000	22684	8349	7545
22003	2021	964845000	22604	8055	7596
22003	2022	948727000	22320	8120	7784
22005	2020	7084942000	126966	63977	59474
22005	2021	7636934000	128502	65057	62265
22005	2022	7879742000	130458	66620	64655
22007	2020	1087289000	20957	8726	7803
22007	2021	1179429000	20726	8824	8195
22007	2022	1148832000	20604	8734	8333
22009	2020	1693355000	39638	14850	13602
22009	2021	1780963000	39265	14632	13838
22009	2022	1704914000	38751	14361	13766
22011	2020	1730688000	36600	14316	13303
22011	2021	1837220000	36619	14484	13862
22011	2022	1846898000	36570	14548	14055
22013	2020	550434000	12918	5347	4914
22013	2021	581807000	12800	5195	4891
22013	2022	570718000	12641	5171	4955
22015	2020	6253863000	128717	56481	52730
22015	2021	6765982000	129402	56832	54555
22015	2022	6884444000	129276	57717	55986
22017	2020	12976558000	236928	100939	91444
22017	2021	13372691000	232741	100974	94629
22017	2022	13202840000	229025	101200	97072
22019	2020	10117795000	216465	96852	87676
22019	2021	10559327000	205095	94584	89178
22019	2022	10430209000	202418	91860	88640
22021	2020	374959000	9611	3629	3347
22021	2021	394989000	9593	3675	3498
22021	2022	380470000	9554	3661	3522
22023	2020	326527000	5623	3488	3276
22023	2021	324667000	5099	3457	3331
22023	2022	308808000	4902	3410	3314
22025	2020	362553000	8841	3430	3172
22025	2021	388520000	8712	3459	3274
22025	2022	369939000	8566	3464	3323
22027	2020	575068000	14103	5431	5049
22027	2021	604983000	13990	5431	5156
22027	2022	604939000	13744	5387	5182
22029	2020	741439000	18568	6858	6264
22029	2021	782057000	18373	6866	6451
22029	2022	756737000	18116	6931	6611
22031	2020	1271075000	26838	10634	9825
22031	2021	1405989000	26934	10699	10160
22031	2022	1426809000	26853	10853	10439
22033	2020	25094099000	455886	224875	206505
22033	2021	27243892000	453653	228356	216209
22033	2022	27024382000	450544	232508	224477
22035	2020	256407000	7397	1802	1577
22035	2021	282912000	7242	1739	1566
22035	2022	251727000	6990	1650	1522
22037	2020	858288000	19450	7530	6996
22037	2021	915120000	19319	7688	7329
22037	2022	900274000	19135	7854	7606
22039	2020	1243308000	32304	11880	10910
22039	2021	1306540000	32190	11928	11259
22039	2022	1286708000	31986	11972	11484
22041	2020	739141000	19712	7278	6651
22041	2021	792191000	19593	7380	6937
22041	2022	750584000	19308	7372	7020
22043	2020	776594000	22135	8077	7517
22043	2021	828921000	22212	8158	7815
22043	2022	822159000	22000	8197	7911
22045	2020	2951416000	70054	27355	24626
22045	2021	3234214000	69298	27530	25609
22045	2022	3083795000	68327	27430	26279
22047	2020	1465430000	30058	13572	12164
22047	2021	1590381000	29713	13702	12723
22047	2022	1540175000	29506	13850	13240
22049	2020	585829000	14997	6688	6308
22049	2021	625219000	14922	6741	6478
22049	2022	625356000	14839	6903	6684
22051	2020	24086340000	439712	208437	188494
22051	2021	25493133000	433929	207469	194974
22051	2022	24996051000	425884	208950	201513
22053	2020	1475396000	32210	12666	11656
22053	2021	1519356000	32413	12414	11797
22053	2022	1552351000	32026	12284	11856
22055	2020	13100224000	242148	113595	105162
22055	2021	14530014000	244922	114652	109328
22055	2022	14614814000	247866	115683	112040
22057	2020	4465124000	97434	40958	38149
22057	2021	5008555000	97537	40452	38527
22057	2022	5016278000	95870	40406	39042
22059	2020	545700000	14822	6796	6450
22059	2021	559700000	14793	6679	6451
22059	2022	551083000	14729	6700	6523
22061	2020	2029677000	48304	20886	19507
22061	2021	2258756000	48153	21058	20121
22061	2022	2278256000	48129	21159	20419
22063	2020	6561596000	142824	68403	63814
22063	2021	7099337000	146230	69536	66832
22063	2022	7298471000	148425	71405	69374
22065	2020	398383000	9923	3514	3199
22065	2021	431501000	9804	3453	3214
22065	2022	400690000	9478	3463	3290
22067	2020	1045720000	25453	9963	8936
22067	2021	1099664000	25000	9906	9171
22067	2022	1039337000	24446	9804	9288
22069	2020	1651793000	37388	16003	14844
22069	2021	1776589000	36995	16355	15561
22069	2022	1804164000	36663	16536	15888
22071	2020	21298054000	383218	178850	156655
22071	2021	23577230000	377063	176799	162126
22071	2022	22785015000	369749	175296	167464
22073	2020	6980475000	160096	69033	63661
22073	2021	7457508000	158919	69513	65929
22073	2022	7409117000	157702	69870	67319
22075	2020	1200997000	23458	9482	8782
22075	2021	1290449000	23284	9507	9078
22075	2022	1252016000	22516	9727	9414
22077	2020	1107782000	20670	9400	8619
22077	2021	1195970000	20323	9581	9024
22077	2022	1152300000	20151	9761	9384
22079	2020	6468427000	129657	54413	50813
22079	2021	6887427000	128748	55085	52773
22079	2022	6853705000	127189	55235	53441
22081	2020	377280000	7587	3565	3331
22081	2021	402892000	7490	3660	3496
22081	2022	402866000	7420	3741	3615
22083	2020	856569000	20032	8056	7407
22083	2021	895378000	19890	8101	7665
22083	2022	876729000	19826	8169	7836
22085	2020	918202000	22093	9158	8618
22085	2021	996033000	22098	9211	8854
22085	2022	1032123000	21985	9225	8926
22087	2020	1723818000	43853	19894	17818
22087	2021	1877166000	44330	19811	18452
22087	2022	1861926000	44479	19866	19061
22089	2020	2765411000	52507	24241	22268
22089	2021	2976383000	52405	24276	23029
22089	2022	2940903000	50998	24625	23808
22091	2020	493836000	10901	4217	3705
22091	2021	516260000	10921	4270	3880
22091	2022	488411000	10822	4258	4031
22093	2020	1154367000	20117	8796	7892
22093	2021	1262916000	19790	8806	8151
22093	2022	1217522000	19423	8851	8444
22095	2020	1864266000	42355	19085	16863
22095	2021	1946003000	42021	19065	17429
22095	2022	1822692000	39864	18972	18027
22097	2020	3709916000	82302	32014	29087
22097	2021	3937368000	82283	31958	29916
22097	2022	3893301000	81773	31722	30315
22099	2020	2193426000	51628	21667	19808
22099	2021	2382140000	51573	21804	20550
22099	2022	2301022000	51236	21928	21126
22101	2020	2174903000	49143	19281	17425
22101	2021	2343736000	48188	19054	17751
22101	2022	2236367000	47789	19076	18263
22103	2020	17352907000	264986	116097	107919
22103	2021	19699862000	270087	116397	111733
22103	2022	20138628000	273263	118867	115374
22105	2020	5864115000	133635	55843	50250
22105	2021	6470262000	135508	55977	52330
22105	2022	6511396000	137048	56453	54026
22107	2020	181561000	4107	1335	1216
22107	2021	207764000	4034	1313	1233
22107	2022	181684000	3846	1304	1239
22109	2020	4964511000	109405	45442	41743
22109	2021	5253886000	109013	44774	42113
22109	2022	5095651000	104786	44444	42735
22111	2020	930125000	21090	8942	8267
22111	2021	987898000	20996	9008	8556
22111	2022	1012877000	20721	9113	8768
22113	2020	2504670000	56918	23466	21633
22113	2021	2700364000	56854	23750	22515
22113	2022	2669178000	56952	23918	23075
22115	2020	2164167000	48625	15710	14518
22115	2021	2291753000	48056	15871	15111
22115	2022	2246965000	47247	16135	15483
22117	2020	1785219000	45344	16529	15105
22117	2021	1892035000	45176	16747	15737
22117	2022	1862975000	45025	16849	16144
22119	2020	1686324000	36875	13878	12721
22119	2021	1788051000	36024	13944	13159
22119	2022	1771714000	35643	14092	13508
22121	2020	1407211000	27258	13425	12412
22121	2021	1522795000	27805	13673	12994
22121	2022	1538925000	28034	13946	13492
22123	2020	403036000	9693	3634	3249
22123	2021	410095000	9596	3502	3272
22123	2022	391090000	9475	3488	3296
22125	2020	643289000	15250	5146	4850
22125	2021	701737000	15481	5276	5077
22125	2022	702811000	15381	5417	5277
22127	2020	595013000	13721	4661	4310
22127	2021	628449000	13507	4561	4332
22127	2022	627419000	13205	4586	4402
23001	2020	5099252000	111180	54016	51281
23001	2021	5428031000	112648	54623	51905
23001	2022	5544341000	113023	53206	51679
23003	2020	3138012000	67064	29067	27574
23003	2021	3345264000	67022	29311	27616
23003	2022	3424296000	67255	28769	27631
23005	2020	20819715000	303570	159948	152096
23005	2021	22911063000	306149	164041	157369
23005	2022	23984992000	307451	163301	159534
23007	2020	1286700000	29460	13661	12886
23007	2021	1387790000	30275	13944	13194
23007	2022	1435940000	30474	13789	13316
23009	2020	3083104000	55500	27591	26104
23009	2021	3443336000	56403	28818	27365
23009	2022	3592419000	56701	28745	27778
23011	2020	6206832000	123832	61060	58248
23011	2021	6747495000	124824	61983	59260
23011	2022	6950038000	125540	61727	60056
23013	2020	2269256000	40657	19470	18488
23013	2021	2437186000	41074	20126	19229
23013	2022	2547931000	41164	20021	19447
23015	2020	1927715000	35249	16309	15504
23015	2021	2130054000	35985	16949	16190
23015	2022	2228081000	36215	16780	16316
23017	2020	2477340000	57894	25646	24072
23017	2021	2689262000	58719	26520	25020
23017	2022	2763527000	59495	26059	25234
23019	2020	7191988000	152165	73858	70142
23019	2021	7756839000	152834	75450	71805
23019	2022	7992291000	153704	73882	71644
23021	2020	766738000	16805	7125	6764
23021	2021	842603000	17184	7535	7150
23021	2022	868458000	17417	7345	7076
23023	2020	2002942000	36724	19152	18309
23023	2021	2226728000	37190	19375	18641
23023	2022	2339608000	37393	19143	18706
23025	2020	2185854000	50460	21910	20557
23025	2021	2371053000	50715	22551	21122
23025	2022	2417252000	51098	22054	21181
23027	2020	1898061000	39654	19888	18938
23027	2021	2075782000	39984	20469	19492
23027	2022	2201765000	40241	20356	19736
23029	2020	1433761000	31087	13285	12510
23029	2021	1519991000	31166	13575	12689
23029	2022	1556136000	31437	13420	12868
23031	2020	12255113000	212256	109992	104512
23031	2021	13513226000	215066	113270	108093
23031	2022	14103520000	216732	112574	109630
24001	2020	3066203000	67955	31355	29022
24001	2021	3210197000	67691	30396	28617
24001	2022	3113977000	67267	31030	29877
24003	2020	42525933000	589054	317713	300122
24003	2021	45544247000	592052	310869	297439
24003	2022	46803613000	593286	312778	304604
24005	2020	54480535000	853325	452562	423067
24005	2021	57265072000	850634	442014	419248
24005	2022	57385048000	846161	442812	429325
24009	2020	6234318000	92905	49757	47287
24009	2021	6499411000	94226	48510	46487
24009	2022	6687927000	94573	48864	47524
24011	2020	1592316000	33273	17714	16770
24011	2021	1789708000	33413	16993	16241
24011	2022	1855197000	33433	16956	16472
24013	2020	11262720000	172923	95119	90511
24013	2021	12148929000	174208	93356	89799
24013	2022	12487826000	175305	94395	92088
24015	2020	5479885000	103793	53529	50515
24015	2021	5766801000	104096	52255	49777
24015	2022	5882013000	104942	53404	51756
24017	2020	9993795000	166726	88257	82636
24017	2021	10481590000	168870	85617	81175
24017	2022	10706536000	170102	85674	83028
24019	2020	1604444000	32528	16559	15520
24019	2021	1807019000	32625	15841	15013
24019	2022	1825208000	32726	15725	15195
24021	2020	17864769000	272765	137667	129952
24021	2021	19587024000	280410	133849	127988
24021	2022	20713005000	287079	135039	131346
24023	2020	1410870000	28792	15611	14623
24023	2021	1535160000	28757	15140	14408
24023	2022	1512498000	28579	14829	14353
24025	2020	16233287000	261213	141475	133699
24025	2021	17422666000	263292	138510	132471
24025	2022	17803767000	263867	139568	135753
24027	2020	27058069000	332786	189181	179877
24027	2021	29036622000	335287	185607	178266
24027	2022	29827252000	335411	187053	182520
24029	2020	1205225000	19114	9841	9221
24029	2021	1328548000	19254	9461	8984
24029	2022	1346895000	19320	9701	9378
24031	2020	90565341000	1060825	557256	523592
24031	2021	96133196000	1055924	543085	516016
24031	2022	98300546000	1052521	542899	528308
24033	2020	48455083000	965290	513138	473084
24033	2021	50984848000	956254	498124	464942
24033	2022	49958493000	946971	491617	475409
24035	2020	3557859000	50023	28125	26668
24035	2021	3966491000	50900	27608	26508
24035	2022	4129931000	51711	27942	27230
24037	2020	7119548000	113987	58561	55860
24037	2021	7466688000	114664	57991	55656
24037	2022	7598680000	114877	57285	55659
24039	2020	798887000	24564	8722	8018
24039	2021	903748000	24528	8803	8201
24039	2022	944518000	24546	8969	8573
24041	2020	2947357000	37481	17993	16953
24041	2021	3242179000	37796	17212	16368
24041	2022	3355057000	37932	17395	16853
24043	2020	7609287000	154677	73027	68259
24043	2021	8233095000	155197	71933	68410
24043	2022	8305634000	155590	72075	69859
24045	2020	4447808000	103556	49840	46253
24045	2021	4850585000	104181	49983	47210
24045	2022	4830585000	104664	50840	49029
24047	2020	3100085000	52511	25258	22517
24047	2021	3447767000	53370	24838	22995
24047	2022	3473587000	53866	25059	23879
24510	2020	31562507000	583139	282305	258446
24510	2021	33715825000	576981	274893	255999
24510	2022	34085639000	569931	272948	262199
25001	2020	18218342000	228856	110383	98557
25001	2021	19512593000	232594	111617	104588
25001	2022	19832524000	232457	111556	106399
25003	2020	7870500000	128774	61441	55388
25003	2021	8288857000	128621	61801	57918
25003	2022	8279881000	127859	61916	59284
25005	2020	34791553000	576737	300281	268029
25005	2021	37111108000	579895	297967	279686
25005	2022	37184286000	580068	298713	285189
25007	2020	1746167000	20579	9089	8151
25007	2021	1813870000	21109	9573	8982
25007	2022	1828484000	20868	9745	9255
25009	2020	58172607000	808491	424418	380823
25009	2021	62654945000	807485	421565	396435
25009	2022	63093353000	806765	421534	405406
25011	2020	4288420000	70930	40030	36877
25011	2021	4464289000	70943	40221	38313
25011	2022	4462352000	70894	40068	38748
25013	2020	26813072000	464407	226395	201794
25013	2021	28099474000	462849	225465	209563
25013	2022	27806420000	461041	222436	211709
25015	2020	9311762000	146592	88543	81884
25015	2021	9665216000	163088	88980	85055
25015	2022	9723031000	162588	88857	85916
25017	2020	148135188000	1628671	902368	833448
25017	2021	160766220000	1617099	903496	864086
25017	2022	164506575000	1617105	910849	883631
25019	2020	1332547000	14237	7169	6326
25019	2021	1470372000	14499	7739	7181
25019	2022	1485837000	14421	7916	7432
25021	2020	69412454000	724322	390646	356557
25021	2021	76805508000	724692	389060	370253
25021	2022	79288752000	725531	392560	379802
25023	2020	39280792000	530154	283815	255751
25023	2021	42128915000	532919	282496	266308
25023	2022	42678549000	533069	283538	272555
25025	2020	69357940000	793271	456876	410348
25025	2021	74994008000	771765	451216	425993
25025	2022	74287708000	766381	453111	437082
25027	2020	52689154000	859708	442803	402081
25027	2021	55587692000	862132	440221	415848
25027	2022	55942537000	862927	440791	423910
26001	2020	470826000	10189	3860	3459
26001	2021	514403000	10300	3732	3475
26001	2022	514811000	10417	3867	3606
26003	2020	339732000	8842	3135	2784
26003	2021	368984000	8789	3101	2861
26003	2022	362593000	8807	3228	2994
26005	2020	6025429000	120647	62300	57581
26005	2021	6562001000	121010	60567	57793
26005	2022	6660219000	121210	62102	59858
26007	2020	1293340000	28880	13276	12209
26007	2021	1404089000	28916	13149	12438
26007	2022	1402930000	28847	13340	12694
26009	2020	1218924000	23459	10160	9131
26009	2021	1346531000	23884	9878	9206
26009	2022	1363615000	24249	10091	9514
26011	2020	669614000	15003	5969	5271
26011	2021	710800000	15000	5693	5232
26011	2022	704598000	15089	5784	5365
26013	2020	312963000	8140	3162	2774
26013	2021	334228000	8291	3013	2785
26013	2022	328926000	8277	3075	2855
26015	2020	3086392000	62598	31554	29140
26015	2021	3349040000	63170	30883	29496
26015	2022	3441884000	63554	32025	30825
26017	2020	4878569000	103733	49601	44867
26017	2021	5200417000	103251	48030	45182
26017	2022	5106814000	102821	48979	46493
26019	2020	944013000	17997	8700	7855
26019	2021	992977000	18236	8475	7983
26019	2022	1002386000	18297	8798	8342
26021	2020	8271146000	154183	72798	66186
26021	2021	9159537000	153377	69918	65956
26021	2022	9221598000	152900	71953	68758
26023	2020	1803050000	44868	19765	18113
26023	2021	1946579000	45202	19230	18300
26023	2022	1916634000	44531	19704	18912
26025	2020	5849429000	134184	62078	55834
26025	2021	6102372000	133878	59303	55529
26025	2022	5985202000	133289	60320	57498
26027	2020	2593300000	51550	24472	22228
26027	2021	2815105000	51501	23159	22002
26027	2022	2823923000	51403	23689	22667
26029	2020	1515131000	26034	12564	11285
26029	2021	1693947000	26215	12333	11616
26029	2022	1752930000	26293	12883	12290
26031	2020	1164362000	25584	10350	8818
26031	2021	1226056000	25735	10018	9188
26031	2022	1211067000	25940	10374	9534
26033	2020	1456719000	36781	15980	14479
26033	2021	1570986000	35867	15592	14588
26033	2022	1548512000	36293	15983	14985
26035	2020	1221789000	30834	11756	10344
26035	2021	1283308000	31128	11154	10285
26035	2022	1258672000	31352	11416	10648
26037	2020	4070481000	79157	40394	37663
26037	2021	4425101000	79499	38966	37258
26037	2022	4530790000	79748	40317	38788
26039	2020	541550000	12993	5616	5002
26039	2021	576037000	13292	5371	5003
26039	2022	560382000	13491	5479	5127
26041	2020	1608256000	36860	16899	15363
26041	2021	1699686000	36834	16354	15377
26041	2022	1637788000	36741	16666	15761
26043	2020	1313740000	25898	12177	11280
26043	2021	1445138000	25795	12198	11627
26043	2022	1418709000	25874	12256	11737
26045	2020	5198211000	109176	56380	51916
26045	2021	5536347000	109030	54159	51321
26045	2022	5551420000	108992	56161	53741
26047	2020	2123623000	34104	17237	15387
26047	2021	2351368000	34280	16543	15532
26047	2022	2395130000	34163	16905	15991
26049	2020	18414693000	405757	180398	159533
26049	2021	19488910000	404662	175068	162234
26049	2022	19119944000	401983	179097	169352
26051	2020	1074930000	25375	9875	8875
26051	2021	1127631000	25528	9694	9035
26051	2022	1124342000	25728	10003	9416
26053	2020	650865000	14346	5841	5370
26053	2021	684354000	14356	5621	5317
26053	2022	680992000	14319	5756	5466
26055	2020	5308599000	95411	49239	44977
26055	2021	5871628000	96013	48067	45716
26055	2022	5989358000	96464	49730	47908
26057	2020	1727449000	41667	17877	16399
26057	2021	1813627000	41269	17056	16124
26057	2022	1773831000	41100	17396	16609
26059	2020	1816865000	45733	20184	18298
26059	2021	1948797000	45609	19768	18709
26059	2022	1921422000	45762	20127	19223
26061	2020	1486817000	37238	15959	14744
26061	2021	1601532000	37444	15792	15013
26061	2022	1587391000	37035	16245	15477
26063	2020	1619180000	31371	15489	14125
26063	2021	1770319000	31354	14830	14047
26063	2022	1757081000	31248	14993	14303
26065	2020	13169421000	284640	147085	135611
26065	2021	14014855000	271427	141835	134052
26065	2022	14085158000	284108	146731	140394
26067	2020	2519193000	66855	30273	27784
26067	2021	2729426000	66797	29693	28303
26067	2022	2736694000	66809	30507	29354
26069	2020	1097918000	25185	10153	9048
26069	2021	1180107000	25374	9836	9147
26069	2022	1168087000	25521	10261	9619
26071	2020	540233000	11628	4952	4530
26071	2021	565985000	11576	4741	4458
26071	2022	557823000	11622	4764	4486
26073	2020	2790960000	64513	33124	30253
26073	2021	2931044000	64291	31823	30175
26073	2022	2888830000	64447	32373	30860
26075	2020	6957521000	160225	74719	67782
26075	2021	7514270000	160266	71880	67846
26075	2022	7428423000	160066	73988	70758
26077	2020	14349521000	261767	132389	122381
26077	2021	15326372000	260688	128287	121963
26077	2022	15570936000	261173	132130	127053
26079	2020	734067000	17916	7902	6993
26079	2021	780765000	17958	7646	7109
26079	2022	766950000	18182	7909	7449
26081	2020	39016248000	658460	357620	329277
26081	2021	43042407000	659000	349438	333345
26081	2022	44142240000	659083	362319	350035
26083	2020	111741000	2068	898	816
26083	2021	117543000	2118	889	831
26083	2022	119754000	2180	905	851
26085	2020	457826000	12094	3973	3528
26085	2021	474652000	12261	3830	3524
26085	2022	458851000	12594	3829	3562
26087	2020	4332071000	88572	40515	35581
26087	2021	4499803000	88686	40112	37715
26087	2022	4490087000	88780	40436	38693
26089	2020	1629040000	22312	10257	9413
26089	2021	1790242000	22630	10074	9564
26089	2022	1870881000	22870	10365	9935
26091	2020	4402351000	99320	45779	41555
26091	2021	4713424000	99202	44544	42150
26091	2022	4685716000	98567	45179	43133
26093	2020	12106997000	193971	100827	92130
26093	2021	13124957000	195277	101861	97651
26093	2022	13593733000	196161	103422	100456
26095	2020	215403000	5336	2234	2033
26095	2021	231255000	5337	2137	1991
26095	2022	224957000	5330	2142	2013
26097	2020	535179000	10816	4946	4271
26097	2021	573716000	10899	4851	4440
26097	2022	569745000	10941	5158	4704
26099	2020	44785665000	880176	442460	390375
26099	2021	47139119000	877385	439388	413835
26099	2022	47046713000	874195	443204	426693
26101	2020	1085679000	25061	10211	9062
26101	2021	1167983000	25299	9684	8996
26101	2022	1151401000	25287	9692	9126
26103	2020	2915242000	66012	31795	29064
26103	2021	3157571000	65800	30931	29318
26103	2022	3097491000	66661	31656	30107
26105	2020	1324856000	29038	13335	12051
26105	2021	1422016000	29381	13021	12205
26105	2022	1383674000	29409	13226	12543
26107	2020	1624785000	39792	18391	16645
26107	2021	1767359000	40057	17822	16714
26107	2022	1729902000	40720	18177	17190
26109	2020	1040597000	23450	10688	9971
26109	2021	1112010000	23323	10498	10032
26109	2022	1100221000	23266	10702	10257
26111	2020	4724096000	83481	39408	36313
26111	2021	5018053000	83426	38572	36723
26111	2022	5090894000	83674	40151	38455
26113	2020	618432000	15057	6931	6275
26113	2021	668021000	15164	6835	6465
26113	2022	664311000	15213	6840	6504
26115	2020	7701408000	154893	74533	67687
26115	2021	8192345000	155646	72065	67791
26115	2022	8246982000	155609	75015	71499
26117	2020	2518262000	66648	27944	25295
26117	2021	2749070000	67458	27091	25607
26117	2022	2746228000	67433	27971	26742
26119	2020	390098000	9164	3023	2610
26119	2021	403976000	9302	2951	2685
26119	2022	396539000	9569	3021	2780
26121	2020	7627568000	175848	77821	68576
26121	2021	8127512000	176612	75414	69999
26121	2022	8046286000	176565	77067	73242
26123	2020	2092315000	50095	23392	21288
26123	2021	2251234000	50468	22841	21583
26123	2022	2246097000	50886	23277	22201
26125	2020	97217213000	1272413	653743	594036
26125	2021	104068949000	1271891	660052	629655
26125	2022	107711780000	1269431	668923	648819
26127	2020	1147994000	26713	12055	10753
26127	2021	1225809000	26884	11574	10741
26127	2022	1212983000	26973	11450	10717
26129	2020	818945000	20779	8084	7168
26129	2021	881556000	20783	7941	7340
26129	2022	862292000	20970	8261	7697
26131	2020	258977000	5805	2053	1832
26131	2021	275075000	5855	2008	1858
26131	2022	273571000	5863	2028	1881
26133	2020	982237000	22906	11567	10571
26133	2021	1044971000	23176	11244	10632
26133	2022	1036830000	23274	11308	10786
26135	2020	308157000	8239	2809	2447
26135	2021	340442000	8328	2664	2432
26135	2022	340913000	8404	2772	2556
26137	2020	1150281000	25138	11658	10420
26137	2021	1256138000	25351	11397	10648
26137	2022	1236065000	25644	11544	10935
26139	2020	15899412000	296889	160116	148785
26139	2021	17621225000	298317	156918	150626
26139	2022	18358772000	300873	162867	157634
26141	2020	583571000	12997	4960	4388
26141	2021	617962000	13173	4788	4419
26141	2022	617800000	13361	4904	4534
26143	2020	1002819000	23466	7775	6789
26143	2021	1053782000	23677	7464	6777
26143	2022	1038730000	23708	7808	7146
26145	2020	8673982000	189860	84852	76084
26145	2021	9209795000	189590	81566	75989
26145	2022	8983295000	188330	83043	78542
26147	2020	8005913000	160375	74662	65931
26147	2021	8402183000	160384	74208	69883
26147	2022	8417015000	160151	74805	71872
26149	2020	2613600000	60931	29136	26404
26149	2021	2866988000	60850	27794	26395
26149	2022	2857149000	60874	28503	27325
26151	2020	1775276000	40502	19491	17538
26151	2021	1904199000	40604	18945	17813
26151	2022	1877896000	40657	18881	17916
26153	2020	365069000	8056	3253	2925
26153	2021	382777000	8060	3104	2860
26153	2022	363556000	8188	3157	2920
26155	2020	3035932000	68006	32862	29750
26155	2021	3236334000	67998	31737	29970
26155	2022	3226093000	68022	32413	30908
26157	2020	2222125000	53310	23711	21236
26157	2021	2366100000	53046	22668	21273
26157	2022	2318852000	52945	23081	21865
26159	2020	3516176000	75576	34849	31815
26159	2021	3745702000	75703	33743	31741
26159	2022	3749904000	75692	34307	32605
26161	2020	24021472000	371817	194168	181098
26161	2021	25510478000	364998	188726	180683
26161	2022	26147662000	366376	195332	188405
26163	2020	83044053000	1789129	802218	693214
26163	2021	86896082000	1773073	794669	732872
26163	2022	85232497000	1757043	794634	757497
26165	2020	1402348000	33685	14938	13365
26165	2021	1516537000	33940	14645	13799
26165	2022	1499901000	34196	14891	14183
27001	2020	735113000	15718	7512	6893
27001	2021	800881000	15945	7416	7039
27001	2022	804802000	16126	7423	7103
27003	2020	20290309000	364458	200992	188030
27003	2021	21678422000	367416	195435	188163
27003	2022	22268689000	368864	197907	192915
27005	2020	1807272000	35194	19022	17820
27005	2021	1987370000	35326	19176	18495
27005	2022	2034026000	35371	19334	18789
27007	2020	2176636000	46243	24996	23396
27007	2021	2368486000	46420	24612	23636
27007	2022	2356358000	46799	25010	24228
27009	2020	2053603000	41357	22172	20683
27009	2021	2215207000	41496	21507	20512
27009	2022	2249574000	41463	21567	20860
27011	2020	296865000	5158	2553	2431
27011	2021	338451000	5162	2457	2365
27011	2022	361106000	5144	2395	2320
27013	2020	3340991000	69211	40813	38592
27013	2021	3570559000	69361	39746	38422
27013	2022	3679165000	69631	40269	39405
27015	2020	1470938000	25903	14294	13549
27015	2021	1553118000	25883	13757	13300
27015	2022	1599165000	25723	13852	13496
27017	2020	1691531000	36193	17810	16504
27017	2021	1818979000	36455	17440	16683
27017	2022	1844449000	36708	17540	16937
27019	2020	8126250000	107284	59771	56643
27019	2021	9022210000	108826	58293	56552
27019	2022	9583434000	110034	59102	57885
27021	2020	1532141000	30142	14534	13201
27021	2021	1768774000	30638	15757	15002
27021	2022	1748888000	31274	14754	14165
27023	2020	608463000	12596	6796	6445
27023	2021	669226000	12390	6615	6405
27023	2022	688824000	12284	6460	6310
27025	2020	3056457000	56713	30362	28328
27025	2021	3317932000	57544	29501	28311
27025	2022	3410387000	57988	29835	28957
27027	2020	3037683000	65332	36602	35002
27027	2021	3332179000	65665	36981	35902
27027	2022	3359967000	65929	37560	36788
27029	2020	439957000	8571	4550	4103
27029	2021	466577000	8574	4392	4111
27029	2022	462123000	8649	4487	4204
27031	2020	308578000	5595	3007	2755
27031	2021	322720000	5623	2964	2823
27031	2022	324188000	5708	2870	2774
27033	2020	622668000	11509	6370	6065
27033	2021	678335000	11578	6561	6322
27033	2022	717226000	11356	6647	6468
27035	2020	3243931000	66277	32514	30131
27035	2021	3682012000	67345	32875	31474
27035	2022	3590178000	67948	33473	32441
27037	2020	27888958000	440393	245102	229771
27037	2021	29960018000	442773	238169	229944
27037	2022	31026692000	443341	241305	235800
27039	2020	1095772000	20895	12117	11456
27039	2021	1222598000	20964	11903	11503
27039	2022	1238484000	20981	11890	11589
27041	2020	2181050000	39089	21395	20361
27041	2021	2399385000	39305	21508	20865
27041	2022	2480190000	39668	21538	21057
27043	2020	663760000	13901	7154	6708
27043	2021	751750000	13910	6988	6708
27043	2022	776392000	13926	7057	6845
27045	2020	1055740000	21234	11748	11143
27045	2021	1150213000	21303	11451	11084
27045	2022	1190571000	21414	11408	11124
27047	2020	1507885000	30902	16303	15370
27047	2021	1665762000	30808	15806	15219
27047	2022	1701058000	30718	15904	15499
27049	2020	2691526000	47575	26879	25292
27049	2021	2932334000	48018	26549	25632
27049	2022	3073035000	48013	26623	25969
27051	2020	328414000	6094	3363	3182
27051	2021	354036000	6161	3280	3151
27051	2022	381167000	6136	3265	3174
27053	2020	99541341000	1281568	715219	667782
27053	2021	109529542000	1266736	694964	668831
27053	2022	113223114000	1260121	701738	685129
27055	2020	1035899000	18851	10410	9957
27055	2021	1098488000	18829	10396	10080
27055	2022	1128228000	18800	10265	10039
27057	2020	1199099000	21392	10057	9340
27057	2021	1294915000	21745	10243	9799
27057	2022	1286713000	21960	10149	9744
27059	2020	2045263000	41385	21969	20469
27059	2021	2186416000	41951	21404	20453
27059	2022	2239785000	42727	21643	20948
27061	2020	2175364000	45035	22269	20346
27061	2021	2317250000	45058	21752	20657
27061	2022	2329847000	45205	21629	20697
27063	2020	578716000	9992	5830	5521
27063	2021	614348000	10015	5523	5335
27063	2022	628923000	9893	5423	5293
27065	2020	788666000	16049	9162	8415
27065	2021	828228000	16187	9072	8562
27065	2022	820756000	16463	9181	8770
27067	2020	2348344000	43726	24766	23557
27067	2021	2531304000	43865	23548	22649
27067	2022	2608625000	43839	23290	22654
27069	2020	258504000	4198	2405	2292
27069	2021	278694000	4162	2276	2205
27069	2022	284436000	4059	2240	2180
27071	2020	570608000	12025	5844	5407
27071	2021	602289000	11944	5736	5464
27071	2022	627176000	11844	5847	5623
27073	2020	379403000	6702	3534	3363
27073	2021	428414000	6715	3384	3280
27073	2022	463039000	6689	3391	3304
27075	2020	534712000	10918	5362	4970
27075	2021	588413000	11009	5394	5187
27075	2022	580013000	10939	5349	5096
27077	2020	214491000	3764	2448	2296
27077	2021	228270000	3821	2420	2325
27077	2022	230766000	3871	2411	2337
27079	2020	1571123000	28639	16197	15083
27079	2021	1717370000	28918	15697	14994
27079	2022	1769339000	29153	15845	15305
27081	2020	285425000	5628	3148	3006
27081	2021	319219000	5563	3055	2943
27081	2022	337568000	5580	3025	2942
27083	2020	1359528000	25170	14660	14004
27083	2021	1475809000	25267	14339	13919
27083	2022	1523071000	25262	14375	14033
27085	2020	1919932000	36738	19417	18296
27085	2021	2092568000	36807	19175	18466
27085	2022	2114456000	36714	19274	18745
27087	2020	222671000	5372	2218	1926
27087	2021	257832000	5387	2187	2044
27087	2022	259187000	5328	2225	2121
27089	2020	588006000	9026	5480	5118
27089	2021	651452000	8979	5309	5074
27089	2022	672805000	8861	5358	5153
27091	2020	1079106000	19982	10096	9550
27091	2021	1201220000	19899	9673	9336
27091	2022	1234295000	19650	9646	9400
27093	2020	1140128000	23431	13362	12648
27093	2021	1238486000	23391	13237	12754
27093	2022	1286584000	23496	13604	13225
27095	2020	1268666000	26462	12952	11838
27095	2021	1367712000	26892	12516	11811
27095	2022	1401712000	27280	12620	12078
27097	2020	1597696000	33995	18022	16788
27097	2021	1724512000	34071	17534	16708
27097	2022	1765199000	34246	17239	16515
27099	2020	2036369000	40054	20951	19886
27099	2021	2119653000	40214	20695	19998
27099	2022	2160946000	40140	20724	20222
27101	2020	500857000	8172	4877	4626
27101	2021	519897000	8145	4725	4534
27101	2022	545973000	8060	4642	4493
27103	2020	1825299000	34504	20943	19921
27103	2021	1938683000	34373	20410	19799
27103	2022	1996610000	34441	20653	20258
27105	2020	1137200000	22207	11663	11164
27105	2021	1195784000	22047	11345	10997
27105	2022	1231465000	21947	11132	10895
27107	2020	319614000	6435	3327	3114
27107	2021	378458000	6442	3198	3063
27107	2022	381084000	6377	3176	3069
27109	2020	9999759000	163028	91855	86831
27109	2021	10818962000	163620	90913	88129
27109	2022	11078990000	164020	90971	89078
27111	2020	3182908000	60072	31709	29971
27111	2021	3367123000	60222	31434	30296
27111	2022	3434524000	60519	31422	30522
27113	2020	827389000	13950	8720	8178
27113	2021	900645000	13806	8723	8379
27113	2022	916353000	13845	8778	8498
27115	2020	1237983000	28889	14668	13385
27115	2021	1338461000	29034	14272	13506
27115	2022	1330637000	29446	14399	13789
27117	2020	531984000	9414	4708	4515
27117	2021	594020000	9352	4585	4445
27117	2022	631114000	9355	4657	4545
27119	2020	1660175000	31083	16381	15442
27119	2021	1824716000	30817	16054	15397
27119	2022	1810102000	30731	16028	15575
27121	2020	638720000	11326	6580	6283
27121	2021	701112000	11418	6494	6293
27121	2022	728640000	11431	6489	6338
27123	2020	31679044000	551699	290437	270020
27123	2021	34664860000	542861	282082	270330
27123	2022	35058878000	536413	284339	277002
27125	2020	225769000	3940	2241	2095
27125	2021	270171000	3932	2192	2100
27125	2022	283867000	3874	2179	2099
27127	2020	922090000	15408	7807	7372
27127	2021	1062340000	15397	7578	7304
27127	2022	1138510000	15361	7579	7388
27129	2020	810815000	14697	8535	8040
27129	2021	911831000	14628	8338	7990
27129	2022	936028000	14525	8134	7856
27131	2020	3222076000	67086	37506	35493
27131	2021	3531216000	67375	37241	35955
27131	2022	3624851000	67693	37488	36564
27133	2020	539131000	9684	5866	5683
27133	2021	556936000	9674	5941	5821
27133	2022	582272000	9537	5997	5901
27135	2020	818689000	15293	7967	7506
27135	2021	923241000	15260	7933	7682
27135	2022	936302000	15292	7952	7758
27137	2020	10113861000	200064	101615	94222
27137	2021	11087968000	199332	99480	95373
27137	2022	11287953000	199532	100065	96942
27139	2020	9940424000	151350	85210	80150
27139	2021	11003957000	153408	82956	80201
27139	2022	11654918000	154520	84028	82212
27141	2020	5099922000	97580	53542	50247
27141	2021	5542570000	99248	52210	50226
27141	2022	5757220000	100824	52941	51484
27143	2020	793688000	14810	8345	7872
27143	2021	866000000	14927	8011	7693
27143	2022	895190000	14955	8052	7806
27145	2020	8576356000	158467	91692	86381
27145	2021	9248962000	159144	88990	85508
27145	2022	9511382000	160405	89288	86975
27147	2020	1872016000	37375	20653	19515
27147	2021	2075936000	37409	20397	19681
27147	2022	2051720000	37398	19175	18655
27149	2020	532675000	9666	5464	5285
27149	2021	581011000	9704	5330	5195
27149	2022	628433000	9637	5345	5233
27151	2020	512354000	9804	4902	4614
27151	2021	581622000	9781	4778	4590
27151	2022	651335000	9755	4828	4688
27153	2020	1101253000	25277	13865	13115
27153	2021	1372568000	25307	13463	12925
27153	2022	1422522000	25538	13502	13089
27155	2020	224333000	3361	1764	1685
27155	2021	246576000	3287	1664	1610
27155	2022	280409000	3275	1635	1596
27157	2020	1196495000	21400	12501	11826
27157	2021	1286749000	21514	12197	11798
27157	2022	1317378000	21658	12145	11845
27159	2020	614891000	14119	6044	5574
27159	2021	668605000	14184	6029	5743
27159	2022	667756000	14307	6041	5802
27161	2020	886758000	18964	9184	8604
27161	2021	1011951000	18992	8870	8497
27161	2022	1036431000	18893	8615	8331
27163	2020	19083842000	268372	145910	137630
27163	2021	20821872000	272610	142203	137649
27163	2022	22021692000	275912	144287	141152
27165	2020	555079000	11231	6693	6379
27165	2021	616045000	11158	6559	6348
27165	2022	631573000	11075	6528	6370
27167	2020	371699000	6482	3485	3339
27167	2021	431358000	6410	3409	3307
27167	2022	447957000	6350	3386	3314
27169	2020	2718119000	49640	28402	26982
27169	2021	2770423000	49750	28002	27142
27169	2022	2845380000	49478	28278	27692
27171	2020	8043861000	141860	77121	72792
27171	2021	8765457000	145143	75284	72728
27171	2022	9258972000	148003	76309	74427
27173	2020	578740000	9504	5334	5087
27173	2021	591103000	9446	5083	4923
27173	2022	627878000	9486	5025	4891
28001	2020	1164073000	29419	10438	9310
28001	2021	1314851000	28804	10550	9715
28001	2022	1292524000	28408	10452	9923
28003	2020	1449784000	34727	15125	14189
28003	2021	1521530000	34429	15096	14386
28003	2022	1538396000	34204	14959	14430
28005	2020	442658000	12699	4378	4016
28005	2021	488033000	12644	4372	4063
28005	2022	483968000	12619	4285	4066
28007	2020	703550000	17816	6845	6280
28007	2021	760989000	17706	6841	6437
28007	2022	752429000	17509	6837	6553
28009	2020	296250000	7661	2993	2748
28009	2021	321677000	7630	3031	2841
28009	2022	313118000	7550	3046	2900
28011	2020	1291230000	30827	11359	10386
28011	2021	1454664000	30180	11301	10543
28011	2022	1376573000	29370	11139	10619
28013	2020	525468000	13222	5518	5077
28013	2021	556929000	12936	5434	5155
28013	2022	515965000	12781	5374	5157
28015	2020	408961000	9930	3393	3134
28015	2021	444312000	9817	3428	3230
28015	2022	419323000	9731	3328	3180
28017	2020	655135000	17078	6872	6140
28017	2021	694846000	16973	6828	6411
28017	2022	655572000	16812	6561	6270
28019	2020	308053000	8208	3546	3323
28019	2021	336644000	8113	3553	3385
28019	2022	328461000	8037	3569	3441
28021	2020	310019000	9099	3066	2630
28021	2021	331745000	8898	2971	2638
28021	2022	308109000	8805	2914	2682
28023	2020	628582000	15546	5705	5230
28023	2021	662940000	15457	5659	5312
28023	2022	654220000	15271	5585	5328
28025	2020	795391000	18621	7825	6925
28025	2021	884298000	18500	8009	7461
28025	2022	875886000	18380	8670	8322
28027	2020	875519000	21230	8271	7256
28027	2021	963655000	20732	8030	7359
28027	2022	876319000	20197	7582	7168
28029	2020	1033465000	28268	10651	9782
28029	2021	1106684000	27927	10758	10079
28029	2022	1083565000	27719	10733	10271
28031	2020	720960000	18298	8230	7670
28031	2021	806412000	18250	8201	7787
28031	2022	810449000	18098	8197	7917
28033	2020	8782446000	186107	91132	85721
28033	2021	9809410000	189042	92707	88680
28033	2022	10020297000	191723	93460	90508
28035	2020	3137399000	78185	32449	29865
28035	2021	3347834000	77883	33227	31398
28035	2022	3303596000	78110	33275	32056
28037	2020	297948000	7665	2709	2487
28037	2021	312648000	7689	2655	2478
28037	2022	305949000	7642	2629	2491
28039	2020	921208000	24364	8859	8063
28039	2021	978371000	24793	8779	8187
28039	2022	976238000	25206	8741	8315
28041	2020	424524000	13530	4251	3843
28041	2021	456231000	13643	4197	3890
28041	2022	442476000	13552	4182	3947
28043	2020	838051000	21572	9156	8506
28043	2021	921775000	21312	9061	8617
28043	2022	897423000	21088	8886	8565
28045	2020	1881659000	46117	18578	17036
28045	2021	2066461000	46046	19045	17957
28045	2022	2045845000	46094	18973	18220
28047	2020	8725392000	208811	86545	78489
28047	2021	9709877000	209642	87492	82824
28047	2022	9752463000	211044	87323	84104
28049	2020	10047658000	226763	102105	92647
28049	2021	10465575000	222508	101749	95644
28049	2022	10201511000	217730	101368	97470
28051	2020	558281000	16879	5446	4576
28051	2021	616230000	16476	5184	4637
28051	2022	546972000	16121	5019	4695
28053	2020	303283000	7735	2183	1866
28053	2021	334895000	7548	2056	1807
28053	2022	289415000	7333	1949	1803
28055	2020	40820000	1325	327	298
28055	2021	46982000	1297	326	297
28055	2022	31175000	1273	313	290
28057	2020	925335000	23862	10160	9461
28057	2021	998651000	23866	10342	9904
28057	2022	981676000	23903	10208	9867
28059	2020	5946496000	143377	57736	52312
28059	2021	6626093000	144438	58648	55226
28059	2022	6656046000	144975	58521	56095
28061	2020	678155000	16352	5977	5449
28061	2021	732588000	16265	5799	5391
28061	2022	762277000	16167	5825	5539
28063	2020	263196000	7249	1960	1605
28063	2021	280316000	7156	1899	1600
28063	2022	266749000	7087	1877	1627
28065	2020	372844000	11271	3946	3572
28065	2021	407572000	11158	3899	3609
28065	2022	400833000	11088	3875	3685
28067	2020	2751138000	67163	25176	23413
28067	2021	2983227000	66839	24559	23189
28067	2022	3067011000	66569	24820	23820
28069	2020	317423000	8956	3314	3000
28069	2021	337843000	8781	3273	3037
28069	2022	320247000	8654	3236	3049
28071	2020	2565449000	55907	26302	24724
28071	2021	2798778000	56857	27633	26511
28071	2022	2851810000	57615	28016	27149
28073	2020	2818332000	64384	30397	28591
28073	2021	3142442000	65395	31343	30075
28073	2022	3188667000	65783	31649	30707
28075	2020	3209307000	72672	29233	27065
28075	2021	3387176000	71871	29044	27500
28075	2022	3340734000	70904	28711	27574
28077	2020	458362000	11982	4607	4212
28077	2021	506664000	11774	4651	4343
28077	2022	517528000	11713	4760	4541
28079	2020	740015000	21245	7935	7319
28079	2021	856272000	21247	7890	7454
28079	2022	883241000	21135	7817	7498
28081	2020	3928462000	83310	40843	37570
28081	2021	4351954000	83043	41259	39399
28081	2022	4317519000	82959	40555	39233
28083	2020	1192680000	28191	9769	8741
28083	2021	1370896000	27398	9796	9020
28083	2022	1241140000	26570	9365	8870
28085	2020	1438256000	34822	14297	13256
28085	2021	1549759000	34907	14774	14044
28085	2022	1548676000	34717	14764	14229
28087	2020	2561739000	58767	24657	22625
28087	2021	2786754000	58129	24633	23212
28087	2022	2779603000	57603	24478	23494
28089	2020	7544135000	109251	52354	48985
28089	2021	8455733000	109919	52790	50567
28089	2022	8823461000	111113	53152	51524
28091	2020	957649000	24370	9994	9293
28091	2021	1001175000	24271	10187	9656
28091	2022	998750000	24050	10114	9737
28093	2020	1385691000	33778	13972	12928
28093	2021	1501293000	33820	14176	13368
28093	2022	1455247000	34110	14201	13638
28095	2020	1389300000	34138	15474	14117
28095	2021	1501961000	33913	15749	14948
28095	2022	1456880000	33577	15487	14884
28097	2020	376128000	9796	3862	3556
28097	2021	410161000	9704	3851	3621
28097	2022	395260000	9530	3893	3731
28099	2020	1164000000	28988	10255	9313
28099	2021	1277858000	28863	9989	9435
28099	2022	1307910000	28673	9845	9424
28101	2020	783077000	21255	7946	7324
28101	2021	871033000	21117	8160	7722
28101	2022	847116000	21029	7944	7611
28103	2020	385930000	10228	3781	3366
28103	2021	457173000	10114	3586	3281
28103	2022	404012000	9990	3386	3189
28105	2020	1900029000	51698	21813	20156
28105	2021	2042146000	51808	22276	21066
28105	2022	2012179000	51427	22056	21176
28107	2020	1284983000	33171	12564	11350
28107	2021	1395289000	32919	12489	11630
28107	2022	1320256000	32661	12276	11715
28109	2020	2293569000	56198	22940	21303
28109	2021	2448154000	56505	23273	21987
28109	2022	2468421000	57261	23453	22569
28111	2020	408483000	11458	4135	3777
28111	2021	431916000	11490	4236	3965
28111	2022	412908000	11368	4245	4047
28113	2020	1373094000	40190	14414	13142
28113	2021	1506773000	39957	14316	13328
28113	2022	1439506000	39644	13987	13327
28115	2020	1203414000	31194	14852	13722
28115	2021	1332420000	31336	15026	14372
28115	2022	1301767000	31389	14816	14316
28117	2020	889782000	24962	11044	10290
28117	2021	958574000	24921	11257	10770
28117	2022	930766000	24792	11206	10840
28119	2020	219517000	6154	2331	2082
28119	2021	252241000	5911	2326	2135
28119	2022	217827000	5701	2299	2173
28121	2020	7608284000	157149	74306	70437
28121	2021	8326192000	158183	75411	72712
28121	2022	8539571000	158979	76286	74103
28123	2020	930603000	27968	12438	11717
28123	2021	1051813000	27650	12300	11736
28123	2022	1066376000	27707	12233	11810
28125	2020	163162000	3769	1452	1296
28125	2021	194212000	3648	1397	1272
28125	2022	160785000	3488	1302	1226
28127	2020	1054327000	25892	10373	9677
28127	2021	1154390000	25686	10511	9973
28127	2022	1159896000	25587	10553	10163
28129	2020	571855000	14194	6544	6170
28129	2021	641988000	14191	6570	6277
28129	2022	665619000	14092	6589	6353
28131	2020	682985000	18332	6845	6331
28131	2021	739144000	18589	6909	6539
28131	2022	734847000	18669	6897	6616
28133	2020	871736000	25853	7442	6626
28133	2021	962226000	25328	7291	6648
28133	2022	864810000	24811	7175	6771
28135	2020	454583000	12650	5093	4716
28135	2021	530029000	12302	4772	4487
28135	2022	462789000	12035	4641	4450
28137	2020	1148657000	28117	11951	11049
28137	2021	1258990000	28118	12073	11409
28137	2022	1226179000	28296	12104	11642
28139	2020	923354000	21732	9187	8552
28139	2021	962837000	21614	9412	8985
28139	2022	917669000	21431	9727	9404
28141	2020	736059000	18843	8251	7714
28141	2021	783674000	18732	8300	7926
28141	2022	787207000	18619	8417	8115
28143	2020	366379000	9723	4437	3775
28143	2021	415662000	9652	4247	3889
28143	2022	374925000	9458	4155	3972
28145	2020	1057462000	27810	13940	12960
28145	2021	1159267000	28001	14095	13533
28145	2022	1147512000	28125	14554	14136
28147	2020	483825000	13868	4920	4510
28147	2021	532533000	13804	4923	4591
28147	2022	517210000	13761	5005	4769
28149	2020	2015648000	44544	19918	18206
28149	2021	2111200000	43450	19418	18261
28149	2022	2050945000	42649	19361	18573
28151	2020	1838762000	44631	16207	14481
28151	2021	1992166000	43641	15650	14399
28151	2022	1849012000	42514	14638	13813
28153	2020	753772000	19803	7386	6752
28153	2021	841709000	19712	7278	6800
28153	2022	869612000	19681	7090	6755
28155	2020	413623000	9901	3839	3559
28155	2021	448835000	9981	3904	3696
28155	2022	437335000	9993	3873	3726
28157	2020	291758000	8524	2724	2372
28157	2021	305899000	8288	2736	2445
28157	2022	289263000	8143	2568	2408
28159	2020	692279000	17683	7263	6642
28159	2021	765066000	17608	7219	6787
28159	2022	767740000	17543	7135	6832
28161	2020	501672000	12443	4844	4469
28161	2021	532873000	12409	4887	4624
28161	2022	518549000	12364	4767	4579
28163	2020	905994000	26671	8972	8067
28163	2021	993578000	26432	8924	8296
28163	2022	908124000	25948	8841	8451
29001	2020	897501000	25269	10006	9489
29001	2021	929593000	25179	9757	9353
29001	2022	926270000	25165	9771	9468
29003	2020	850758000	18098	9672	9279
29003	2021	909555000	18009	9436	9160
29003	2022	919993000	18003	9325	9120
29005	2020	262722000	5308	2703	2593
29005	2021	280429000	5227	2615	2534
29005	2022	285716000	5182	2536	2474
29007	2020	1001953000	24798	10238	9636
29007	2021	1082963000	24824	10072	9716
29007	2022	1078091000	24434	9832	9528
29009	2020	1328150000	34541	15584	14557
29009	2021	1438301000	34733	14798	14149
29009	2022	1532506000	34926	14092	13692
29011	2020	473491000	11608	5133	4879
29011	2021	494138000	11649	5138	4972
29011	2022	513037000	11694	5159	5034
29013	2020	730454000	16045	7565	7156
29013	2021	760947000	16084	7584	7276
29013	2022	767116000	16177	7582	7369
29015	2020	809287000	19424	7187	6655
29015	2021	858679000	19916	7206	6814
29015	2022	885539000	20224	7133	6864
29017	2020	451393000	10559	5343	5039
29017	2021	474894000	10578	5270	5061
29017	2022	480631000	10518	5231	5089
29019	2020	9361588000	184035	95454	91342
29019	2021	10096387000	186075	97779	94984
29019	2022	10397138000	187690	99229	97207
29021	2020	3687194000	84460	43418	41255
29021	2021	3899375000	83655	42302	40759
29021	2022	3931201000	82911	41786	40747
29023	2020	1704432000	42059	18052	16906
29023	2021	1810129000	42150	17752	16952
29023	2022	1832888000	42179	17707	17165
29025	2020	378174000	8824	4220	3992
29025	2021	401343000	8896	4260	4052
29025	2022	406634000	8933	4215	4095
29027	2020	1916792000	44337	21283	20321
29027	2021	2019567000	44667	21308	20620
29027	2022	2045399000	44762	21406	20897
29029	2020	1970150000	42802	18672	17355
29029	2021	2353763000	43527	18972	18074
29029	2022	2186698000	43768	18983	18365
29031	2020	3774935000	81811	40217	38134
29031	2021	3975383000	82147	39864	38494
29031	2022	4114737000	82899	39967	39042
29033	2020	428679000	8468	4593	4336
29033	2021	474220000	8403	4449	4264
29033	2022	495245000	8423	4348	4230
29035	2020	222664000	5202	2508	2343
29035	2021	239766000	5339	2526	2401
29035	2022	244286000	5268	2462	2370
29037	2020	5561233000	108145	53617	50728
29037	2021	5945067000	109751	53991	51989
29037	2022	6150233000	110394	54571	53216
29039	2020	489914000	14210	5697	5439
29039	2021	526590000	14518	5706	5504
29039	2022	532683000	14601	5638	5480
29041	2020	350579000	7384	3719	3567
29041	2021	379350000	7361	3691	3574
29041	2022	377697000	7386	3655	3577
29043	2020	4073682000	89284	45426	43180
29043	2021	4439219000	91541	46230	44808
29043	2022	4609426000	93114	47079	46084
29045	2020	276881000	6661	3145	2953
29045	2021	294142000	6738	3081	2943
29045	2022	297393000	6723	2964	2866
29047	2020	13242010000	254112	135882	127530
29047	2021	14127061000	255860	137274	130854
29047	2022	14326486000	257033	137802	134241
29049	2020	967801000	21210	10458	9832
29049	2021	1009519000	21258	10573	10038
29049	2022	1023926000	21328	10548	10239
29051	2020	3987081000	76614	38606	36884
29051	2021	4208036000	76631	38631	37494
29051	2022	4330112000	76969	38856	38065
29053	2020	755307000	16648	7127	6734
29053	2021	825979000	16672	7001	6758
29053	2022	839506000	16772	7036	6862
29055	2020	918102000	23037	10747	10053
29055	2021	988159000	22818	10780	10314
29055	2022	993028000	22659	10685	10371
29057	2020	288138000	7587	3535	3380
29057	2021	312984000	7600	3501	3389
29057	2022	323867000	7660	3409	3331
29059	2020	622677000	17130	7049	6632
29059	2021	671953000	17371	7120	6826
29059	2022	695518000	17626	7162	6962
29061	2020	306567000	8425	4088	3914
29061	2021	316888000	8385	4052	3905
29061	2022	311475000	8435	3931	3832
29063	2020	401392000	11610	4185	3994
29063	2021	417801000	11708	4075	3925
29063	2022	421324000	11336	3998	3890
29065	2020	570047000	14389	6273	5967
29065	2021	597470000	14428	6196	5941
29065	2022	595010000	14467	6046	5850
29067	2020	412812000	11604	5118	4722
29067	2021	441962000	11754	5082	4873
29067	2022	440200000	11975	5094	4951
29069	2020	1090881000	28217	11474	10627
29069	2021	1208593000	27751	11092	10452
29069	2022	1203559000	27406	10845	10390
29071	2020	5171362000	104853	52341	49078
29071	2021	5484032000	105328	52223	50239
29071	2022	5712875000	105879	52534	51273
29073	2020	646280000	14760	7555	7118
29073	2021	680824000	14791	7512	7250
29073	2022	692769000	14768	7525	7348
29075	2020	297392000	6134	3378	3262
29075	2021	311363000	6169	3280	3196
29075	2022	306540000	6253	3152	3082
29077	2020	14292454000	299312	149004	140916
29077	2021	15165820000	301118	151144	146236
29077	2022	15752440000	303293	153877	150613
29079	2020	374666000	9761	4258	4061
29079	2021	399462000	9761	4124	3982
29079	2022	399371000	9838	4008	3899
29081	2020	336691000	8156	3771	3597
29081	2021	356582000	8170	3700	3574
29081	2022	356214000	8199	3669	3577
29083	2020	993664000	21974	9607	9036
29083	2021	1074567000	22221	9902	9525
29083	2022	1097195000	22438	10081	9809
29085	2020	305823000	8301	3850	3654
29085	2021	334820000	8594	3893	3744
29085	2022	337294000	8630	3979	3866
29087	2020	236479000	4184	2529	2443
29087	2021	245392000	4241	2450	2381
29087	2022	256865000	4262	2407	2361
29089	2020	446572000	10151	4784	4583
29089	2021	484309000	10128	4781	4631
29089	2022	486118000	10168	4683	4567
29091	2020	1525596000	39793	16128	15035
29091	2021	1616402000	39980	15901	15170
29091	2022	1649417000	40631	15786	15303
29093	2020	363956000	9514	3473	3225
29093	2021	385907000	9421	3433	3243
29093	2022	392675000	9414	3419	3277
29095	2020	35571512000	717572	355392	329479
29095	2021	37629231000	717616	356641	338282
29095	2022	38085664000	716531	357678	347080
29097	2020	5016577000	122878	55572	52375
29097	2021	5352606000	123325	56071	54062
29097	2022	5462719000	124075	56628	55261
29099	2020	10576264000	226927	116256	109125
29099	2021	11351631000	227934	116383	111905
29099	2022	11728900000	229336	117248	114377
29101	2020	2171132000	54018	22970	21651
29101	2021	2525171000	54170	22722	21762
29101	2022	2346297000	54368	22634	22013
29103	2020	154783000	3739	1737	1667
29103	2021	165371000	3787	1708	1657
29103	2022	163244000	3776	1678	1633
29105	2020	1410486000	36044	16651	15271
29105	2021	1526090000	36135	16257	15587
29105	2022	1585373000	36313	16341	15912
29107	2020	1518757000	33062	16434	15562
29107	2021	1627723000	32832	16544	15872
29107	2022	1651633000	32961	16627	16174
29109	2020	1406906000	37977	17552	16473
29109	2021	1513924000	38268	17187	16520
29109	2022	1561256000	38683	16923	16495
29111	2020	380234000	10039	4913	4670
29111	2021	409949000	9986	4763	4603
29111	2022	409319000	9891	4699	4587
29113	2020	2685896000	59849	28919	27125
29113	2021	2970436000	61654	29006	27735
29113	2022	3145226000	63155	29069	28278
29115	2020	510627000	11852	5029	4715
29115	2021	534165000	11843	5001	4740
29115	2022	534411000	11820	5042	4887
29117	2020	637786000	13988	7259	6985
29117	2021	677521000	14223	7142	6935
29117	2022	687150000	14402	7118	6972
29119	2020	744838000	23286	10451	9918
29119	2021	819555000	23428	10707	10322
29119	2022	882636000	23588	11050	10774
29121	2020	676333000	15197	7389	7030
29121	2021	725861000	15167	7237	6980
29121	2022	757878000	15049	7091	6904
29123	2020	495522000	12626	5433	5075
29123	2021	512601000	12671	5380	5152
29123	2022	521893000	12753	5312	5153
29125	2020	328408000	8452	3880	3689
29125	2021	346197000	8422	3850	3708
29125	2022	345157000	8431	3812	3712
29127	2020	1279413000	28480	14169	13480
29127	2021	1361328000	28502	13974	13509
29127	2022	1389186000	28438	13624	13291
29129	2020	127944000	3513	1855	1789
29129	2021	136302000	3469	1779	1728
29129	2022	128610000	3437	1677	1634
29131	2020	1017913000	24770	12223	11471
29131	2021	1079891000	24943	12427	11937
29131	2022	1102312000	25403	12641	12309
29133	2020	459086000	12130	5606	5303
29133	2021	502313000	12129	5339	5102
29133	2022	496397000	11688	5112	4943
29135	2020	670612000	15213	7071	6763
29135	2021	692215000	15284	7038	6811
29135	2022	724547000	15220	7011	6846
29137	2020	380026000	8686	3761	3537
29137	2021	415058000	8720	3736	3580
29137	2022	409911000	8652	3707	3604
29139	2020	512310000	11287	5683	5400
29139	2021	564044000	11429	5718	5514
29139	2022	569784000	11470	5761	5616
29141	2020	937814000	20990	8171	7655
29141	2021	951585000	21417	8340	7959
29141	2022	1036393000	21785	8255	8001
29143	2020	689609000	16331	8364	7871
29143	2021	794153000	16024	8196	7826
29143	2022	799680000	15695	8027	7779
29145	2020	2477037000	58684	26479	24926
29145	2021	2668750000	59437	26627	25656
29145	2022	2802824000	60011	26816	26144
29147	2020	801476000	21000	10666	10185
29147	2021	839337000	20984	10580	10277
29147	2022	854768000	20670	10834	10589
29149	2020	347908000	8611	3898	3630
29149	2021	370152000	8639	3781	3590
29149	2022	372104000	8732	3738	3616
29151	2020	650811000	13265	6986	6732
29151	2021	680686000	13409	6977	6802
29151	2022	708575000	13399	6988	6849
29153	2020	318411000	8520	3451	3198
29153	2021	341536000	8774	3393	3216
29153	2022	352813000	8940	3360	3230
29155	2020	630374000	15585	6236	5732
29155	2021	709983000	15225	5940	5532
29155	2022	692839000	14841	5693	5469
29157	2020	868080000	18969	9774	9224
29157	2021	915030000	18956	9651	9358
29157	2022	924419000	18858	9455	9250
29159	2020	1724914000	43001	20500	19095
29159	2021	1876450000	43206	20005	19107
29159	2022	1920437000	43353	19804	19276
29161	2020	1881937000	44560	19647	18700
29161	2021	1973332000	44949	19706	19001
29161	2022	1991671000	45313	19864	19356
29163	2020	685896000	17408	7429	7024
29163	2021	722117000	17602	7270	6996
29163	2022	731095000	17664	7164	6979
29165	2020	6448602000	107168	58524	55324
29165	2021	7133641000	108720	59022	56748
29165	2022	7572680000	110534	59554	58204
29167	2020	1238191000	31612	14232	13556
29167	2021	1329352000	32089	14466	13984
29167	2022	1380428000	32693	14625	14256
29169	2020	2366753000	54017	14467	13641
29169	2021	2417233000	53850	14331	13720
29169	2022	2353258000	53941	14406	13965
29171	2020	186919000	4690	2258	2157
29171	2021	198672000	4696	2202	2135
29171	2022	190039000	4666	2136	2085
29173	2020	461203000	10357	5589	5337
29173	2021	486613000	10378	5516	5335
29173	2022	493315000	10420	5363	5234
29175	2020	1065596000	24454	10081	9477
29175	2021	1178747000	24569	10112	9704
29175	2022	1186049000	24622	10125	9857
29177	2020	1057571000	23129	10720	9977
29177	2021	1097028000	23061	10889	10215
29177	2022	1098038000	23107	10824	10450
29179	2020	232284000	6077	2910	2745
29179	2021	245363000	6082	2884	2770
29179	2022	243218000	6006	2789	2705
29181	2020	452183000	10670	4989	4594
29181	2021	478365000	10619	4998	4737
29181	2022	487000000	10703	4986	4822
29183	2020	23631089000	406385	224352	212593
29183	2021	25543919000	410511	225168	217747
29183	2022	26716206000	413803	227459	222602
29185	2020	319015000	9351	3760	3524
29185	2021	347842000	9404	3779	3616
29185	2022	352066000	9576	3755	3642
29186	2020	813058000	18474	9151	8695
29186	2021	868856000	18571	9110	8811
29186	2022	881148000	18644	9206	8990
29187	2020	2569765000	66437	26153	24300
29187	2021	2751057000	67057	25601	24420
29187	2022	2814603000	66969	25335	24479
29189	2020	78990469000	1003056	519392	486284
29189	2021	87319292000	998227	520579	498480
29189	2022	92509949000	990414	522800	509543
29195	2020	969405000	23323	10517	10033
29195	2021	1043876000	23241	10277	9928
29195	2022	1060116000	23007	10178	9918
29197	2020	151472000	4010	1891	1780
29197	2021	159669000	4021	1817	1742
29197	2022	160314000	4002	1787	1732
29199	2020	194342000	4699	2366	2288
29199	2021	219815000	4679	2291	2233
29199	2022	219184000	4643	2244	2194
29201	2020	1705945000	38020	19772	18709
29201	2021	1849012000	37856	19898	19160
29201	2022	1903286000	37840	19697	19209
29203	2020	275591000	7028	3332	3088
29203	2021	290046000	7085	3312	3135
29203	2022	288744000	7193	3242	3120
29205	2020	264502000	6088	3017	2881
29205	2021	292266000	5957	2949	2855
29205	2022	293673000	5982	2915	2845
29207	2020	1150400000	28644	13138	12357
29207	2021	1316159000	28482	13121	12561
29207	2022	1353725000	28377	12944	12553
29209	2020	1375089000	31206	13111	11839
29209	2021	1472492000	31605	13345	12510
29209	2022	1509049000	32136	13313	12795
29211	2020	266685000	5987	2741	2621
29211	2021	269721000	5916	2614	2493
29211	2022	250642000	5840	2501	2429
29213	2020	2182278000	56057	25907	22576
29213	2021	2460946000	56334	25733	23904
29213	2022	2553137000	56821	25596	24531
29215	2020	839176000	24326	8904	8384
29215	2021	910744000	24893	8889	8503
29215	2022	913576000	25336	8935	8660
29217	2020	784384000	19669	9351	8936
29217	2021	830154000	19605	9249	8945
29217	2022	842094000	19651	9016	8782
29219	2020	1667616000	35740	18469	17407
29219	2021	1823157000	36529	18534	17804
29219	2022	1917843000	37260	18633	18153
29221	2020	816760000	23416	10041	9313
29221	2021	874103000	23444	9957	9472
29221	2022	881309000	23441	9973	9643
29223	2020	431506000	10933	4998	4688
29223	2021	454844000	10907	4788	4560
29223	2022	457252000	10792	4686	4513
29225	2020	1477752000	39002	17130	16206
29225	2021	1623929000	39580	17283	16717
29225	2022	1687819000	40335	17484	17087
29227	2020	80925000	1962	1165	1117
29227	2021	82481000	1969	1158	1130
29227	2022	81598000	1955	1139	1116
29229	2020	658842000	18211	7350	6833
29229	2021	717811000	18640	7497	7208
29229	2022	729225000	19156	7514	7301
29510	2020	15163500000	300483	149537	136427
29510	2021	15842025000	293562	148689	139850
29510	2022	15982697000	286578	147775	143010
30001	2020	490851000	9381	5101	4899
30001	2021	530323000	9532	5137	4992
30001	2022	592163000	9719	5330	5202
30003	2020	465571000	13082	4883	4530
30003	2021	466960000	12932	4683	4327
30003	2022	479492000	12851	4647	4437
30005	2020	228466000	7005	2277	2169
30005	2021	229114000	6982	2239	2151
30005	2022	254170000	6936	2201	2130
30007	2020	322799000	6857	2658	2492
30007	2021	363534000	7323	2670	2562
30007	2022	403194000	7793	2758	2662
30009	2020	621804000	10510	5653	5321
30009	2021	700847000	10862	5647	5451
30009	2022	761939000	11179	5815	5659
30011	2020	57531000	1408	649	631
30011	2021	53254000	1410	652	635
30011	2022	57595000	1382	675	661
30013	2020	4258036000	84402	38022	35799
30013	2021	4609262000	84498	37798	36533
30013	2022	4838950000	84864	39572	38522
30015	2020	267473000	5895	2479	2384
30015	2021	238775000	5916	2460	2392
30015	2022	323643000	5898	2452	2394
30017	2020	568640000	11863	6244	5945
30017	2021	596709000	11971	6252	6058
30017	2022	633130000	12032	6327	6169
30019	2020	94461000	1653	893	868
30019	2021	91587000	1669	871	854
30019	2022	104111000	1628	871	854
30021	2020	415381000	8923	4686	4428
30021	2021	423404000	8866	4518	4376
30021	2022	437369000	8830	4513	4405
30023	2020	415282000	9420	5088	4831
30023	2021	445753000	9506	5121	4953
30023	2022	455852000	9510	5342	5206
30025	2020	146612000	3028	1655	1590
30025	2021	147696000	2984	1621	1579
30025	2022	151747000	3011	1643	1616
30027	2020	523176000	11469	5863	5599
30027	2021	556955000	11609	5831	5637
30027	2022	596778000	11663	5854	5683
30029	2020	5822134000	104862	49895	46034
30029	2021	6674528000	108725	50942	48870
30029	2022	7055024000	111814	51914	50269
30031	2020	7686693000	119585	71113	67567
30031	2021	9350625000	123051	73930	72132
30031	2022	10102031000	124857	76778	75302
30033	2020	48855000	1170	748	728
30033	2021	40999000	1210	743	725
30033	2022	53319000	1218	757	735
30035	2020	563588000	13737	5527	4994
30035	2021	562943000	13743	5532	5152
30035	2022	608973000	13681	5657	5365
30037	2020	45669000	821	366	349
30037	2021	41966000	818	369	356
30037	2022	46806000	835	377	365
30039	2020	169379000	3308	1605	1476
30039	2021	187407000	3355	1629	1556
30039	2022	197779000	3502	1666	1600
30041	2020	799174000	16263	7632	7257
30041	2021	810313000	16175	7541	7303
30041	2022	875624000	16068	7512	7323
30043	2020	658745000	12140	5846	5551
30043	2021	732596000	12472	5899	5705
30043	2022	773833000	12826	6023	5865
30045	2020	106177000	2025	986	940
30045	2021	92963000	2052	945	919
30045	2022	112777000	2105	966	942
30047	2020	1356676000	31246	13783	12937
30047	2021	1495246000	32075	13990	13451
30047	2022	1562289000	32853	14275	13831
30049	2020	3823731000	71168	36845	35032
30049	2021	4225366000	72503	37204	36084
30049	2022	4391787000	73832	38130	37197
30051	2020	119122000	1956	974	948
30051	2021	106151000	1934	983	960
30051	2022	144962000	1972	969	945
30053	2020	826028000	19739	8140	7324
30053	2021	918898000	20571	8160	7678
30053	2022	965946000	21525	8586	8165
30055	2020	76632000	1730	961	934
30055	2021	82170000	1711	972	954
30055	2022	90556000	1709	967	949
30057	2020	556254000	8660	4698	4464
30057	2021	597725000	8944	4787	4634
30057	2022	670597000	9265	5102	4983
30059	2020	92230000	1922	962	917
30059	2021	90076000	1960	988	963
30059	2022	99440000	2013	1000	977
30061	2020	200200000	4565	1793	1613
30061	2021	221366000	4868	1873	1773
30061	2022	235414000	5058	1848	1751
30063	2020	6814562000	118337	64721	60696
30063	2021	7405590000	119806	64886	62678
30063	2022	7721261000	121041	67346	65553
30065	2020	224959000	4745	2347	2205
30065	2021	238839000	4912	2347	2248
30065	2022	257011000	5197	2343	2274
30067	2020	921047000	17224	9036	8372
30067	2021	1039533000	17531	9250	8919
30067	2022	1123839000	17790	9841	9563
30069	2020	18691000	500	272	263
30069	2021	13848000	522	272	264
30069	2022	17830000	524	270	262
30071	2020	177721000	4208	1900	1808
30071	2021	178635000	4216	1850	1779
30071	2022	190653000	4240	1804	1736
30073	2020	329169000	5879	2679	2549
30073	2021	319521000	6018	2636	2550
30073	2022	369026000	6078	2598	2529
30075	2020	68654000	1693	968	938
30075	2021	63184000	1707	979	953
30075	2022	70375000	1725	991	969
30077	2020	348990000	6941	2936	2800
30077	2021	336574000	7012	2956	2878
30077	2022	353941000	7051	2914	2835
30079	2020	55136000	1093	472	441
30079	2021	52995000	1101	490	472
30079	2022	58493000	1107	494	479
30081	2020	2332249000	44409	20904	19710
30081	2021	2672169000	46125	21307	20531
30081	2022	2852161000	47298	21714	21081
30083	2020	676868000	11531	5986	5603
30083	2021	692930000	11342	5855	5620
30083	2022	723489000	11237	5716	5560
30085	2020	426434000	10794	4462	4197
30085	2021	451363000	10808	4338	4154
30085	2022	462403000	10572	4296	4142
30087	2020	425733000	8305	3752	3542
30087	2021	427849000	8077	3585	3441
30087	2022	427238000	8088	3566	3438
30089	2020	507419000	12463	5103	4710
30089	2021	576307000	12975	5223	4969
30089	2022	597156000	13442	5358	5121
30091	2020	188571000	3536	1769	1684
30091	2021	186727000	3569	1782	1723
30091	2022	188837000	3564	1737	1702
30093	2020	1754224000	35201	17419	16280
30093	2021	1944632000	35554	17507	16866
30093	2022	2040096000	36068	17681	17156
30095	2020	558869000	8997	5389	5119
30095	2021	592440000	9026	5492	5332
30095	2022	625835000	9177	5401	5276
30097	2020	196562000	3670	1863	1797
30097	2021	208119000	3705	1901	1856
30097	2022	220603000	3715	1896	1857
30099	2020	329182000	6256	2798	2678
30099	2021	326269000	6282	2803	2714
30099	2022	383337000	6368	2768	2692
30101	2020	275025000	4970	2156	2051
30101	2021	254371000	5010	2051	1997
30101	2022	303144000	5082	2062	2019
30103	2020	41568000	758	342	330
30103	2021	33897000	769	348	338
30103	2022	39077000	758	346	338
30105	2020	376207000	7556	4094	3919
30105	2021	424292000	7556	4023	3896
30105	2022	447643000	7513	3965	3864
30107	2020	92375000	2083	765	711
30107	2021	88000000	2045	757	718
30107	2022	94793000	2032	748	720
30109	2020	41541000	937	452	429
30109	2021	42983000	935	427	412
30109	2022	42770000	919	446	435
30111	2020	9199659000	165196	83890	79362
30111	2021	10285474000	167397	84061	81373
30111	2022	10788735000	169852	87227	85085
31001	2020	1645878000	31177	17038	16351
31001	2021	1832855000	30990	16879	16459
31001	2022	1856883000	30970	17196	16843
31003	2020	435022000	6278	3932	3844
31003	2021	479044000	6292	3668	3605
31003	2022	433298000	6293	3662	3597
31005	2020	23097000	432	234	222
31005	2021	22933000	441	235	228
31005	2022	19291000	433	232	227
31007	2020	43441000	677	393	381
31007	2021	45155000	689	386	378
31007	2022	40296000	660	387	376
31009	2020	30502000	431	255	246
31009	2021	26875000	461	248	241
31009	2022	24760000	453	253	244
31011	2020	335719000	5359	2953	2879
31011	2021	406500000	5400	2938	2888
31011	2022	340177000	5385	3006	2955
31013	2020	566493000	10826	5409	5151
31013	2021	605612000	10647	5451	5311
31013	2022	589933000	10672	5319	5202
31015	2020	114474000	1805	1057	1027
31015	2021	137625000	1786	1028	1007
31015	2022	136752000	1741	1030	1008
31017	2020	185395000	2902	1421	1382
31017	2021	194485000	2912	1426	1392
31017	2022	182929000	2872	1424	1390
31019	2020	3067114000	50195	27871	26747
31019	2021	3174072000	50310	27972	27386
31019	2022	3254945000	50586	28257	27741
31021	2020	336130000	6721	3596	3456
31021	2021	393986000	6706	3590	3498
31021	2022	368702000	6755	3569	3491
31023	2020	437521000	8345	4626	4467
31023	2021	519817000	8425	4674	4568
31023	2022	506369000	8427	4706	4626
31025	2020	1533927000	26601	13481	12889
31025	2021	1706507000	27071	13487	13111
31025	2022	1747284000	27122	13583	13275
31027	2020	471173000	8372	4564	4439
31027	2021	569653000	8325	4633	4546
31027	2022	524023000	8371	4628	4547
31029	2020	265403000	3887	2289	2248
31029	2021	284175000	3829	2239	2202
31029	2022	273956000	3772	2280	2242
31031	2020	293289000	5454	3399	3315
31031	2021	313102000	5447	3447	3391
31031	2022	294869000	5464	3395	3339
31033	2020	465699000	9486	4290	4099
31033	2021	474765000	9502	4239	4115
31033	2022	481772000	9511	4228	4130
31035	2020	349323000	6105	3303	3195
31035	2021	405744000	6047	3246	3168
31035	2022	359782000	6049	3103	3035
31037	2020	520823000	10557	5676	5511
31037	2021	597492000	10474	5688	5574
31037	2022	583479000	10444	5755	5650
31039	2020	644710000	9008	4891	4766
31039	2021	698830000	8972	4907	4821
31039	2022	671021000	8929	4858	4772
31041	2020	585948000	10493	6428	6252
31041	2021	648054000	10476	6377	6270
31041	2022	613208000	10476	6362	6262
31043	2020	914836000	21552	10723	10204
31043	2021	1056246000	21256	10775	10433
31043	2022	1098776000	21042	10971	10684
31045	2020	363305000	8150	4986	4846
31045	2021	393767000	8131	4995	4896
31045	2022	378687000	8241	5024	4926
31047	2020	1162719000	24086	13453	12990
31047	2021	1250672000	23934	13489	13188
31047	2022	1259560000	23884	13640	13332
31049	2020	82346000	1831	966	936
31049	2021	86501000	1857	972	951
31049	2022	88789000	1902	1022	999
31051	2020	278958000	5582	2958	2860
31051	2021	318295000	5546	2972	2905
31051	2022	300898000	5464	3029	2969
31053	2020	1890321000	37110	20310	19593
31053	2021	2114615000	37120	20380	19882
31053	2022	2195848000	36997	20685	20273
31055	2020	37410823000	585386	302641	287163
31055	2021	40686190000	585467	301813	292356
31055	2022	43298830000	586327	303746	296286
31057	2020	140326000	1654	1168	1142
31057	2021	146916000	1630	1160	1141
31057	2022	140448000	1590	1178	1161
31059	2020	339752000	5572	3204	3114
31059	2021	390214000	5555	3284	3217
31059	2022	367538000	5553	3331	3273
31061	2020	173957000	2890	1482	1431
31061	2021	190798000	2891	1494	1461
31061	2022	174324000	2873	1548	1515
31063	2020	117605000	2504	1556	1511
31063	2021	145721000	2555	1566	1538
31063	2022	140918000	2633	1531	1500
31065	2020	245981000	4626	2616	2544
31065	2021	287848000	4611	2575	2524
31065	2022	273552000	4575	2538	2491
31067	2020	1105343000	21653	10977	10534
31067	2021	1307597000	21611	10887	10610
31067	2022	1378333000	21583	10849	10594
31069	2020	95619000	1886	1082	1043
31069	2021	100387000	1833	1113	1090
31069	2022	94721000	1837	1119	1098
31071	2020	92423000	1807	1161	1138
31071	2021	93943000	1832	1145	1122
31071	2022	87899000	1801	1140	1118
31073	2020	109916000	1895	1112	1084
31073	2021	125275000	1819	1200	1180
31073	2022	119017000	1808	1205	1183
31075	2020	33106000	615	419	411
31075	2021	31559000	577	424	418
31075	2022	28039000	576	416	410
31077	2020	127938000	2175	1240	1203
31077	2021	151634000	2184	1224	1200
31077	2022	138825000	2227	1245	1222
31079	2020	2925126000	62760	32250	30379
31079	2021	3296899000	62092	32416	31443
31079	2022	3353322000	62097	32852	32117
31081	2020	564799000	9404	4780	4601
31081	2021	637842000	9382	4842	4735
31081	2022	627629000	9429	4925	4830
31083	2020	186935000	3057	1753	1703
31083	2021	206773000	3097	1784	1749
31083	2022	192801000	3054	1810	1778
31085	2020	72982000	853	633	619
31085	2021	75690000	841	611	602
31085	2022	64830000	849	597	588
31087	2020	127608000	2622	1322	1276
31087	2021	155950000	2594	1317	1287
31087	2022	152455000	2598	1299	1270
31089	2020	594877000	10113	5770	5627
31089	2021	691369000	10081	5688	5583
31089	2022	634611000	10043	5676	5578
31091	2020	32957000	706	409	398
31091	2021	32379000	731	423	416
31091	2022	29855000	686	407	396
31093	2020	334939000	6484	3405	3256
31093	2021	376755000	6519	3430	3352
31093	2022	367511000	6515	3491	3423
31095	2020	367914000	7259	4237	4120
31095	2021	420879000	7160	4188	4109
31095	2022	410943000	7154	4186	4111
31097	2020	202696000	5292	2078	1996
31097	2021	234797000	5335	2001	1941
31097	2022	226948000	5287	2013	1960
31099	2020	407998000	6681	3843	3718
31099	2021	482770000	6662	3819	3747
31099	2022	458004000	6690	3731	3667
31101	2020	415191000	8325	4668	4518
31101	2021	448374000	8298	4657	4559
31101	2022	445252000	8269	4674	4593
31103	2020	50605000	759	585	572
31103	2021	47099000	787	584	574
31103	2022	46069000	787	548	537
31105	2020	175114000	3411	1987	1916
31105	2021	180903000	3405	1950	1905
31105	2022	182779000	3315	1950	1916
31107	2020	439902000	8396	4690	4547
31107	2021	497271000	8436	4670	4570
31107	2022	489419000	8336	4668	4570
31109	2020	17260040000	323144	178492	170896
31109	2021	19129727000	323420	177655	173130
31109	2022	19600428000	324756	179486	175851
31111	2020	1830132000	34534	18542	17807
31111	2021	2104894000	34078	18501	18075
31111	2022	2181601000	33685	18408	18031
31113	2020	39177000	715	476	464
31113	2021	37735000	684	470	462
31113	2022	35631000	675	483	473
31115	2020	37138000	603	409	396
31115	2021	39009000	598	404	395
31115	2022	37903000	599	410	400
31117	2020	26821000	397	443	432
31117	2021	22787000	382	432	424
31117	2022	20823000	372	434	427
31119	2020	1889687000	35521	19825	19058
31119	2021	2154846000	35360	19916	19416
31119	2022	2209345000	35368	19881	19492
31121	2020	401449000	7655	4084	3922
31121	2021	442554000	7670	4135	4035
31121	2022	426759000	7721	4195	4119
31123	2020	294107000	4553	2640	2545
31123	2021	318271000	4573	2635	2568
31123	2022	314516000	4527	2660	2608
31125	2020	149194000	3390	1976	1912
31125	2021	185262000	3380	1954	1915
31125	2022	158565000	3326	1960	1923
31127	2020	353440000	7085	3626	3496
31127	2021	410592000	7000	3636	3552
31127	2022	389047000	7035	3611	3532
31129	2020	235428000	4090	2478	2410
31129	2021	281367000	4063	2479	2431
31129	2022	256333000	4041	2488	2438
31131	2020	886932000	15897	8453	8150
31131	2021	949654000	16008	8537	8330
31131	2022	938149000	16198	8549	8368
31133	2020	130864000	2536	1503	1462
31133	2021	152416000	2540	1520	1491
31133	2022	141258000	2528	1492	1462
31135	2020	209480000	2863	1860	1826
31135	2021	256048000	2822	1858	1832
31135	2022	243535000	2829	1858	1829
31137	2020	533541000	8972	5012	4862
31137	2021	595384000	8933	4948	4857
31137	2022	560371000	8988	5006	4915
31139	2020	430891000	7340	4178	4041
31139	2021	542189000	7316	4162	4068
31139	2022	626943000	7332	4213	4137
31141	2020	1744016000	34283	17949	17282
31141	2021	1956217000	34282	18201	17791
31141	2022	1928041000	34296	18436	18079
31143	2020	292475000	5212	2947	2857
31143	2021	352520000	5159	2933	2876
31143	2022	336879000	5166	2925	2871
31145	2020	538574000	10686	5887	5695
31145	2021	588587000	10639	5849	5727
31145	2022	594130000	10573	5925	5816
31147	2020	420250000	7860	4240	4101
31147	2021	476475000	7783	4252	4146
31147	2022	451021000	7705	4158	4077
31149	2020	94899000	1266	889	870
31149	2021	99472000	1271	880	867
31149	2022	89280000	1245	898	884
31151	2020	661730000	14242	7379	7111
31151	2021	756364000	14052	7259	7084
31151	2022	732554000	14116	7211	7041
31153	2020	10496946000	191157	97950	93916
31153	2021	11610739000	193798	98031	95594
31153	2022	12192268000	196553	98999	96926
31155	2020	1288811000	22372	11388	10969
31155	2021	1479994000	22798	11425	11159
31155	2022	1506023000	23118	11493	11272
31157	2020	1779182000	36036	18289	17521
31157	2021	1875081000	35828	18092	17574
31157	2022	1899086000	35603	17973	17540
31159	2020	952120000	17614	8852	8485
31159	2021	1053902000	17584	8809	8580
31159	2022	1048987000	17692	8874	8693
31161	2020	285775000	5104	2735	2669
31161	2021	323195000	5086	2746	2694
31161	2022	350552000	4996	2781	2729
31163	2020	147202000	2956	1679	1625
31163	2021	178828000	2953	1687	1650
31163	2022	167793000	2980	1654	1620
31165	2020	76391000	1144	767	750
31165	2021	82210000	1151	766	752
31165	2022	74128000	1127	768	754
31167	2020	307915000	5822	3559	3439
31167	2021	350062000	5797	3593	3514
31167	2022	333797000	5717	3567	3500
31169	2020	294558000	5019	2790	2713
31169	2021	340759000	4906	2696	2649
31169	2022	324019000	4885	2706	2658
31171	2020	40620000	670	430	413
31171	2021	40883000	676	432	421
31171	2022	44374000	671	456	445
31173	2020	327609000	6752	3128	2965
31173	2021	377945000	6595	3197	3086
31173	2022	369036000	6507	3237	3136
31175	2020	240204000	4055	2141	2080
31175	2021	259226000	4074	2108	2062
31175	2022	246836000	4073	2111	2068
31177	2020	1269300000	20928	11271	10856
31177	2021	1416383000	20993	11304	11032
31177	2022	1477407000	21167	11412	11185
31179	2020	447928000	9694	5714	5552
31179	2021	516046000	9843	5718	5603
31179	2022	511259000	9871	5725	5611
31181	2020	186718000	3390	1663	1601
31181	2021	198908000	3393	1652	1617
31181	2022	189138000	3336	1673	1635
31183	2020	54858000	775	569	558
31183	2021	53153000	787	554	547
31183	2022	44392000	785	560	552
31185	2020	755111000	14103	7329	7081
31185	2021	869567000	14248	7301	7152
31185	2022	870178000	14354	7418	7272
32001	2020	1277265000	25568	11079	10434
32001	2021	1420593000	25671	11071	10704
32001	2022	1400858000	25843	10951	10571
32003	2020	119563676000	2274734	1106244	934905
32003	2021	134011250000	2295194	1097878	1011808
32003	2022	137403632000	2322985	1150663	1083926
32005	2020	4226734000	49522	22177	20175
32005	2021	4751159000	49969	21900	20961
32005	2022	4977474000	49628	22290	21431
32007	2020	2698820000	53670	26179	24606
32007	2021	2877927000	53811	25662	24864
32007	2022	2920991000	54046	25746	24942
32009	2020	35100000	732	418	396
32009	2021	46969000	733	422	407
32009	2022	44920000	744	414	400
32011	2020	89980000	1853	1022	985
32011	2021	91949000	1909	1049	1024
32011	2022	92462000	1863	1006	978
32013	2020	877387000	17276	8026	7620
32013	2021	952139000	17591	8131	7871
32013	2022	940147000	17272	7832	7583
32015	2020	392104000	5726	3137	2981
32015	2021	423703000	5762	3144	3038
32015	2022	424092000	5766	3038	2939
32017	2020	217738000	4448	2031	1926
32017	2021	227353000	4433	2126	2059
32017	2022	217685000	4482	2049	1971
32019	2020	2615023000	59466	22713	20664
32019	2021	2842019000	60927	23299	22158
32019	2022	2878176000	61585	23568	22454
32021	2020	214754000	4557	2113	1990
32021	2021	223364000	4615	2050	1976
32021	2022	214936000	4525	1667	1589
32023	2020	2085919000	51960	17420	15639
32023	2021	2285465000	53277	17128	16134
32023	2022	2356607000	54738	17750	16779
32027	2020	244106000	6622	2568	2442
32027	2021	267778000	6442	2597	2513
32027	2022	257606000	6462	2501	2414
32029	2020	279235000	4106	2016	1843
32029	2021	320507000	4145	2044	1955
32029	2022	325291000	4170	2088	2007
32031	2020	31752592000	487674	248602	228136
32031	2021	37242958000	494281	251993	241814
32031	2022	38784839000	496745	256315	247689
32033	2020	484383000	9051	4556	4360
32033	2021	517902000	8846	4594	4464
32033	2022	503756000	8788	4512	4379
32510	2020	3214408000	58683	25644	23415
32510	2021	3503024000	58796	25355	24212
32510	2022	3547426000	58130	25216	24243
33001	2020	4376543000	63775	30981	28824
33001	2021	4601505000	64612	30908	29800
33001	2022	4733706000	64781	30876	30170
33003	2020	3317972000	50235	23032	21263
33003	2021	3629323000	51725	23103	22247
33003	2022	3710382000	52199	23222	22674
33005	2020	4400832000	76541	39670	37222
33005	2021	5008433000	76821	39314	37847
33005	2022	4824273000	77350	39128	38171
33007	2020	1537973000	31227	14255	13125
33007	2021	1658422000	31411	14280	13669
33007	2022	1652012000	31504	14249	13815
33009	2020	6299573000	91177	47961	45149
33009	2021	6731642000	90474	48232	46672
33009	2022	6855914000	91126	48551	47531
33011	2020	28018649000	422883	240323	223541
33011	2021	29643657000	424496	236253	227995
33011	2022	30613013000	426594	239052	233468
33013	2020	9903093000	154022	82544	77741
33013	2021	10386209000	154591	81134	78601
33013	2022	10720636000	156020	82076	80383
33015	2020	25696512000	314603	186331	173201
33015	2021	27795019000	318214	184416	178235
33015	2022	28968183000	319424	187161	182773
33017	2020	7483507000	131055	73359	68752
33017	2021	7965489000	131534	72707	70386
33017	2022	8232006000	132275	73343	71801
33019	2020	2547367000	43069	22967	21720
33019	2021	2777150000	43627	22859	22124
33019	2022	2811792000	43958	22675	22190
34001	2020	14677214000	274172	123593	102446
34001	2021	15778937000	275130	121913	109815
34001	2022	15413028000	275638	122428	115832
34003	2020	84358030000	953617	494407	449064
34003	2021	90383200000	954879	492834	461561
34003	2022	92572219000	952997	504861	487201
34005	2020	30177389000	461648	238216	219308
34005	2021	32331893000	464411	240563	226911
34005	2022	32836141000	466103	246708	238085
34007	2020	29718047000	523074	263515	237908
34007	2021	31983569000	524124	264992	246076
34007	2022	31751272000	524907	269575	258219
34009	2020	6542215000	95040	45738	39457
34009	2021	7034972000	95768	47078	42700
34009	2022	6846399000	95634	47265	44058
34011	2020	6762503000	153692	68333	61223
34011	2021	7311328000	152089	68506	62962
34011	2022	7082126000	151356	69010	65338
34013	2020	58351749000	859924	387334	343775
34013	2021	63950732000	854121	385589	353407
34013	2022	64504533000	849477	388290	369991
34015	2020	17684552000	302554	156240	142271
34015	2021	18989435000	304620	157201	147161
34015	2022	19133365000	306601	160615	154432
34017	2020	46668857000	721832	372954	335061
34017	2021	51146832000	703447	370608	344250
34017	2022	51155489000	703366	377810	363504
34019	2020	12009432000	128786	65809	61260
34019	2021	12726403000	129668	66288	63053
34019	2022	13242918000	129777	68058	65989
34021	2020	28137302000	386441	210967	195728
34021	2021	29799059000	382116	211612	199908
34021	2022	30209069000	380688	215471	208265
34023	2020	55848432000	861314	447228	409340
34023	2021	60303844000	862328	452424	424923
34023	2022	61118860000	861418	462334	446142
34025	2020	55656459000	642771	336742	307993
34025	2021	58981569000	646392	339979	319991
34025	2022	60790515000	644098	347680	335679
34027	2020	51243502000	508384	261177	241666
34027	2021	54954469000	510444	262393	248469
34027	2022	57042676000	511151	268634	260117
34029	2020	36360846000	638422	289318	263012
34029	2021	38585418000	649741	291725	273243
34029	2022	38906205000	655735	298173	286624
34031	2020	28022722000	523406	253066	222385
34031	2021	30038687000	518345	250241	228485
34031	2022	29328889000	513936	253380	241287
34033	2020	3370402000	64842	30607	27781
34033	2021	3582567000	65058	30398	28050
34033	2022	3532590000	65117	30632	29159
34035	2020	35615970000	344725	174098	161076
34035	2021	37004662000	346331	175044	165578
34035	2022	38417397000	346875	179197	173376
34037	2020	9653621000	143915	76179	69295
34037	2021	10237523000	145645	76084	71299
34037	2022	10470040000	146084	77614	74621
34039	2020	40544459000	573617	285280	258049
34039	2021	43123901000	572810	285153	265193
34039	2022	43656824000	569815	289422	277712
34041	2020	6490663000	109513	57587	52883
34041	2021	6846171000	110494	58190	54760
34041	2022	6979621000	110926	59058	56933
35001	2020	33882675000	676803	327232	302519
35001	2021	36820728000	674980	333979	312357
35001	2022	37353443000	672508	338098	325772
35003	2020	135822000	3611	1141	1061
35003	2021	145050000	3726	1174	1097
35003	2022	151011000	3827	1201	1142
35005	2020	2807080000	65148	27499	25396
35005	2021	3015428000	64644	27857	25822
35005	2022	3053649000	63894	27534	26348
35006	2020	868532000	27102	8931	8151
35006	2021	921878000	27238	8751	7901
35006	2022	921250000	26950	8215	7762
35007	2020	550878000	12353	5076	4735
35007	2021	605590000	12356	5526	5176
35007	2022	615787000	12246	5335	5125
35009	2020	2339337000	48370	21832	20702
35009	2021	2461687000	47960	22200	21045
35009	2022	2551319000	47532	22276	21551
35011	2020	90628000	1683	692	661
35011	2021	90679000	1679	687	650
35011	2022	94895000	1693	724	699
35013	2020	8993528000	220047	96511	88977
35013	2021	10118335000	221655	98454	91646
35013	2022	10130839000	223337	99295	94887
35015	2020	3679704000	62329	32925	30794
35015	2021	3950210000	60899	31484	29396
35015	2022	4074383000	60400	31250	30199
35017	2020	1242531000	28203	11727	10738
35017	2021	1360338000	27892	11456	10595
35017	2022	1437371000	27686	11589	11108
35019	2020	168832000	4440	1487	1392
35019	2021	193715000	4432	1601	1483
35019	2022	184281000	4310	1442	1360
35021	2020	28691000	655	275	264
35021	2021	28126000	636	281	267
35021	2022	29004000	628	281	271
35023	2020	196146000	4166	1906	1801
35023	2021	205539000	4090	1888	1780
35023	2022	212600000	4003	1894	1829
35025	2020	3399530000	74635	28930	25917
35025	2021	3487606000	73103	27977	25242
35025	2022	3827278000	72452	29141	27846
35027	2020	935989000	20313	8644	7910
35027	2021	1018710000	20421	8773	8091
35027	2022	1025707000	20411	8846	8487
35028	2020	1480995000	19415	9759	9413
35028	2021	1601898000	19340	10011	9689
35028	2022	1661557000	19187	10579	10345
35029	2020	910455000	25447	10129	8576
35029	2021	988947000	25486	10140	8593
35029	2022	963336000	25749	9845	8861
35031	2020	2321360000	72578	23494	21198
35031	2021	2517057000	71484	23301	20984
35031	2022	2437786000	69830	22516	21210
35033	2020	205109000	4192	2023	1869
35033	2021	211548000	4203	1990	1859
35033	2022	215904000	4169	1937	1829
35035	2020	2638642000	67873	25111	23128
35035	2021	2877044000	68538	25262	23531
35035	2022	2880438000	68823	25081	24031
35037	2020	355387000	8712	3022	2810
35037	2021	383538000	8624	2948	2729
35037	2022	403461000	8546	2989	2859
35039	2020	1571221000	40269	16413	15158
35039	2021	1718903000	40249	16486	15271
35039	2022	1738099000	40048	16453	15729
35041	2020	840940000	19157	7795	7342
35041	2021	884346000	19017	7858	7393
35041	2022	939714000	18934	7825	7522
35043	2020	7135497000	149276	66278	61017
35043	2021	7860544000	151439	67645	63001
35043	2022	8157706000	153501	68101	65497
35045	2020	4739467000	121368	49768	45109
35045	2021	5200944000	120866	49182	45071
35045	2022	5236874000	120418	49438	47141
35047	2020	1106738000	27129	10383	9579
35047	2021	1207441000	27167	10347	9557
35047	2022	1224848000	26953	10308	9794
35049	2020	9783768000	155041	70713	65291
35049	2021	11335203000	155404	72300	67643
35049	2022	11635970000	155664	72251	69627
35051	2020	519831000	11563	4050	3697
35051	2021	562722000	11498	4094	3751
35051	2022	556205000	11436	3941	3705
35053	2020	647132000	16558	6132	5723
35053	2021	695681000	16303	6194	5783
35053	2022	696763000	16115	6083	5817
35055	2020	1419851000	34459	14622	13034
35055	2021	1608375000	34700	14728	13380
35055	2022	1617742000	34580	14745	14016
35057	2020	593366000	15054	5295	4823
35057	2021	648012000	15318	5407	4965
35057	2022	667837000	15454	5505	5209
35059	2020	164610000	4072	1622	1544
35059	2021	172166000	4097	1565	1494
35059	2022	172208000	3980	1575	1529
35061	2020	3028933000	76369	30081	27772
35061	2021	3350265000	77233	30873	28667
35061	2022	3433741000	78080	31119	29772
36001	2020	21610081000	313987	159599	148570
36001	2021	23219393000	316301	157766	150727
36001	2022	23093599000	315811	158683	153760
36003	2020	1976903000	47320	19452	17943
36003	2021	1978492000	46921	19163	18191
36003	2022	1928302000	46694	19028	18242
36005	2020	60256805000	1461125	613070	514858
36005	2021	62556538000	1421089	614132	528957
36005	2022	56151391000	1379946	603376	555806
36007	2020	9390702000	198126	83619	76645
36007	2021	9965417000	198703	82132	77785
36007	2022	9624515000	197117	82021	78855
36009	2020	3432270000	76992	33738	30661
36009	2021	3558713000	76650	33127	31353
36009	2022	3483714000	76439	32681	31333
36011	2020	3751001000	76198	36143	33395
36011	2021	3925136000	75791	35482	33785
36011	2022	3878417000	74998	35353	34112
36013	2020	5694356000	127578	54000	49387
36013	2021	6014110000	126785	53344	50354
36013	2022	5832466000	126027	52852	50751
36015	2020	4118178000	83945	36033	32996
36015	2021	4290383000	82830	34850	33005
36015	2022	4204007000	81426	34610	33313
36017	2020	2225031000	47067	22189	20716
36017	2021	2329661000	46637	21943	20967
36017	2022	2289831000	46458	21798	21068
36019	2020	3872405000	79761	36208	33432
36019	2021	4074216000	79996	35492	33823
36019	2022	4026854000	78753	35509	34304
36021	2020	3948248000	61403	30972	29126
36021	2021	4241526000	62039	30463	29281
36021	2022	4240167000	61286	30401	29549
36023	2020	2160913000	46750	22854	21093
36023	2021	2245760000	46489	22466	21318
36023	2022	2197810000	46126	22551	21678
36025	2020	1986820000	44221	19018	17692
36025	2021	2111148000	44753	18746	17850
36025	2022	2053574000	44740	18419	17726
36027	2020	18856816000	295398	145036	134383
36027	2021	20045956000	298039	143707	137228
36027	2022	20374217000	297545	145356	140829
36029	2020	52485608000	952598	446586	405707
36029	2021	55256800000	954350	440742	416660
36029	2022	54594961000	950312	443121	426888
36031	2020	1910934000	37326	16906	15574
36031	2021	2042421000	37292	16786	15977
36031	2022	1976814000	36910	16539	15937
36033	2020	2152949000	47565	19507	17955
36033	2021	2318725000	47040	19230	18304
36033	2022	2283376000	46373	18876	18184
36035	2020	2545190000	53132	22975	21075
36035	2021	2688968000	53055	22454	21200
36035	2022	2644102000	52669	22353	21450
36037	2020	2806763000	58313	29610	27513
36037	2021	2901871000	57988	29471	28194
36037	2022	2834113000	57535	29566	28621
36039	2020	2563582000	47912	20632	18984
36039	2021	2737625000	48493	20376	19349
36039	2022	2704441000	48061	20246	19516
36041	2020	273568000	5073	2199	2029
36041	2021	285999000	5114	2212	2111
36041	2022	277320000	5118	2186	2090
36043	2020	2875477000	60024	28065	25851
36043	2021	3054528000	60082	27585	25967
36043	2022	2951847000	59822	27340	26251
36045	2020	5843908000	116273	44233	40513
36045	2021	6160986000	117680	43904	41648
36045	2022	6035804000	116637	43990	42182
36047	2020	149632137000	2719044	1202125	1052319
36047	2021	163526385000	2637486	1207334	1081803
36047	2022	155826107000	2590516	1207908	1136159
36049	2020	1359373000	26551	11644	10775
36049	2021	1438467000	26745	11584	10991
36049	2022	1440472000	26699	11650	11175
36051	2020	3044982000	61728	30352	28277
36051	2021	3108144000	61629	30007	28682
36051	2022	3092233000	61516	30200	29184
36053	2020	3532284000	67927	33052	30557
36053	2021	3767672000	67397	32437	30938
36053	2022	3752358000	67097	32611	31484
36055	2020	43288355000	757790	366956	336893
36055	2021	45304149000	756547	362432	343509
36055	2022	44635928000	752035	363686	350887
36057	2020	2255454000	49485	22517	20618
36057	2021	2374041000	49611	22065	20808
36057	2022	2327769000	49623	22175	21259
36059	2020	127691559000	1390559	712663	655369
36059	2021	135153796000	1391112	713300	681033
36059	2022	138184076000	1383726	727435	706044
36061	2020	272490074000	1677306	896451	811056
36061	2021	305682670000	1578801	904495	833890
36061	2022	298260631000	1596273	918234	875652
36063	2020	10651490000	212125	99542	89502
36063	2021	11040064000	211891	97351	91822
36063	2022	10912318000	210880	97827	94010
36065	2020	11479417000	231575	102757	94725
36065	2021	12088387000	229942	100451	95280
36065	2022	11816953000	228846	100071	96450
36067	2020	27406412000	474316	224981	206935
36067	2021	28775144000	472094	221382	210380
36067	2022	28288828000	468249	222271	214753
36069	2020	6586531000	112327	55882	51990
36069	2021	6977839000	112660	55292	52894
36069	2022	6974921000	112707	55665	53924
36071	2020	22200118000	401088	187228	172265
36071	2021	23309534000	404997	186040	177197
36071	2022	23599824000	405941	190509	184299
36073	2020	1781842000	40225	17412	16007
36073	2021	1848316000	39711	17078	16183
36073	2022	1784726000	39318	17104	16447
36075	2020	5373937000	117440	53129	48538
36075	2021	5663382000	118124	52208	49299
36075	2022	5592469000	118287	52456	50279
36077	2020	2948827000	58377	27159	25275
36077	2021	3100814000	60758	26975	25750
36077	2022	3008666000	60636	26941	25991
36079	2020	7375761000	97632	51374	47668
36079	2021	7693323000	98176	50882	48734
36079	2022	7873943000	98045	51592	50049
36081	2020	123924022000	2388586	1142439	1000240
36081	2021	131104608000	2328141	1140450	1028039
36081	2022	123608097000	2278029	1140072	1079845
36083	2020	8635933000	160900	82193	76661
36083	2021	9044922000	160740	81376	77764
36083	2022	8947880000	159853	81856	79295
36085	2020	29337598000	494586	221561	198280
36085	2021	31069191000	493484	223872	203690
36085	2022	30680773000	491133	226890	214276
36087	2020	21670218000	337394	156371	144312
36087	2021	22766718000	339256	155696	148767
36087	2022	23005986000	339022	159358	154732
36089	2020	4629889000	108554	43848	40394
36089	2021	4910357000	108410	43269	41016
36089	2022	4775637000	107733	42695	40894
36091	2020	16341817000	235794	121791	113947
36091	2021	17705339000	237962	120216	115584
36091	2022	17907537000	238797	121104	117811
36093	2020	8468459000	159315	78486	72431
36093	2021	9146315000	160214	77334	73486
36093	2022	9157071000	160093	77582	74955
36095	2020	1446384000	29752	14831	13817
36095	2021	1513237000	30152	14630	13952
36095	2022	1488615000	30063	14718	14173
36097	2020	845482000	17863	8208	7524
36097	2021	883581000	17800	8115	7710
36097	2022	862081000	17650	8029	7727
36099	2020	1491790000	33747	15568	14350
36099	2021	1572965000	33576	15133	14410
36099	2022	1532535000	32882	14771	14284
36101	2020	4783496000	93314	42794	39426
36101	2021	5061100000	93105	41732	39625
36101	2022	5023239000	92599	41212	39687
36103	2020	119779436000	1521950	781583	718094
36103	2021	126177083000	1533118	781899	745778
36103	2022	128446201000	1525465	798630	773162
36105	2020	4004199000	78605	36583	33513
36105	2021	4297988000	79694	36438	34638
36105	2022	4337477000	79658	37348	36103
36107	2020	2412220000	48352	22602	20901
36107	2021	2490049000	48087	22169	21174
36107	2022	2428017000	47772	22181	21452
36109	2020	5036291000	99784	49677	46779
36109	2021	5358130000	106044	49565	47684
36109	2022	5361286000	104777	49504	48089
36111	2020	10586115000	181627	87714	80952
36111	2021	11247096000	183704	86975	82863
36111	2022	11353095000	182319	87437	84618
36113	2020	3837638000	65618	31475	28911
36113	2021	4024834000	65773	31174	29625
36113	2022	3984652000	65599	31078	29981
36115	2020	2783654000	61202	27668	25748
36115	2021	2949442000	60975	27517	26234
36115	2022	2900494000	60841	27367	26460
36117	2020	4689180000	91193	43705	40589
36117	2021	4950463000	91201	43105	41147
36117	2022	4905902000	91125	43303	41886
36119	2020	111499045000	1001431	487399	448279
36119	2021	119793619000	999607	485835	462281
36119	2022	122841607000	990427	496415	480605
36121	2020	1855661000	40427	18239	16919
36121	2021	2001841000	40017	17977	17155
36121	2022	1993374000	39666	17419	16796
36123	2020	1133238000	24720	11814	11073
36123	2021	1209687000	24634	11600	11148
36123	2022	1206864000	24451	11619	11270
37001	2020	7604373000	171954	78631	73052
37001	2021	8383946000	173876	80769	76817
37001	2022	8637798000	176353	83565	80446
37003	2020	1532957000	36482	17060	15797
37003	2021	1679287000	36467	17320	16577
37003	2022	1753845000	36512	17930	17347
37005	2020	452806000	10897	4090	3795
37005	2021	491524000	11066	4213	4013
37005	2022	497328000	11185	4462	4284
37007	2020	926087000	22033	10067	9306
37007	2021	1053552000	22254	10052	9409
37007	2022	1114244000	22202	10244	9791
37009	2020	1082608000	26580	12198	11445
37009	2021	1178977000	26764	12551	12039
37009	2022	1204592000	27110	12885	12444
37011	2020	716787000	17848	7067	6627
37011	2021	781897000	17502	7325	7026
37011	2022	802164000	17571	7681	7427
37013	2020	2218597000	44690	18773	17598
37013	2021	2427989000	44438	19383	18426
37013	2022	2415209000	44272	19716	18923
37015	2020	739535000	17862	7351	6888
37015	2021	847998000	17425	7132	6700
37015	2022	851818000	17240	7163	6811
37017	2020	1275264000	29629	14008	13006
37017	2021	1437278000	29565	14175	13342
37017	2022	1425899000	29446	14544	13907
37019	2020	7438414000	138157	51602	47121
37019	2021	8342881000	144814	53830	50546
37019	2022	8920659000	153064	57142	54444
37021	2020	14252553000	269694	133001	122139
37021	2021	15999747000	271719	136131	130348
37021	2022	16842122000	273589	142267	138014
37023	2020	3598964000	87577	38460	35731
37023	2021	3866967000	87634	39354	37536
37023	2022	3922258000	87881	40681	39260
37025	2020	11204539000	227214	106769	99509
37025	2021	12254399000	231726	109954	105068
37025	2022	12910767000	235797	116084	112114
37027	2020	3233059000	80632	34466	31780
37027	2021	3560497000	80561	35147	33389
37027	2022	3602876000	80492	36235	34920
37029	2020	544477000	10407	4429	4187
37029	2021	596711000	10816	4498	4313
37029	2022	630978000	11088	4694	4514
37031	2020	3889079000	67724	30215	28347
37031	2021	4270026000	68718	31036	29722
37031	2022	4407792000	69380	32165	31037
37033	2020	865429000	22699	9357	8642
37033	2021	945975000	22701	9378	8870
37033	2022	930684000	22614	9630	9237
37035	2020	7874013000	160892	75482	69544
37035	2021	8684925000	161821	76606	72986
37035	2022	9026785000	163462	79114	76349
37037	2020	5387990000	76670	34830	32995
37037	2021	5998165000	78111	35559	34229
37037	2022	6370657000	79864	37442	36273
37039	2020	1054405000	28858	10616	9784
37039	2021	1157460000	29195	10553	10013
37039	2022	1181099000	29512	11100	10648
37041	2020	626590000	13701	5281	4962
37041	2021	698348000	13791	5470	5193
37041	2022	711004000	13940	5798	5563
37043	2020	452232000	11142	3959	3669
37043	2021	496725000	11350	3945	3744
37043	2022	508148000	11614	4190	4022
37045	2020	4069493000	99799	46936	43311
37045	2021	4468932000	100318	47529	44980
37045	2022	4542813000	100670	49037	47129
37047	2020	2006644000	50487	21855	20110
37047	2021	2210981000	49953	22253	20851
37047	2022	2200396000	49885	23539	22522
37049	2020	4979472000	100646	39679	37123
37049	2021	5414079000	100277	40818	38875
37049	2022	5480226000	100874	42075	40508
37051	2020	14229547000	334391	123239	111805
37051	2021	15513865000	337249	125099	116485
37051	2022	15496282000	336699	127611	121003
37053	2020	1501909000	28401	14001	13150
37053	2021	1703632000	29714	14195	13601
37053	2022	1841717000	31015	14704	14187
37055	2020	2390184000	37032	19031	17172
37055	2021	2732647000	37889	19596	18427
37055	2022	2888465000	37956	19999	19129
37057	2020	7441886000	169196	77355	71988
37057	2021	8198969000	170794	78573	74924
37057	2022	8374362000	172586	81375	78484
37059	2020	2273876000	42895	19687	18380
37059	2021	2567999000	43614	19998	19121
37059	2022	2670944000	44090	20745	20035
37061	2020	2148524000	48657	24000	22671
37061	2021	2553546000	48606	24076	22986
37061	2022	2584731000	48990	24833	23919
37063	2020	17571636000	325561	168718	158074
37063	2021	19072781000	329699	170530	163236
37063	2022	19651318000	332680	179018	173285
37065	2020	1971859000	48777	19917	17841
37065	2021	2132625000	48370	20260	18546
37065	2022	2101422000	48301	20203	18862
37067	2020	19796963000	383166	179529	166480
37067	2021	21730970000	386172	182288	173169
37067	2022	22485752000	389157	188496	181410
37069	2020	2889188000	69115	30644	28606
37069	2021	3287290000	71798	31984	30447
37069	2022	3453402000	74539	33999	32749
37071	2020	10239160000	228514	106393	98013
37071	2021	11277151000	231337	109190	103494
37071	2022	11634395000	234215	114695	110438
37073	2020	466098000	10448	4864	4588
37073	2021	514266000	10403	4956	4737
37073	2022	517593000	10383	5128	4947
37075	2020	315716000	8035	2977	2685
37075	2021	341343000	8008	2997	2789
37075	2022	329858000	7980	2953	2793
37077	2020	2607295000	61060	28792	27143
37077	2021	2834055000	61408	29145	27946
37077	2022	2903609000	61903	30234	29262
37079	2020	716985000	20440	9196	8684
37079	2021	802655000	20261	9287	8895
37079	2022	787485000	20211	9554	9241
37081	2020	26921196000	539498	251382	230345
37081	2021	29372130000	542756	252984	238606
37081	2022	30040008000	546101	259951	249172
37083	2020	1952926000	48521	19361	17614
37083	2021	2155157000	48377	19077	17651
37083	2022	2142081000	47848	19215	18119
37085	2020	5306254000	133779	51372	47591
37085	2021	5991689000	135669	52761	49920
37085	2022	6135221000	138832	54989	52711
37087	2020	2792702000	62223	27987	25920
37087	2021	3085188000	62504	28898	27648
37087	2022	3186417000	62609	30256	29282
37089	2020	5637970000	116541	51138	47671
37089	2021	6244711000	116988	53056	50850
37089	2022	6524513000	118106	55624	53850
37091	2020	837188000	21470	8674	8081
37091	2021	890759000	21172	8468	7906
37091	2022	866917000	20875	8554	8112
37093	2020	1963320000	52240	19413	17777
37093	2021	2208929000	53235	19820	18535
37093	2022	2214985000	53787	20266	19258
37095	2020	205185000	4551	1743	1564
37095	2021	231116000	4625	1746	1630
37095	2022	222363000	4576	1770	1668
37097	2020	10656351000	187683	87357	81104
37097	2021	11858045000	192227	89852	85656
37097	2022	12623086000	195897	94619	91385
37099	2020	1697516000	42231	19090	17663
37099	2021	1872598000	42520	19329	18433
37099	2022	1927392000	42955	19756	18984
37101	2020	9788439000	217787	97260	91245
37101	2021	11010981000	227313	101471	97112
37101	2022	11661913000	234778	108034	104427
37103	2020	388796000	9147	4036	3809
37103	2021	463477000	9217	4165	3985
37103	2022	448582000	9233	4310	4161
37105	2020	2843649000	63428	25060	23080
37105	2021	3165900000	64097	25116	23733
37105	2022	3249066000	65476	26030	24922
37107	2020	2461502000	55050	26632	25014
37107	2021	2728498000	54693	26749	25395
37107	2022	2788441000	54633	27614	26587
37109	2020	4523605000	87206	42585	39845
37109	2021	5038218000	89870	43938	42122
37109	2022	5420659000	93095	46385	44910
37111	2020	1789386000	44580	19855	18491
37111	2021	1946886000	44586	19844	18930
37111	2022	1968385000	44753	20251	19540
37113	2020	1629288000	37092	14914	13925
37113	2021	1769755000	37488	15252	14593
37113	2022	1838864000	38065	15986	15424
37115	2020	847107000	21228	9263	8632
37115	2021	937798000	21645	9627	9207
37115	2022	968602000	21768	10099	9751
37117	2020	841768000	21953	8593	8008
37117	2021	940029000	21742	8478	7993
37117	2022	915226000	21508	8575	8190
37119	2020	76551092000	1116788	604094	558343
37119	2021	83205782000	1125809	620295	589814
37119	2022	87554823000	1145392	652325	629232
37121	2020	600243000	14906	5723	5285
37121	2021	654713000	14982	5886	5577
37121	2022	663987000	15094	6009	5756
37123	2020	1079005000	25719	10934	10215
37123	2021	1184480000	25853	10965	10440
37123	2022	1211154000	25894	11238	10817
37125	2020	5752298000	100267	39395	36572
37125	2021	6299960000	102952	40034	38155
37125	2022	6636457000	105531	42080	40521
37127	2020	4435047000	95148	41265	37891
37127	2021	4752103000	95227	42085	39414
37127	2022	4857898000	95789	42205	40066
37129	2020	12249566000	226307	117839	109452
37129	2021	13775949000	229930	122169	116878
37129	2022	14316813000	234921	129832	125541
37131	2020	729397000	17435	7189	6668
37131	2021	813295000	17093	7146	6694
37131	2022	798911000	16779	7236	6879
37133	2020	9587104000	204937	62580	58076
37133	2021	10537886000	204660	65377	61961
37133	2022	10693469000	207298	68184	65247
37135	2020	10376950000	143583	76010	72017
37135	2021	11197670000	148610	77332	74520
37135	2022	11672141000	150477	81535	79042
37137	2020	600923000	12303	5136	4854
37137	2021	646779000	12347	5312	5079
37137	2022	647541000	12381	5499	5297
37139	2020	1743008000	40577	16027	14868
37139	2021	1918904000	40746	16203	15313
37139	2022	1933670000	40938	16774	16020
37141	2020	2738679000	60642	27725	25950
37141	2021	3128782000	63072	28943	27691
37141	2022	3279399000	65737	30808	29735
37143	2020	609223000	13016	4713	4396
37143	2021	693238000	13126	4807	4544
37143	2022	704815000	13210	4980	4755
37145	2020	1657601000	39187	17788	16517
37145	2021	1790826000	39172	17981	17054
37145	2022	1784355000	39386	18824	18106
37147	2020	8334899000	170378	85324	79630
37147	2021	9081502000	172273	84661	80188
37147	2022	9283701000	173542	87986	84352
37149	2020	1064416000	19383	8686	8152
37149	2021	1155471000	19691	9008	8578
37149	2022	1229020000	19986	9379	9018
37151	2020	6013708000	144418	62610	58089
37151	2021	6679473000	145109	63213	60185
37151	2022	6827173000	146043	65267	62865
37153	2020	1727996000	42916	16110	14656
37153	2021	1922077000	42842	16250	15066
37153	2022	1968174000	42778	16904	16039
37155	2020	4322765000	116305	48108	43916
37155	2021	4837177000	116229	47790	44164
37155	2022	4791409000	116663	48151	45476
37157	2020	3773382000	91188	38012	34901
37157	2021	4145772000	91260	38328	36176
37157	2022	4168590000	91957	39440	37781
37159	2020	6160508000	147148	62849	57911
37159	2021	6841314000	148012	64472	61193
37159	2022	7031826000	149645	67740	65262
37161	2020	2470990000	64479	23673	21499
37161	2021	2718166000	64618	23961	22403
37161	2022	2762542000	64963	24563	23378
37163	2020	2411300000	59078	27457	25874
37163	2021	2756486000	59080	27608	26331
37163	2022	2769698000	59120	28265	27197
37165	2020	1294008000	34141	10981	9675
37165	2021	1401347000	34175	11006	9963
37165	2022	1402824000	34162	11164	10442
37167	2020	2703532000	62638	28770	26980
37167	2021	2983331000	63108	29379	28072
37167	2022	3092949000	64153	31070	30044
37169	2020	1870097000	44565	20446	19155
37169	2021	2073228000	44641	20864	19959
37169	2022	2095695000	45175	21633	20902
37171	2020	3072145000	71372	31610	29471
37171	2021	3421653000	71196	31811	30390
37171	2022	3482893000	71403	32788	31651
37173	2020	625650000	14099	6719	6157
37173	2021	711944000	14149	6769	6457
37173	2022	719533000	13967	7156	6921
37175	2020	1597214000	33046	13704	12875
37175	2021	1763384000	33255	14086	13493
37175	2022	1848067000	33355	14681	14169
37177	2020	144444000	3239	1230	1117
37177	2021	159422000	3377	1279	1190
37177	2022	151691000	3365	1309	1240
37179	2020	13981105000	239443	118922	111959
37179	2021	15700480000	244260	123221	118322
37179	2022	16847280000	249070	130315	126174
37181	2020	1681570000	42535	16495	14850
37181	2021	1848698000	42103	16576	15263
37181	2022	1826935000	42138	16793	15806
37183	2020	74305486000	1130685	570246	534103
37183	2021	85044447000	1152357	592680	568603
37183	2022	89720755000	1175021	631165	611634
37185	2020	653059000	18598	6302	5693
37185	2021	726544000	18791	6351	5856
37185	2022	703634000	18713	6382	5974
37187	2020	457370000	10976	4235	3895
37187	2021	506710000	10909	4257	3961
37187	2022	491646000	10828	4350	4127
37189	2020	2333684000	54117	26979	25317
37189	2021	2551974000	54962	28110	27041
37189	2022	2668769000	55089	29336	28374
37191	2020	5181855000	117266	49525	46394
37191	2021	5741810000	116866	50183	47598
37191	2022	5790425000	117286	50846	48770
37193	2020	2714897000	65904	27375	25530
37193	2021	3010010000	65818	26941	25634
37193	2022	3124440000	65784	26962	25910
37195	2020	3516300000	78807	33467	30543
37195	2021	3801276000	78283	33230	30980
37195	2022	3826306000	78449	33678	31933
37197	2020	1555271000	37246	16783	15610
37197	2021	1739715000	37258	16974	16237
37197	2022	1777796000	37463	17614	17019
37199	2020	728832000	18490	7890	7374
37199	2021	784808000	18776	7957	7606
37199	2022	790173000	18811	8262	7965
38001	2020	131930000	2187	1005	969
38001	2021	123237000	2152	973	945
38001	2022	124339000	2115	950	931
38003	2020	664946000	10847	5184	4991
38003	2021	721857000	10812	5191	5056
38003	2022	815092000	10758	5273	5162
38005	2020	296702000	5931	2307	2155
38005	2021	327939000	5778	2299	2205
38005	2022	395554000	5770	2325	2260
38007	2020	81017000	933	437	421
38007	2021	83404000	961	455	444
38007	2022	84554000	1018	456	448
38009	2020	443032000	6384	2967	2814
38009	2021	460482000	6437	2986	2870
38009	2022	573071000	6376	2995	2909
38011	2020	213201000	2984	1627	1574
38011	2021	218337000	2902	1597	1564
38011	2022	217220000	2894	1556	1531
38013	2020	177174000	2208	1034	981
38013	2021	157804000	2173	1052	1015
38013	2022	221204000	2155	1048	1028
38015	2020	6186570000	98594	51024	48896
38015	2021	6879360000	98967	51892	50551
38015	2022	7096858000	99280	52147	51178
38017	2020	11432233000	184874	105695	101236
38017	2021	12703772000	189293	107750	105167
38017	2022	13315423000	192734	109988	108126
38019	2020	342421000	3694	1905	1842
38019	2021	327747000	3664	1882	1835
38019	2022	487648000	3597	1842	1799
38021	2020	334200000	4971	2304	2231
38021	2021	381149000	4905	2278	2227
38021	2022	457639000	4923	2236	2199
38023	2020	140188000	2212	1437	1393
38023	2021	136894000	2191	1445	1416
38023	2022	161398000	2187	1430	1412
38025	2020	321329000	4100	3143	3004
38025	2021	365540000	4025	3074	2990
38025	2022	368231000	4015	3188	3146
38027	2020	159816000	2320	1200	1146
38027	2021	169975000	2322	1196	1157
38027	2022	209005000	2314	1193	1160
38029	2020	212325000	3293	1485	1416
38029	2021	248268000	3262	1476	1420
38029	2022	305467000	3250	1450	1391
38031	2020	248445000	3388	1554	1502
38031	2021	260971000	3362	1517	1482
38031	2022	309021000	3378	1524	1493
38033	2020	88197000	1720	860	834
38033	2021	96504000	1757	850	831
38033	2022	99324000	1744	849	835
38035	2020	4019425000	73126	37097	35452
38035	2021	4267106000	72512	37159	36171
38035	2022	4426160000	72413	37592	36911
38037	2020	129310000	2289	1196	1165
38037	2021	139373000	2311	1240	1213
38037	2022	144179000	2243	1217	1194
38039	2020	155956000	2297	1021	992
38039	2021	170008000	2284	1031	1007
38039	2022	211522000	2252	1013	993
38041	2020	156227000	2467	1389	1336
38041	2021	141181000	2422	1392	1355
38041	2022	162206000	2406	1389	1366
38043	2020	159462000	2387	1293	1230
38043	2021	180604000	2361	1322	1266
38043	2022	199964000	2393	1317	1267
38045	2020	278373000	4101	2060	2008
38045	2021	309656000	4095	2057	2019
38045	2022	388582000	4098	2098	2061
38047	2020	114418000	1890	860	833
38047	2021	129869000	1882	871	849
38047	2022	158414000	1855	866	848
38049	2020	355729000	5311	3103	2941
38049	2021	389332000	5239	3145	3033
38049	2022	406535000	5189	3113	3016
38051	2020	176646000	2511	1096	1062
38051	2021	206481000	2506	1096	1065
38051	2022	222600000	2475	1062	1040
38053	2020	974764000	14776	9468	8775
38053	2021	1012515000	13851	8632	8252
38053	2022	1057642000	13908	9099	8932
38055	2020	641985000	9756	4821	4613
38055	2021	771101000	9794	4722	4578
38055	2022	797638000	9824	4757	4616
38057	2020	519015000	8348	3629	3429
38057	2021	554859000	8330	3688	3547
38057	2022	551872000	8333	3632	3519
38059	2020	1881582000	33313	16868	16049
38059	2021	2026897000	33560	17106	16565
38059	2022	2050212000	33710	17156	16750
38061	2020	702832000	9807	6897	6552
38061	2021	701726000	9593	6480	6293
38061	2022	753165000	9290	6438	6344
38063	2020	206245000	2993	1395	1335
38063	2021	212751000	3044	1410	1367
38063	2022	276327000	2995	1457	1416
38065	2020	101191000	1869	870	827
38065	2021	118313000	1873	877	849
38065	2022	116638000	1856	884	856
38067	2020	494496000	6823	3387	3202
38067	2021	535553000	6775	3323	3191
38067	2022	594729000	6763	3237	3132
38069	2020	225938000	3968	1706	1636
38069	2021	267857000	3943	1684	1637
38069	2022	294138000	3942	1692	1651
38071	2020	649607000	11573	5724	5478
38071	2021	699531000	11598	5760	5605
38071	2022	786567000	11515	5679	5557
38073	2020	331581000	5690	2885	2771
38073	2021	377402000	5667	2714	2656
38073	2022	420065000	5640	2661	2617
38075	2020	183226000	2273	1227	1169
38075	2021	174511000	2262	1210	1176
38075	2022	252060000	2220	1215	1192
38077	2020	860227000	16527	8613	8292
38077	2021	1034547000	16570	8713	8514
38077	2022	1093485000	16580	8810	8649
38079	2020	596114000	12195	4756	4137
38079	2021	641247000	12086	4720	4315
38079	2022	680134000	11933	4735	4432
38081	2020	254635000	3836	2800	2684
38081	2021	314793000	3819	2388	2335
38081	2022	353334000	3795	2300	2262
38083	2020	76265000	1267	679	641
38083	2021	100870000	1270	664	636
38083	2022	128545000	1295	654	637
38085	2020	143977000	3882	1194	1148
38085	2021	140374000	3759	1218	1181
38085	2022	143932000	3711	1225	1195
38087	2020	45365000	695	392	381
38087	2021	47103000	686	359	351
38087	2022	38396000	672	339	331
38089	2020	2085709000	33828	18344	17063
38089	2021	2088885000	33059	17539	16871
38089	2022	2199686000	32803	18014	17686
38091	2020	154948000	1787	958	931
38091	2021	154593000	1798	939	916
38091	2022	206596000	1788	946	928
38093	2020	1255147000	21556	10520	10169
38093	2021	1334012000	21591	10427	10166
38093	2022	1459905000	21487	10614	10405
38095	2020	181273000	2147	1152	1121
38095	2021	160597000	2133	1151	1120
38095	2022	246752000	2064	1127	1102
38097	2020	527305000	7988	4460	4305
38097	2021	532037000	7990	4460	4348
38097	2022	599808000	7958	4470	4384
38099	2020	651576000	10524	5157	4933
38099	2021	697328000	10479	5292	5094
38099	2022	792840000	10438	5234	5076
38101	2020	4020486000	69923	31966	30118
38101	2021	4165787000	69437	31997	30876
38101	2022	4309665000	68870	32069	31369
38103	2020	294441000	3971	1907	1828
38103	2021	318640000	3905	1909	1844
38103	2022	429990000	3930	1898	1841
38105	2020	2542220000	41184	23122	20955
38105	2021	2481024000	38487	20837	19725
38105	2022	2633163000	38109	21781	21308
39001	2020	1095850000	27440	10861	9853
39001	2021	1211290000	27513	10897	10202
39001	2022	1190867000	27420	10964	10376
39003	2020	4794131000	102107	47796	43698
39003	2021	5079044000	101792	47201	44464
39003	2022	5075440000	101115	46717	44748
39005	2020	2321859000	52468	26273	24573
39005	2021	2473069000	52340	26114	24963
39005	2022	2458688000	52181	25920	24922
39007	2020	4214069000	97516	43672	40037
39007	2021	4512580000	97452	42982	40594
39007	2022	4493330000	97014	42858	40967
39009	2020	2382865000	62371	26347	24340
39009	2021	2508138000	59086	25686	24245
39009	2022	2469196000	58979	26044	24792
39011	2020	2350485000	46461	24505	22822
39011	2021	2559198000	46240	24168	23259
39011	2022	2566504000	45948	23978	23238
39013	2020	2887265000	66283	28506	25615
39013	2021	3055039000	65895	27667	25955
39013	2022	3056506000	65509	27464	26065
39015	2020	1861100000	43671	19248	17645
39015	2021	2021604000	43690	19296	18256
39015	2022	2002548000	43680	19466	18587
39017	2020	20257902000	390872	193650	179572
39017	2021	21365261000	387791	194483	185665
39017	2022	21711666000	388420	196838	189835
39019	2020	1181990000	26697	12837	11703
39019	2021	1268206000	26671	12664	11946
39019	2022	1263488000	26659	12509	11968
39021	2020	1782767000	38734	19786	18371
39021	2021	1910395000	38782	19244	18383
39021	2022	1891827000	38709	19193	18477
39023	2020	6025189000	135879	62619	57526
39023	2021	6426844000	135747	62371	59027
39023	2022	6357462000	134831	62666	60100
39025	2020	12710836000	208738	105837	98553
39025	2021	13003627000	209867	106598	101943
39025	2022	13174314000	210805	107937	104095
39027	2020	1997071000	42023	17678	16198
39027	2021	2109472000	42100	17804	16819
39027	2022	2097560000	41964	17867	17086
39029	2020	4295362000	101634	47039	42616
39029	2021	4562398000	101250	45490	42852
39029	2022	4542014000	100511	44774	42709
39031	2020	1441267000	36578	14092	12836
39031	2021	1560589000	36614	13703	12896
39031	2022	1544735000	36571	13663	12997
39033	2020	1801004000	42003	18530	16798
39033	2021	1983398000	41797	17928	16873
39033	2022	1933745000	41522	17652	16808
39035	2020	72024560000	1262523	599293	536505
39035	2021	77733984000	1247808	595435	558382
39035	2022	78423857000	1236041	600431	571700
39037	2020	2467742000	51897	25638	23910
39037	2021	2695417000	51645	25489	24480
39037	2022	2714186000	51529	25537	24634
39039	2020	1693397000	38254	17731	16278
39039	2021	1818818000	38216	17463	16633
39039	2022	1806642000	38187	17324	16638
39041	2020	17218278000	215139	112054	106035
39041	2021	18817305000	221186	113880	109721
39041	2022	20111071000	226296	115171	111711
39043	2020	4028405000	75475	36471	32680
39043	2021	4255598000	74918	36896	34536
39043	2022	4384754000	74501	36512	34733
39045	2020	8218055000	159443	78532	73318
39045	2021	8809068000	161182	79302	75810
39045	2022	8961909000	162898	80029	77231
39047	2020	1293148000	28971	13939	12910
39047	2021	1379346000	28929	13639	12977
39047	2022	1355784000	28839	13670	13142
39049	2020	71982043000	1324357	699696	646859
39049	2021	78251092000	1317560	704306	669207
39049	2022	78612180000	1321820	706390	682093
39051	2020	2131208000	42643	21752	20038
39051	2021	2248473000	42473	21508	20482
39051	2022	2226964000	42171	21626	20758
39053	2020	1299843000	29241	12200	11225
39053	2021	1342948000	29220	12011	11322
39053	2022	1339414000	29068	12041	11477
39055	2020	6873723000	95347	46860	43719
39055	2021	7630061000	95649	47503	45590
39055	2022	7947659000	95469	48394	46485
39057	2020	9305351000	168119	82185	76863
39057	2021	10034233000	167628	81639	78052
39057	2022	10277994000	168456	81766	78826
39059	2020	1758828000	38415	18254	16667
39059	2021	1842134000	38263	17741	16742
39059	2022	1816727000	38098	17729	16860
39061	2020	52328248000	830320	412765	380346
39061	2021	57557999000	827501	413635	393436
39061	2022	59210201000	825037	416987	401963
39063	2020	4176944000	74930	41435	38608
39063	2021	4219472000	74775	40717	39015
39063	2022	4249202000	74861	40188	38868
39065	2020	1139821000	30724	13920	12791
39065	2021	1230961000	30446	13506	12797
39065	2022	1214741000	30416	13131	12579
39067	2020	623511000	14486	6682	6063
39067	2021	663899000	14476	6464	6060
39067	2022	663810000	14378	6463	6145
39069	2020	1354535000	27663	13001	11949
39069	2021	1450252000	27555	12695	12032
39069	2022	1441308000	27512	12694	12119
39071	2020	1771315000	43359	17399	15890
39071	2021	1933219000	43423	17209	16215
39071	2022	1910725000	43391	17317	16463
39073	2020	1215367000	28039	12708	11756
39073	2021	1282857000	28126	12792	12169
39073	2022	1266757000	27858	12915	12384
39075	2020	2188622000	44226	20884	20068
39075	2021	2404549000	44374	21303	20700
39075	2022	2491731000	44390	21626	21012
39077	2020	2650223000	58485	27503	24901
39077	2021	2807298000	58431	27522	25904
39077	2022	2773239000	58218	27659	26251
39079	2020	1312993000	32669	13124	11977
39079	2021	1362368000	32518	12559	11778
39079	2022	1338777000	32586	12324	11712
39081	2020	2804020000	65171	27444	24675
39081	2021	2980427000	65111	27012	25242
39081	2022	2926399000	64330	26933	25464
39083	2020	3042123000	62783	30907	28988
39083	2021	3197411000	62547	30873	29604
39083	2022	3229101000	63183	30837	29760
39085	2020	12797156000	232508	122456	112219
39085	2021	13663774000	232223	122827	116768
39085	2022	13852306000	231842	124804	119559
39087	2020	2551325000	58136	23640	21630
39087	2021	2695407000	57400	23040	21837
39087	2022	2688149000	56653	23346	22267
39089	2020	9213827000	178769	90051	84118
39089	2021	9943215000	179962	90782	87016
39089	2022	10095424000	181359	91692	88549
39091	2020	2114659000	46106	22703	20838
39091	2021	2255587000	46129	22315	21377
39091	2022	2237863000	46040	22525	21746
39093	2020	15970295000	313495	152382	137501
39093	2021	17180773000	314165	151447	143041
39093	2022	17534249000	316268	154121	146477
39095	2020	21643519000	430834	208216	186684
39095	2021	22879384000	429360	203714	191012
39095	2022	22794670000	426643	202831	193865
39097	2020	2094999000	43853	20478	19246
39097	2021	2255814000	44404	20679	19872
39097	2022	2276925000	43540	20909	20235
39099	2020	10828243000	228005	100125	89896
39099	2021	11600455000	226443	98159	91907
39099	2022	11680076000	225636	97955	93256
39101	2020	2627719000	65399	28247	26100
39101	2021	2792235000	65311	27710	26388
39101	2022	2739661000	64642	27290	26085
39103	2020	11022620000	182636	95393	88194
39103	2021	11735723000	183338	95806	91780
39103	2022	12057138000	183512	97765	93925
39105	2020	899448000	22149	8969	8097
39105	2021	943701000	22085	8730	8148
39105	2022	924049000	21969	8558	8056
39107	2020	2287250000	42526	23385	22129
39107	2021	2531078000	42369	22765	22042
39107	2022	2618443000	42348	22723	22110
39109	2020	5652921000	108950	53737	49964
39109	2021	6085345000	109386	53001	50704
39109	2022	6182462000	110247	53145	51250
39111	2020	558121000	13349	5656	5052
39111	2021	578141000	13324	5261	4872
39111	2022	558112000	13234	5125	4798
39113	2020	27570546000	537093	250353	228600
39113	2021	29260783000	536169	245996	232159
39113	2022	29424781000	533892	244612	234562
39115	2020	551299000	13756	6682	6066
39115	2021	593865000	13689	6716	6295
39115	2022	589167000	13668	6761	6401
39117	2020	1594547000	34973	16700	15499
39117	2021	1710785000	35197	16803	16035
39117	2022	1685611000	35339	16968	16305
39119	2020	3990885000	86450	40199	37075
39119	2021	4257333000	86574	40313	38231
39119	2022	4236058000	86113	40536	38790
39121	2020	431879000	14086	4636	4187
39121	2021	457563000	14312	4605	4292
39121	2022	446154000	14335	4583	4307
39123	2020	2319546000	40287	20571	18696
39123	2021	2484614000	40156	20475	19221
39123	2022	2497808000	39978	20494	19421
39125	2020	857389000	18805	8684	8035
39125	2021	917122000	18886	8556	8183
39125	2022	912049000	18757	8645	8342
39127	2020	1525336000	35448	15781	14442
39127	2021	1642305000	35454	15817	14928
39127	2022	1630068000	35480	15911	15209
39129	2020	2737951000	58646	26255	24456
39129	2021	2992515000	58770	26475	25279
39129	2022	3054876000	60023	26727	25734
39131	2020	1169502000	27069	10858	9839
39131	2021	1243386000	27059	10818	10130
39131	2022	1251581000	27005	11024	10466
39133	2020	7902744000	161833	85174	78952
39133	2021	8506535000	158978	84371	80349
39133	2022	8640290000	161745	85243	81995
39135	2020	1830985000	41001	21003	19578
39135	2021	2000606000	40894	21398	20526
39135	2022	1974746000	40596	21779	21045
39137	2020	1872421000	34395	18533	17496
39137	2021	2023822000	34353	18714	18069
39137	2022	2043210000	34334	18806	18236
39139	2020	5334007000	124962	51682	47036
39139	2021	5665390000	125327	51093	48219
39139	2022	5639149000	125319	50422	48141
39141	2020	3211565000	77064	35189	32374
39141	2021	3465394000	76540	34917	33207
39141	2022	3425160000	76606	35088	33744
39143	2020	2673767000	58865	29987	27555
39143	2021	2872650000	58763	30119	28531
39143	2022	2848683000	58667	29904	28496
39145	2020	3221394000	73844	29085	26552
39145	2021	3355544000	73012	29118	27299
39145	2022	3343941000	72194	29219	27738
39147	2020	2447582000	55051	27114	24917
39147	2021	2633731000	54954	26528	25255
39147	2022	2598442000	54632	26291	25195
39149	2020	2358722000	48138	23934	22086
39149	2021	2500754000	48030	23659	22658
39149	2022	2476737000	47671	23496	22670
39151	2020	18344095000	374486	183171	168367
39151	2021	19814175000	373659	181375	171855
39151	2022	19970074000	372657	179690	172413
39153	2020	30427426000	539792	267324	245092
39153	2021	32802654000	537247	263798	249374
39153	2022	33335804000	535882	265461	254663
39155	2020	8704390000	201672	84643	75837
39155	2021	9222182000	201444	82899	77564
39155	2022	9142177000	200643	82752	78656
39157	2020	4286626000	93183	44458	41102
39157	2021	4687955000	92608	44149	42085
39157	2022	4769605000	91937	44347	42651
39159	2020	3927410000	63089	29504	27794
39159	2021	4354531000	65110	29796	28731
39159	2022	4649293000	66898	30108	29196
39161	2020	1324041000	28919	14737	13702
39161	2021	1437587000	28776	14404	13828
39161	2022	1425864000	28769	14357	13878
39163	2020	502894000	12804	5599	5084
39163	2021	519118000	12707	5461	5120
39163	2022	509340000	12565	5396	5128
39165	2020	16113399000	243201	119662	112049
39165	2021	17396442000	246822	120752	115880
39165	2022	18381641000	249778	122415	118391
39167	2020	2785849000	59644	26810	24507
39167	2021	2993436000	59459	26500	25011
39167	2022	3004906000	58901	26595	25343
39169	2020	5718570000	116906	60302	56758
39169	2021	6169368000	116129	59801	57613
39169	2022	6197937000	116559	60006	58114
39171	2020	1665352000	37077	18788	17334
39171	2021	1792734000	36743	18298	17501
39171	2022	1795917000	36652	18107	17490
39173	2020	6771671000	132248	69228	64350
39173	2021	7209158000	130331	68808	65823
39173	2022	7370646000	131592	69232	66800
39175	2020	1096766000	21861	12895	12003
39175	2021	1188713000	21704	12826	12369
39175	2022	1196703000	21567	13176	12795
40001	2020	696105000	19451	8326	7830
40001	2021	784508000	19479	8579	8250
40001	2022	815623000	19576	8674	8380
40003	2020	233653000	5708	2756	2653
40003	2021	258672000	5681	2695	2628
40003	2022	236289000	5637	2717	2662
40005	2020	487211000	14154	5133	4759
40005	2021	517021000	14252	5031	4781
40005	2022	510903000	14262	5160	4958
40007	2020	291771000	5029	2578	2508
40007	2021	341433000	4999	2646	2598
40007	2022	329305000	5016	2726	2675
40009	2020	833238000	22342	9980	9205
40009	2021	871119000	22044	9774	9338
40009	2022	852226000	22009	10439	10164
40011	2020	390836000	8702	4392	4122
40011	2021	437512000	8523	4412	4276
40011	2022	424357000	8409	4439	4338
40013	2020	1886808000	46327	22395	21229
40013	2021	2110981000	47187	22157	21392
40013	2022	2141998000	48182	23261	22618
40015	2020	1115649000	26900	11936	11212
40015	2021	1203461000	26441	12037	11567
40015	2022	1160959000	26198	11926	11533
40017	2020	7552060000	155425	77559	72896
40017	2021	8487366000	161981	78802	76145
40017	2022	9113653000	169149	81247	79164
40019	2020	2223609000	48036	21315	19785
40019	2021	2422673000	48324	21536	20543
40019	2022	2449376000	48510	21778	21012
40021	2020	1809614000	47090	19558	18454
40021	2021	1994352000	47631	20129	19257
40021	2022	2007126000	48098	20325	19602
40023	2020	530068000	14201	5573	5143
40023	2021	587854000	14314	5981	5657
40023	2022	566556000	14358	6021	5738
40025	2020	146693000	2290	1401	1372
40025	2021	161817000	2255	1510	1482
40025	2022	161664000	2252	1603	1580
40027	2020	14053351000	296207	142564	134411
40027	2021	15252498000	298099	145282	140381
40027	2022	15501557000	299587	149727	145867
40029	2020	214957000	5284	2283	2123
40029	2021	230844000	5319	2307	2199
40029	2022	227438000	5313	2352	2274
40031	2020	5519000000	121125	47992	44706
40031	2021	5911172000	122438	48051	45995
40031	2022	5869778000	123046	47985	46232
40033	2020	268176000	5535	2714	2518
40033	2021	278493000	5467	2725	2608
40033	2022	263181000	5477	2711	2627
40035	2020	580989000	14136	5806	5484
40035	2021	615273000	14176	5818	5597
40035	2022	616433000	14123	5944	5758
40037	2020	3240126000	71837	31014	28932
40037	2021	3487746000	72186	31308	29917
40037	2022	3505800000	72699	31810	30683
40039	2020	1218697000	28444	15073	14238
40039	2021	1334773000	28132	15283	14763
40039	2022	1321446000	27886	15137	14734
40041	2020	1542952000	40385	18431	17430
40041	2021	1728220000	40927	19067	18402
40041	2022	1809086000	41413	20069	19473
40043	2020	231502000	4474	2685	2552
40043	2021	217141000	4415	2688	2610
40043	2022	220189000	4401	2998	2938
40045	2020	203076000	3739	2137	2038
40045	2021	216889000	3731	2116	2054
40045	2022	220632000	3657	2113	2064
40047	2020	2792550000	62692	26949	25442
40047	2021	3036214000	61947	26847	25871
40047	2022	3026153000	61920	26965	26177
40049	2020	1208119000	25645	12740	11928
40049	2021	1282423000	25738	12710	12211
40049	2022	1275240000	25713	12804	12432
40051	2020	2456904000	54873	26380	24721
40051	2021	2679721000	55608	26847	25872
40051	2022	2727531000	56658	27613	26847
40053	2020	224352000	4174	2768	2674
40053	2021	244852000	4153	2792	2718
40053	2022	204426000	4124	2796	2742
40055	2020	183487000	5493	1874	1730
40055	2021	193180000	5483	1875	1776
40055	2022	188865000	5547	1853	1788
40057	2020	114202000	2473	1172	1130
40057	2021	120876000	2413	1186	1154
40057	2022	115998000	2428	1217	1184
40059	2020	179518000	3248	1770	1708
40059	2021	191465000	3172	1809	1762
40059	2022	202956000	3129	1816	1780
40061	2020	442824000	11552	4232	3888
40061	2021	497746000	11601	4241	4009
40061	2022	513902000	11641	4202	4019
40063	2020	543171000	13348	5314	4905
40063	2021	658962000	13394	5222	4942
40063	2022	627717000	13407	5175	4972
40065	2020	1123178000	24736	10603	10160
40065	2021	1217336000	24720	10819	10493
40065	2022	1200616000	24556	10824	10525
40067	2020	214423000	5325	2564	2391
40067	2021	216736000	5396	2497	2394
40067	2022	220041000	5389	2515	2436
40069	2020	426291000	10241	3757	3464
40069	2021	464453000	10357	3717	3538
40069	2022	472988000	10406	3881	3738
40071	2020	1978816000	43609	18312	17066
40071	2021	2131993000	43724	18559	17716
40071	2022	2114511000	43668	18735	18075
40073	2020	940524000	15174	8750	8359
40073	2021	1079458000	15253	8746	8506
40073	2022	1099735000	15293	9022	8841
40075	2020	363446000	8493	3510	3329
40075	2021	381371000	8358	3641	3512
40075	2022	372290000	8345	3692	3572
40077	2020	357867000	9481	3150	2824
40077	2021	376984000	9482	3114	2881
40077	2022	377082000	9630	3175	2995
40079	2020	1764403000	48195	19195	17826
40079	2021	1954477000	48601	19563	18622
40079	2022	2027309000	48907	19773	19035
40081	2020	1421552000	33495	15512	14619
40081	2021	1558080000	33856	15909	15316
40081	2022	1552187000	34188	16368	15863
40083	2020	2262391000	49743	22304	21130
40083	2021	2461939000	50924	22879	22096
40083	2022	2517524000	51933	23590	22946
40085	2020	423183000	10159	6515	6235
40085	2021	448846000	10244	6078	5909
40085	2022	443076000	10218	5920	5777
40087	2020	2085295000	41911	20070	18940
40087	2021	2348220000	43497	20511	19841
40087	2022	2541050000	45306	21136	20567
40089	2020	1185069000	30838	14998	13972
40089	2021	1335697000	30884	15897	15165
40089	2022	1356622000	30931	16053	15408
40091	2020	767945000	18950	7133	6515
40091	2021	825295000	19262	7199	6748
40091	2022	833219000	19451	7351	6988
40093	2020	338050000	7746	3681	3501
40093	2021	370068000	7617	3720	3600
40093	2022	349070000	7502	3827	3736
40095	2020	634819000	15340	6825	6374
40095	2021	691983000	15546	7093	6822
40095	2022	713273000	15882	7463	7233
40097	2020	1642758000	39053	19307	18299
40097	2021	1780634000	39246	19549	18781
40097	2022	1773323000	39589	19954	19323
40099	2020	636829000	13877	6133	5745
40099	2021	674119000	13712	6143	5892
40099	2022	679696000	13672	6179	5989
40101	2020	2782374000	66241	29102	27291
40101	2021	2969645000	66255	29105	27783
40101	2022	2967800000	66354	29120	28103
40103	2020	523482000	10922	5469	5240
40103	2021	551739000	10942	5597	5447
40103	2022	533241000	10896	5877	5748
40105	2020	396179000	9322	4603	4355
40105	2021	415474000	9387	4669	4497
40105	2022	418921000	9483	4753	4616
40107	2020	398177000	11271	4403	4101
40107	2021	429697000	11196	4440	4215
40107	2022	427129000	11134	4466	4288
40109	2020	46869182000	798200	384705	359437
40109	2021	52468446000	799622	392214	375578
40109	2022	54611484000	802559	401978	390008
40111	2020	1456467000	36686	15378	14225
40111	2021	1569559000	36827	15553	14712
40111	2022	1576279000	36990	15774	15106
40113	2020	1808759000	45778	20203	18850
40113	2021	2021272000	45868	20380	19478
40113	2022	1993018000	45839	20774	20018
40115	2020	1285736000	30229	14274	13446
40115	2021	1417553000	30400	14546	14057
40115	2022	1406599000	30338	15209	14776
40117	2020	623172000	15552	7249	6761
40117	2021	683084000	15761	7324	7007
40117	2022	685145000	15757	7455	7181
40119	2020	3387775000	81645	37671	35635
40119	2021	3699623000	82149	38162	36860
40119	2022	3760152000	82794	39340	38230
40121	2020	1774008000	43784	16672	15376
40121	2021	1872226000	43695	16549	15643
40121	2022	1852849000	43613	16501	15784
40123	2020	1845740000	38087	19177	18161
40123	2021	1996423000	38195	19252	18576
40123	2022	2021472000	38141	19621	19073
40125	2020	3135006000	72542	32288	30266
40125	2021	3647165000	73092	32844	31512
40125	2022	3499211000	73533	33515	32347
40127	2020	401356000	10796	4459	4155
40127	2021	437796000	10789	4739	4528
40127	2022	422991000	10769	4610	4430
40129	2020	163689000	3428	1779	1687
40129	2021	166532000	3361	1813	1758
40129	2022	156555000	3320	1815	1773
40131	2020	4777704000	95387	44768	42104
40131	2021	5117868000	96796	45109	43439
40131	2022	5223504000	98836	46016	44665
40133	2020	910419000	23515	9205	8504
40133	2021	994814000	23498	9204	8719
40133	2022	1007690000	23351	9327	8934
40135	2020	1543680000	39246	16524	15373
40135	2021	1705344000	39442	16830	16073
40135	2022	1733341000	39667	17000	16408
40137	2020	1951460000	42814	18501	17022
40137	2021	2088656000	43174	18812	17933
40137	2022	2126606000	43710	19363	18733
40139	2020	1079243000	21291	11281	11013
40139	2021	1288186000	20822	11526	11302
40139	2022	1238928000	20495	12011	11794
40141	2020	260971000	6948	3028	2835
40141	2021	288017000	7039	2960	2825
40141	2022	239294000	6977	2954	2854
40143	2020	41189157000	670653	323624	301882
40143	2021	45366745000	673961	325706	311951
40143	2022	47458230000	677358	330103	320002
40145	2020	3751824000	81379	38500	36215
40145	2021	4140706000	84198	38862	37412
40145	2022	4312603000	86644	39612	38406
40147	2020	3328781000	52604	22238	20901
40147	2021	4435821000	52857	22602	21705
40147	2022	5132934000	53242	22587	21836
40149	2020	418144000	10903	5102	4749
40149	2021	449349000	10881	5012	4788
40149	2022	430066000	10732	5303	5140
40151	2020	390051000	8598	4596	4434
40151	2021	424493000	8613	4763	4658
40151	2022	410616000	8587	4673	4583
40153	2020	798560000	20406	8915	8295
40153	2021	855303000	20216	8709	8329
40153	2022	809365000	19990	8695	8436
41001	2020	749023000	16725	7279	6755
41001	2021	812491000	16873	7449	7066
41001	2022	824298000	16938	7368	7037
41003	2020	4759412000	95208	46704	44087
41003	2021	5258868000	96277	47546	45668
41003	2022	5401411000	97630	48739	47108
41005	2020	27394717000	422444	218682	202879
41005	2021	30369278000	423763	222517	211796
41005	2022	30946445000	423177	225320	217242
41007	2020	2045821000	41160	19285	17459
41007	2021	2268043000	41916	19465	18320
41007	2022	2242683000	41695	19531	18743
41009	2020	2619345000	52730	24170	22258
41009	2021	2840549000	53229	24598	23197
41009	2022	2878954000	53588	24960	23828
41011	2020	3298551000	64971	26609	24311
41011	2021	3546509000	65119	26823	25156
41011	2022	3530876000	64990	26391	25083
41013	2020	1170630000	24923	10384	9466
41013	2021	1336000000	25753	10939	10213
41013	2022	1369672000	26375	11182	10608
41015	2020	1127366000	23516	8972	8192
41015	2021	1234354000	23720	9195	8592
41015	2022	1225915000	23598	9165	8698
41017	2020	12781035000	199454	98358	90543
41017	2021	14408123000	205358	102138	96769
41017	2022	14794468000	206549	102623	98610
41019	2020	5137354000	111288	47382	43706
41019	2021	5641286000	112057	47885	45105
41019	2022	5552019000	112297	47438	45091
41021	2020	128416000	2017	993	931
41021	2021	127293000	2015	943	898
41021	2022	139469000	2018	969	933
41023	2020	345311000	7241	3206	2936
41023	2021	370440000	7288	3238	3023
41023	2022	369853000	7218	3204	3018
41025	2020	333885000	7502	3641	3424
41025	2021	373538000	7590	3776	3583
41025	2022	375868000	7515	3763	3589
41027	2020	1428171000	23958	14114	13229
41027	2021	1581971000	24094	14441	13792
41027	2022	1557049000	24048	14273	13793
41029	2020	11594427000	223614	105233	97012
41029	2021	12770524000	224327	106999	101199
41029	2022	12755983000	221644	105908	101237
41031	2020	989456000	24577	10335	9482
41031	2021	1099540000	25122	10460	9792
41031	2022	1098154000	25330	10208	9676
41033	2020	4231297000	88235	36154	33291
41033	2021	4604845000	88590	36724	34465
41033	2022	4576508000	87730	36322	34411
41035	2020	3018790000	69547	29565	26982
41035	2021	3327583000	70255	29828	27844
41035	2022	3317067000	70212	30074	28373
41037	2020	356013000	8167	3661	3454
41037	2021	393176000	8285	3729	3525
41037	2022	391814000	8385	3661	3473
41039	2020	19432684000	383279	179338	165227
41039	2021	21485107000	384063	182267	172299
41039	2022	21483599000	382353	182468	174653
41041	2020	2478005000	50507	20773	18523
41041	2021	2739068000	51026	21111	19704
41041	2022	2718202000	50813	20917	19899
41043	2020	6142058000	128978	59202	54618
41043	2021	6757131000	129948	60624	57255
41043	2022	6845480000	130467	61099	58440
41045	2020	1108494000	31650	12594	11931
41045	2021	1210276000	31709	12724	12167
41045	2022	1224380000	31879	12695	12176
41047	2020	17010290000	346339	162806	151468
41047	2021	18699043000	347775	167122	158642
41047	2022	18874639000	346703	168836	162048
41049	2020	605755000	12220	5761	5462
41049	2021	637970000	12358	5940	5667
41049	2022	677480000	12300	5984	5753
41051	2020	51399555000	816467	456615	417372
41051	2021	56253777000	805593	460868	435841
41051	2022	55618917000	795083	465107	447900
41053	2020	4023974000	87950	40708	38053
41053	2021	4435267000	89384	41901	39873
41053	2022	4507111000	89614	42362	40678
41055	2020	116477000	1873	978	917
41055	2021	119334000	1912	963	922
41055	2022	131868000	1955	955	925
41057	2020	1363130000	27466	11875	10922
41057	2021	1509711000	27800	12144	11483
41057	2022	1506622000	27574	12121	11617
41059	2020	3584075000	80098	36908	34389
41059	2021	3868007000	80154	37544	35580
41059	2022	3942486000	80215	37918	36279
41061	2020	1198902000	26167	12031	11084
41061	2021	1280585000	26276	12194	11516
41061	2022	1282656000	26177	12089	11546
41063	2020	355925000	7401	3468	3220
41063	2021	400327000	7554	3603	3407
41063	2022	403619000	7659	3595	3411
41065	2020	1282637000	26631	13468	12512
41065	2021	1401975000	26735	13621	12914
41065	2022	1383652000	26561	13391	12846
41067	2020	40690172000	601101	321085	300230
41067	2021	43096551000	602494	327152	312877
41067	2022	44040839000	600176	332525	321631
41069	2020	58206000	1460	696	665
41069	2021	59806000	1453	723	699
41069	2022	62225000	1445	740	716
41071	2020	5503115000	107931	54212	50550
41071	2021	6064030000	108436	55266	52654
41071	2022	6121563000	108226	56051	54013
42001	2020	5527061000	103779	54836	51147
42001	2021	5896214000	105632	54654	52389
42001	2022	5894792000	106027	54709	53012
42003	2020	82485899000	1249524	646554	589554
42003	2021	87351618000	1245445	633043	597285
42003	2022	87359911000	1233253	628783	604049
42005	2020	3269472000	65459	31823	28779
42005	2021	3500832000	65138	31356	29150
42005	2022	3519158000	64747	31006	29478
42007	2020	8822212000	167860	83965	75522
42007	2021	9231354000	166914	81929	76502
42007	2022	9081089000	165677	81464	77384
42009	2020	2182332000	47569	24031	21924
42009	2021	2371351000	47495	23857	22536
42009	2022	2345666000	47418	24372	23352
42011	2020	23325136000	428631	215733	195790
42011	2021	25051044000	429612	212303	199444
42011	2022	25051661000	430449	213323	204729
42013	2020	6237173000	122651	60263	55160
42013	2021	6739749000	122181	59370	56054
42013	2022	6668927000	121032	58879	56422
42015	2020	2727348000	59969	28581	26491
42015	2021	2888646000	60099	28056	26590
42015	2022	2885883000	59866	28122	27014
42017	2020	50919869000	646112	344795	316977
42017	2021	54665501000	647159	344724	327726
42017	2022	55971107000	645054	350406	337962
42019	2020	12279663000	194056	99766	92204
42019	2021	13454089000	196789	98571	93403
42019	2022	13639217000	197300	98291	94455
42021	2020	6160474000	133199	57178	51879
42021	2021	6476552000	132281	55758	52107
42021	2022	6305307000	131441	55396	52625
42023	2020	229506000	4531	2070	1818
42023	2021	230992000	4461	2006	1863
42023	2022	223359000	4418	1935	1832
42025	2020	3851961000	64744	32070	29015
42025	2021	3946748000	65460	32108	30102
42025	2022	3837681000	65460	32481	30940
42027	2020	8216113000	157962	77923	73508
42027	2021	8706362000	157990	76497	73190
42027	2022	8663589000	158425	78275	75657
42029	2020	49293687000	534783	286398	268513
42029	2021	52816343000	540864	288479	277135
42029	2022	55155695000	545823	294834	286041
42031	2020	1710233000	37193	17056	15681
42031	2021	1789694000	37581	16659	15649
42031	2022	1735030000	37346	16129	15351
42033	2020	3942695000	80438	36272	33032
42033	2021	4211741000	78333	35800	33472
42033	2022	4071644000	77904	35419	33663
42035	2020	1713925000	37380	17937	16415
42035	2021	1776746000	38035	17290	16213
42035	2022	1740217000	37931	17051	16205
42037	2020	3074052000	64682	33909	31233
42037	2021	3275163000	64980	33605	31776
42037	2022	3236797000	64926	33868	32451
42039	2020	3831782000	83797	38798	35441
42039	2021	4033501000	83202	38003	35654
42039	2022	3945994000	82670	37890	36199
42041	2020	15840091000	260223	133628	124976
42041	2021	17123322000	265593	132740	127006
42041	2022	17485966000	268579	134905	130606
42043	2020	15736375000	286685	147089	134329
42043	2021	16819117000	288187	144978	136522
42043	2022	16668703000	288800	145887	140459
42045	2020	40887145000	576323	300050	273188
42045	2021	44174403000	576772	297603	280436
42045	2022	44995363000	575182	299925	288308
42047	2020	1554114000	30926	15462	13629
42047	2021	1564706000	30771	14931	13982
42047	2022	1530197000	30477	14669	14000
42049	2020	13575479000	270539	129162	116813
42049	2021	14016506000	269300	126713	118159
42049	2022	13758095000	267689	125838	120023
42051	2020	5968298000	128569	56983	50439
42051	2021	6304892000	127113	55575	51095
42051	2022	6068766000	125755	54802	51670
42053	2020	195006000	6959	1820	1633
42053	2021	197719000	6896	1748	1613
42053	2022	185589000	6626	1706	1603
42055	2020	7999119000	155939	78816	72991
42055	2021	8632012000	156589	77624	73901
42055	2022	8662802000	156902	77884	75200
42057	2020	694892000	14572	7525	6650
42057	2021	716808000	14509	7131	6715
42057	2022	697774000	14533	7208	6930
42059	2020	1695080000	35859	16206	14669
42059	2021	1736408000	35269	15768	14703
42059	2022	1720853000	34663	15525	14755
42061	2020	1921177000	44047	19883	17845
42061	2021	2017374000	43937	19278	17969
42061	2022	1949778000	43281	19258	18248
42063	2020	3679015000	83142	38406	35017
42063	2021	3894480000	83158	37467	35006
42063	2022	3782731000	82957	36691	34879
42065	2020	2066313000	44478	20431	18687
42065	2021	2138078000	44142	19732	18532
42065	2022	2085853000	43794	19526	18645
42067	2020	1223827000	23471	12795	11903
42067	2021	1325457000	23348	12575	11984
42067	2022	1322189000	23339	12459	11962
42069	2020	11133616000	215523	105371	95479
42069	2021	11839505000	215957	103684	97124
42069	2022	11774144000	215615	104935	100315
42071	2020	31958383000	552761	286662	265741
42071	2021	34350132000	556049	286489	273305
42071	2022	35091885000	556629	289525	280002
42073	2020	4140602000	85959	40906	36779
42073	2021	4419305000	85554	39709	36914
42073	2022	4299674000	84849	39277	37299
42075	2020	7502472000	143282	73275	67617
42075	2021	8044252000	143809	73005	69287
42075	2022	8094389000	144011	73340	70790
42077	2020	22047195000	374477	195426	177177
42077	2021	23434611000	375760	196189	183868
42077	2022	23662485000	376317	196923	188905
42079	2020	15786328000	325197	159928	142862
42079	2021	16828411000	325889	157240	145327
42079	2022	16520258000	326369	157927	150080
42081	2020	5482453000	114108	56961	52070
42081	2021	5762711000	113595	55517	52057
42081	2022	5640409000	113104	54945	52510
42083	2020	1922811000	40392	17377	15717
42083	2021	1982822000	40292	17046	15952
42083	2022	1945326000	39866	16871	16027
42085	2020	5035167000	110534	48855	44240
42085	2021	5341294000	109950	48119	44953
42085	2022	5226968000	109220	47745	45520
42087	2020	2005292000	46144	21409	19646
42087	2021	2138341000	46187	21034	19845
42087	2022	2120990000	45988	20994	20061
42089	2020	8225972000	168316	83027	73723
42089	2021	8757149000	168629	81994	76201
42089	2022	8801847000	167198	82054	77663
42091	2020	73985426000	856938	456734	422938
42091	2021	78205276000	864022	458517	437315
42091	2022	80991052000	864683	466300	451148
42093	2020	1096248000	18129	9137	8584
42093	2021	1170326000	18103	9103	8732
42093	2022	1196207000	18091	9216	8921
42095	2020	18789729000	312774	161933	147814
42095	2021	19913098000	318051	162398	153394
42095	2022	20330906000	318526	164085	157608
42097	2020	4210085000	91542	42943	39016
42097	2021	4373445000	91013	42370	39714
42097	2022	4294794000	90133	42348	40399
42099	2020	2326920000	45828	24432	22821
42099	2021	2506613000	45941	24240	23174
42099	2022	2491353000	46114	24665	23828
42101	2020	87851398000	1600600	738204	648448
42101	2021	91762382000	1589480	722187	661918
42101	2022	88964392000	1567258	730158	693345
42103	2020	3136914000	58560	25490	22873
42103	2021	3340414000	59965	25290	23584
42103	2022	3454129000	60558	25674	24320
42105	2020	767385000	16385	7311	6648
42105	2021	830301000	16287	7099	6644
42105	2022	784712000	16220	6886	6509
42107	2020	6632487000	142946	67209	61142
42107	2021	7061558000	143201	65640	61529
42107	2022	6959788000	143104	65860	62820
42109	2020	1859365000	39727	19722	18255
42109	2021	2032066000	39742	19699	18744
42109	2022	2051994000	39652	19718	18932
42111	2020	3382940000	74016	33260	30203
42111	2021	3568220000	72999	32766	30712
42111	2022	3462616000	72710	32524	30883
42113	2020	307258000	5823	2623	2405
42113	2021	327690000	5859	2569	2392
42113	2022	328265000	5855	2548	2422
42115	2020	1991499000	38334	20106	18672
42115	2021	2187319000	38363	20107	19080
42115	2022	2242471000	38074	20233	19436
42117	2020	1800219000	41014	19175	17489
42117	2021	1919256000	41335	18986	17817
42117	2022	1889936000	41106	19050	18178
42119	2020	2053275000	42639	19633	18346
42119	2021	2145476000	42419	19604	18743
42119	2022	2183740000	42744	19587	18881
42121	2020	2349448000	50354	22488	20536
42121	2021	2484809000	50038	21990	20595
42121	2022	2422309000	49777	21386	20385
42123	2020	1793470000	38516	18932	17439
42123	2021	1877457000	38115	18109	16976
42123	2022	1857033000	37808	17645	16878
42125	2020	12753317000	209382	107178	97382
42125	2021	13869596000	210012	105114	98656
42125	2022	13943312000	210383	104233	99759
42127	2020	2541329000	51151	22465	20462
42127	2021	2737632000	51195	22536	21155
42127	2022	2716039000	51173	22737	21664
42129	2020	19921796000	354316	179407	163499
42129	2021	21142873000	353765	176003	165668
42129	2022	20944891000	352057	174907	167456
42131	2020	1356556000	26030	13388	12290
42131	2021	1419696000	26100	13278	12497
42131	2022	1414142000	26014	13504	12891
42133	2020	24841690000	456692	237305	218784
42133	2021	26472413000	459148	236297	224335
42133	2022	26428495000	461058	238542	230106
44001	2020	4056120000	50774	26219	24268
44001	2021	4407045000	50800	26579	25330
44001	2022	4479729000	50360	26609	25922
44003	2020	10642709000	170386	93405	85412
44003	2021	11413290000	170997	93964	89147
44003	2022	11487036000	171275	93921	91231
44005	2020	6535768000	85508	44757	41180
44005	2021	7108585000	85662	45183	42981
44005	2022	7137259000	84481	45244	43986
44007	2020	34004182000	659920	336827	303203
44007	2021	36478414000	658646	336418	316460
44007	2022	35839958000	657288	335461	323859
44009	2020	9517775000	129757	69528	64217
44009	2021	10430003000	130880	70404	67009
44009	2022	10570229000	130330	70521	68590
45001	2020	923239000	24256	9771	9142
45001	2021	975641000	24258	9596	9166
45001	2022	970343000	24356	9475	9111
45003	2020	8113687000	169163	73909	70326
45003	2021	8812850000	171263	73743	71274
45003	2022	8986274000	174150	73747	71447
45005	2020	320681000	7992	2555	2319
45005	2021	321786000	7870	2421	2239
45005	2022	307950000	7579	2285	2157
45007	2020	8929750000	204176	88758	83660
45007	2021	9755911000	206852	90053	86763
45007	2022	9995469000	209581	92055	89311
45009	2020	507590000	13261	4759	4344
45009	2021	525165000	13112	4624	4290
45009	2022	516199000	12908	4551	4303
45011	2020	790671000	20580	7777	7221
45011	2021	825167000	20580	7514	7042
45011	2022	800078000	20414	7565	7215
45013	2020	12213168000	187819	74961	71015
45013	2021	13537694000	192007	75966	73363
45013	2022	14166672000	196371	77029	74636
45015	2020	10436939000	231538	104444	98848
45015	2021	11744450000	236871	106843	103019
45015	2022	12423980000	245117	110406	107041
45017	2020	644070000	14113	6362	5983
45017	2021	708665000	14134	6407	6124
45017	2022	703965000	14179	6451	6227
45019	2020	28146737000	409716	207060	194389
45019	2021	30598884000	414403	210295	202844
45019	2022	32094123000	419279	216613	210699
45021	2020	2045891000	56207	24821	22894
45021	2021	2189063000	56025	24743	23526
45021	2022	2174128000	56121	24177	23188
45023	2020	1243460000	32278	13199	12043
45023	2021	1327135000	32097	13272	12520
45023	2022	1322307000	31931	13429	12865
45025	2020	1550859000	43250	21373	20120
45025	2021	1700660000	43337	21458	20513
45025	2022	1703990000	43683	21493	20740
45027	2020	1286988000	30835	12482	11666
45027	2021	1413386000	30950	12418	11826
45027	2022	1400366000	30913	12028	11541
45029	2020	1495837000	38536	16289	15331
45029	2021	1623658000	38427	16132	15439
45029	2022	1622315000	38599	15883	15332
45031	2020	2741947000	62843	29925	28052
45031	2021	2946406000	62708	29791	28473
45031	2022	2976849000	62398	29949	28898
45033	2020	1002900000	28275	12975	12203
45033	2021	1110433000	27981	13062	12323
45033	2022	1084947000	27738	12869	12285
45035	2020	7020128000	162159	76074	71796
45035	2021	7661511000	163508	77601	74829
45035	2022	7937087000	166133	80039	77734
45037	2020	1155385000	25672	10390	9871
45037	2021	1286926000	26285	10347	10000
45037	2022	1323419000	26932	10336	10002
45039	2020	936775000	20880	9214	8495
45039	2021	1017210000	20698	9215	8694
45039	2022	1024260000	20455	9281	8849
45041	2020	6392853000	136811	65640	62096
45041	2021	6983383000	136439	65821	63197
45041	2022	7114269000	136721	66429	64295
45043	2020	3296668000	63506	25597	23734
45043	2021	3638014000	63991	25800	24592
45043	2022	3700812000	64722	26153	25184
45045	2020	27454746000	527207	251990	238182
45045	2021	29801989000	534521	255636	247052
45045	2022	31043162000	547950	261642	254376
45047	2020	2871804000	69388	30800	28896
45047	2021	3039260000	69148	30245	28902
45047	2022	3032265000	69267	29763	28675
45049	2020	702529000	18519	8004	7623
45049	2021	740264000	18236	7992	7711
45049	2022	731408000	18113	7911	7685
45051	2020	15569486000	353745	144782	132675
45051	2021	17419059000	366011	147545	140214
45051	2022	18003786000	383101	151771	145920
45053	2020	1133525000	29143	12825	12193
45053	2021	1281283000	30456	13092	12650
45053	2022	1318207000	32039	13276	12875
45055	2020	3041844000	65581	28933	27447
45055	2021	3411879000	66121	29163	28095
45055	2022	3576023000	67751	29556	28599
45057	2020	4975139000	96576	42320	39537
45057	2021	5332453000	100522	42977	41152
45057	2022	5758562000	104577	43866	42310
45059	2020	2658151000	67624	29390	27435
45059	2021	2878828000	67817	29704	28451
45059	2022	2903792000	67965	30273	29263
45061	2020	619793000	16533	6675	6181
45061	2021	672022000	16266	6568	6213
45061	2022	661550000	16153	6421	6125
45063	2020	15407874000	295033	148144	141926
45063	2021	16801385000	300482	149903	145398
45063	2022	17396614000	304797	152183	148158
45065	2020	404137000	9505	3285	3073
45065	2021	432998000	9782	3338	3182
45065	2022	450079000	9764	3447	3324
45067	2020	1092533000	29083	12980	11998
45067	2021	1187473000	28839	12875	12057
45067	2022	1169525000	28450	12663	12050
45069	2020	913600000	26481	9081	8225
45069	2021	1009729000	26265	8791	8142
45069	2022	985073000	26039	8090	7557
45071	2020	1618758000	37731	18867	17997
45071	2021	1780609000	37957	19203	18579
45071	2022	1815372000	38247	19190	18664
45073	2020	3806191000	78778	34316	32546
45073	2021	4227788000	79322	34032	32809
45073	2022	4362957000	80180	34437	33391
45075	2020	3243598000	83956	34075	31089
45075	2021	3489488000	82798	33488	31201
45075	2022	3414314000	83094	32982	31341
45077	2020	5420104000	131669	55777	52908
45077	2021	5973616000	132079	56865	54913
45077	2022	6117232000	133462	58341	56548
45079	2020	20353785000	415645	194882	183830
45079	2021	22269573000	417132	196224	188308
45079	2022	22748912000	421566	198509	192084
45081	2020	739704000	18830	8351	8004
45081	2021	827931000	18821	8409	8146
45081	2022	831065000	18938	8453	8213
45083	2020	15719115000	329365	156233	146381
45083	2021	17514836000	335406	155207	149151
45083	2022	18197864000	345831	155135	150296
45085	2020	4491978000	105474	43019	40230
45085	2021	4886771000	104856	42632	40714
45085	2022	4845036000	104012	42000	40399
45087	2020	979143000	27176	11469	10452
45087	2021	1037298000	26994	11365	10656
45087	2022	1020781000	26752	11266	10739
45089	2020	1139691000	30908	11502	10582
45089	2021	1205266000	30384	11105	10446
45089	2022	1155619000	30058	10797	10285
45091	2020	14734890000	284032	143112	134794
45091	2021	16422022000	289255	145692	140418
45091	2022	17356781000	294248	149123	144505
46003	2020	130368000	2733	1472	1430
46003	2021	149569000	2732	1483	1454
46003	2022	162403000	2755	1488	1461
46005	2020	987206000	19165	9362	9040
46005	2021	1088758000	19182	9275	9052
46005	2022	1129256000	19376	9255	9081
46007	2020	138651000	3389	1076	1027
46007	2021	150792000	3400	1054	1016
46007	2022	162027000	3336	1066	1032
46009	2020	298849000	6973	2854	2750
46009	2021	334917000	7011	2824	2756
46009	2022	384303000	7062	2848	2795
46011	2020	1744091000	34350	18512	17783
46011	2021	1903172000	34710	18573	18070
46011	2022	1988715000	35484	19103	18717
46013	2020	2333150000	38222	20579	19766
46013	2021	2578487000	38090	20532	20009
46013	2022	2721608000	37972	20088	19647
46015	2020	273121000	5253	2471	2372
46015	2021	317271000	5254	2564	2510
46015	2022	342506000	5321	2664	2620
46017	2020	51382000	1938	691	640
46017	2021	64062000	1912	697	666
46017	2022	65824000	1861	724	692
46019	2020	450739000	10286	4988	4746
46019	2021	492811000	10530	5014	4871
46019	2022	514819000	10774	5054	4959
46021	2020	93351000	1377	784	759
46021	2021	113156000	1375	773	752
46021	2022	109830000	1349	774	754
46023	2020	430802000	9356	3774	3558
46023	2021	468610000	9186	3803	3684
46023	2022	497539000	9213	3812	3727
46025	2020	252416000	3855	2155	2078
46025	2021	284989000	3867	1931	1870
46025	2022	300469000	3912	1953	1910
46027	2020	605985000	14996	7154	6862
46027	2021	680766000	15155	7325	7141
46027	2022	741779000	15280	7345	7191
46029	2020	1573306000	28350	15459	14776
46029	2021	1828731000	28467	15692	15284
46029	2022	1941062000	28721	15970	15659
46031	2020	129920000	3891	1322	1264
46031	2021	152361000	3843	1307	1255
46031	2022	158365000	3826	1278	1241
46033	2020	470101000	8334	4045	3824
46033	2021	531287000	8635	4129	3989
46033	2022	564260000	9006	4208	4091
46035	2020	1098928000	19962	10938	10528
46035	2021	1190902000	19926	10939	10683
46035	2022	1242964000	19973	11068	10866
46037	2020	333783000	5442	2694	2556
46037	2021	364241000	5435	2675	2579
46037	2022	391988000	5479	2683	2604
46039	2020	262570000	4294	2325	2214
46039	2021	282831000	4280	2289	2208
46039	2022	285849000	4352	2303	2238
46041	2020	265558000	5224	2304	2149
46041	2021	286973000	5218	2266	2155
46041	2022	279840000	5140	2277	2149
46043	2020	173467000	2829	1551	1511
46043	2021	192788000	2809	1535	1503
46043	2022	204969000	2776	1504	1475
46045	2020	264100000	3982	1990	1938
46045	2021	352909000	4028	2013	1968
46045	2022	375237000	4065	1995	1958
46047	2020	348100000	6972	3011	2850
46047	2021	387479000	7189	3076	2971
46047	2022	402296000	7370	3054	2983
46049	2020	147078000	2128	1036	1004
46049	2021	180700000	2126	1055	1031
46049	2022	188266000	2126	1081	1060
46051	2020	434350000	7532	4369	4213
46051	2021	491063000	7532	4347	4222
46051	2022	527395000	7463	4383	4275
46053	2020	209706000	3997	2042	1973
46053	2021	228485000	3952	2077	2028
46053	2022	241120000	3962	2137	2098
46055	2020	133209000	1870	1058	1034
46055	2021	134406000	1834	1042	1018
46055	2022	142509000	1826	1071	1051
46057	2020	333808000	6157	3364	3261
46057	2021	384834000	6263	3473	3396
46057	2022	404751000	6352	3584	3516
46059	2020	210488000	3145	1750	1709
46059	2021	252300000	3095	1750	1714
46059	2022	268995000	3140	1790	1759
46061	2020	237167000	3465	1757	1677
46061	2021	258808000	3496	1762	1702
46061	2022	271794000	3461	1785	1740
46063	2020	60568000	1307	720	697
46063	2021	75902000	1320	712	696
46063	2022	68381000	1330	741	727
46065	2020	985647000	17745	9880	9583
46065	2021	1102366000	17768	9911	9706
46065	2022	1132155000	17692	9910	9747
46067	2020	406489000	7421	3609	3488
46067	2021	479846000	7400	3606	3511
46067	2022	539209000	7368	3618	3539
46069	2020	83878000	1249	669	650
46069	2021	87071000	1215	655	640
46069	2022	94759000	1184	659	645
46071	2020	104583000	2801	1208	1162
46071	2021	116195000	2846	1216	1170
46071	2022	124767000	2821	1218	1182
46073	2020	94816000	1648	1198	1172
46073	2021	107863000	1640	1337	1314
46073	2022	120484000	1650	1327	1309
46075	2020	52700000	925	522	505
46075	2021	74596000	884	520	506
46075	2022	70112000	884	526	514
46077	2020	348217000	5203	2675	2587
46077	2021	377829000	5201	2724	2658
46077	2022	391831000	5294	2803	2751
46079	2020	690053000	11008	6464	6243
46079	2021	763074000	10863	6553	6385
46079	2022	805119000	10972	6711	6576
46081	2020	1486923000	25838	13566	12799
46081	2021	1730528000	26138	13819	13463
46081	2022	1848671000	27214	14128	13864
46083	2020	4883385000	65650	36257	35075
46083	2021	5439235000	67995	36886	36121
46083	2022	5917722000	70987	37550	36946
46085	2020	175314000	3709	1667	1580
46085	2021	204384000	3753	1678	1615
46085	2022	213600000	3692	1687	1645
46087	2020	331698000	5673	2997	2896
46087	2021	386806000	5723	3054	2983
46087	2022	423883000	5778	3114	3063
46089	2020	139680000	2402	995	949
46089	2021	171178000	2414	964	931
46089	2022	173695000	2395	979	953
46091	2020	322381000	4315	2420	2317
46091	2021	307466000	4319	2420	2348
46091	2022	326022000	4374	2474	2407
46093	2020	1461877000	29900	13869	13246
46093	2021	1576659000	30270	14203	13839
46093	2022	1639302000	30698	14435	14142
46095	2020	68930000	1921	711	671
46095	2021	86389000	1908	725	697
46095	2022	85899000	1892	747	725
46097	2020	134213000	2310	1148	1099
46097	2021	156186000	2329	1167	1137
46097	2022	167258000	2304	1224	1202
46099	2020	12804850000	197686	113380	108738
46099	2021	13962495000	199925	114738	111975
46099	2022	14669921000	203971	116619	114506
46101	2020	376270000	6343	4022	3834
46101	2021	418924000	6314	4006	3912
46101	2022	422047000	6349	4018	3931
46102	2020	429887000	13645	3775	3444
46102	2021	493029000	13549	3853	3572
46102	2022	482449000	13519	3786	3604
46103	2020	6604474000	109563	57385	54642
46103	2021	7459951000	111854	58652	57071
46103	2022	7913173000	114461	59489	58307
46105	2020	133248000	2842	1373	1328
46105	2021	145380000	2823	1394	1359
46105	2022	151966000	2804	1433	1404
46107	2020	188529000	2480	1025	995
46107	2021	190986000	2471	1053	1026
46107	2022	206036000	2438	1040	1017
46109	2020	464005000	10250	4819	4544
46109	2021	511574000	10178	4684	4503
46109	2022	531130000	10163	4631	4482
46111	2020	143494000	2325	1161	1119
46111	2021	141526000	2383	1184	1154
46111	2022	154483000	2415	1208	1183
46115	2020	455270000	6347	3093	2982
46115	2021	508194000	6273	3073	2991
46115	2022	541635000	6235	3036	2964
46117	2020	191845000	2969	1914	1848
46117	2021	234717000	3017	1921	1873
46117	2022	246246000	2999	1929	1894
46119	2020	133801000	1452	792	772
46119	2021	143680000	1471	811	785
46119	2022	149730000	1471	815	802
46121	2020	298205000	9317	3057	2880
46121	2021	346479000	9292	3049	2924
46121	2022	330510000	9220	3004	2894
46123	2020	309981000	5603	3002	2919
46123	2021	340335000	5566	3014	2954
46123	2022	365745000	5565	3071	3020
46125	2020	479302000	8672	4577	4413
46125	2021	565067000	8682	4657	4553
46125	2022	628364000	8856	4757	4670
46127	2020	1928789000	16853	8646	8253
46127	2021	1940164000	16868	8634	8375
46127	2022	2076941000	17063	8697	8509
46129	2020	280733000	5286	2126	2010
46129	2021	322613000	5246	2153	2054
46129	2022	329834000	5265	2113	2041
46135	2020	1256160000	23282	11745	11260
46135	2021	1454081000	23334	11633	11364
46135	2022	1591810000	23373	11732	11525
46137	2020	67401000	2392	947	908
46137	2021	76662000	2400	947	911
46137	2022	80711000	2395	945	911
47001	2020	3610601000	77302	34320	32012
47001	2021	3960848000	77567	34749	33350
47001	2022	4058974000	78913	35385	34208
47003	2020	2073731000	50381	21038	19363
47003	2021	2340997000	51157	21206	20292
47003	2022	2459149000	51950	21613	20879
47005	2020	597300000	15850	6780	6243
47005	2021	656886000	15839	6753	6415
47005	2022	653830000	16002	6823	6543
47007	2020	453729000	14954	4289	3929
47007	2021	505514000	14844	4299	4063
47007	2022	515449000	14798	4380	4148
47009	2020	6547155000	135649	63727	59667
47009	2021	7228403000	137649	64450	62113
47009	2022	7464299000	139958	65737	63686
47011	2020	4704210000	108820	52557	49109
47011	2021	5094878000	109769	50657	48488
47011	2022	5212562000	110616	50472	48652
47013	2020	1531075000	39301	14581	13479
47013	2021	1664959000	39409	14775	14037
47013	2022	1664527000	39584	15007	14385
47015	2020	582610000	14568	6522	6097
47015	2021	641304000	14535	6646	6409
47015	2022	650313000	14788	6882	6673
47017	2020	1066237000	28421	11422	10575
47017	2021	1165753000	28287	11566	11020
47017	2022	1153792000	28458	11741	11285
47019	2020	2096297000	56362	23673	22058
47019	2021	2277387000	56060	24085	23025
47019	2022	2277749000	56410	24130	23251
47021	2020	2028573000	41128	21362	20146
47021	2021	2221245000	41547	21976	21257
47021	2022	2311511000	41830	22668	22064
47023	2020	666482000	17377	8471	8002
47023	2021	715316000	17479	8601	8306
47023	2022	716432000	17609	8542	8287
47025	2020	1246932000	32066	12779	11831
47025	2021	1342637000	32146	12750	12200
47025	2022	1364753000	32431	12884	12392
47027	2020	255397000	7588	2703	2494
47027	2021	296037000	7572	2752	2601
47027	2022	315676000	7620	2780	2651
47029	2020	1336823000	36039	14859	13323
47029	2021	1489346000	36370	14722	13872
47029	2022	1502472000	36879	14685	13932
47031	2020	2514727000	58134	25669	23629
47031	2021	2748626000	58933	25204	24127
47031	2022	2801837000	59728	25174	24324
47033	2020	613283000	13903	6825	6434
47033	2021	685317000	13993	6903	6647
47033	2022	655744000	13888	6847	6628
47035	2020	2534258000	61377	22779	21064
47035	2021	2781953000	62431	22771	21643
47035	2022	2829263000	63522	23261	22264
47037	2020	52398623000	716058	399372	366443
47037	2021	57075072000	703372	403974	386391
47037	2022	60582226000	708144	414106	402427
47039	2020	523105000	11437	4440	4059
47039	2021	560285000	11413	4311	4054
47039	2022	569522000	11564	4396	4197
47041	2020	899821000	20187	7616	6918
47041	2021	986449000	20478	7583	7216
47041	2022	1014219000	21003	7697	7396
47043	2020	2538202000	54442	26339	24769
47043	2021	2775562000	55174	27043	26082
47043	2022	2880513000	55761	27999	27170
47045	2020	1699479000	36709	15907	14649
47045	2021	1878281000	36586	16260	15487
47045	2022	1852325000	36410	16565	15970
47047	2020	2701607000	42151	19195	18002
47047	2021	3056929000	42899	19252	18421
47047	2022	3207236000	43630	19250	18574
47049	2020	704018000	18533	7518	7047
47049	2021	791110000	18837	7541	7223
47049	2022	806035000	19332	7714	7421
47051	2020	1829955000	42839	19893	18297
47051	2021	1998303000	43247	19422	18635
47051	2022	2043921000	43942	19369	18690
47053	2020	2146779000	50436	21795	20319
47053	2021	2354651000	50537	21610	20647
47053	2022	2341104000	50837	21601	20836
47055	2020	1223904000	30340	14635	13417
47055	2021	1330996000	30403	14688	14027
47055	2022	1363834000	30554	14909	14419
47057	2020	896256000	23563	9488	8812
47057	2021	1012416000	23833	9588	9163
47057	2022	1029549000	24277	9751	9377
47059	2020	2772833000	70333	28887	26539
47059	2021	2981756000	70603	28843	27520
47059	2022	3018925000	71405	28926	27775
47061	2020	488032000	13539	5126	4617
47061	2021	528497000	13586	4985	4700
47061	2022	530201000	13783	4929	4705
47063	2020	2642286000	64537	27929	25951
47063	2021	2988829000	64390	27832	26661
47063	2022	3047678000	65168	28156	27128
47065	2020	20635821000	367242	183019	170053
47065	2021	21906252000	369027	181768	174011
47065	2022	22739854000	374682	184617	178316
47067	2020	202532000	6625	2194	2014
47067	2021	225093000	6777	2259	2145
47067	2022	217860000	6845	2272	2177
47069	2020	830430000	25432	9286	8550
47069	2021	914356000	25276	8971	8413
47069	2022	887506000	25529	8941	8564
47071	2020	1120680000	26805	10257	9546
47071	2021	1200802000	26878	10238	9758
47071	2022	1198991000	27077	10144	9738
47073	2020	2146525000	56710	23384	21589
47073	2021	2364189000	57257	23070	21995
47073	2022	2387525000	58043	23159	22254
47075	2020	647254000	17824	7777	7102
47075	2021	718118000	17715	7642	7179
47075	2022	658616000	17550	7581	7237
47077	2020	1133164000	27827	11886	10931
47077	2021	1285969000	27916	11902	11360
47077	2022	1290966000	27929	11725	11296
47079	2020	1509413000	32144	14133	13136
47079	2021	1656597000	32250	13846	13255
47079	2022	1694221000	32379	13603	13060
47081	2020	950951000	24969	11096	10450
47081	2021	1057467000	25085	11430	11010
47081	2022	1083456000	25455	11773	11431
47083	2020	302004000	8303	3245	2993
47083	2021	324511000	8282	3199	3038
47083	2022	322098000	8219	3171	3032
47085	2020	779203000	19001	8688	8154
47085	2021	847652000	19200	8623	8271
47085	2022	851427000	19106	8697	8395
47087	2020	411760000	11634	4714	4341
47087	2021	446691000	11777	4778	4561
47087	2022	446432000	11989	4792	4605
47089	2020	2253772000	54908	24937	23063
47089	2021	2481653000	55562	24768	23699
47089	2022	2542291000	56727	25023	24109
47091	2020	638079000	17990	7679	7197
47091	2021	697311000	18056	7697	7411
47091	2022	696820000	18086	7533	7277
47093	2020	26903816000	480500	243170	228861
47093	2021	30196108000	486812	246772	238320
47093	2022	31402606000	494574	251747	244518
47095	2020	184522000	6988	1678	1542
47095	2021	216784000	6597	1665	1563
47095	2022	197836000	6507	1636	1554
47097	2020	914754000	25120	9690	8841
47097	2021	1029820000	24922	9594	8999
47097	2022	984416000	24793	9404	8961
47099	2020	1687748000	44182	19249	17761
47099	2021	1872005000	44729	19315	18445
47099	2022	1915457000	45415	19266	18594
47101	2020	495535000	12602	5340	4940
47101	2021	535504000	12854	5542	5267
47101	2022	539867000	12957	5576	5374
47103	2020	1554854000	35335	15966	14623
47103	2021	1726071000	35451	16263	15577
47103	2022	1755522000	36004	16660	16123
47105	2020	3152285000	55127	23701	22225
47105	2021	3622387000	56672	23920	23062
47105	2022	3903252000	58181	24444	23649
47107	2020	2165371000	53344	23314	21495
47107	2021	2338399000	53907	22508	21438
47107	2022	2375773000	54719	21605	20731
47109	2020	926489000	25858	8354	7654
47109	2021	1000227000	25854	8352	7889
47109	2022	996782000	25988	8383	7997
47111	2020	893884000	25263	11160	10433
47111	2021	1005493000	25682	11331	10896
47111	2022	1045367000	26229	11678	11320
47113	2020	4622085000	98833	49372	45677
47113	2021	5113000000	98585	49902	47583
47113	2022	5189167000	99245	49138	47445
47115	2020	1243358000	28865	12268	11344
47115	2021	1369017000	28927	12172	11616
47115	2022	1385250000	29094	12374	11894
47117	2020	1484389000	34466	15475	14064
47117	2021	1658297000	35032	15545	14809
47117	2022	1730105000	35878	15622	15105
47119	2020	4853243000	101824	51065	46948
47119	2021	5432152000	105003	52036	49440
47119	2022	5727723000	108159	53113	51496
47121	2020	477531000	12807	5191	4741
47121	2021	516982000	13029	5161	4899
47121	2022	528871000	13272	5180	4953
47123	2020	1781489000	46395	20148	18535
47123	2021	1961677000	46668	20664	19842
47123	2022	1976467000	47740	20975	20248
47125	2020	10140569000	221265	86939	80370
47125	2021	11210468000	227841	87572	83443
47125	2022	11510381000	235201	88330	85037
47127	2020	293919000	6471	3611	3418
47127	2021	316128000	6652	3572	3473
47127	2022	327866000	6742	3686	3595
47129	2020	720250000	21038	7581	7101
47129	2021	784916000	21101	7718	7368
47129	2022	785174000	21224	7869	7568
47131	2020	1352049000	30767	12166	11343
47131	2021	1491583000	30498	12376	11776
47131	2022	1488947000	30394	12779	12287
47133	2020	854903000	22592	9735	9123
47133	2021	922646000	22856	9971	9594
47133	2022	908886000	23044	10013	9673
47135	2020	295031000	8379	2960	2677
47135	2021	315721000	8473	2873	2657
47135	2022	308427000	8685	2794	2644
47137	2020	213213000	5002	2235	2101
47137	2021	212903000	5082	2235	2147
47137	2022	213819000	5107	2181	2097
47139	2020	644796000	17568	7382	6878
47139	2021	710081000	17784	7099	6792
47139	2022	728284000	17863	7077	6813
47141	2020	3542779000	80052	35082	32815
47141	2021	3891836000	81255	35454	34072
47141	2022	3977411000	82382	35403	34208
47143	2020	1305766000	32934	13112	11853
47143	2021	1441715000	33205	13530	12850
47143	2022	1463969000	33730	13861	13267
47145	2020	2486994000	53510	22961	21506
47145	2021	2691667000	54056	23332	22362
47145	2022	2764686000	55082	23828	22954
47147	2020	3463320000	72945	37200	34926
47147	2021	3811835000	74088	37999	36677
47147	2022	3949220000	75470	39317	38201
47149	2020	15778356000	343266	186771	173735
47149	2021	17516521000	351202	189845	183004
47149	2022	18633772000	360619	196153	190828
47151	2020	749186000	21878	8147	7461
47151	2021	823184000	21895	8040	7613
47151	2022	825470000	22035	8172	7773
47153	2020	660359000	15850	6164	5685
47153	2021	746939000	16445	6115	5829
47153	2022	778840000	16909	6211	5956
47155	2020	4435098000	98562	54071	48806
47155	2021	5094854000	99435	54750	52515
47155	2022	5192446000	98789	55091	53350
47157	2020	49569047000	929388	447440	404536
47157	2021	54333362000	923352	446509	415413
47157	2022	53823833000	916371	439083	419218
47159	2020	872559000	19970	9237	8677
47159	2021	953447000	20181	9456	9124
47159	2022	984465000	20489	9780	9489
47161	2020	625121000	13711	5409	5066
47161	2021	675615000	13830	5386	5153
47161	2022	682743000	14035	5467	5255
47163	2020	7381516000	158237	69256	64328
47163	2021	8010302000	159167	68662	65625
47163	2022	8216357000	160820	68787	66360
47165	2020	10848564000	197396	103406	96677
47165	2021	11997028000	200582	105622	101936
47165	2022	12709595000	203858	109078	106085
47167	2020	2746351000	61041	27614	25776
47167	2021	3033008000	61049	27664	26420
47167	2022	3012883000	61656	27667	26664
47169	2020	394593000	11638	5425	5086
47169	2021	434284000	11619	5562	5348
47169	2022	453896000	12111	5740	5568
47171	2020	704277000	17883	7019	6464
47171	2021	752792000	17667	7059	6699
47171	2022	749822000	17674	7080	6773
47173	2020	728130000	19841	7627	7105
47173	2021	817731000	19996	7739	7412
47173	2022	835701000	20452	7878	7580
47175	2020	210226000	6174	2013	1841
47175	2021	228844000	6277	2018	1914
47175	2022	231227000	6429	2061	1973
47177	2020	1595254000	41054	17227	15701
47177	2021	1744941000	41529	16713	15883
47177	2022	1756973000	42026	16420	15737
47179	2020	6385173000	133213	60297	56488
47179	2021	7005840000	133525	61140	58854
47179	2022	7270430000	136172	61533	59542
47181	2020	535126000	16222	6353	5919
47181	2021	582790000	16336	6281	6013
47181	2022	595866000	16308	6484	6190
47183	2020	1325494000	32899	15463	14577
47183	2021	1490247000	32870	15475	14859
47183	2022	1512228000	33063	15300	14768
47185	2020	1031391000	27443	12064	11213
47185	2021	1145783000	27557	11898	11411
47185	2022	1164177000	28064	11992	11570
47187	2020	24731101000	249538	129379	123273
47187	2021	28460482000	256209	133518	130004
47187	2022	31281241000	260815	138494	135165
47189	2020	8185821000	148645	77883	72940
47189	2021	9479521000	152010	79454	76782
47189	2022	10327893000	158555	82167	80000
48001	2020	2268057000	57926	22985	21676
48001	2021	2514011000	58233	23375	22240
48001	2022	2547260000	58064	23122	22319
48003	2020	907707000	18617	9173	8420
48003	2021	951535000	18411	9065	8547
48003	2022	995967000	18334	9419	9114
48005	2020	3709022000	86376	35364	32661
48005	2021	4072361000	86654	35874	33563
48005	2022	4118195000	87101	35501	33854
48007	2020	1364453000	23932	9149	8383
48007	2021	1526510000	24519	9261	8593
48007	2022	1598202000	24944	9291	8797
48009	2020	497072000	8554	3962	3753
48009	2021	524887000	8684	3999	3829
48009	2022	548620000	8835	4013	3877
48011	2020	114431000	1849	895	857
48011	2021	110152000	1838	925	892
48011	2022	108328000	1850	934	908
48013	2020	2073505000	49134	21590	19743
48013	2021	2311133000	49886	22022	20683
48013	2022	2329549000	50864	22505	21586
48015	2020	1698176000	30131	13430	12536
48015	2021	1848768000	30421	13766	13002
48015	2022	1916518000	31097	14133	13571
48017	2020	348969000	6868	2381	2267
48017	2021	354860000	6803	2427	2306
48017	2022	356032000	6779	2419	2316
48019	2020	1158494000	20992	9921	9344
48019	2021	1261527000	21551	10298	9807
48019	2022	1310810000	22115	10621	10225
48021	2020	3880549000	98046	42647	40074
48021	2021	4462678000	102166	45500	43453
48021	2022	4736728000	106188	48219	46585
48023	2020	192738000	3461	1765	1705
48023	2021	199336000	3456	1835	1772
48023	2022	211385000	3466	1905	1852
48025	2020	1016103000	31049	9798	8825
48025	2021	1073126000	30828	9345	8551
48025	2022	1054879000	30394	9206	8665
48027	2020	17334197000	372229	144433	134302
48027	2021	19087905000	380241	148232	139665
48027	2022	19192659000	388386	149152	142464
48029	2020	96677356000	2015369	932280	861055
48029	2021	105893306000	2030895	951800	900953
48029	2022	108297179000	2059530	977978	941275
48031	2020	749069000	11450	6563	6310
48031	2021	874331000	11890	6898	6665
48031	2022	925961000	12418	7193	6991
48033	2020	44614000	641	440	425
48033	2021	60458000	621	598	585
48033	2022	67818000	585	676	663
48035	2020	867487000	18245	8226	7776
48035	2021	961358000	18495	8532	8140
48035	2022	980882000	18697	8736	8410
48037	2020	4226602000	92924	38608	35745
48037	2021	4577890000	92291	38912	36617
48037	2022	4609963000	92035	38528	36726
48039	2020	19835688000	373481	178219	162907
48039	2021	21428774000	378858	180831	168591
48039	2022	22376306000	388181	184653	176191
48041	2020	10248454000	234486	116907	110672
48041	2021	11096912000	237583	123821	118762
48041	2022	11514089000	242014	128688	124664
48043	2020	484892000	9553	4089	3818
48043	2021	542543000	9459	4227	4034
48043	2022	543443000	9343	4218	4072
48045	2020	64724000	1419	552	526
48045	2021	87353000	1400	585	557
48045	2022	78409000	1431	603	581
48047	2020	282804000	7057	2585	2309
48047	2021	298624000	6994	2504	2277
48047	2022	295073000	6906	2375	2231
48049	2020	1642784000	38048	15199	14213
48049	2021	1774001000	38142	15423	14619
48049	2022	1797114000	38373	15336	14663
48051	2020	919401000	17680	8114	7597
48051	2021	998320000	18110	8578	8155
48051	2022	1040759000	18657	8869	8547
48053	2020	2819374000	49473	23636	22510
48053	2021	3247642000	51080	24777	23840
48053	2022	3389584000	52502	25625	24856
48055	2020	1725029000	45949	18909	17680
48055	2021	1885718000	46904	20165	19171
48055	2022	1932708000	47848	21303	20557
48057	2020	1199497000	20063	11905	11210
48057	2021	1267843000	19798	12274	11670
48057	2022	1310970000	19706	12298	11842
48059	2020	671611000	13744	5973	5647
48059	2021	702393000	14078	6168	5878
48059	2022	722045000	14210	6281	6054
48061	2020	14204344000	421445	170184	152951
48061	2021	16079007000	423124	176084	161984
48061	2022	15870893000	425208	177980	167764
48063	2020	558124000	12427	4977	4609
48063	2021	610531000	12594	5125	4821
48063	2022	638277000	12716	5158	4926
48065	2020	274840000	5791	2869	2748
48065	2021	324606000	5708	2976	2859
48065	2022	276341000	5784	3001	2908
48067	2020	1240246000	28436	12194	11227
48067	2021	1327781000	28557	12415	11593
48067	2022	1349132000	28539	12017	11448
48069	2020	579267000	7336	3265	3146
48069	2021	622026000	7362	3395	3275
48069	2022	631840000	7298	3338	3232
48071	2020	2705938000	47025	20311	18407
48071	2021	2939915000	48721	20740	19056
48071	2022	3164169000	51288	21038	19912
48073	2020	2047474000	50488	21088	19412
48073	2021	2223510000	51163	20928	19597
48073	2022	2241230000	51645	20689	19767
48075	2020	237754000	6662	3010	2898
48075	2021	268666000	6781	3022	2912
48075	2022	300257000	6809	3185	3094
48077	2020	500696000	10250	4795	4530
48077	2021	542189000	10315	4860	4618
48077	2022	548592000	10486	4868	4678
48079	2020	108661000	2557	1111	1031
48079	2021	141273000	2491	1083	1015
48079	2022	101158000	2526	1154	1099
48081	2020	163945000	3295	1360	1285
48081	2021	167825000	3313	1384	1318
48081	2022	170521000	3333	1546	1492
48083	2020	394196000	7686	2859	2648
48083	2021	439345000	7736	2966	2789
48083	2022	449457000	7850	3056	2922
48085	2020	77559730000	1075654	578797	542541
48085	2021	87585892000	1114450	600186	574037
48085	2022	95700547000	1158696	625800	605672
48087	2020	125320000	2638	1066	1021
48087	2021	141377000	2603	1098	1050
48087	2022	119385000	2568	1088	1050
48089	2020	1143949000	20558	9653	9116
48089	2021	1271587000	20592	9952	9476
48089	2022	1278312000	20754	10232	9868
48091	2020	10819663000	163640	77199	72493
48091	2021	12625949000	174891	79647	76016
48091	2022	13861893000	184642	82200	79317
48093	2020	654023000	13628	5612	5303
48093	2021	692464000	13804	6054	5773
48093	2022	736406000	13878	6343	6120
48095	2020	117122000	3303	1328	1268
48095	2021	127734000	3336	1357	1299
48095	2022	124406000	3340	1333	1290
48097	2020	2262367000	41744	19209	17844
48097	2021	2500159000	42408	19486	18499
48097	2022	2629184000	43050	20068	19386
48099	2020	2915567000	83146	23753	22179
48099	2021	3175421000	84406	24472	23069
48099	2022	3104900000	85057	24651	23532
48101	2020	81805000	1364	566	538
48101	2021	92896000	1357	636	608
48101	2022	114178000	1307	862	838
48103	2020	221401000	4673	1622	1400
48103	2021	231685000	4639	1628	1477
48103	2022	241974000	4546	1649	1567
48105	2020	184292000	3094	1546	1408
48105	2021	181990000	3015	1474	1376
48105	2022	182773000	2943	1432	1375
48107	2020	229393000	5093	2288	2166
48107	2021	269595000	5085	2393	2259
48107	2022	224325000	4998	2420	2319
48109	2020	143272000	2185	1126	1052
48109	2021	152739000	2182	1075	1023
48109	2022	176830000	2155	1159	1126
48111	2020	503567000	7126	3726	3623
48111	2021	504865000	7188	3823	3720
48111	2022	506640000	7241	3896	3804
48113	2020	172373083000	2609966	1329323	1225658
48113	2021	188060854000	2587954	1373693	1297412
48113	2022	196583986000	2600840	1421836	1368400
48115	2020	547786000	12473	4565	4166
48115	2021	582691000	12412	4629	4314
48115	2022	587774000	12130	4521	4321
48117	2020	1059806000	18526	8472	8166
48117	2021	1138758000	18345	8826	8498
48117	2022	1211547000	18377	9020	8748
48119	2020	228647000	5222	2389	2257
48119	2021	250920000	5337	2458	2337
48119	2022	251016000	5406	2512	2409
48121	2020	59049136000	914324	511246	478345
48121	2021	67212262000	943857	529274	505915
48121	2022	72721863000	977281	551918	533977
48123	2020	1156824000	19835	9175	8618
48123	2021	1343642000	19949	9470	9009
48123	2022	1406174000	19772	9156	8840
48125	2020	80941000	1758	659	618
48125	2021	84785000	1734	690	654
48125	2022	82676000	1726	682	649
48127	2020	432321000	8577	6461	6049
48127	2021	446929000	8479	5928	5599
48127	2022	451702000	8387	6180	5942
48129	2020	153291000	3279	1412	1350
48129	2021	159784000	3364	1456	1395
48129	2022	156447000	3339	1492	1439
48131	2020	441974000	9807	4823	4236
48131	2021	478253000	10003	5472	5034
48131	2022	466212000	9888	5069	4841
48133	2020	961333000	17775	7318	6824
48133	2021	957011000	17834	7423	6997
48133	2022	1003151000	17944	6733	6424
48135	2020	7961725000	165485	82540	73412
48135	2021	8472763000	160764	80887	74420
48135	2022	8919825000	160869	83257	79976
48137	2020	102646000	1424	1234	1190
48137	2021	100997000	1431	1287	1232
48137	2022	94107000	1422	1193	1158
48139	2020	9687518000	194295	95045	89362
48139	2021	10979312000	203107	99090	94587
48139	2022	11771560000	212182	103397	99752
48141	2020	34822699000	866547	361398	331382
48141	2021	38298213000	868086	366331	343774
48141	2022	38397840000	868763	370182	354166
48143	2020	1953228000	42716	19921	18776
48143	2021	2095463000	43389	20629	19692
48143	2022	2219635000	43895	21227	20481
48145	2020	675033000	16954	6378	5989
48145	2021	734682000	17099	6706	6350
48145	2022	719440000	17049	6827	6545
48147	2020	1551579000	35798	16673	15884
48147	2021	1722808000	36716	17182	16483
48147	2022	1749661000	37125	17487	16871
48149	2020	1521589000	24471	11734	11180
48149	2021	1706731000	24669	11959	11443
48149	2022	1749853000	24913	11997	11576
48151	2020	181390000	3676	1592	1521
48151	2021	210032000	3678	1623	1554
48151	2022	195255000	3622	1629	1571
48153	2020	235762000	5368	2490	2335
48153	2021	281799000	5299	2507	2363
48153	2022	235705000	5235	2471	2368
48155	2020	60529000	1085	574	551
48155	2021	64899000	1052	589	569
48155	2022	73039000	1057	568	550
48157	2020	52772051000	829036	402550	371808
48157	2021	58003716000	860124	409265	385179
48157	2022	62587149000	889146	419021	402341
48159	2020	493552000	10371	4808	4551
48159	2021	538224000	10472	5246	5014
48159	2022	611522000	10618	5356	5179
48161	2020	795307000	19445	6311	5783
48161	2021	886314000	19784	6361	5903
48161	2022	897739000	19950	6355	6013
48163	2020	650758000	18409	9515	8975
48163	2021	681344000	17548	9477	9022
48163	2022	667254000	17815	9490	9164
48165	2020	1008908000	21699	9692	9146
48165	2021	1057260000	21881	9836	9384
48165	2022	1040847000	22181	10171	9864
48167	2020	19758585000	351559	163817	149429
48167	2021	21201592000	355309	165655	154797
48167	2022	21872079000	357117	169221	161693
48169	2020	183090000	5817	2005	1868
48169	2021	204010000	6269	2007	1908
48169	2022	205540000	6262	1969	1886
48171	2020	2082828000	26742	13218	12589
48171	2021	2233163000	27282	14004	13532
48171	2022	2322504000	27477	14612	14222
48173	2020	122897000	1117	802	773
48173	2021	142773000	1142	817	792
48173	2022	143049000	1164	876	852
48175	2020	370648000	7021	3122	2879
48175	2021	401488000	7146	3180	2974
48175	2022	408632000	7131	3188	3046
48177	2020	1000605000	19679	9489	8975
48177	2021	1137636000	19655	9640	9223
48177	2022	1323321000	19832	9541	9227
48179	2020	971337000	21198	7744	7114
48179	2021	978432000	21085	7731	7223
48179	2022	979844000	21015	7700	7352
48181	2020	6650503000	136100	63891	60126
48181	2021	7378993000	139561	65060	62019
48181	2022	7642205000	143131	67033	64573
48183	2020	6301758000	124241	56255	51574
48183	2021	6771244000	124052	56419	52829
48183	2022	7019956000	125443	57085	54632
48185	2020	1181229000	29430	11063	10168
48185	2021	1296232000	30106	11234	10492
48185	2022	1298190000	30754	11498	10974
48187	2020	8598588000	173686	80569	75621
48187	2021	9493095000	177254	82771	79063
48187	2022	9830228000	182760	85569	82634
48189	2020	1277252000	32465	11695	10904
48189	2021	1369361000	32234	11972	11245
48189	2022	1327987000	31827	11708	11125
48191	2020	108596000	2797	1063	1001
48191	2021	141257000	2845	1089	1029
48191	2022	110078000	2810	1100	1054
48193	2020	532721000	8247	3728	3558
48193	2021	514247000	8238	3844	3686
48193	2022	531983000	8298	3884	3750
48195	2020	368129000	5260	2471	2385
48195	2021	400011000	5138	2568	2488
48195	2022	402812000	5151	2907	2837
48197	2020	180336000	3559	1701	1626
48197	2021	189478000	3544	1745	1670
48197	2022	199491000	3516	1796	1732
48199	2020	2895116000	56344	25184	22932
48199	2021	3045702000	57044	24867	22916
48199	2022	3158513000	57811	24970	23668
48201	2020	279805427000	4734505	2274838	2070430
48201	2021	313193267000	4735287	2292623	2146642
48201	2022	330617356000	4780913	2341765	2241382
48203	2020	3069913000	68798	28966	26683
48203	2021	3316895000	69454	28751	26869
48203	2022	3391410000	69955	29081	27770
48205	2020	437112000	5349	2608	2556
48205	2021	446236000	5389	2746	2686
48205	2022	464168000	5208	2634	2582
48207	2020	262085000	5432	2663	2549
48207	2021	287169000	5392	2762	2651
48207	2022	273120000	5403	2772	2689
48209	2020	12725048000	243967	123296	115559
48209	2021	14715164000	256065	130746	125340
48209	2022	16179523000	269225	138727	134484
48211	2020	237375000	3363	1790	1708
48211	2021	232800000	3315	1646	1573
48211	2022	238198000	3217	1627	1572
48213	2020	3734643000	82394	36984	34602
48213	2021	4064074000	83590	38403	36417
48213	2022	4155970000	84511	39102	37594
48215	2020	27327410000	872806	359152	317207
48215	2021	30481804000	880633	367863	334443
48215	2022	29782422000	888367	371568	347089
48217	2020	1642427000	35962	16232	15208
48217	2021	1807430000	36430	16997	16144
48217	2022	1861175000	37329	17847	17145
48219	2020	1007451000	21503	10637	9790
48219	2021	1062965000	21256	10732	10099
48219	2022	1019256000	21161	10803	10404
48221	2020	3660550000	62054	27918	26073
48221	2021	3988550000	64263	29048	27543
48221	2022	4224076000	66373	29898	28759
48223	2020	1691307000	36824	17422	16531
48223	2021	1878805000	37237	17936	17152
48223	2022	2021384000	37804	18345	17686
48225	2020	1001259000	22055	10052	9524
48225	2021	1089373000	21958	10652	10134
48225	2022	1104598000	21950	10596	10216
48227	2020	1685597000	34812	13410	12319
48227	2021	1827087000	34336	13336	12481
48227	2022	1903514000	33672	13143	12471
48229	2020	116830000	3203	1844	1694
48229	2021	122964000	3289	1862	1755
48229	2022	121209000	3432	1886	1810
48231	2020	4429667000	100257	43158	40313
48231	2021	4926615000	103458	45015	42678
48231	2022	5190862000	108282	46855	44995
48233	2020	942692000	20568	8479	7871
48233	2021	980449000	20411	8611	8099
48233	2022	961287000	20215	8470	8087
48235	2020	107232000	1511	756	711
48235	2021	115909000	1531	783	745
48235	2022	122912000	1530	790	766
48237	2020	361556000	8486	3388	3150
48237	2021	402264000	8718	3421	3234
48237	2022	412564000	8922	3454	3322
48239	2020	722006000	14992	7265	6844
48239	2021	778782000	15097	7176	6816
48239	2022	736428000	15142	7154	6902
48241	2020	1545465000	32921	12817	11376
48241	2021	1644030000	32570	12854	11625
48241	2022	1667932000	32484	12673	11853
48243	2020	105943000	1986	957	908
48243	2021	114386000	1959	1033	989
48243	2022	113212000	1903	1018	982
48245	2020	11583447000	256118	104564	92024
48245	2021	12116809000	253531	102002	92031
48245	2022	12072705000	250830	101423	95037
48247	2020	183468000	4846	1872	1693
48247	2021	199236000	4797	1864	1703
48247	2022	193190000	4763	1809	1711
48249	2020	1732619000	38877	16080	13989
48249	2021	1872447000	38923	15643	14099
48249	2022	1867264000	38826	15440	14546
48251	2020	8712507000	180945	83252	77847
48251	2021	9717907000	187442	86254	82061
48251	2022	10330042000	195506	88975	85823
48253	2020	701602000	19678	5613	5216
48253	2021	779310000	19809	5756	5403
48253	2022	796278000	19935	5829	5575
48255	2020	926059000	14763	6980	6541
48255	2021	1143387000	14714	6870	6515
48255	2022	1204368000	14836	6645	6423
48257	2020	6940499000	147126	69207	64784
48257	2021	8041515000	158216	72056	68507
48257	2022	9076697000	172366	75163	72313
48259	2020	4551672000	44547	22127	21003
48259	2021	4781408000	46851	22942	22049
48259	2022	5216003000	48973	23735	22983
48261	2020	17362000	351	179	169
48261	2021	14167000	342	186	175
48261	2022	13687000	358	145	136
48263	2020	37685000	761	461	443
48263	2021	41116000	746	454	441
48263	2022	47152000	740	657	644
48265	2020	3072304000	52691	21644	20377
48265	2021	3338461000	53136	22219	21207
48265	2022	3450044000	53741	22340	21528
48267	2020	215479000	4291	1828	1736
48267	2021	239921000	4350	1887	1807
48267	2022	240524000	4422	1862	1799
48269	2020	22053000	266	236	232
48269	2021	22309000	256	464	460
48269	2022	26444000	233	572	567
48271	2020	124449000	3124	1307	1229
48271	2021	129449000	3117	1254	1184
48271	2022	127638000	3128	1262	1201
48273	2020	1270626000	30977	13209	12090
48273	2021	1391421000	30642	13245	12314
48273	2022	1376678000	30362	13104	12469
48275	2020	161046000	3346	1444	1363
48275	2021	169617000	3307	1477	1408
48275	2022	169916000	3273	1483	1423
48277	2020	2347071000	50126	23496	21983
48277	2021	2579011000	50305	24675	23315
48277	2022	2611271000	50484	24445	23382
48279	2020	655952000	13005	5192	4921
48279	2021	699005000	12886	5243	4979
48279	2022	705006000	12724	5277	5065
48281	2020	1206921000	21707	9009	8525
48281	2021	1335228000	22213	9338	8885
48281	2022	1362509000	22785	9415	9062
48283	2020	293273000	6664	3723	3472
48283	2021	329909000	6716	3811	3648
48283	2022	337959000	6604	4116	3997
48285	2020	1220840000	20348	8383	7944
48285	2021	1304326000	20490	8689	8296
48285	2022	1350081000	20589	9146	8835
48287	2020	964662000	17502	9132	8680
48287	2021	1025683000	17671	9023	8630
48287	2022	1029774000	17954	8794	8481
48289	2020	774050000	15731	6073	5598
48289	2021	869946000	15985	6215	5780
48289	2022	920780000	16209	6098	5779
48291	2020	3730945000	92465	34302	30712
48291	2021	4081992000	97382	34962	31828
48291	2022	4326732000	101992	35332	33238
48293	2020	953747000	22139	8292	7700
48293	2021	1054014000	22125	8536	8009
48293	2022	1045855000	22253	8455	8064
48295	2020	292747000	3036	1519	1456
48295	2021	315853000	2907	1513	1455
48295	2022	332890000	2854	1467	1421
48297	2020	488659000	11349	5147	4760
48297	2021	527511000	11383	4952	4623
48297	2022	528501000	11428	4884	4678
48299	2020	1196106000	21285	8436	7950
48299	2021	1378203000	22013	8993	8554
48299	2022	1443562000	22540	9353	8993
48301	2020	7026000	65	296	291
48301	2021	7037000	57	488	483
48301	2022	7210000	51	866	861
48303	2020	14998699000	311564	156589	147580
48303	2021	16319999000	314597	161486	154144
48303	2022	16652095000	317561	163437	157861
48305	2020	243959000	5610	2736	2586
48305	2021	338658000	5652	2818	2696
48305	2022	291257000	5724	2870	2767
48307	2020	330165000	7591	3203	2961
48307	2021	360564000	7532	3183	2980
48307	2022	359218000	7497	3158	3024
48309	2020	11950503000	261177	118990	111569
48309	2021	13167732000	263714	124620	118600
48309	2022	13417604000	266836	126753	122139
48311	2020	48314000	598	716	696
48311	2021	63983000	597	752	735
48311	2022	68310000	576	851	835
48313	2020	504381000	13464	4460	4140
48313	2021	557038000	13498	4705	4412
48313	2022	561280000	13661	4765	4557
48315	2020	433090000	9751	4226	3874
48315	2021	466692000	9618	4266	3977
48315	2022	474540000	9560	4228	4015
48317	2020	431527000	5252	2551	2395
48317	2021	477726000	5208	2630	2504
48317	2022	515744000	5217	2803	2715
48319	2020	216823000	3968	1723	1627
48319	2021	220989000	3929	1805	1720
48319	2022	218789000	3982	1830	1768
48321	2020	1728072000	36280	16454	14720
48321	2021	1855549000	36366	16578	15229
48321	2022	1819272000	36125	17202	16175
48323	2020	2060991000	57873	24229	20559
48323	2021	2235367000	57841	23814	20886
48323	2022	2228369000	57843	23525	21646
48325	2020	2367545000	50939	21299	19948
48325	2021	2617207000	52322	21983	20878
48325	2022	2687893000	53723	22675	21800
48327	2020	92935000	1961	861	817
48327	2021	93491000	1964	850	809
48327	2022	90563000	1968	859	827
48329	2020	18220253000	170348	98346	90423
48329	2021	20970515000	168206	100142	94599
48329	2022	24955132000	171999	106186	103044
48331	2020	1022436000	24775	9665	8970
48331	2021	1162707000	25189	10246	9650
48331	2022	1193275000	25628	10394	9950
48333	2020	223847000	4447	1875	1798
48333	2021	235602000	4497	1925	1839
48333	2022	232569000	4500	1905	1823
48335	2020	305213000	9014	2338	2153
48335	2021	333336000	9050	2354	2189
48335	2022	331463000	8943	2311	2208
48337	2020	873660000	19994	9047	8446
48337	2021	961215000	20430	9317	8836
48337	2022	973776000	21063	9294	8956
48339	2020	43084847000	625243	289558	267945
48339	2021	46775202000	650261	294875	277933
48339	2022	51594318000	678490	302110	290130
48341	2020	1074221000	21264	10543	10148
48341	2021	1176879000	21122	11115	10741
48341	2022	1221471000	20996	11313	11012
48343	2020	529697000	11972	4846	4301
48343	2021	568116000	12009	4629	4158
48343	2022	595270000	12083	4491	4206
48345	2020	43017000	1063	431	412
48345	2021	41342000	1065	450	427
48345	2022	42021000	1032	508	487
48347	2020	2721156000	64619	27784	25955
48347	2021	2988767000	64699	28417	26856
48347	2022	3166210000	64862	28050	26833
48349	2020	2207886000	52828	23259	21818
48349	2021	2431629000	53616	23748	22528
48349	2022	2465719000	54636	23564	22637
48351	2020	498232000	12157	4970	4415
48351	2021	527350000	12202	4913	4412
48351	2022	525816000	12052	4896	4558
48353	2020	686251000	14723	7042	6664
48353	2021	766178000	14600	7204	6863
48353	2022	750966000	14473	6801	6543
48355	2020	17236592000	353376	164180	149531
48355	2021	19130597000	353230	163762	152585
48355	2022	19595351000	351674	164081	156295
48357	2020	539686000	9954	4021	3786
48357	2021	613374000	9763	3988	3806
48357	2022	578937000	9606	3972	3836
48359	2020	125121000	1764	892	857
48359	2021	128797000	1730	923	890
48359	2022	134321000	1752	934	906
48361	2020	3997941000	84747	35658	31878
48361	2021	4187371000	84641	34980	31893
48361	2022	4261107000	84934	34953	32930
48363	2020	1349519000	28445	13148	12222
48363	2021	1483491000	28676	12990	12254
48363	2022	1512897000	29239	13137	12634
48365	2020	1093522000	22492	9385	8596
48365	2021	1203146000	22538	9765	9120
48365	2022	1292263000	22677	9609	9162
48367	2020	9200580000	149547	69418	65376
48367	2021	10543237000	156966	72181	68961
48367	2022	11596160000	165834	74559	72083
48369	2020	572333000	9854	4838	4714
48369	2021	628187000	9779	5017	4870
48369	2022	654053000	9620	5146	5020
48371	2020	608708000	15185	6393	5865
48371	2021	651809000	15126	6243	5813
48371	2022	659332000	14735	6223	5965
48373	2020	2286475000	50494	18323	16708
48373	2021	2495727000	51816	18696	17219
48373	2022	2510949000	53255	18726	17674
48375	2020	5993110000	118272	53070	50128
48375	2021	6477888000	116538	54571	52204
48375	2022	6510561000	115645	54782	52994
48377	2020	331835000	6109	3192	2717
48377	2021	355861000	6115	3113	2797
48377	2022	341120000	5939	3108	2914
48379	2020	482211000	12178	5984	5702
48379	2021	521534000	12449	6363	6112
48379	2022	527075000	12823	6538	6312
48381	2020	7514331000	141342	72890	69640
48381	2021	8176593000	144039	75044	72361
48381	2022	8460916000	146140	75680	73487
48383	2020	188329000	3378	1799	1623
48383	2021	197603000	3228	1675	1552
48383	2022	204550000	3135	1640	1581
48385	2020	148536000	2743	1080	1010
48385	2021	160795000	2806	1150	1082
48385	2022	164360000	2840	1141	1087
48387	2020	559874000	11560	5095	4770
48387	2021	602851000	11547	5338	5021
48387	2022	616943000	11542	5211	4944
48389	2020	706167000	14763	8785	8153
48389	2021	748417000	13002	8545	8053
48389	2022	794089000	12905	8536	8241
48391	2020	329471000	6742	3038	2787
48391	2021	364316000	6700	3045	2844
48391	2022	360645000	6632	2985	2843
48393	2020	43466000	822	401	383
48393	2021	43797000	798	402	385
48393	2022	43370000	803	401	385
48395	2020	806378000	16771	7294	6825
48395	2021	884328000	16948	7719	7317
48395	2022	923550000	17153	7982	7672
48397	2020	7428531000	109136	54536	51302
48397	2021	8365201000	116549	56784	54313
48397	2022	9346568000	123208	59266	57275
48399	2020	466541000	9919	4519	4296
48399	2021	503365000	9886	4674	4481
48399	2022	511705000	9859	4680	4523
48401	2020	2219875000	52257	21911	20299
48401	2021	2352403000	53071	22145	20827
48401	2022	2437347000	53333	22474	21529
48403	2020	412957000	9888	3891	3469
48403	2021	461162000	9989	4000	3626
48403	2022	464686000	10048	3942	3660
48405	2020	364308000	7923	3014	2724
48405	2021	408854000	7900	2981	2739
48405	2022	449005000	7857	3111	2929
48407	2020	1159022000	27531	11587	10646
48407	2021	1251118000	27829	11935	11065
48407	2022	1265833000	28348	12084	11490
48409	2020	3310273000	68838	29355	26353
48409	2021	3561414000	69701	29397	26846
48409	2022	3558673000	69954	29300	27513
48411	2020	246894000	5722	2185	2072
48411	2021	252201000	5824	2218	2114
48411	2022	246565000	5824	2234	2154
48413	2020	125896000	2445	1208	1124
48413	2021	127526000	2443	1197	1131
48413	2022	131271000	2357	1233	1188
48415	2020	762208000	16937	6200	5689
48415	2021	789881000	16830	6136	5733
48415	2022	809405000	16686	6295	6031
48417	2020	261738000	3105	1773	1679
48417	2021	316987000	3177	1860	1786
48417	2022	336237000	3186	1875	1824
48419	2020	1160662000	23927	11194	10428
48419	2021	1340714000	23962	11519	10893
48419	2022	1571668000	24008	11060	10588
48421	2020	283414000	2787	1301	1261
48421	2021	357015000	2791	1392	1349
48421	2022	289743000	2799	1388	1349
48423	2020	12986025000	234195	108049	100705
48423	2021	14955757000	237114	110555	104846
48423	2022	16156522000	241922	112585	108356
48425	2020	478785000	9204	4262	3983
48425	2021	538203000	9472	4433	4204
48425	2022	569424000	9757	4570	4393
48427	2020	2001715000	65861	26050	21481
48427	2021	2199270000	65972	25542	21554
48427	2022	2079818000	65728	24752	22023
48429	2020	401189000	9098	4015	3770
48429	2021	434216000	9434	4207	3999
48429	2022	440014000	9390	4066	3912
48431	2020	83268000	1381	557	521
48431	2021	89021000	1382	585	555
48431	2022	94626000	1417	524	503
48433	2020	92577000	1245	570	541
48433	2021	104128000	1208	589	564
48433	2022	104957000	1182	701	680
48435	2020	226523000	3355	1210	1091
48435	2021	225988000	3284	1163	1069
48435	2022	222032000	3217	1040	981
48437	2020	418324000	6946	2512	2381
48437	2021	505069000	6996	2599	2468
48437	2022	491170000	6881	2582	2476
48439	2020	113957625000	2115682	1075554	995932
48439	2021	128806067000	2129402	1108542	1049944
48439	2022	133502348000	2154595	1139902	1098145
48441	2020	7150789000	143444	65896	62293
48441	2021	7860864000	143942	67530	64559
48441	2022	8067010000	145163	68904	66573
48443	2020	41274000	750	379	362
48443	2021	42139000	720	414	400
48443	2022	41677000	693	405	390
48445	2020	498071000	11794	4796	4444
48445	2021	529200000	11721	4807	4518
48445	2022	499034000	11567	4650	4454
48447	2020	65564000	1453	636	606
48447	2021	100031000	1508	986	957
48447	2022	72359000	1550	739	715
48449	2020	1326879000	31292	13219	12328
48449	2021	1508659000	31266	13632	12895
48449	2022	1619712000	31208	13764	13162
48451	2020	6726748000	120194	53580	50179
48451	2021	7253462000	119250	54828	52169
48451	2022	7492866000	118892	55626	53694
48453	2020	94348886000	1296515	734290	687548
48453	2021	107315870000	1308544	777556	746067
48453	2022	113981201000	1326436	823554	800001
48455	2020	598548000	13632	5291	4860
48455	2021	639763000	13809	5383	4991
48455	2022	649277000	13996	5368	5083
48457	2020	785453000	19811	7334	6608
48457	2021	860140000	19892	7397	6773
48457	2022	860205000	20030	7181	6744
48459	2020	1684880000	41038	17468	16121
48459	2021	1851610000	41811	17634	16540
48459	2022	1923809000	42488	17868	17097
48461	2020	183697000	3301	1808	1705
48461	2021	203164000	3241	1780	1688
48461	2022	226171000	3152	2414	2350
48463	2020	1186306000	24559	11266	10541
48463	2021	1320944000	24810	11328	10703
48463	2022	1316009000	24940	11264	10763
48465	2020	2038712000	47605	21464	19672
48465	2021	2255379000	47589	22253	20947
48465	2022	2280496000	47606	22262	21246
48467	2020	2524392000	59749	26006	24405
48467	2021	2778484000	61200	26968	25687
48467	2022	2874061000	62859	27948	26966
48469	2020	4884410000	91303	40803	37401
48469	2021	5225679000	90897	41138	38551
48469	2022	5375580000	91065	41237	39485
48471	2020	2393539000	76544	23982	22258
48471	2021	2634540000	78322	24049	22545
48471	2022	2652494000	78870	24019	22877
48473	2020	2723517000	57304	24376	22518
48473	2021	2999933000	59474	24905	23327
48473	2022	3198051000	61894	25472	24363
48475	2020	572462000	11680	6143	5560
48475	2021	611053000	11111	5935	5524
48475	2022	645552000	10964	6231	6001
48477	2020	2188224000	35805	15179	14320
48477	2021	2524335000	35898	15324	14515
48477	2022	2650496000	36159	15299	14685
48479	2020	9895846000	267345	115773	105964
48479	2021	10986536000	267633	116381	109107
48479	2022	10945018000	267780	117568	112669
48481	2020	2020917000	41564	21268	19822
48481	2021	2225819000	41697	21210	20009
48481	2022	2153148000	41824	21466	20640
48483	2020	232275000	4976	2185	2052
48483	2021	238598000	4905	2076	1948
48483	2022	226839000	4807	2014	1935
48485	2020	6102835000	129617	55338	51659
48485	2021	6544431000	130006	55642	52686
48485	2022	6626118000	129978	55477	53276
48487	2020	711228000	12844	4894	4607
48487	2021	705582000	12688	4931	4608
48487	2022	700208000	12491	4901	4662
48489	2020	664722000	20150	6584	5795
48489	2021	759325000	20290	7052	6339
48489	2022	703487000	20143	7268	6669
48491	2020	35560872000	615517	323000	304159
48491	2021	41037988000	644451	343600	329807
48491	2022	45040688000	671418	365035	354210
48493	2020	2595976000	50051	24370	22973
48493	2021	2878802000	51281	25169	24052
48493	2022	2987959000	52735	25975	25116
48495	2020	460757000	7750	3961	3587
48495	2021	458572000	7373	3750	3470
48495	2022	493069000	7306	3986	3827
48497	2020	3503338000	68943	32090	29988
48497	2021	3915029000	71888	33255	31632
48497	2022	4149943000	74895	34293	33059
48499	2020	2022019000	45041	17815	16633
48499	2021	2199548000	46031	18160	17133
48499	2022	2291270000	46857	18267	17436
48501	2020	367586000	7675	3501	3081
48501	2021	377476000	7559	3299	3048
48501	2022	368365000	7451	3296	3162
48503	2020	964267000	17847	7724	7316
48503	2021	1079598000	17911	8116	7745
48503	2022	1132161000	17962	8142	7861
48505	2020	414330000	13874	4664	4093
48505	2021	460296000	13893	4590	4055
48505	2022	458065000	13849	4590	4268
48507	2020	381361000	9662	3388	2904
48507	2021	407797000	9487	3281	2874
48507	2022	408359000	9377	3398	3103
49001	2020	283329000	7087	2845	2728
49001	2021	320192000	7203	2836	2754
49001	2022	349236000	7327	2853	2773
49003	2020	2423644000	57946	26695	25502
49003	2021	2676889000	59693	26926	26247
49003	2022	2855052000	61498	27627	26991
49005	2020	5748987000	133624	66025	64038
49005	2021	6654916000	137429	68871	67471
49005	2022	6794048000	140173	70880	69424
49007	2020	884946000	20488	8620	8156
49007	2021	927038000	20361	8436	8102
49007	2022	932033000	20571	8432	8129
49009	2020	47114000	952	413	394
49009	2021	48047000	977	411	396
49009	2022	47441000	1014	408	389
49011	2020	18314011000	363745	176601	169150
49011	2021	20515245000	367446	179395	174918
49011	2022	21511327000	369948	184020	179956
49013	2020	813879000	19617	7854	7227
49013	2021	880438000	19806	7760	7381
49013	2022	923783000	20161	8007	7744
49015	2020	378405000	9842	4411	4198
49015	2021	387993000	9963	4450	4275
49015	2022	399565000	10099	4524	4373
49017	2020	218301000	5107	2659	2382
49017	2021	261456000	5149	2782	2603
49017	2022	294549000	5281	2942	2765
49019	2020	599928000	9677	6256	5653
49019	2021	648867000	9665	6608	6317
49019	2022	683455000	9769	6957	6727
49021	2020	2105806000	57708	25328	24156
49021	2021	2369830000	60522	26472	25705
49021	2022	2473214000	62429	27768	27074
49023	2020	518367000	11818	5856	5678
49023	2021	582392000	12192	6157	6030
49023	2022	618257000	12567	6410	6281
49025	2020	356242000	7688	3884	3673
49025	2021	415855000	7999	4026	3908
49025	2022	420924000	8227	4119	4014
49027	2020	529530000	13049	6040	5840
49027	2021	583980000	13175	6050	5902
49027	2022	629480000	13330	6256	6111
49029	2020	744774000	12381	5674	5480
49029	2021	818467000	12667	5784	5659
49029	2022	875089000	12832	5943	5822
49031	2020	69203000	1433	482	452
49031	2021	71029000	1482	484	462
49031	2022	97148000	1487	511	490
49033	2020	106312000	2500	1165	1124
49033	2021	113799000	2581	1277	1248
49033	2022	118855000	2628	1245	1213
49035	2020	68000953000	1186921	645065	611284
49035	2021	75407450000	1186440	654622	636093
49035	2022	78680099000	1186257	674723	658798
49037	2020	471862000	14517	5510	4934
49037	2021	495766000	14476	5488	5144
49037	2022	511141000	14359	5600	5350
49039	2020	1050365000	28521	12782	12290
49039	2021	1161011000	29138	13068	12690
49039	2022	1249087000	29724	13525	13145
49041	2020	852771000	21561	9920	9489
49041	2021	930162000	21918	9998	9666
49041	2022	954962000	22069	10250	9952
49043	2020	6981873000	42482	24686	22866
49043	2021	8867142000	43168	24992	24259
49043	2022	9725951000	43036	26085	25510
49045	2020	3069421000	73338	36136	34394
49045	2021	3441596000	76734	36852	35771
49045	2022	3729452000	79934	38041	37053
49047	2020	1184857000	35671	13509	12227
49047	2021	1280743000	36232	13502	12750
49047	2022	1354273000	37141	14110	13593
49049	2020	31308760000	663559	317287	304982
49049	2021	35046435000	685806	331915	323973
49049	2022	37799679000	702434	344947	337405
49051	2020	2395993000	35063	16505	15417
49051	2021	2773468000	36260	16979	16485
49051	2022	3033500000	36619	17724	17303
49053	2020	8255866000	182009	80243	75839
49053	2021	9463674000	191476	83867	81376
49053	2022	10031391000	197680	87255	85015
49055	2020	122707000	2508	1450	1339
49055	2021	128692000	2567	1482	1411
49055	2022	133959000	2645	1531	1463
49057	2020	12101998000	262973	130298	123855
49057	2021	13195694000	266588	131842	127963
49057	2022	13784862000	269561	135048	131650
50001	2020	2082271000	37343	20445	19508
50001	2021	2240719000	37444	20445	19853
50001	2022	2332266000	37578	20956	20507
50003	2020	2076975000	37300	17631	16477
50003	2021	2186001000	37424	17336	16553
50003	2022	2248611000	37392	17761	17260
50005	2020	1442840000	30183	14506	13641
50005	2021	1528926000	30423	14365	13805
50005	2022	1544497000	30579	14705	14301
50007	2020	10738289000	168386	95839	91326
50007	2021	11505189000	169271	95264	92438
50007	2022	11947718000	169301	97567	95805
50009	2020	259165000	5918	2701	2496
50009	2021	272473000	5965	2674	2538
50009	2022	272110000	5994	2694	2600
50011	2020	2604109000	50040	27264	25870
50011	2021	2753051000	50433	27395	26410
50011	2022	2840381000	50731	27786	27139
50013	2020	472118000	7276	4068	3831
50013	2021	509471000	7418	4041	3878
50013	2022	533556000	7489	4140	4019
50015	2020	1496413000	25917	13855	12787
50015	2021	1607033000	26147	13744	13167
50015	2022	1670831000	26090	14147	13725
50017	2020	1550185000	29299	15819	14990
50017	2021	1638380000	29625	15568	15039
50017	2022	1672233000	29846	15826	15464
50019	2020	1367380000	27404	13051	12056
50019	2021	1441122000	27601	13053	12419
50019	2022	1472237000	27666	13370	12843
50021	2020	3315686000	60477	30193	28158
50021	2021	3427099000	60720	29625	28330
50021	2022	3537223000	60366	29951	29087
50023	2020	3840898000	59756	33870	32218
50023	2021	4022793000	60023	33177	32129
50023	2022	4157244000	60048	34105	33373
50025	2020	2434682000	45850	21608	20154
50025	2021	2564262000	46128	20896	19926
50025	2022	2609471000	45842	21236	20694
50027	2020	3592834000	57744	28909	27198
50027	2021	3907022000	58350	28679	27681
50027	2022	3951959000	58142	29307	28731
51001	2020	1700237000	33388	15893	14824
51001	2021	1883502000	33364	15338	14679
51001	2022	1797403000	33191	15584	15086
51007	2020	610727000	13268	6079	5714
51007	2021	671171000	13337	6072	5857
51007	2022	712802000	13455	6282	6100
51009	2020	1283599000	31309	14636	13793
51009	2021	1382732000	31391	14515	13983
51009	2022	1412745000	31589	14759	14317
51011	2020	677317000	16154	7060	6640
51011	2021	745095000	16398	6998	6729
51011	2022	769590000	16748	7105	6886
51013	2020	23342907000	238799	151165	144218
51013	2021	25454836000	233574	152177	147645
51013	2022	26281190000	234000	156767	153622
51017	2020	291914000	4186	2294	2058
51017	2021	283915000	4087	2244	2145
51017	2022	302572000	4049	2418	2360
51019	2020	3985249000	79553	37881	35890
51019	2021	4307397000	80287	37712	36424
51019	2022	4433461000	80848	38331	37264
51021	2020	244720000	6257	2786	2624
51021	2021	260519000	6179	2741	2647
51021	2022	262081000	6148	2774	2696
51023	2020	1853587000	33637	17164	16364
51023	2021	1945976000	33977	17171	16652
51023	2022	2031153000	34135	17646	17214
51025	2020	580298000	15824	5906	5422
51025	2021	643432000	15979	5754	5401
51025	2022	654060000	15921	5840	5580
51027	2020	802292000	20249	6384	5759
51027	2021	857307000	19861	6145	5739
51027	2022	876430000	19352	6305	6016
51029	2020	563931000	16826	6276	5799
51029	2021	627227000	16940	6284	5962
51029	2022	643221000	16982	6436	6189
51033	2020	1460890000	30924	14907	13872
51033	2021	1587298000	31402	14855	14223
51033	2022	1645782000	31957	15355	14872
51036	2020	365558000	6744	3505	3264
51036	2021	376000000	6631	3491	3341
51036	2022	377480000	6605	3596	3489
51037	2020	454337000	11541	5070	4778
51037	2021	507826000	11522	5250	5055
51037	2022	519394000	11475	5432	5271
51041	2020	21295117000	365776	186767	175462
51041	2021	23031264000	371276	186665	179915
51041	2022	24231333000	378408	193562	188326
51043	2020	1023033000	14813	7411	7061
51043	2021	1123862000	14916	7458	7227
51043	2022	1190156000	15266	7670	7481
51045	2020	209606000	4878	2252	2133
51045	2021	225832000	4876	2248	2174
51045	2022	229709000	4847	2310	2242
51047	2020	2714286000	52766	24655	23398
51047	2021	2918687000	53785	24788	23984
51047	2022	3043253000	54381	25528	24839
51049	2020	394420000	9666	4564	4278
51049	2021	438889000	9696	4590	4395
51049	2022	452665000	9746	4719	4562
51051	2020	522560000	14074	4711	4324
51051	2021	560733000	13852	4652	4406
51051	2022	563251000	13725	4514	4324
51057	2020	507169000	10595	5444	5054
51057	2021	543024000	10552	5409	5155
51057	2022	549467000	10630	5484	5300
51061	2020	5422269000	72990	36446	34677
51061	2021	5876758000	74022	36584	35490
51061	2022	6187539000	74664	37720	36790
51063	2020	675049000	15469	8073	7652
51063	2021	737544000	15509	8216	7960
51063	2022	763962000	15619	8460	8256
51065	2020	1319206000	27285	13684	12941
51065	2021	1457515000	27797	13761	13315
51065	2022	1501813000	28159	14205	13853
51067	2020	2569414000	54486	25920	24463
51067	2021	2793566000	55010	25828	24913
51067	2022	2895651000	55074	26456	25703
51071	2020	719149000	16785	7723	7225
51071	2021	797262000	16584	7797	7528
51071	2022	814781000	16453	8098	7853
51073	2020	2022843000	38718	19134	18059
51073	2021	2203586000	39131	19118	18476
51073	2022	2270781000	39493	19529	19018
51075	2020	2483913000	24853	11324	10762
51075	2021	2820497000	25499	11399	11050
51075	2022	3036383000	26109	11830	11518
51077	2020	535752000	15278	7954	7482
51077	2021	581353000	15330	7740	7478
51077	2022	597494000	15343	7974	7769
51079	2020	951467000	20606	10271	9718
51079	2021	1055286000	21028	10305	9999
51079	2022	1089723000	21107	10635	10388
51083	2020	1341061000	33920	15054	13960
51083	2021	1459586000	33758	14962	14256
51083	2022	1497444000	33644	15390	14812
51085	2020	7172823000	110195	57538	54660
51085	2021	7745057000	111821	57744	56038
51085	2022	8165682000	112938	60044	58623
51087	2020	23159228000	334344	179896	167858
51087	2021	24781249000	333867	179139	172095
51087	2022	25706948000	333962	185309	180233
51091	2020	99320000	2241	1222	1174
51091	2021	107929000	2241	1237	1201
51091	2022	116156000	2301	1359	1328
51093	2020	2242509000	38702	19221	18218
51093	2021	2447844000	39393	19307	18641
51093	2022	2563516000	40151	19714	19179
51097	2020	337016000	6588	3844	3642
51097	2021	365664000	6668	3834	3713
51097	2022	371533000	6718	3896	3796
51099	2020	1581062000	26822	13756	13119
51099	2021	1732177000	27522	13976	13570
51099	2022	1783275000	27856	14453	14093
51101	2020	890431000	17916	9216	8709
51101	2021	974944000	18205	9248	8941
51101	2022	1009878000	18492	9568	9321
51103	2020	697944000	10897	5318	4917
51103	2021	758955000	10896	5252	4974
51103	2022	779630000	10750	5387	5199
51105	2020	770978000	22107	8230	7686
51105	2021	834105000	22061	8058	7729
51105	2022	847448000	21982	8194	7893
51107	2020	36092801000	422669	225264	212910
51107	2021	39485918000	428435	224820	217894
51107	2022	41852457000	432085	232059	226714
51109	2020	1763295000	37798	19836	18767
51109	2021	1966821000	39032	20066	19391
51109	2022	2035078000	40116	20764	20218
51111	2020	434647000	11947	5209	4925
51111	2021	473793000	11997	5091	4898
51111	2022	469044000	12031	5167	4994
51113	2020	712069000	13860	7268	6982
51113	2021	770755000	13950	7374	7190
51113	2022	791493000	14000	7548	7386
51115	2020	526929000	8520	3983	3779
51115	2021	560564000	8545	3995	3869
51115	2022	576215000	8490	4096	3982
51117	2020	1251295000	30278	12570	11689
51117	2021	1401073000	30300	12517	11928
51117	2022	1388895000	30508	12966	12516
51119	2020	587201000	10616	5109	4840
51119	2021	634648000	10772	5125	4952
51119	2022	659840000	10943	5250	5107
51125	2020	844000000	14737	7169	6749
51125	2021	929579000	14800	7205	6953
51125	2022	947596000	14652	7376	7178
51127	2020	2047656000	23119	12652	12058
51127	2021	2310383000	23979	12742	12367
51127	2022	2569780000	24986	13231	12924
51131	2020	726286000	12208	5377	4944
51131	2021	805933000	12039	5411	5129
51131	2022	764219000	11900	5501	5315
51133	2020	699780000	11838	5616	5246
51133	2021	748402000	12046	5526	5260
51133	2022	755601000	12302	5457	5244
51135	2020	578696000	15639	7140	6766
51135	2021	662037000	15584	7092	6833
51135	2022	698804000	15559	7226	7014
51137	2020	2022604000	36391	17001	16011
51137	2021	2196582000	37189	17115	16495
51137	2022	2239270000	37991	17426	16922
51139	2020	993540000	23687	11927	11023
51139	2021	1104039000	23801	11975	11425
51139	2022	1165767000	23750	12142	11743
51141	2020	638348000	17583	7176	6669
51141	2021	690787000	17668	7115	6799
51141	2022	710520000	17643	7163	6914
51145	2020	1854947000	30438	14045	13345
51145	2021	2022431000	31172	14102	13695
51145	2022	2138367000	31489	14669	14306
51147	2020	783186000	21898	10061	9391
51147	2021	854431000	21957	9977	9497
51147	2022	866674000	21927	9941	9562
51155	2020	1438185000	33804	16082	14777
51155	2021	1571150000	33808	16039	15407
51155	2022	1621534000	33706	16602	16104
51157	2020	519286000	7321	3593	3423
51157	2021	570106000	7437	3622	3516
51157	2022	595848000	7502	3710	3619
51159	2020	373750000	8919	4004	3802
51159	2021	396789000	9049	3958	3820
51159	2022	387582000	9080	3960	3848
51167	2020	954350000	25756	11100	10338
51167	2021	1012290000	25577	10731	10266
51167	2022	1023458000	25448	11006	10629
51169	2020	772157000	21585	8925	8430
51169	2021	834459000	21482	8875	8557
51169	2022	850549000	21476	9184	8899
51171	2020	2181592000	44263	21981	20780
51171	2021	2442507000	44829	21760	20984
51171	2022	2551717000	44968	22145	21546
51173	2020	1197335000	29782	13314	12425
51173	2021	1279000000	29600	13517	12957
51173	2022	1309326000	29449	13571	13157
51179	2020	9336139000	157746	73203	68965
51179	2021	10134120000	161584	73204	70549
51179	2022	10657807000	163380	75585	73485
51181	2020	304061000	6551	3572	3361
51181	2021	338504000	6524	3552	3419
51181	2022	342198000	6527	3649	3546
51183	2020	373596000	10789	3663	3337
51183	2021	411591000	10812	3639	3409
51183	2022	403227000	10680	3689	3536
51185	2020	1627542000	40405	15388	14171
51185	2021	1719369000	40057	15067	14278
51185	2022	1751573000	39821	15403	14775
51187	2020	2078074000	40786	20172	18957
51187	2021	2249202000	40957	20135	19422
51187	2022	2326593000	41440	20735	20160
51193	2020	890157000	18508	9446	8875
51193	2021	949666000	18732	9572	9153
51193	2022	947315000	18712	9543	9252
51197	2020	1119175000	28312	13750	12651
51197	2021	1216015000	28200	13588	13041
51197	2022	1252790000	28111	14083	13669
51510	2020	14482237000	159125	98544	92409
51510	2021	16114865000	155203	98279	94612
51510	2022	16367274000	155525	100719	98425
51550	2020	13282444000	249803	121987	114294
51550	2021	14393403000	251739	121486	116863
51550	2022	14764927000	252488	124115	120590
51650	2020	6197924000	137276	64507	58848
51650	2021	6696166000	137847	63680	60172
51650	2022	6698261000	138037	64499	62099
51700	2020	8036156000	186033	88923	80945
51700	2021	8668862000	184764	87501	82758
51700	2022	8639040000	184306	88557	85433
51710	2020	9974284000	237738	110941	100964
51710	2021	11027102000	235025	109285	103229
51710	2022	11159969000	232995	110326	106566
51740	2020	4216116000	97954	44643	40274
51740	2021	4474290000	97638	44017	41186
51740	2022	4465807000	97029	44161	42505
51760	2020	14211062000	227008	119637	108760
51760	2021	15658742000	227602	117789	111544
51760	2022	16326858000	229395	120698	116730
51770	2020	4550924000	99883	48949	45060
51770	2021	4908937000	98744	48170	45876
51770	2022	4971266000	97847	48968	47459
51800	2020	5187793000	94697	44972	41988
51800	2021	5718577000	96328	44866	42920
51800	2022	5988090000	98537	45674	44299
51810	2020	27393674000	459646	228946	214201
51810	2021	29563536000	458680	227474	219133
51810	2022	30064333000	455618	232244	225983
53001	2020	902384000	20608	9308	8640
53001	2021	974134000	20640	9742	9213
53001	2022	1004733000	20961	9816	9335
53003	2020	1110195000	22325	10367	9835
53003	2021	1195506000	22468	10450	10052
53003	2022	1223081000	22508	10559	10165
53005	2020	10520807000	207413	102644	94278
53005	2021	11511248000	210585	103269	97454
53005	2022	11587408000	212791	105674	100627
53007	2020	4591318000	79228	44070	40414
53007	2021	4979745000	79775	43910	41558
53007	2022	5010185000	79926	44353	42316
53009	2020	3939572000	77357	28989	26040
53009	2021	4316320000	78442	28742	26854
53009	2022	4323302000	77805	28911	27267
53011	2020	29220288000	505301	244663	224113
53011	2021	32766056000	512588	241382	228130
53011	2022	33860383000	516779	246694	235641
53013	2020	229160000	3949	1722	1597
53013	2021	242269000	4015	1730	1635
53013	2022	251890000	4026	1738	1647
53015	2020	5550791000	111019	48362	43888
53015	2021	6043590000	111648	47683	44643
53015	2022	6116134000	111956	48420	45801
53017	2020	1973029000	43031	21235	19450
53017	2021	2162025000	43838	21198	20001
53017	2022	2170458000	44192	21681	20583
53019	2020	312597000	7196	2438	2158
53019	2021	338116000	7267	2297	2093
53019	2022	328785000	7448	2289	2083
53021	2020	4127010000	97143	42777	38972
53021	2021	4590465000	98126	42859	40021
53021	2022	4546268000	98678	43925	41354
53023	2020	128596000	2298	818	749
53023	2021	132144000	2354	798	750
53023	2022	137318000	2363	796	743
53025	2020	4504130000	99427	47170	43029
53025	2021	4914194000	100440	46375	43287
53025	2022	4960525000	101311	48734	45944
53027	2020	3319846000	75855	28817	25442
53027	2021	3632315000	76787	28491	26287
53027	2022	3611396000	77038	28799	26954
53029	2020	5150793000	86990	36152	33183
53029	2021	5601284000	87557	35874	33843
53029	2022	5679464000	86625	36599	34884
53031	2020	1865776000	33063	12946	11725
53031	2021	2063627000	33561	12592	11807
53031	2022	2112697000	33589	12616	11953
53033	2020	225981347000	2274094	1271278	1172004
53033	2021	250351806000	2253038	1273377	1219480
53033	2022	258004537000	2266789	1318942	1279356
53035	2020	17152713000	275802	128470	118603
53035	2021	18509168000	276591	125915	119476
53035	2022	18936661000	277673	127917	122423
53037	2020	2268496000	44626	22374	20380
53037	2021	2469007000	44688	21512	20142
53037	2022	2488811000	45189	22421	21182
53039	2020	1176018000	22816	9773	8976
53039	2021	1257396000	23178	9795	9189
53039	2022	1240461000	23271	9760	9221
53041	2020	4033699000	82556	34775	31523
53041	2021	4371537000	84575	34122	31955
53041	2022	4504861000	85370	34539	32560
53043	2020	555293000	10927	4662	4349
53043	2021	602005000	11277	4584	4354
53043	2022	602701000	11601	4608	4373
53045	2020	3147590000	66029	25373	22873
53045	2021	3435682000	67229	24848	23124
53045	2022	3502046000	68166	25347	23836
53047	2020	1966069000	42146	19536	17803
53047	2021	2166442000	42741	19161	17886
53047	2022	2137018000	43127	19542	18356
53049	2020	1033219000	23491	8320	7409
53049	2021	1134375000	23971	8394	7734
53049	2022	1121217000	24113	8549	7986
53051	2020	630515000	13506	5029	4506
53051	2021	689352000	13906	5053	4669
53051	2022	693233000	14179	5121	4785
53053	2020	51285933000	923524	449543	406487
53053	2021	55137240000	927199	441427	414713
53053	2022	55630100000	927380	450279	428275
53055	2020	1448574000	17827	8153	7495
53055	2021	1581693000	18615	8301	7885
53055	2022	1674797000	18662	8649	8321
53057	2020	7519006000	129884	62250	56176
53057	2021	8171766000	130933	60663	56832
53057	2022	8253187000	131179	61005	57932
53059	2020	675318000	12033	5475	4974
53059	2021	751590000	12207	5401	5058
53059	2022	778400000	12460	5514	5236
53061	2020	52119873000	829869	436283	397958
53061	2021	56754531000	836037	435341	414010
53061	2022	57973586000	840079	449536	434437
53063	2020	26560163000	541125	256668	234378
53063	2021	29715525000	545498	256755	242856
53063	2022	29805658000	549690	261261	249353
53065	2020	1989008000	46587	18563	16838
53065	2021	2242454000	47553	18703	17443
53065	2022	2254701000	48229	19061	17843
53067	2020	16229187000	295988	144287	132430
53067	2021	17586890000	298078	143383	135881
53067	2022	17835065000	298758	147067	140545
53069	2020	217321000	4443	1393	1272
53069	2021	227137000	4579	1332	1242
53069	2022	236145000	4688	1349	1261
53071	2020	3103954000	62619	29965	27919
53071	2021	3412296000	62158	30034	28578
53071	2022	3430905000	61890	30056	28721
53073	2020	12250878000	227430	113764	103131
53073	2021	13281368000	226718	111396	104690
53073	2022	13608269000	230677	114083	108778
53075	2020	2115950000	47804	22255	20985
53075	2021	2215311000	43238	23197	22190
53075	2022	2222484000	47619	23127	22105
53077	2020	11807373000	256702	130702	118188
53077	2021	12739226000	256647	129085	120112
53077	2022	12661318000	257001	130634	122667
54001	2020	591797000	15463	7142	6554
54001	2021	630924000	15445	7140	6759
54001	2022	622714000	15414	7172	6852
54003	2020	5853049000	122691	57655	54119
54003	2021	6467277000	126194	58959	56791
54003	2022	6767690000	129490	58992	57259
54005	2020	816546000	21739	7307	6550
54005	2021	882585000	21367	7054	6616
54005	2022	865460000	20968	7164	6846
54007	2020	486127000	12397	5157	4632
54007	2021	500715000	12293	5026	4684
54007	2022	488361000	12185	5076	4771
54009	2020	1008831000	22472	9686	8830
54009	2021	1087395000	22109	9758	9158
54009	2022	1093693000	21733	9679	9233
54011	2020	4346539000	94234	41115	37874
54011	2021	4672539000	93494	40685	38749
54011	2022	4740847000	92730	40923	39463
54013	2020	240933000	6199	2475	2081
54013	2021	257295000	6165	2429	2175
54013	2022	247214000	6068	2461	2261
54015	2020	288929000	8007	3083	2700
54015	2021	306479000	7895	2967	2733
54015	2022	300452000	7814	3001	2826
54017	2020	268551000	7787	3870	3636
54017	2021	288701000	7739	3841	3680
54017	2022	300895000	7698	3733	3616
54019	2020	1631866000	40425	15897	14326
54019	2021	1776768000	40083	15561	14573
54019	2022	1769577000	39487	15638	14909
54021	2020	246670000	7397	2278	2049
54021	2021	259760000	7389	2318	2158
54021	2022	259386000	7325	2283	2162
54023	2020	463356000	10988	5867	5491
54023	2021	504151000	11009	5931	5661
54023	2022	508181000	10968	5906	5687
54025	2020	1444726000	32895	15421	14193
54025	2021	1543562000	32698	15620	14911
54025	2022	1534304000	32435	15300	14719
54027	2020	962827000	23097	10565	9990
54027	2021	1062348000	23374	10857	10478
54027	2022	1086630000	23468	11016	10722
54029	2020	1332873000	29037	12896	11621
54029	2021	1432638000	28591	12857	12043
54029	2022	1431815000	28172	12771	12137
54031	2020	509518000	14241	5703	5296
54031	2021	577329000	14155	5593	5312
54031	2022	621543000	14192	5637	5408
54033	2020	3474781000	65839	33444	30819
54033	2021	3770214000	65436	33278	31688
54033	2022	3833753000	64915	33654	32447
54035	2020	1172633000	27720	12407	11346
54035	2021	1250340000	27761	11673	10991
54035	2022	1260160000	27716	11875	11372
54037	2020	3283685000	57783	29442	27707
54037	2021	3606749000	58520	30003	29051
54037	2022	3741292000	58979	30400	29641
54039	2020	9254695000	180217	81647	74524
54039	2021	9958737000	177993	79512	75276
54039	2022	10034853000	175515	80845	77870
54041	2020	694402000	17016	6155	5490
54041	2021	737742000	16897	6079	5653
54041	2022	731581000	16767	6155	5860
54043	2020	689978000	20363	7053	6349
54043	2021	741683000	20191	6959	6496
54043	2022	731622000	19901	6964	6612
54045	2020	1266844000	32510	10985	9669
54045	2021	1348528000	31917	10963	10237
54045	2022	1324929000	31316	11065	10588
54047	2020	586026000	18921	4376	3836
54047	2021	625655000	18413	4165	3814
54047	2022	611945000	17850	4015	3758
54049	2020	2559802000	56230	24735	22606
54049	2021	2748802000	56117	24687	23369
54049	2022	2741509000	55952	24962	23873
54051	2020	1300559000	30497	13275	11967
54051	2021	1422632000	30208	13127	12297
54051	2022	1450882000	29752	12972	12323
54053	2020	986650000	25398	10168	9316
54053	2021	1063697000	25290	10244	9679
54053	2022	1052874000	25000	10085	9641
54055	2020	2460552000	59517	20590	18693
54055	2021	2641268000	59215	20349	19106
54055	2022	2627566000	58700	20334	19424
54057	2020	1252515000	26890	11980	11083
54057	2021	1328800000	26866	12037	11461
54057	2022	1310995000	26855	12326	11858
54059	2020	796360000	23487	6677	5730
54059	2021	843873000	23094	6172	5620
54059	2022	827211000	22573	6429	6075
54061	2020	5286153000	105905	53798	50422
54061	2021	5776351000	106487	54545	52317
54061	2022	5901127000	106869	55032	53152
54063	2020	469720000	12380	5949	5531
54063	2021	506669000	12383	5983	5755
54063	2022	496532000	12296	6086	5878
54065	2020	710420000	17087	8177	7686
54065	2021	788008000	17280	8339	8038
54065	2022	786177000	17430	8441	8202
54067	2020	931697000	24554	9214	8257
54067	2021	987646000	24415	8920	8379
54067	2022	987975000	24335	8914	8501
54069	2020	2404877000	42338	20098	18426
54069	2021	2695729000	41878	19976	18931
54069	2022	2764561000	41447	19757	18970
54071	2020	276219000	6132	3607	3431
54071	2021	305216000	6078	3694	3580
54071	2022	326787000	6011	3740	3643
54073	2020	346589000	7652	2658	2364
54073	2021	368464000	7612	2654	2463
54073	2022	373295000	7586	2660	2518
54075	2020	378240000	7864	3770	3426
54075	2021	402686000	7890	3837	3641
54075	2022	396820000	7819	3874	3716
54077	2020	1353118000	34187	15118	14019
54077	2021	1461238000	34270	15298	14582
54077	2022	1449148000	34172	15440	14817
54079	2020	2870378000	57432	26637	24688
54079	2021	3095339000	57355	26404	25262
54079	2022	3182983000	57015	26630	25745
54081	2020	3252387000	74386	29898	27258
54081	2021	3510392000	73801	29286	27711
54081	2022	3519115000	72882	29446	28363
54083	2020	1181443000	27892	12094	10996
54083	2021	1273515000	27891	11792	11121
54083	2022	1259557000	27600	11679	11133
54085	2020	405588000	8426	4319	3962
54085	2021	436349000	8388	4269	4028
54085	2022	450168000	8207	4278	4103
54087	2020	515430000	13986	5049	4432
54087	2021	545739000	13912	4914	4494
54087	2022	540302000	13834	5026	4713
54089	2020	471434000	11939	4305	3973
54089	2021	508865000	11892	4429	4217
54089	2022	506072000	11762	4582	4412
54091	2020	742984000	16684	7665	7106
54091	2021	805206000	16483	7729	7363
54091	2022	803387000	16342	7837	7536
54093	2020	323083000	6753	3281	3010
54093	2021	355209000	6675	3377	3194
54093	2022	362273000	6568	3542	3409
54095	2020	368475000	8296	2990	2674
54095	2021	415397000	8243	2906	2670
54095	2022	461888000	8183	2960	2788
54097	2020	912139000	23813	9493	8597
54097	2021	975655000	23820	9565	8967
54097	2022	977636000	23712	9662	9201
54099	2020	1478646000	38864	15453	14165
54099	2021	1576652000	38533	15298	14491
54099	2022	1592964000	37998	15376	14762
54101	2020	276450000	8356	3241	2939
54101	2021	277941000	8286	3181	2983
54101	2022	266216000	8167	3212	3070
54103	2020	575195000	14392	6450	5808
54103	2021	623407000	14195	6483	6037
54103	2022	635057000	14025	6393	6036
54105	2020	194762000	5186	2216	1979
54105	2021	207303000	5059	2221	2050
54105	2022	201926000	5091	2227	2096
54107	2020	4064051000	84142	35832	32709
54107	2021	4653523000	83791	35738	33810
54107	2022	4860841000	83340	35981	34500
54109	2020	678865000	21317	6779	6112
54109	2021	725713000	20991	6934	6521
54109	2022	722167000	20527	7101	6794
55001	2020	909558000	20675	8130	7334
55001	2021	958904000	20795	7934	7436
55001	2022	948708000	21226	7736	7362
55003	2020	697957000	16018	7690	7017
55003	2021	747419000	16054	7638	7244
55003	2022	738025000	16039	7500	7206
55005	2020	2546803000	46714	24132	22629
55005	2021	2661152000	46746	24178	23214
55005	2022	2718274000	46843	23920	23119
55007	2020	811490000	16233	7561	6852
55007	2021	877445000	16304	7533	7092
55007	2022	879606000	16608	7387	7034
55009	2020	15318974000	268921	141592	132856
55009	2021	16343715000	268814	141395	136483
55009	2022	16882342000	270036	140668	136985
55011	2020	661542000	13319	6411	5925
55011	2021	724584000	13312	6326	6052
55011	2022	740780000	13391	6191	5951
55013	2020	749046000	16579	7261	6591
55013	2021	810943000	16759	7351	6951
55013	2022	819115000	17036	7251	6915
55015	2020	2862475000	52462	27352	26036
55015	2021	3053528000	52587	27517	26725
55015	2022	3110294000	52718	27668	27029
55017	2020	3324755000	66337	33197	31076
55017	2021	3580031000	66628	33663	32304
55017	2022	3639260000	66807	33577	32452
55019	2020	1648638000	34667	17599	16784
55019	2021	1740456000	34722	17770	17184
55019	2022	1781899000	34691	17651	17184
55021	2020	3284124000	58516	31477	29573
55021	2021	3555522000	58404	31743	30644
55021	2022	3581335000	58193	31918	31081
55023	2020	750248000	16084	7447	6888
55023	2021	805528000	16082	7437	7098
55023	2022	812216000	16007	7093	6822
55025	2020	36849007000	562577	323891	307959
55025	2021	40731243000	561724	329172	319649
55025	2022	41891572000	568203	331415	324324
55027	2020	4241046000	89353	47798	45224
55027	2021	4571322000	88657	48055	46497
55027	2022	4625809000	88282	47639	46412
55029	2020	1981546000	30120	15100	14048
55029	2021	2139464000	30406	15562	14869
55029	2022	2171328000	30526	15244	14766
55031	2020	2022872000	44343	23423	21256
55031	2021	2172345000	44026	22795	21760
55031	2022	2183768000	44144	22761	21832
55033	2020	2025506000	45441	23851	22496
55033	2021	2216263000	44509	23945	23071
55033	2022	2251676000	45651	24020	23272
55035	2020	5472590000	105874	58920	55558
55035	2021	5978086000	105988	59784	57809
55035	2022	6123919000	106837	59637	58133
55037	2020	250657000	4560	2206	2026
55037	2021	281245000	4586	2225	2117
55037	2022	291993000	4688	2153	2076
55039	2020	5459482000	104150	56283	52906
55039	2021	5902723000	104166	56511	54642
55039	2022	6043639000	103836	56254	54814
55041	2020	407878000	9165	3931	3427
55041	2021	427601000	9262	3892	3630
55041	2022	424472000	9381	3867	3685
55043	2020	2471031000	51984	27571	26099
55043	2021	2639879000	51285	27297	26445
55043	2022	2679872000	51276	27067	26326
55045	2020	2100263000	37036	20453	19434
55045	2021	2231740000	37018	20767	20124
55045	2022	2261075000	36816	20880	20374
55047	2020	893610000	19022	9314	8662
55047	2021	984626000	19249	9342	8930
55047	2022	995965000	19220	9118	8811
55049	2020	1261491000	23709	13544	12698
55049	2021	1383617000	23777	13613	13140
55049	2022	1403198000	23865	13636	13280
55051	2020	310105000	6146	2576	2279
55051	2021	330577000	6193	2565	2399
55051	2022	333771000	6224	2515	2385
55053	2020	1020803000	21096	10009	9060
55053	2021	1047239000	20899	9551	9051
55053	2022	1043821000	20836	9381	9021
55055	2020	4290325000	86193	45542	42995
55055	2021	4623164000	85796	46080	44499
55055	2022	4720099000	85784	46089	44849
55057	2020	1146282000	26780	13439	12451
55057	2021	1245403000	26756	13451	12861
55057	2022	1254544000	26866	13286	12856
55059	2020	8846321000	169184	89896	83390
55059	2021	9513323000	168465	90129	86169
55059	2022	9776111000	167817	90351	87396
55061	2020	1079665000	20550	10725	10219
55061	2021	1164627000	20577	10794	10475
55061	2022	1191382000	20623	10760	10490
55063	2020	6508069000	120930	65938	62300
55063	2021	7126780000	119367	66625	64547
55063	2022	7273302000	120294	65448	63805
55065	2020	794539000	16613	9905	9472
55065	2021	853419000	16816	10152	9880
55065	2022	878412000	16877	10222	9974
55067	2020	933189000	19462	9387	8764
55067	2021	995112000	19505	9427	8989
55067	2022	994618000	19559	9286	8948
55069	2020	1414647000	28429	14851	13951
55069	2021	1495048000	28453	14808	14251
55069	2022	1504995000	28376	14656	14204
55071	2020	4011852000	81384	40849	38265
55071	2021	4369950000	81479	40998	39556
55071	2022	4431363000	81172	40505	39374
55073	2020	7510385000	138047	73122	69400
55073	2021	8139312000	137746	73503	71251
55073	2022	8270430000	137958	72542	70710
55075	2020	1978221000	41885	19735	18164
55075	2021	2165462000	41849	19455	18584
55075	2022	2194299000	41988	19106	18388
55077	2020	718404000	15594	7747	7215
55077	2021	772004000	15777	7763	7409
55077	2022	773811000	15779	7682	7409
55078	2020	157795000	4256	1665	1403
55078	2021	177260000	4292	1576	1442
55078	2022	173901000	4197	1509	1427
55079	2020	47536977000	938527	468245	428775
55079	2021	51723659000	924207	465633	440277
55079	2022	51617850000	918661	461542	444682
55081	2020	2136235000	46296	23597	22256
55081	2021	2304199000	46246	23592	22806
55081	2022	2305802000	46109	23373	22754
55083	2020	1940298000	39080	20639	19316
55083	2021	2096783000	39393	20646	19854
55083	2022	2133157000	39633	20524	19878
55085	2020	1978990000	37872	18059	16727
55085	2021	2124437000	38282	18131	17332
55085	2022	2140350000	38212	18025	17429
55087	2020	10512028000	190961	103958	98119
55087	2021	11340023000	191309	104135	100788
55087	2022	11595157000	192127	104672	102060
55089	2020	7958892000	91613	48882	46181
55089	2021	8799408000	92551	49040	47504
55089	2022	9283849000	93009	49050	47855
55091	2020	403001000	7347	4134	3886
55091	2021	439258000	7386	4068	3926
55091	2022	445682000	7410	4059	3932
55093	2020	2155653000	42223	24973	23192
55093	2021	2394972000	41606	24327	23438
55093	2022	2481219000	42532	24487	23687
55095	2020	2244302000	45032	24738	22928
55095	2021	2434429000	45521	24621	23549
55095	2022	2482111000	45709	24613	23666
55097	2020	3543705000	70402	37875	35783
55097	2021	3796419000	69429	37940	36569
55097	2022	3845320000	70718	37677	36576
55099	2020	669904000	14032	6279	5843
55099	2021	720468000	14055	6281	6010
55099	2022	735122000	14179	6286	6074
55101	2020	10459744000	197536	98367	91061
55101	2021	11134131000	196439	98636	93931
55101	2022	11275643000	195846	98838	95384
55103	2020	819173000	17272	9112	8637
55103	2021	868711000	17166	8974	8650
55103	2022	878123000	17090	8851	8598
55105	2020	7845226000	163751	85831	79608
55105	2021	8530579000	164192	86172	82262
55105	2022	8615932000	164060	86212	83263
55107	2020	678932000	14179	6615	6165
55107	2021	734989000	14116	6552	6258
55107	2022	747771000	14186	6539	6298
55109	2020	5597173000	93874	50775	47139
55109	2021	6190800000	95055	49435	47668
55109	2022	6478914000	96017	49714	48189
55111	2020	3661518000	65793	34691	32035
55111	2021	4105210000	65740	34671	33240
55111	2022	4081573000	65777	34437	33473
55113	2020	849194000	18123	8015	7372
55113	2021	935910000	18247	8063	7644
55113	2022	946332000	18559	8005	7686
55115	2020	1905149000	40873	20942	19573
55115	2021	2040749000	40812	20995	20192
55115	2022	2062440000	40886	20517	19920
55117	2020	6487359000	118030	61963	58343
55117	2021	6922115000	117697	61649	59682
55117	2022	7112794000	117841	61413	59917
55119	2020	937525000	19937	11079	10526
55119	2021	1008785000	19944	11100	10712
55119	2022	999652000	19975	10651	10290
55121	2020	1444922000	30806	15775	14649
55121	2021	1562500000	30730	15437	14844
55121	2022	1584522000	30899	14906	14441
55123	2020	1406226000	30698	15071	14266
55123	2021	1540886000	30921	15426	14914
55123	2022	1572319000	31060	15179	14768
55125	2020	1266680000	23097	10404	9640
55125	2021	1387854000	23522	10492	9983
55125	2022	1421195000	23763	10248	9851
55127	2020	5817761000	105308	56964	53434
55127	2021	6450492000	105200	57832	55683
55127	2022	6620827000	105380	57898	56235
55129	2020	841859000	16613	7866	7313
55129	2021	929863000	16760	7925	7556
55129	2022	936224000	16911	7767	7479
55131	2020	8454283000	136784	76681	72277
55131	2021	9147032000	137237	76603	74193
55131	2022	9459879000	137688	76765	74906
55133	2020	31347000000	407467	223766	211048
55133	2021	34408877000	409080	223946	216841
55133	2022	35946492000	410434	224416	218866
55135	2020	2550963000	51791	25755	24301
55135	2021	2774704000	51992	25893	24955
55135	2022	2812905000	51488	25328	24575
55137	2020	1074790000	24549	11099	10375
55137	2021	1164867000	24797	11323	10833
55137	2022	1167366000	24999	11124	10744
55139	2020	8908632000	171800	92206	87085
55139	2021	9594164000	170554	92330	89296
55139	2022	9710157000	170718	92597	90256
55141	2020	3679247000	74197	34801	32421
55141	2021	3902675000	74085	34322	32772
55141	2022	3933589000	73993	33685	32568
56001	2020	1723747000	37110	20556	19784
56001	2021	1876004000	37860	20628	19931
56001	2022	1925581000	38031	21324	20687
56003	2020	502061000	11481	5288	5021
56003	2021	540903000	11645	5284	5045
56003	2022	552607000	11855	5238	5030
56005	2020	2544664000	47139	23171	21563
56005	2021	2589512000	46533	21922	20761
56005	2022	2652863000	47058	22921	22145
56007	2020	897575000	14504	7918	7551
56007	2021	927567000	14679	7756	7447
56007	2022	975847000	14542	7465	7200
56009	2020	906763000	13741	8002	7519
56009	2021	886566000	13678	7492	7127
56009	2022	906194000	13786	7731	7504
56011	2020	381932000	7186	3837	3687
56011	2021	400920000	7319	3830	3699
56011	2022	427509000	7448	3944	3831
56013	2020	1922464000	39197	19009	17809
56013	2021	2006462000	39422	18814	17917
56013	2022	2072143000	39472	18990	18260
56015	2020	603895000	12514	6500	6216
56015	2021	636165000	12557	6524	6293
56015	2022	635997000	12562	6547	6362
56017	2020	332883000	4618	2227	2116
56017	2021	327775000	4574	2254	2165
56017	2022	326067000	4588	2326	2261
56019	2020	493490000	8467	4171	3939
56019	2021	524638000	8633	4243	4065
56019	2022	540874000	8730	4339	4196
56021	2020	5624265000	100718	50083	47501
56021	2021	5919055000	100794	49060	47054
56021	2022	5957582000	100723	48401	46734
56023	2020	1054392000	19657	9287	8819
56023	2021	1236472000	20170	9432	9064
56023	2022	1305617000	20660	9723	9406
56025	2020	5117034000	80282	40097	36933
56025	2021	5336085000	79660	38746	36401
56025	2022	5450408000	79601	38772	37247
56027	2020	128380000	2452	1232	1186
56027	2021	136044000	2414	1254	1208
56027	2022	131296000	2380	1223	1189
56029	2020	1825124000	29664	15190	14365
56029	2021	1894007000	30142	15444	14799
56029	2022	1988670000	30518	15655	15118
56031	2020	456248000	8632	4577	4345
56031	2021	468734000	8674	4493	4309
56031	2022	478906000	8645	4443	4294
56033	2020	1837475000	31005	15990	15189
56033	2021	2058696000	31667	15983	15299
56033	2022	2143699000	32096	16243	15722
56035	2020	550231000	8738	4018	3725
56035	2021	522318000	8725	3954	3728
56035	2022	539664000	8763	3963	3807
56037	2020	2308147000	42190	20501	18973
56037	2021	2339052000	41582	19325	18236
56037	2022	2413486000	41345	19898	19115
56039	2020	7028651000	23377	15126	14231
56039	2021	8563496000	23622	15889	15368
56039	2022	9455780000	23287	16829	16392
56041	2020	865096000	20457	9100	8521
56041	2021	916208000	20655	8800	8352
56041	2022	927386000	20712	9017	8691
56043	2020	421944000	7658	3942	3734
56043	2021	423376000	7712	3934	3774
56043	2022	426769000	7719	3848	3699
56045	2020	339907000	6818	3786	3640
56045	2021	336503000	6766	3714	3594
56045	2022	349768000	6860	3823	3725
\.

COPY statistics.state (state_code, state_name) FROM stdin;
US	All states
AL	Alabama
AK	Alaska
AZ	Arizona
AR	Arkansas
CA	California
CO	Colorado
CT	Connecticut
DE	Delaware
DC	District of Columbia
FL	Florida
GA	Georgia
HI	Hawaii
ID	Idaho
IL	Illinois
IN	Indiana
IA	Iowa
KS	Kansas
KY	Kentucky
LA	Louisiana
ME	Maine
MD	Maryland
MA	Massachusetts
MI	Michigan
MN	Minnesota
MS	Mississippi
MO	Missouri
MT	Montana
NE	Nebraska
NV	Nevada
NH	New Hampshire
NJ	New Jersey
NM	New Mexico
NY	New York
NC	North Carolina
ND	North Dakota
OH	Ohio
OK	Oklahoma
OR	Oregon
PA	Pennsylvania
RI	Rhode Island
SC	South Carolina
SD	South Dakota
TN	Tennessee
TX	Texas
UT	Utah
VT	Vermont
VA	Virginia
WA	Washington
WV	West Virginia
WI	Wisconsin
WY	Wyoming
\.
