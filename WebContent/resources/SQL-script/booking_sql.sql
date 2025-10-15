CREATE DATABASE IF NOT EXISTS `web_booking_travel`;
USE `web_booking_travel`;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255),
    status VARCHAR(20),
    role_id INT
);
--
-- Table structure for table `tour`
--
DROP TABLE IF EXISTS `tour`;
CREATE TABLE tour (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    description text,
    start_date DATETIME(6) NOT NULL,
    duetime DATETIME(6) NOT NULL,
    address VARCHAR(255) NOT NULL,
    price double NOT NULL,
    status VARCHAR(20) NOT NULL
);
--
-- Table structure for table `booking`
--
DROP TABLE IF EXISTS `booking`;
CREATE TABLE booking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    tour_id INT NOT NULL,
    adults_quantity INT NOT NULL,
    children_quantity INT NOT NULL,
    created_date DATETIME(6) NOT NULL,
    status VARCHAR(20) NOT NULL
);
--
-- Table structure for table `post`
--
DROP TABLE IF EXISTS `post`;
CREATE TABLE post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    description text,
    created_date DATETIME(6) NOT NULL,
    status VARCHAR(20) NOT NULL
);
--
-- Table structure for table `comment`
--
DROP TABLE IF EXISTS `comment`;
CREATE TABLE comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_date DATETIME(6) NOT NULL,
    comment_message text,
    rate INT NOT NULL
);
--
-- Dumping data for table `user`
--

-- add data samples
INSERT INTO user (username, password, fullname, email, phone_number, address, status, role_id) VALUES
('john_doe', '123', 'John Doe', 'john@example.com', '1234567890', 'USA', 'active', 0),
('jane_smith', '123', 'Jane Smith', 'jane@example.com', '0987654321', 'USA', 'inactive', 1),
('john_biden', '123', 'John Biden', 'johnbiden@example.com', '0371234157', 'USA', 'active', 1),
('cr7', '123', 'Critiano Ronaldo', 'cr7@example.com', '0987654321', 'Portugal', 'active', 1),
('ironman', '123', 'Tony Stak', 'ironman@example.com', '0112233441', 'USA', 'active', 1),
('captain', '123', 'Steve Roger', 'captain@example.com', '0793234622', 'USA', 'active', 1),
('thor', '123', 'THOR', 'thor@example.com', '0933333119', 'Asgard', 'active', 1),
('dr Strange', '123', 'Strange Geogle', 'witch@example.com', '0987777733', 'USA', 'active', 1),
('test', '123', 'Test User', 'test@example.com', '0793234444', 'Vietnam', 'active', 1),
('alice_jones', '123', 'Alice Jones', 'alice@example.com', '1122334455', 'USA', 'inactive', 1);


--
-- Dumping data for table `booking`
--

-- add data tour samples
INSERT INTO booking (user_id, tour_id, adults_quantity, children_quantity, created_date, status) VALUES 
(1, 1, 1, 2, NOW(), 'active'),
(1, 2, 2, 1, NOW(), 'active'),
(2, 1, 1, 0, NOW(), 'active'),
(2, 3, 2, 1, NOW(), 'active'),
(3, 2, 3, 2, NOW(), 'active'),
(4, 1, 3, 2, NOW(), 'active'),
(4, 4, 2, 2, NOW(), 'active'),
(5, 4, 3, 2,NOW(), 'active'),
(2, 2, 2, 2, NOW(), 'active'),
(3, 3, 1, 1, NOW(), 'active');

-- Dumping data for table `comment`
-- add data comment samples
INSERT INTO comment (user_id, post_id, created_date, comment_message, rate) VALUES
(2, 1, NOW(),'The post is excellent', 5),
(1, 1, NOW(),'I don\'t think so', 3),
(1, 2, NOW(),'I think i loved this place', 5),
(3, 2, NOW(),'The post is excellent', 4),
(5, 4, NOW(),'The post is excellent', 3),
(9, 10, NOW(),'The post is excellent', 5),
(10,9, NOW(),'The post is excellent', 2),
(8, 6, NOW(),'The post is excellent', 1),
(5, 5, NOW(),'The post is excellent', 5),
(6, 6, NOW(),'The post is excellent', 2);
--
-- Dumping data for table `tour`
--

-- add data tour samples
INSERT INTO tour (name, image, description, start_date, duetime, address, price, status) VALUES
('Nha Trang - Da Lat tour', 'NhaTrang-bg.jpg', 
'<p><strong>Day 1: Ho Chi Minh City - Nha Trang (/)</strong><br>
Morning, pick up and transfer to Nha Trang. Stop at Phan Thiet for a short visit. Arrive in Nha Trang. 
Transfer to the hotel. Overnight in Nha Trang.</p><p><strong>Day 2: Nha Trang (B,L)</strong><br>
Breakfast at the hotel. Morning, pick up and transfer to Da Chong pier where you start your day tour exploring Nha Phu Bay. 
Visit Orchid island and explore safari park with many kinds of animal living in their natural habitat. 
Enjoy a walking route inside the green forest of pine and explore the wildlife sanctuary with many kinds of bird. 
Back to An Binh beach and have your free time of swimming. Have lunch at a local restaurant. 
Afternoon, visit Lao island, the most famous destination in Nha Trang for nature-based activities and eco-tourism. 
You can offer handshakes with monkeys and feed them. Cruise back to Da Chong Pier. 
Transfer back to the hotel. Overnight in Nha Trang.</p><p><strong>Day 3: Nha Trang - Da Lat (B)</strong><br>
Breakfast at the hotel. Visit Po Nagar Temple, built during the 8th-13th centuries in Nha Trang, 
is an architectural work of art typical of Cham ethnic aesthetics. Then, transfer to Da Lat.
 On arrival, visit Lam Vien Square and Xuan Huong Lake. Overnight in Da Lat.</p><p><strong>Day 4: Da Lat (B)</strong>
 <br>Breakfast at the hotel. Morning, visit City Flower Garden, King Bao Dai\'s Summer Palace and Truc Lam 
 Pagoda. Afternoon, visit Old Train Station and Domain De Marie Church. Overnight in Da Lat.</p><p><strong>
 Day 5: Da Lat - Ho Chi Minh City (B)</strong><br>Breakfast at the hotel. Morning, transfer back to Ho Chi Minh
 City via Dambri waterfall in Bao Loc town. Arrive in Ho Chi Minh City. Transfer to the departure point. 
 End of service. &nbsp;</p><p><strong>NOTE:&nbsp;B</strong> - Breakfast; <strong>L</strong>- Lunch</p>
 <p><strong>PRICE:</strong><br><strong>Starting at&nbsp;VND 15,999,000 / person</strong>&nbsp;(for a group of minimum 
 6&nbsp;people).<br><strong>VALIDITY: From January 1st, 2024 to December 31st, 2024</strong>&nbsp;(Except: Peak Season
 &amp; Festive periods)</p><p>Please contact us for more tailor-made&nbsp;tours: 
 <a href=\"mailto:Info@saigontouristvietnam.com\">Info@saigontouristvietnam.com</a></p>', DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 4 DAY), 'Nha Trang', 85, 'active'),
('Phu Quoc tour', 'PhuQuoc-bg.jpg', 
'<p><strong>Day 1: Arrival - Phu Quoc</strong><br>Flight to Phu Quoc. Arrive in Phu Quoc. 
Pick up and transfer to the hotel. Afternoon, visit Khu Tuong pepper garden, fish sauce firm, Sung Hung Co Tu Pagoda
 and Ganh Dau Beach. Overnight in Phu Quoc.</p><p><strong>
 Day 2: Phu Quoc (B)</strong><br>Breakfast at the hotel. Morning, visit An Thoi Harbor, the feeding and growing pearl
 firm. Afternoon, visit Ham Ninh fishing village, Bien Sao Beach and Duong Dong Market. 
 Overnight in Phu Quoc.&nbsp;</p><p><strong>Day 3: Phu Quoc - Departure (B)</strong><br>Breakfast at the hotel.
 Free at leisure until transfer to the airport for the departure flight. End of service.</p><p><strong>Notes:</strong>
 B - Breakfast</p><p><strong>PRICE</strong>:<br><strong>Starting at</strong>&nbsp;<strong>VND</strong>&nbsp;<strong>9,500,000/ person </strong>
 (for a group of minimum 6&nbsp;people).</p><p><strong>Validity: From January 1st, 2024 to December 31st, 2024</strong></p>',
DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 4 DAY), 'Phu Quoc', 275, 'active'),
('Da Lat tour', 'DaLat-XuanHuong.jpg', 
'<p><strong>Day 1: Arrival - Da Lat</strong><br>Flight to Da Lat. Arrive at Lien Khuong airport. 
Pick up and transfer to hotel. Afternoon, take a city tour to visit the Datanla waterfalls, 
Truc Lam Pagoda and Xuan Huong Lake. Overnight in Da Lat.</p><p><strong>Day 2: Da Lat (B)</strong><br>
Breakfast at the hotel. Take a full day city tour to visit the Domain De Marie Church, Bao Dai Summer Palace, 
Valley of Love, Minh Tam\'s flower garden, Crazy House, Truc Lam Pagoda, Tuyen Lam Lake and Da Lat Market. 
Overnight in Da Lat.&nbsp;</p><p><strong>Day 3: Da Lat - Departure (B)</strong><br>Breakfast at the hotel. 
Morning free at leisure until transfer to the airport for flight back to the departure point. 
End of service.</p><p><strong>NOTE:</strong> B - Breakfast</p>
<p><strong>PRICE:</strong></p><p><strong>Starting at</strong>&nbsp;<strong>VND&nbsp;5,500,000/ person</strong> 
(for a group of minimum 6&nbsp;people).</p>
<p><strong>Validity: From January 1st, 2024 to December 31st, 2024</strong></p>
<h2><strong>HOTLINE:&nbsp;</strong></h2><h2><a href=\"tel:+84 91 1273003\"><strong>(+84) 909 284 554</strong></a
><br><a href=\"tel:+84 91 1273003\"><strong>(+84) 911 273 003</strong></a></h2>
<p>Please contact us for more tailor-made tours: Info@saigontouristvietnam.com</p>',
NOW(), DATE_ADD(NOW(), INTERVAL 3 DAY), 'Da Lat City', 99, 'active'),
('Da Nang tour', 'CauRongDaNang.jpg', 
'<p><strong>Start at 13:30 and return around 17:30 (tour will depart with at least 4 people).
</strong></p><p>A half day city tour in Da Nang features tho Non Nuoc carving village, the Cham Museum,
 a pedicab ride (30 minutes) along han River, and the Marble Mountains.&nbsp;During the short stop at Han market,
 you can buy unique hand-made souvenirs.</p><h3><strong>ITINERARY</strong></h3><p>Visit the Cham Museum.<br>
 Enjoy the pecicab ride along Han River (30 minutes).<br>Visit the Marble Mountains and Non Nuoc Beach.<br>
 Stop at Non Nuoc carving village and Han Market.<br>Overland back to Hoi An.<br>Return to the hotel. 
 End of tour.</p><p><strong>Departure:</strong>&nbsp;<br>At Saigontourist Da Nang\'s office&nbsp;
 10 minutes before prior to departure time.<br>Hotel pick-up.</p><p><strong>PRICE:&nbsp;VND 575,000/ person 
 for a group of minimum 4 people&nbsp;</strong><br><strong>
 Validity: From&nbsp;May 1st, 2024&nbsp;to September&nbsp;30th, 2024.</strong></p>',
DATE_ADD(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 5 DAY), 'Da Nang City', 349, 'active'),
('Ha Noi - Sapa (4D3N)', 'Sapa-City.jpg',
'<p><strong>Day 1: Ha Noi - Lao Cai (By Train)</strong><br>Pick up at the hotel and transfer to the railway station 
for the night train to Lao Cai. Overnight on train.</p><p><strong>Day 2: Lao Cai - Sapa</strong><br>Arrive in Lao Cai
 Town. Pick up and overland to Sapa Town. Then, take the trekking tour to visit the ethnic villages at Muong Hoa 
 Valley including Y Linh Ho, Lao Chai and Tavan. Afternoon transfer to the hotel. Free at leisure. Overnight in Sapa.
 </p><p><strong>Day 3: Sapa Bac Ha - Lao Cai (B)</strong><br>Breakfast at the hotel. Transfer to visit the Tuesday 
 Coc Ly Fair, or the Thursday Lung Khau Nhin Fair or the Saturday Can Cau Fair, or the Sunday Bac Ha Fair. Afternoon
 overland back Lao Cai via Trung Do village en route. Arrive in Lao Cai Town. Transfer to the railway station for 
 the night train back to Ha Noi. Overnight on train.</p><p><strong>Day 4: Lao Cai - Ha Noi</strong><br>Arrive in Ha 
 Noi. Pick up and transfer to the departure point. End of service.</p><p><strong>NOTE:</strong> B - Breakfast</p><p>
 <strong>PRICE</strong></p><p><strong>Starting at 7,500,000&nbsp;VND/person (for a group of minimum 6&nbsp;people).
 </strong></p><p><strong>Validity: From January 1st, 2024 to December 31st, 2024</strong></p>',
 DATE_ADD(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 4 DAY), 'Sa Pa City', 349, 'active'),
 ('Ha Noi - Sapa - Ninh Binh - Ha Long (6D5N)', 'Sapa.jpg',
'<p><strong>Day 1: Arrival &nbsp;Ha Noi</strong><br>Arrive in Ha Noi. Meet and transfer to the hotel. Afternoon tour 
to visit the the Literature Temple, Hoan Kiem Lake, Ngoc Son Temple and take 01-hour pedicab ride to the Old French 
Quarters. Overnight in Ha Noi.</p><p><strong>Day 2</strong>: <strong>Ha Noi - Lao Cai -Train (B)</strong><br>
Breakfast at the hotel. Take a full day city tour to visit Ho Chi Minh\'s Mausoleum and Museum, House on Stilts, 
One-Pillared Pagoda, History Museum, West Lake, Quan Thanh Temples and Tran Quoc Pagoda. Evening, enjoy the water 
puppet show. Then, transfer to the railway station for the night train to Lao Cai. Overnight on train.<br><br><strong>
Day 3</strong>: <strong>Lao Cai - Sapa (/)</strong><br>Arrive in Lao Cai early in the morning. Meet and overland to 
visit Bac Ha Town and the ethnic minorities surroundings. Afternoon overland back to Sapa Town. Transfer to the hotel
. Free at leisure. Overnight in Sapa.</p><p><strong>Day 4:</strong> <strong>Sapa - Lao Cai - Train (B)</strong><br>
Breakfast at the hotel. Morning tour to visit Thac Bac waterfalls and Sapa Market. Afternoon, overland back to Lao 
Cai. Transfer to the railway station for the night train back to Ha Noi. Overnight on train.</p><p><strong>Day 5
</strong>: <strong>Ha Noi - Ninh Binh - Ha Long (/)</strong><br>Arrive in Ha Noi early in the morning. Transfer to 
Ninh Binh Town. Visit the Dinh &amp; Le dynasty temples in Hoa Lu, an ancient capital of Vietnam. Continue with a 
sampan ride to Tam Coc, known as Vietnam\'s \"Inland Ha Long Bay\" and Bich Dong cave pagodas. Afternoon, overland 
to Ha Long Bay. Arrive in Ha Long City. Free at leisure. Overnight in Ha Long.&nbsp;</p><p><strong>Day 6:</strong> 
<strong>Ha Long - Ha Noi - Departure (B, L)</strong><br>Breakfast at the hotel. Morning, take a boat cruise to visit
 Thien Cung, Dau Go grottos and enjoy swimming. Lunch on board. Afternoon, overland back to Noi Bai Airport for 
 departure flight. End of service.</p><p><strong>Notes</strong>: B - Breakfast / L - Lunch. &nbsp;</p><p><strong>
 PRICE:</strong><br><strong>Starting at</strong>&nbsp;<strong>VND 14,500,000/ person (for a group minimum 6 people)
 </strong></p><p><strong>Validity: From January 1st, 2024 to December 31st, 2024</strong><br>(Booking is applied for
 a private group from 2 adults onwards).</p>',
 DATE_ADD(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 4 DAY), 'Ha Noi - Sapa - Ninh Binh - Ha Long', 709, 'active'),
  ('HCM - Can Tho (2D1N)', 'CanTho-SongNuoc.jpg',
'<p><strong>Day 1: Ho Chi Minh City - Can Tho - Mang Thit - Tra On (L, D)</strong><br>Morning: Pick up&nbsp;at your
 hotel in Saigon Center and transfer directly to Can Tho. Boarding at noon at Ninh Kieu pier. Welcome drink, 
 introduction to the ship and crew of the <strong>Bassac ship</strong>, check into the cabins. Departure at noon 
 downstream of the Hau river. Lunch on board while en route.<br>Turning into Nicolai canal, towards the Mang Thit 
 river. Rest on the upper deck in a scenery of rice fields, sugar cane, woods on the near banks.<br>By mid-afternoon,
 the Bassac casts anchor for a visit on shore: past the first tree line, quiet discovery of the peaceful life in the
 delta\'s countryside, of rice fields, fruit trees and the welcoming inhabitants, or, at your option, short cycling 
 tour of the surrounding area.<br>Boarding back, complimentary drink as a welcome back on board. Rest on the deck or
 around the bar enjoying the sunset. The Bassac sets anchor just downstream from Tra On for the night.</p><p><strong>
 Day 2: Tra On - Can Tho - Ho Chi Minh City (B)</strong><br>The boat departs at 06:00, as the ship passes by Tra On.
 The ship then departs towards Can Tho. The breakfast is available at 7:00. Arrival in Can ThoÂ¡, transfer onto a 
 local boat to visit the Cai Rang floating market (8:45 AM), then a noodle factory and return to the Ninh Kieu pier.
 Disembark at 10:00 AM. Transfer back to your drop-off point in Ho Chi Minh City. End of service.</p><p><strong>
 NOTE:&nbsp; L</strong> - Lunch / <strong>D</strong> -&nbsp;Dinner / <strong>B&nbsp;</strong>- Breakfast</p><p><i>(*)
 Please note that the itinerary may be subject to change without prior notice.</i></p><p><strong>PRICE:&nbsp;
 </strong><br><strong>Starting at VND 8,880,000 / person</strong> (for a group of minimum 2 people)<br><strong>
 Validity: From January 1st, 2024 to December 31st, 2024&nbsp;</strong>(Except: Peak Season &amp; Festive periods)</p>',
DATE_ADD(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 5 DAY), 'Can Tho City', 379, 'active'),
  ('VIET NAM MEDICAL TOUR: CITY - CU CHI TUNNEL - HO TRAM BEACH 5 Days 4 Nights', 'HoChiMinh.png',
'<p><strong>Day 1: ARRIVAL - HO CHI MINH</strong><br>Afternoon: Saigontourist guide will welcome guest in Tan Son 
Nhat international airport.<br>Transfer to hotel for check in (check in time: 14:00)<br>Overnight at the hotel in
 HCMC.</p><p><strong>Day 2: CHO RAY HOSPITAL - CITY TOUR - DINNER CRUISE (L, D)</strong><br>Morning: No breakfast 
 for blood test.<br>Guide will pick you up and transfer to Cho Ray Hospital for medical examination. Transfer to 
 restaurant for lunch.<br>Afternoon: City tour<br>Discover about Vietnamese history at History Museum &amp; Choose 
 from hundreds of beautiful postcards at City Post Office and send home to your beloved.<br>Take a snapshot at the 
 famous Notre Dame Cathedral.<br>Visit Cho Lon (Dist. 5) and explore the daily activities of locals.<br>View the 
 unique architecture of Thien Hau Temple and Van Phat Pagoda.<br>Enjoy cyclo ride around Cho Lon (30 minutes)<br>
 Learn some interesting methods of making silver.<br><i>@&nbsp;Note: History Museum is replaced by War Remnants 
 Museum on Monday</i></p><p>Evening: Dinner Cruise - This tour provides a chance to explore Ho Chi Minh City\'s 
 nightlife. A romantic dinner cruise along the tranquil Saigon River is truly a short retreat from the bustling 
 ambiance of HCMC. The trip will be more complete by a short window sightseeing tour in the city center to contemplate
 French-style colonial architecture in contrast with splendidly lighted modern sky-scrapers.<br>Enjoy water puppet 
 show (Tuesday &amp; Friday only)<br>Take a boat cruise along Saigon River<br>Window sightseeing for quick view of 
 HCM.C downtown at sunset<br>Dinner on cruise with Vietnamese food<br>Overnight at the hotel in HCMC.</p><p><strong>
 Day 3: CU CHI TUNNEL - HO TRAM BEACH (B, L, D)</strong><br>Morning: Check out. Breakfast at the hotel.<br>Transfer 
 to Cu Chi tunnel which is used to be a bitter battleground for many years during the Vietnam War:<br>Watch a short 
 documentary of Cu Chi during the war<br>Experience the network of Cu Chi Tunnels<br>Gain more knowledge about the 
 amazing tenacity shown by the locals during Vietnam war<br>Try some rifle shooting (optional with surcharge)<br>
 Lunch at the restaurant.<br>Transfer to Ho Tram beach. Arrive Ho Tram beach, check in hotel.<br>Dinner at the 
 restaurant.<br>Overnight at the hotel in Ho Tram.</p><p><strong>Day 4: HO TRAM BEACH (B, L, D)</strong><br>Morning:
 Breakfast at the hotel. Free and Easy. Lunch at the restaurant.<br>Afternoon: Check out. Transfer back to Ho Chi 
 Minh<br>Dinner at the restaurant.<br>Overnight at the hotel in HCMC.</p><p><strong>Day 5: HO CHI MINH - DEPARTURE 
 (B, L)</strong><br>Morning: Breakfast at the hotel.<br>Afternoon: See doctor in the meeting room. Light lunch with
 PHO.<br>Transfer to airport for departing.<br>Goodbye!</p><p><i>@ Note: Time and place may be re-arranged but still
 keep full of program.</i></p><p><strong>PRICE: (Per Person) Minimum 30 people &amp; effective until December 31st, 
 2024</strong></p><p>Adult: 659 USD/ person<br>Child (from 5-10 yrs old): 459 USD/ person<br>Single supplement: 
 + 259 USD/ person.</p>',
 NOW(), DATE_ADD(NOW(), INTERVAL 3 DAY), 'HCM - Cu Chi - Ho Tram', 659, 'active'),
 ('Da Nang - Hoi An - My Son - Hue (4D3N)', 'CauRongDaNang.jpg',
'<p><strong>Day 1: Arrival - Da Nang-Hoi An</strong><br>Flight to Da Nang. On arrival, pick up and transfer to visit
 the Cham Museum and the Marble Mountains. Then, transfer to Hoi An Town. Afternoon, visit Hoi An ancient town, 
 including Japanese Covered Bridge, Chinese Conference Halls, Phung Hung Ancient House, market, and shops. Free at 
 leisure. Overnight in Hoi An.&nbsp;</p><p><strong>Day 2: Hoi An - My Son - Hue (B)</strong><br>Breakfast at the 
 hotel. Morning, visit My Son, the ancient Capital of Cham Kingdom. Afternoon, transfer to Hue via Lang Co lagoon. 
 Arrive in Hue. Free at leisure. Overnight in Hue.&nbsp;</p><p><strong>Day 3: Hue (B)</strong><br>Breakfast at the 
 hotel. Morning, visit Imperial Citadel and Dong Ba Market. Afternoon, visit Tombs of King Tu Duc and King Khai Dinh.
 Overnight in Hue.&nbsp;</p><p><strong>Day 4: Hue - Departure (B)</strong><br>Breakfast at the hotel. Morning, take
 a boat cruise on Huong River to visit Thien Mu Pagoda and ending up at Tomb of King Minh Mang. Afternoon, transfer 
 to the airport for departure flight. End of service.</p><p><strong>Notes:</strong>&nbsp;B - Breakfast</p><p><strong>
 *PRICE:</strong><br><strong>Starting at VND 8,999,000/ person</strong> (for a group of minimum 6&nbsp;people)</p><p>
 <strong>Validity: From January 1st, 2024 to December 31st, 2024</strong></p>',
DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 4 DAY), 'Da Nang - Hoi An - My Son - Hue', 449, 'active'),
 ('A Perfect Mixture Of Nature And Culture', 'HoiAn.jpg',
'<p><strong>Day 1: Arrival in DA NANG (/)</strong></p><p>Airport arrival / Pick up and transfer to Hotel / Free time 
for leisure / Overnight in Da Nang.</p><p><strong>Day 2: DA NANG - BANA HILLS - DA NANG (Breakfast, Lunch)</strong>
</p><p>Pick up at hotel and proceed to Ba Na Hills / Arrive at the cable car station and take cable car to Ba Na 
peak / Arrive at Ba Na Hills and Visit Golden Bridge / Visit Le Jardin D\'amour, French Village, Helios Waterfall 
and Sakyamuni Buddha\'s Monument with 27m high Buddha statue / Buffet lunch at restaurant Ba Na Hills / Visit and 
play game at the Ba Na Hills Fantasy Park - the third largest indoor amusement park in the world <i>(only some free 
games depending on Ba Na Hills policy)</i> / Go down the hills by cable car / Transfer back to Danang / Overnight in
 Da Nang.</p><p><strong>Day 3: DA NANG - HOI AN - DA NANG (Breakfast, Lunch)</strong></p><p>Pick up at hotel and 
 Transfer to Cam Thanh Village / Arrive in Cam Thanh village and embark on a sampan bamboo basket / Rowing through 
 the small rivers, canals and ditches and passing through two sides of coconut / Visit palm forest and join in some
 water games activities / Transfer to Hoi An Old Town / Visit Japanese Covered Bridge, Old Merchant House, Hoi An 
 Museum of Trade Ceramics and Folklore Museum / Enjoy shopping time here with numerous art galleries and handmade 
 souvenir stores / Transfer back to Da Nang / Overnight in Da Nang.</p><p><strong>Day 4: DA NANG - DEPARTURE 
 (Breakfast, Lunch)</strong></p><p>Pick up at hotel and visit Marble Mountain / Visit Am Phu Cave, Huyen Khong Cave,
 Tam Thai Pagoda and Linh Ung Pagoda / Have lunch at local restaurant / Visit Son Tra Peninsula, Linh Ung Pagoda and 
 Dragon Bridge / Free time for shopping at Han Market / Transfer to Da Nang International Airport for departure 
 flight.</p><p><strong>PRICE: VND&nbsp;5,225,000/ person for a group of minimum 15&nbsp;people&nbsp;</strong><br>
 <strong>Validity: </strong><i><strong>From 15 January to 15 December 2024. Except Peak periods (Festivals &amp; 
 Public Holidays in Vietnam)</strong></i></p>',
 NOW(),DATE_ADD(NOW(), INTERVAL 3 DAY), 'Da Nang City', 209, 'active');

--
-- Dumping data for table `post`
-- add data post samples
INSERT INTO post (name, image, description, created_date, status) VALUES
('3 Days In Sapa Itinerary: The ULTIMATE Guide (2024)', 'Sapa.jpg', 
'<h2>3 Days In Sapa Itinerary: The ULTIMATE Guide (2024)</h2><p>Posted on 
<a href="https://www.backpackerswanderlust.com/3-days-in-sapa-itinerary-backpacking/">May 14, 2024</a> 
by <a href="https://www.backpackerswanderlust.com/author/tashyie/">Tasha Amy</a></p><p><i>Find out the ideal
 3 days in Sapa itinerary for an epic time in Northern Vietnam. 
 Let\'s get into the best things to do here, restaurants you have to try,
 where to stay including homestays, and more for your Sapa adventure!</i></p>
 <p>Backpacking Sapa is a highlight when you are in Northern Vietnam. 
 This spot is absolutely incredible with beautiful nature and friendly locals that will result in a busy
 3 days in Sapa itinerary.</p><p>Think of bright green rice paddies, mountainous landscapes, and witnessing life
 in rural Vietnam. This place is absolutely gorgeous and honestly quite different from other popular towns and cities
 you may visit, but how do you make the most out of your stay?</p>
 <p>Luckily enough I have traveled Vietnam from North to South discovering the best places worth checking out, 
 including right here in Sapa. And from this experience, I will let you know my top tips for visiting and
 what is actually worth your time!</p><p>So let\'s get into the details of this 3 day Sapa itinerary. 
 From where to stay, where to eat, and what to do. Whether you want to check out some incredible waterfalls, 
 and stunning views, make friends with the local animals, or even hike Fansipan Mountain known as 
 the roof of Indochina.</p>', NOW(), 'active'),
 ('The Ultimate Guide to Experiencing Da Nang, Vietnam', 'Da-Nang.jpg', 
'<h2>The Ultimate Guide to Experiencing Da Nang, Vietnam</h2><p><i>By</i> Josh Hewitt February 8, 2024 (4)
</p><p>&nbsp;</p><p>Located in central Vietnam, the city of&nbsp;Da Nang is a beautiful and rapidly growing city
 that is becoming one of Southeast Asia\'s top tourist destinations. Renowned for its breathtaking landscape, 
 rich culture, and incredible cuisine, it is a destination that should be on every traveler\'s list. 
 In this&nbsp; Da Nang, Vietnam Guide, I will touch on some of the many things that make this city incredible.</p>
 <p>From the city\'s breathtaking beaches to the incredible marble mountains that backdrop this gorgeous city, 
 Da Nang is a city that will take your breath away with its beauty. If that isn\'t enough to make you want to visit,
 the city\'s many incredible beaches are great for unwinding and and enjoying the weather. 
 Not to be outdone, the incredibly diverse and delicious cuisine in&nbsp; Da Nang is renowned the world over. 
 These are just some of the many reasons to visit this amazing city.</p><p>&nbsp;</p><p>
 <img src=\"https://wanderlustphotosblog.com/wp-content/uploads/2024/02/Da-Nang-Vietnam-Guide-2422.jpg\" 
 alt=\"Marble Mountains in Da Nang, Vietnam\"></p><h4>An All You Need Da Nang, Vietnam Guide</h4>
 <p>In this guide, I am going to provide you will all of the information that you need to plan a successful trip 
 to see&nbsp; Da Nang. I cover the best times to visit and the best ways to get there so that you can maximize 
 what you can see and do on your trip.</p><p>I also outline all of the top things to see and do while you are there,
 as well as the best places to stay and eat. With the information in my&nbsp; Da Nang, Vietnam guide in hand, 
 you can be confident that your trip to see one of Vietnam\'s most incredible cities will be one that you remember 
 for the rest of your life.</p>', NOW(), 'active'),
 ('40 Best Things to See & Do in Hanoi', 'Best-Things-Hanoi.jpg', 
 '<h2>40 Best Things to See &amp; Do in Hanoi</h2><p>Hey there, fellow wanderers! Matan here, your friendly 
 neighborhood globetrotter, ready to spill the beans on the 40 best things to do and see in the mesmerizing city of
 Hanoi.</p><p>To me, Hanoi is not just a destination; it\'s a captivating journey that unfolds with each step through
 its bustling streets and serene corners.&nbsp;</p><p>What I love most about Hanoi is its unique ability to blend the
 past and the present seamlessly.&nbsp;</p><p>The Old Quarter\'s labyrinthine streets whisper tales of bygone eras 
 while modern skyscrapers stand tall, embodying the city\'s evolution.&nbsp;</p><p>The vibrant street life, 
 from sipping egg coffee in the quaint cafes to indulging in street food adventures, has a distinctly Hanoian 
 charm.&nbsp;</p><p>The city\'s historical landmarks, like the Ho Chi Minh Mausoleum and the Temple of Literature,
 offer glimpses into Vietnam\'s rich heritage.&nbsp;</p><p>However, the people\'s warmth, resilience, and lively 
 spirit make Hanoi truly special.&nbsp;</p><p>Whether wandering through the French Quarter, enjoying the tranquility 
 of West Lake, or immersing myself in the chaos of the night market, each moment in Hanoi feels like a page in a 
 captivating novel that I never want to put down.&nbsp;</p><p>The city\'s energy, its flavors, and the genuine smiles
 of its residents create an experience that lingers in my heart, calling me back to explore its enchanting tapestry 
 time and time again.</p><p>Whether you\'re a history buff, a foodie adventurer, or seeking unique experiences,
 Hanoi has covered you.</p><p>So, lace up those travel shoes and dive into this Vietnamese gem\'s vibrant tapestry!
 </p><p><img src=\"https://guidetohanoi.com/wp-content/uploads/2024/01/Best-Things-to-See-Do-in-Hanoi-768x644.jpg\" 
 alt=\"Best Things to See &amp; Do in Hanoi\" 
 srcset=\"https://guidetohanoi.com/wp-content/uploads/2024/01/Best-Things-to-See-Do-in-Hanoi-768x644.jpg 768w,
 https://guidetohanoi.com/wp-content/uploads/2024/01/Best-Things-to-See-Do-in-Hanoi-300x251.jpg 300w,
 https://guidetohanoi.com/wp-content/uploads/2024/01/Best-Things-to-See-Do-in-Hanoi.jpg 940w\" 
 sizes=\"100vw\" width=\"768\"></p><p>#1</p><h2>Wander around the Old Quarter</h2><p>Kicking off our Hanoi escapade,
 stroll through the labyrinthine streets of the Old Quarter.</p><p>The lively atmosphere, vibrant markets, 
 and well-preserved historic architecture like the ancient house or Bach Ma Temple
  make this area a perfect initiation into the city\' heartbeat.</p><p>Immerse yourself in the hustle and bustle,
  discovering hidden gems at every turn.</p><p>And if you want more, maximize your exploration of Hanoi by 
  booking a city tour with a knowledgeable guide.</p><p>Gain insights into hidden gems, street food
  ,local legends, and historical anecdotes that breathe life into the city\'s streets.</p><p>A guided tour ensures 
  you don\'t just see Hanoi; you experience it!</p><p>#2</p><h2>People Watch at Hoan Kiem Lake</h2><p>Find a cozy 
  spot by the picturesque Hoan Kiem Lake and indulge in the simple pleasure of people-watching.</p><p>The lake, with
  the iconic Turtle Tower standing tall in its center, provides a serene escape from the urban buzz.</p>
  <p>Reflect on the city\'s legends and observe the ebb and flow of daily life as you soak in the tranquil ambiance
  .</p><p>#3</p><h2>Cross The Huc Bridge and Visit the Ngoc Son Temple</h2><p>For a touch of spirituality, 
  embark on a journey across the gracefully curved Huc Bridge to reach the Ngoc Son Temple on Hoan Kiem Lake.</p>
  <p>Nestled on an island in the lake, this pagoda offers a serene oasis amid the bustling surroundings.</p>
  <p>The journey across the bridge is a visual feast, leading you to a place where history and tranquility coexist.</p>
  <p>#4</p><h2>Visit the Ho Chi Minh Mausoleum and See Uncle Ho</h2><p>Pay homage to the revered founding father 
  of Vietnam at the Ho Chi Minh Mausoleum in the legendary Ba Dinh Square.</p><p>The imposing structure is a testament
  to the nation\'s history and enduring connection to Uncle Ho.</p><p>Witnessing the embalmed leader is a historical 
  encounter and an opportunity to reflect on Vietnam\'s journey.</p><p>After your visit, you can explore the rest of 
  the Ho Chi Minh Mausoleum Complex, which includes more landmarks of Hanoi, such as Ho Chi Minh\'s Stilt House
  and Ho Chi Minh Museum.</p><p>#5</p><h2>Book a Cruise to Ha Long Bay</h2><p>Embark on a captivating journey by 
  booking a cruise to the world-renowned Ha Long Bay.</p><p>Marvel at the surreal limestone karsts that majestically
  rise from the emerald waters.</p><p>This stunning UNESCO World Heritage site that you can not miss if you are in
  Hanoi is a natural masterpiece, inviting you to explore its mystical caves and embrace the enchanting landscapes.
  </p><p>You can book a 1-day cruise or a 2-day Cruise  it\'s up to you, while I recommend the two days trust me, 
  to take up in the bay will be worth it!</p><p>#6</p><h2>Book a Two-Day Tour to Sapa, Including Trekking and Homestay
  </h2><p>Escape the urban sprawl and delve into the scenic beauty of Sapa.</p><p>
  A two-day adventure in Sapa awaits, trekking through mist-covered mountains and a homestay experience that 
  immerses you in the warmth of local hospitality.</p><p>Discover the unique culture and breathtaking landscapes 
  of this northern Vietnamese region.</p><p>Book the tour here.</p><p>#7</p><h2>Book a Day Tour to Ninh Binh, Hoa Lu,
  Tam Coc, and See Mua Cave</h2><p>Indulge in a day tour to Ninh Binh, where history and nature intertwine seamlessly.
  </p><p>Explore the ancient capital of Hoa Lu, glide along the serene Tam Coc, and conquer the steep steps leading
  to Mua Cave for panoramic vistas.</p><p>This day trip promises a blend of historical richness and natural wonders.
  </p><p>#8</p><h2>Try the Egg Coffee at Giang Cafe</h2><p>Satisfy your caffeine cravings with a twist by indulging 
  in the iconic egg coffee at Giang Cafe.</p><p>This unique Hanoi specialty blends rich coffee with a creamy, 
  frothy egg concoction.</p><p>The cozy ambiance of the cafe adds an extra layer of charm to this must-try culinary 
  experience.</p>',NOW(), 'active'),
  ('A Guide to Ho Chi Minh City: Where to Explore, Indulge, Rest, and Enjoy in the Heart of Vietnam', 
  'best-guide-to-ho-chi-minh-city.jpg',
  '<p>Welcome to the culinary kaleidoscope of HCM City where the streets are alive with the sizzle of woks,
  and every bite tells a tale of rich cultural fusions. In this 101 guide, we''ll navigate through the gastronomic
  wonders that define this vibrant metropolis, from the fragrant dance of <strong>pho </strong>to the crispy 
  symphony of <i>banh mi.</i> Ho Chi Minh City\'s food scene isn\'t just a menu; it\'s a journey through diverse 
  backgrounds, a fusion of flavours echoing the city\'s dynamic history and multicultural fabric.<br><br>Join us as 
  we explore the streets and stories that make your visit a delectable ode to Ho Chi Minh City\'s rich tapestry. 
  Get ready to savour not just food but a feast of cultural diversity in every mouthful.<br><br>Let the culinary 
  adventure begin.<br>&nbsp;</p><p>The Notre Dame Cathedral, Chef Peter Cuong Franklin\'s one and only MICHELIN Star
  Saigon, and a building with cafe\'s in Nguyen Hue Walking Street.</p><p>&nbsp;</p><h4><strong>District 1: 
  Explore the cultural and historical hub</strong><br>&nbsp;</h4><p><i><strong>What to see and do</strong></i>
  </p><p>Before 1975, Ho Chi Minh City was known as Saigon, with District 1 serving as its centre. Saigon Centre, c
  onstructed by the French in the 18th century, boasts numerous iconic architectural works and expansive gardens with
  distinct French characteristics.<br><br>Today, District 1 stands as the financial, administrative, and cultural hub
  of the city\'s an essential starting point for every visitor. This district is also home to multiple hotel options, 
  including the centrally located <i><strong>Park Hyatt Saigon</strong></i>, one of the city\'s top hotels, 
  and the luxurious><strong>The Myst Dong Kho</strong>\'s modernist tower adorned with windows and balconies in a 
  unique pattern, surrounded by lush greenery.<br><br>The most immersive way to explore the heart of District 1 is 
  on foot. Begin your journey with a visit to <strong>the Notre Dame Cathedral of Saigon</strong>, an architectural 
  marvel blending Roman and Gothic influences. Adjacent to the cathedral stands <strong>the Saigon Central Post 
  Office</strong>, a Western gem adorned with Eastern decorations, dating back to the late 19th century.<br><br>A 
  brief stroll away lies <strong>the Independence Palace</strong>, steeped in historical significance as the former 
  residence and workplace of the President of the Republic of Vietnam before the pivotal April 30, 1975, event. 
  This three-storey palace, surrounded by lush grounds, invites exploration of its unique architecture and the 
  discovery of remnants from bygone eras.<br>&nbsp;</p><p>Cuc Gach Quan, a Bib Gourmand spot offering mostly 
  traditional Vietnamese in District 1.</p><p>Continue your leisurely walk to <strong>the Saigon Zoo</strong> and 
  <strong>Botanical Garden</strong>, a conservation park inaugurated in 1865 during the French colonial period. 
  This oasis, the eighth oldest zoo globally, provides a serene escape within bustling Saigon. Housing over 1,300 
  animals from 125 species, including rare inhabitants like the star pheasant, yellow-cheeked gibbon, golden deer,
  and clouded leopard, the zoo is complemented by a rich botanical collection of over 2,500 trees and 900 preserved 
  plant species. Nestled within the zoo\'s grounds, <strong>the Vietnam History Museum </strong>offers a brief yet 
  insightful journey through Vietnam\'s historical periods of formation and development.<br><br>Next, embark on a 
  captivating journey along the historic <strong>Dong Khoi Street</strong>, Saigon\'s architectural haven. 
  Once one of the main arteries of Saigon during the French colonial era, Dong Khoi now stands as one of Vietnam\'s
  most expensive streets. Spanning 630 metres, it unveils a remarkable array of landmarks, including <strong>
  the Opera House</strong>, <strong>Notre Dame Cathedral</strong>, <strong>City Hall (now the People\'s Committee of
  Ho Chi Minh City)</strong>, <strong>the Continental Hotel</strong> (established in 1880), <strong>the Majestic 
  Hotel </strong>(built in 1925), and the iconic twin towers of <strong>Vincom Center Tower</strong>.<br>&nbsp;</p>
  <p>A noteworthy attraction near District 1 is the not-to-be-missed <strong>Tan Dinh Church</strong>, a pastel gem 
  situated in District 3. Commencing construction in 1870, the church showcases a striking fusion of Roman 
  architecture intertwined with Gothic and Renaissance elements. An intriguing aspect lies in its distinctive pink 
  exterior and interior, a transformation that took place in 1957, earning it the affectionate moniker \'the pink 
  church.\'</p><p>Continue your walking tour to the bustling <strong>Ben Thanh Market</strong>, where you can savour 
  a variety of specialty dishes with authentic Saigon flavours. Indulge in local delicacies such as broken rice, 
  vermicelli with fish sauce, spring rolls,<i>banh xeo</i>, and Southern sweet soups. The market offers a vibrant 
  culinary experience, allowing you to immerse yourself in the rich gastronomic culture of Saigon.<br>&nbsp;</p><h4>
  <strong>District 2: Discover the new culinary haven</strong><br>&nbsp;</h4><p><i><strong>What to see and do</strong>
  </i></p><p><strong>The Thao Dien area</strong> in District 2, recognised for its high concentration of expatriates,
  accommodates a diverse culinary scene. With an array of foreign restaurants and eateries, including French, Italian,
  Spanish, and Vietnamese fusion establishments, the area caters to the varied tastes of international residents and 
  tourists.<br><br>For a delectable dinner experience, consider exploring the Vietnamese delights at the 2023
  MICHELIN-listed <strong>Ana\'s Saigon</strong>, where authentic flavours take centre stage. Alternatively, 
  indulge in classic French dining at <strong>3G Trois Gourmands</strong>, where culinary expertise meets timeless 
  elegance. If you\'re inclined towards a farm-to-table experience,<strong> </strong>stands out, sourcing only organic 
  produce from local farms and blending European dishes with a subtle infusion of Japanese elements, accompanied by 
  an excellent wine selection.<br><br><strong>Xuan Thuy</strong> emerges as the most captivating street in Thao Dien,
  offering a distinctive charm when explored in the evening. Amidst the brightly coloured electric lights emanating 
  from restaurants and lively bars, Xuan Thuy encapsulates a quieter and more profound night experience. 
  The road, adorned with few cars and abundant trees, invites a serene ambiance.<br><br>Amidst the enchanting array 
  of eateries and chic bars, consider a visit to a balut shop right in Xuan Thuy, renowned as Saigon\'s most famous. 
  Don\'t be surprised if you find a queue forming.</p>',NOW(), 'active'),
  ('The essential Vung Tau guide', 'guide-to-VungTau.jpg', 
  '<h2>The pretty seaside town of Vung Tau is the Vietnamese equivalent of fish nau chips and a few days by the sea.
  In short, its where locals go&nbsp;to relax, soak up the sea breeze, and indulge in seafood feasts. 
  Vung Tau may not have Con Dao\'s paradisiacal white-sand beaches, but&nbsp;just two hours from Ho Chi Minh City, 
  it\'s perfect for a quick getaway. Here is the perfect guide to&nbsp;your Vung Tau holiday.</h2><h3>Take an
  early-morning walk on Back Beach</h3><h3><img 
  src=\"https://vietnam.travel/sites/default/files/inline-images/vung%20tau%20attractions-5.jpg\" 
  alt=\"back beach vung tau \"></h3><p>Dip your toes in cool water and watch the day wake up on 
  Vung Tau\'s beautiful Back Beach. This three kilometer-long strip of sand will entice you to spend a day in the 
  shade of an umbrella, cocktail in hand. A handful of high-end hotels, restaurants, and beach clubs line Back Beach,
  and local vendors rent umbrellas on the sand. When you\'re hungry, break for a delicious seafood lunch overlooking 
  the water.&nbsp;</p><blockquote><p>TIP: The waves on Back Beach are fairly flat and safe, so it\'s a great place 
  to bring little ones.</p></blockquote><h3>Tour Villa Blanche&nbsp;</h3><p>&nbsp;</p><p>It\'s only a 30-minute trek
  to the summit of Big Mountain, where you\'ll have a panoramic view of Vung Tau city and the coastline. 
  Along the way, stop by Villa Blanche for a quick tour. This colonial mansion was built in the late 1800s as a home 
  for the district\'s French governor. Today, Villa Blanche is a quiet museum displaying local and cultural&nbsp; 
  artefacts.&nbsp;</p><h3>Sample the local delicacies</h3><h3>&nbsp;</h3><p>Vung Tau is known for its wide range of 
  mouthwatering dishes made with fresh, local ingredients. Try a fragrant, steaming hot pot of stingray and baby 
  bamboo shoots;&nbsp;, a&nbsp;mini-pancake made of flour and curry powder, topped with fresh squid or shrimp, 
  green onion and shrimp powder. Each piece is wrapped in lettuce and fresh herbs, then dipped into a mix of fish 
  sauce, papaya and chili.</p><blockquote><p>TIP: Try Vung Tau\'s signature <i>banh khot</i> at Banh Khot Goc Vu 
  Sua&nbsp;at 14 Nguyen Truong To. The eatery opens from 7am to 2pm on weekdays, and 7am to 8pm on Sundays.</p>
  </blockquote><h3>Snap a selfie with Jesus</h3><p>&nbsp;</p><p>Vung Tau\'s famous Jesus Christ statue was built in 
  1974, and stands at 32 metres tall. You\'ll need to cover about 800 steps up the headland to reach the feet of the 
  statue, plus another 100 steps to its shoulders. Prepare for a steep climb, as well as amazing views from the top
  .</p><blockquote><p>TIP: Entrance to statue is free, but you\'ll need to follow the standard dress code for 
  religious sites.</p></blockquote><h3>Visit Ben Dinh fishing village</h3><h3>&nbsp;</h3><p>A short ride from the 
  city, Ben Dinh is populated almost entirely with fishermen and their families. Bright, multi-coloured boats are 
  moored by the beach and the catch is hauled in every morning before sunrise and sorted on the sand. In summer,
  the locals lay their fish out on nets to dry in the sun. Visitors can walk among the fishing boats, watch the 
  morning\'s catch being brought in, and buy fresh seafood to cook later.</p><h3>Hop across to Hon Ba</h3><h3>&nbsp;
  </h3><p>Hon Ba is a miniature island off the end of Back Beach that can only be accessed at low tide. 
  Make your way across the rocks and pebbles to the other side, where you can explore the beach for shells, or wander
  up to see the shrines at Mieu Ba temple, dedicated to the patroness of sailors and fishermen.</p>
  <h3>Check out the Monkey Temple</h3><p>About 30km from Back Beach you\'ll find Chua Khi (Monkey Temple), 
  a Buddhist pagoda complex that''s home to nearly 200 long-tailed macaques. Nestled among rolling hills a few 
  hundred meters from the ocean, Chua Khi is a popular site for Vietnamese buddhists. The 40-minute ride can be done
  in a taxi  at Long Hai beach for a quick dip in the sea.&nbsp;</p><blockquote><p>TIP: Be careful with your 
  belongings - the monkeys are quite curious and have been known to steal.</p></blockquote><h4><i><strong>Transport 
  to Vung Tau</strong></i></h4><p><strong>Buses </strong>- Two comfortable bus companies run between Vung Tau and Ho
  Chi Minh City: Phuong Trang Bus Company (FUTA Bus) and Hoa Mai. Visit the FUTA Bus office on De Tham to buy tickets, 
  or get the luxury Hoa Mai bus tickets for VND150,000 from 83 Nguyen Thai Binh.</p><p><strong>Hydrofoil</strong> - 
  The hydrofoil from Saigon River in Ho Chi Minh City to Vung Tau\'s Front Beach, takes roughly two hours. 
  Tickets range from VND120,000 to VND250,000. Simply head to Ben Nha Rong Port in District 1 for tickets and schedules.</p>
', NOW(), 'active'),
('5 must try Vietnamese dishes', 'best-vietnamese-dishes.jpg',
'<h2>In Vietnam, before eating we say Chuc ngon mieng-- meaning \'enjoy your meal\' (but of course you will.)</h2>
<h2>While Vietnamese cuisine abroad still flies under the banners of pho and banh my, the full spectrum of Vietnamese
 food is a symphony of delightfully textured, bright and piquant flavours.</h2><h2>The Vietnamese love their food and
 cooks make the most of each region\'s abundance produce and special ingredients to make their meals. Northern food
 is known for its simplicity; the dishes of central Vietnam are generous in spice and quantity; Southerners like to 
 add sugar. Wherever you travel across the country, you\'re sure to eat well.</h2><p>&nbsp;</p><h3><strong>1. Pho
 </strong></h3><p><img src=\"https://vietnam.travel/sites/default/files/inline-images/top-vietnamese-dishes-2_2.jpg\"
 alt=\"vietnamese pho\"></p><p><i>Pho</i>-real: this world-famous soup differs from north to south.&nbsp;</p><p>
 <i>Pho</i> is the quintessential Vietnamese dish, the word <i>Pho </i>referring to the type of noodle
 used in the recipe. Flat rice noodles dance around with medium-rare slivers of beef or boiled chicken in a hearty 
 beef stock. The more popular of the two widely known varieties is <i>Pho Hanoi</i>. Originally from the north, it is
 distinguished by a clear broth and dressed only with a squeeze of lemon and slices of bird\'s eye chili. The southern
 iteration, <i>Pho Nam</i>, has a murkier broth and is served with a bouquet of fresh herbs like bean sprouts, basil 
 and mint.</p><p>The secret to a good bowl of <i>Pho</i> lies in its stock. The broth is usually infused with fragrant
 star anise, clove and cinnamon to lend a natural sweetness to the mix. This dish is found on almost every street 
 corner and is actually consumed for breakfast, unbeknownst to outsiders.&nbsp;</p><p><strong>Try it:</strong>
 Pho Thin, 13 Lo Duc, Hai Ba Trung District in Hanoi or Pho Hoa, 260C Pasteur Street, District 3 in Ho Chi Minh City
 </p><h3><strong>2. Banh my</strong></h3><p>
 <img src=\"https://vietnam.travel/sites/default/files/inline-images/1016%20AJS%20Vietnam%20TAB%20Food-7.jpg\" 
 alt=\"Banh mi by Aaron Joel Santos Top 21 Dishes\"></p><p>With so many varieties, you\'re bound to find the 
 perfect&nbsp;<i>banh my&nbsp;</i>on a trip to Vietnam.&nbsp;</p><p>Baguettes may have been adopted from the French,
 but banh my is as Vietnamese as it comes. Sink your teeth into the crunchy crust and watch the warm roll give way to
 a whole scheme of textures.</p><p><strong>Try it: </strong>Banh My Phuong, 2B Phan Chau Trinh, Hoi An</p><h3><strong>
 3. Com Tam</strong></h3><p>
 <img src=\"https://vietnam.travel/sites/default/files/inline-images/Must%20try%20Vietnamese%20Dishes-12.jpg\" 
 alt=\"Christian Berg Top 21 Dishes Vietnamese Food\"></p><p>A platter of&nbsp;<i>Com Tam&nbsp;</i>in Ho Chi Minh 
 City.&nbsp;</p><p>Back in the day, Vietnamese farmers would eat the fractured rice grains they could not sell. 
 Nowadays, broken rice is a food staple for the everyday working-class citizen.&nbsp;For a meal of humble origins, 
 the preparations for com tam can get very decadent.</p><p>While it\'s prepared in a number of ways, the most popular 
 is <i>com tam suon cha, op la</i>. A fried egg is paired with caramelised grilled pork chop and laid out on a 
 generous heap of broken rice. The dish is then slathered with <i>nuoc cham</i>, a mixture of chilli, fish sauce and
 sugar, and a drizzle of green onion oil. The final touches include a side of shredded pickled carrots and daikon, 
 slices of cucumbers and tomatoes, and crushed fried pork rinds and shallots for garnish.</p><p><strong>Try it: 
 </strong>A&nbsp;family-operated stall on 260 Vo Van Tan, District 3, Ho Chi Minh City</p><h3><strong>4. Bun Bo Hue
 </strong></h3><p>
 <img src=\"https://vietnam.travel/sites/default/files/inline-images/1016%20AJS%20Vietnam%20TAB%20Hue-19.jpg\"
 alt=\"Bun Bo Hue by Aaron Joel Santos Top 21 Dishes\"></p><p>Called \"the greatest soup in the world\" by the late 
 Anthony Bourdain.&nbsp;</p><p>Representing the legendary royal cuisine of Hue, <i>bun bo hue</i> is a mighty 
 demonstration of both beauty and taste. The alarmingly red broth is the first signal of its striking flavour the 
 result of hours spent simmering beef bones and stalks of lemongrass to produce a citrusy concoction. Flash boiled 
 vegetables paired with tender beef shanks give this dynamic affair added vivacity. This may be a beef soup the word 
 <i>bo </i>is Vietnamese for beef\'s but don\'t be surprised when you see sausage lurking in the bowl. 
 Chao is a sausage made of ham paste that has a texture reminiscent of tofu.</p><p><strong>Try it: </strong>Quan Bun
 Bo Hue,19 Ly Thuong Kiet Street, Hue</p><h3><strong>5. Cao Lau</strong></h3><p>
 <img src=\"https://vietnam.travel/sites/default/files/inline-images/1016%20AJS%20Vietnam%20TAB%20Food-4.jpg\" 
 alt=\"Cao Lau by Aaron Joel Santos Top 21 Dishes\"></p><p>Thick noodles with a secret recipe, these are a must in 
 Hoi An.&nbsp;</p><p>A dish unique to Hoi An, <i>cao lau </i>is beyond compare. Saluting the history of the coastal
 trading port from where it originated, this sensuous bowl of noodles is a fusion of Japanese, Chinese and Vietnamese 
 influences. Slices of Chinese barbecued pork are fanned over <i>cao lau </i>noodles. These thick noodles, with the 
 same heft as Japanese udon, are then doused with a spice-laden broth and topped with fresh herbs and crushed pork 
 cracklings. Authentic <i>cao lau </i>is said to be made from the water found in the thousand-year-old Ba Le well in 
 Hoi An, rumoured to have magical properties.</p><p><strong>Try it: </strong>Thanh Cao Lau, 24 Thai Phien St, 
 Hoi An</p><h3>&nbsp;</h3>',NOW(), 'active'),
 ('Can Tho highlights and travel guide', 'travel-to-Can-Tho.jpg',
 '<h2><strong>Can Tho highlights and travel guide</strong></h2><p><br><strong>Can Tho</strong> is the largest city of
 the magnificent Mekong Delta in the south of Vietnam. Situated on the banks of the Hau River, it serves as the 
 political and commercial centre of the Mekong. Famous for it\'s captivating floating markets, beautiful temples and 
 delicious food, Can Tho is a great starting point for discovering the maze of waterways that makes up the Mekong 
 Delta.<br>&nbsp;<br><br>Despite changes of name and rule, <strong>Can Tho</strong> has managed to retain its unique
 culture and heritage. Its population of over 1 million combined with the flocks of tourists that venture there every
 year create a buzz of energy that can be felt in the streets of the town and the flow of the river. Although the 
 city sprawls over a large area, there is an easily accessible centre which has everything you could need. The main 
 attraction of the area has to be the lively, colourful floating markets which take place at the break of each day, 
 however, Can Tho has some other charms which make this city well worth a visit.<br><br>Much like many areas in the 
 south of Vietnam, Can Tho has two distinct seasons. The rainy season lasts from May to November and the dry season 
 from December to April. The average temperature throughout the year is between 29-33 degrees Celsius with April 
 being the hottest month. During the wet season, especially in October and November, monsoon rains cause the mighty 
 Mekong to swell sometimes causing flooding to the area. The prime time to appreciate the spirit of Can Tho is in 
 either April, May or June when the temperatures are comfortable and the rainy season is not yet in full swing.</p>
 <h2><strong>See and Do</strong></h2><p><br>When <strong>visiting Can Tho</strong>, it is a great idea to take a 
 walk through the town to get a feel for the area\'s unique culture. <strong>The charm of Can Tho</strong> is best 
 discovered in the local markets and on the banks of the river. <strong>Ninh Kieu Park</strong> sits at the 
 confluence of the River Hau and the Can Tho River. Previously a wharf, the park is now a picturesque spot to sit 
 and watch the colourful boats passing by on the flat, glassy water. The edge of the park is lined with well-kept 
 plants and features an impressive 7.2-meter sculpture of the national treasure, Ho Chi Minh.<br><br>
 <img src=\"https://www.mrlinhadventure.com/UserFiles/image/VIETNAM%20HIGHLIGHTS/Can%20Tho/Binh%20Thuy%20ancient%20house%20in%20Can%20Tho.jpg\" 
 alt=\"Minh Thuy ancient house\"></p><p><i>Binh Thuy Ancient House with its stately furnishings.</i></p><p><br>
 <strong>Hai Ba Trung Street</strong> follows the river south of the park and has a large ion of cafe\'s, restaurants
 and hotels. This area really comes to life at night with the beautiful lights reflecting off the river. The Can Tho
 Bridge casts some particularly beautiful light shows on the water with the colours rippling and merging with 
 the gentle waves.<br><br><strong>Binh Thuy Ancient House</strong> is a grand affair with colourful, ornate 
 architecture on the outside and a period furniture and antiques crowding the rooms. The building combines elements 
 of Vietnamese and European elements to create a lavish and elegant building. The house was built in 1870 by the Duong
 family, and it has been passed down through 6 generations of the family, some of whom still live in the rear part of
 the property. Often there will be a member of the Duong family on hand to give guided tours and show visitors points
 of interest around the house.</p><h2><strong>Culture and Arts</strong></h2><p><br>The <strong>floating markets
 </strong> are unarguably the biggest attraction of Can Tho with their unique charm atmosphere attracting hoards of 
 visitors each year. With Can Tho being the largest city in the Mekong Delta, there are a number of different markets 
 to choose from. Daily tours run from the main town to the trading flotillas, picking passengers up at the break of 
 day to catch the main action. The markets are a great place to sample the fresh local produce or watch the friendly 
 to and fro of the vendors as they bob down the river.<br>&nbsp;</p><p><i>The chaotic floating market of Cai Rang.</i>
 </p><p><br><strong>Cai Rang Floating Market</strong> is the biggest in the Mekong Delta and sees hundreds of boats 
 take to the river each day. Larger boats puntuate the water with the smaller boats filtering around them like swarms
 of fish. Each boat has a tall pole with a sample of their product on the end indicating what they have for sale. 
 The boats are laden with fresh fruit and vegetables, their colours painting an amazing picture across the green 
 murky waters. As well as the fresh produce, there are many boats selling sweet, rich Vietnamese coffee or delicious 
 local dishes prepared onboard. The best time to catch this market is from sunrise to early morning when the sun is
 just rising over the Mekong Delta.<br><br><strong>Phong Dien Market </strong>is a little further away from Can Tho
 but offers a more intimate, local style market. Unlike the busy wholesale market at Cai Rang, this floating market
 is made up of mainly smaller boats and has more leisurely pace to it. As with most markets, Phong Dien, is best seen
 as early as possible, between 5 am-8 am. The vibrant colours of the fresh fruit and vegetables add excitement to the
 green surroundings, signalling the start of another day. Most boat companies offer tours which allow passengers to 
 see both Cai Rang and Phong Dien in a single trip.<br><br>Can Tho has an interesting ion of temples and pagodas 
 throughout the city. <strong>Quang Duc Pagoda</strong> is just a short walk from the main downtown area and is a 
 beautiful example of a Buddhist Pagoda. The ornate architecture and grand sculpted wooden doors house a statue of
 the Buddha who sits atop a lotus, surrounded by flowers.<br><br>A short walk through town, opposite Ninh Kieu Park,
 is the beautifully designed <strong>Ong Temple</strong>. The exterior is painted with intricate decorations and its
 roof laden with tiny sculptures. Inside the temple is decorated with exquisite artwork and statues of religious
 deities. Huge incense coils hang from the ceilings, blowing gently and capturing the light in their wafting smoke.
 The temple was built in the late 19th century by the Chinese, and it has been perfectly preserved.<br><br><strong>
 Munirangsyaram</strong> sits like a glimmering vision of gold adorned with colourful flags. It is one Vietnams Khmer
 Buddhist temples and is worth a visit even just to see its ornate golden decoration. As well as the temple,
 there is a monastery housing many monks who are often keen to converse with any interested visitors.<br>&nbsp;</p>
 <h2><strong>Food and Drink</strong></h2><p><br>When it comes to food, Can Tho has many advantages, from being
 situated on some of the most fertile lands to being surrounded by rivers. The city showcases some of the signature 
 dishes of the South using freshly grown, local produce.<br><br><strong>De Tham </strong>is known as food street and 
 offers many different Vietnamese dishes from street vendors, cafes and restaurants. The scent of freshly cooking 
 food rises up from the steaming pots and grills, tempting all those that pass by to stop for a tasty treat.
 <br>&nbsp;</p><p><i>Banh Xeo, a kind of pancake local to the delta.</i></p><p><br><strong>Banh Cong </strong>makes a 
 tasty snack to keep you going until the next delicious meal. A combination of pork, shrimp, taro and mung bean is 
 mixed with a batter and deep fried into small balls which are then dipped in the classic fish sauce.<br><br>
 The Mekong region also has its own take on the Vietnamese dish <strong>Banh Xeo</strong>, sizzling pancake. 
 Here the pancakes are much larger than those in other regions with the sizzling hot, yellow pancake filling the 
 whole pan. The mixture is allowed to sizzle and cook before it is filled with pork, shrimp and vegetables. The best 
 thing about this dish is that is meant to be hands-on, eaten fresh from the pan, held in a lettuce leaf.<br><br>
 <strong>Chuoi Nep Nuong</strong> is a sweet dish that can be enjoyed as a snack or as dessert. Bananas are covered 
 in a layer of glutinous sticky rice which has been cooked in coconut milk. A banana leaf is wrapped around the 
 centre of the banana and rice package and it is placed on the grill. The sticky parcels are often served with coconut
 milk and tapioca.<br><br>Another great area for tasting some great local food is known as <strong>Hot Pot Alley
 </strong>. Located in Xuan Khanh Quarter, this street is popular with locals and students looking for a satisfying,
 steaming bowl of hot pot. Small burners are placed on the table with a large saucepan on top to which diners can add
 their choice of meat and vegetables. Because of its location, Can Tho has some unusual hot pot options including 
 duck and different types of fish. The joy of being this dish is that you can completely personalise it to your own
 tastes.&nbsp;</p>', NOW(),'active'),
 ('All things need to know before travelling to Buon Ma Thuot', 'BuonMeThuoc.png', 
 '<h2><strong>All things need to know before travelling to Buon Ma Thuot</strong></h2><p>Considered as the centre of 
 the culture of the Central Highlands. Buon Ma Thuot attracts visitors thanks to immense coffee fields, majestic 
 waterfalls or the beauty of the legendary Serepok. With Origin Travel explore Buon Ma Thuot if you are planning to 
 travel here.</p><h2><strong>How Buon Ma Thuot Is Unique?</strong></h2><p>Buon Ma Thuot under the French occupation
 was the center of Dak Lak province. Also the center of the Central Highlands.</p><p>Buon Ma Thuot has a long history,
 many documents have shown that this land exists very early. From the archaeological perspective of Buon Ma Thuot at
 least 4,000 years old. Through ethnic culture literature has a few hundred years Buon Ma Thuot and through 
 historical records, up to now Buon Ma Thuot has 105 years of formation and development.</p><h2><strong>How To Get 
 To Buon Ma Thuot?</strong></h2><p>Buon Ma Thuot is about 350 km from Ho Chi Minh City, about 1,400 km from Hanoi. 
 You can choose to go by road or airplane.</p><h4><strong>Travel by air</strong></h4><p>There are many flights to 
 Buon Ma Thuot. Such as. Vietnam Airlines, VietJetAir and Jetstar.</p><h4><strong>By road</strong></h4><p>From Hanoi
 and Ho Chi Minh City. There are direct bus services to Buon Ma Thuot and other districts of Dak Lak province. You 
 can buy bus tickets at Mien Dong Bus Station or Giap Bat Bus Station. Time is about 8 hours from Ho Chi Minh City 
 and about 1 day fro Hanoi.</p><p>There are hundreds of quality accommodation establishments and being put into 
 operation for Dak Lak tourism. Particularly in Buon Ma Thuot City has more than 100 motels, so that even in the peak
 season, the number of accommodation is also quite enough for tourists to come here.</p><h3><strong>Top Things To Do 
 In Buon Ma Thuot</strong></h3><h3><strong>1. DRAY SAP WATERFALL</strong></h3><p>Dray Sap waterfall is located about 
 39km from Buon Me Thuot city on the road towards the city. Ho Chi Minh City is the connecting point between the two 
 provinces of Dak Lak and Dak Nong. You can travel by motorbike rented in the city or by car.</p><p>The height of 
 the Dray Sap waterfall is about 20m and the width is quite impressive when it reaches nearly 100m. The majestic 
 stream of water poured down from above forming white water with an impression of smoke.</p><p>The dry season in 
 the Central Highlands has a rather dry and hot climate. When you come to Dray Sap waterfall, you will find that 
 the water is always clear and clean, very suitable for an outdoor picnic.</p><p>If you visit the waterfall in the 
 rainy season, the water on the waterfall is also full and stronger, you will fully feel the tropical ecosystem. 
 However, the rain in the afternoon is often very heavy, you should also be wary.</p><p>Entering the pristine forest,
 passing the gorging streams, the convex rocks, sometimes meeting a waterfall falling from the cliffs makes us very 
 excited. The deeper you go, the sound of the stream gurgling, the sound of rustling leaves or the sound of birds 
 singing is replaced by the sound of the powerful pouring water. You will feel the very majestic scenery of the 
 waterfall when going deep inside.</p><h3><strong>2. EA KAO LAKE</strong></h3><p>From the centre of Buon Ma Thuot 
 city. Tourists drive along Highway 14 for about 4km, turn left and go for another 8km until they meet the Y Wang 
 junction, ask for directions to enter Ea Kao Lake tourist area.</p><p>Ea Kao Lake means the lake that never runs 
 out. Because the lake is always full of water at all times of the year. When the rainy season comes, from May to 
 November, the water rises to the irrigation dam. In the dry season, the water goes down the middle of the calf. 
 The surrounding scenery is wild and rustic with green and green forests and mountains. Soft red strips of land 
 covered with grass and flowers all create a lively picture that you can admire even in the rainy or dry season.</p>
 <p>Although it is built with a modern structure, the whole project still bears the national cultural identity with 
 diverse terrain from hillsides, slits, slope</p><p>The point that makes visitors interested is the green space 
 surrounding, the large lake, fresh air, creating an ideal ecological environment. The interior is divided into many
 small areas serving all the needs of visitors such as entertainment areas, motels, flower gardens, restaurants, 
 botanical gardens, children\'s areas, campsites, nature reserves. Every area is conveniently arranged, 
 rich and attractive in the landscape.</p><h3><strong>3. GIA LONG WATERFALL</strong></h3><p>As one of the beautiful 
 waterfalls on the Serepok river. It located on the border between the two provinces of Dak Nong and Dak Lak. 
 Gia Long Waterfall is also known as Dray Sap Thuong. The origin of the waterfall name is derived from the time when 
 King Bao Dai arrived here to travel. Inspired by the natural beauty of the waterfall, he took the name of King Gia 
 Long is the first king of the Nguyen Dynasty to name this waterfall.</p><p>This tower attracts visitors for its 
 pure and rare beauty. On the journey to explore Gia Long waterfall, you seem to be lost in a forgotten world
  with a vast and majestic natural landscape. From the top of the tower that is more than ten meters high, 
  the waterfall flows day and night rushing white foam. The sound of waterfalls and birds chirping in the surrounding
  green primitive forests makes you feel like you are in a magical wonderland.</p><h3><strong>4. TROHBU BOTANIC 
  GARDEN</strong></h3><p>Not only is known as the new eco-tourism area of Dak Lak province. But Troh Bu is also known 
  most beautiful landscape garden in the Central Highlands.</p><p>Located in Buon Nieng 3, Ea Neurol commune, 
  Buon Don district, only about 13 kilometres west of Buon Me Thuot centre.</p><p>Because of the natural landscape 
  filled with trees and cool streams. Troh Bu eco-tourism area was born. Troh Bu\'s main goal is to preserve the 
  natural forest orchids, as well as some other rare plant species in the Vietnamese highlands. Although it is a 
  privately owned botanical garden, people have taken great efforts in recreating the old forest environment and 
  landscape for this place.</p><p>Stepping into Troh Bu. Visitors can not help but enjoy the many rich species of 
  forest trees and the landscape is decorated very nicely and fancy.</p><p>The entrance gate of Troh Bu is quite 
  special when grafted from many wooden trunks, bright red colour brings joy and luck to visitors.</p><p>Among the 
  entrances of the tourist area are decorated with many fancy statues for the Central Highlands people.</p><p>As an 
  ecotourism area, Troh Bu\'s space is filled with plants and trees combined with an artificial lake to bring harmony
  and comfort.</p><h3><strong>5. SAC TU KHAI DOAN PAGODA</strong></h3><p>Located in the heart of Buon Ma Thuot, 
  prominent with sophisticated architecture, imbued with Hue imperial appearance mixed with modern features, long 
  history. When stopping in the sacred Central Highlands, do not forget to visit the famous Sac Tu Khai Doan pagoda.
  </p><p>When coming to Sac Tu Khai Doan pagoda,. Visitors not only can learn about the meaningful birth history 
  and special architecture of the temple.</p><p>The statue of Shakyamuni Buddha in the middle of the main hall was 
  built of bronze with a height of 1.1m; wooden lotus 0.35m high. Many Buddha statues were built in many areas around
  the temple.</p><p>Especially not to mention the bronze bell 1.15m high, 2.7m in circumference, weighing 380kg, 
  cast in January 1954, the symbol of Sac Tu Khai Doan.</p><p>Up to now, although it has been through many decades, 
  Sac Tu Khai Doan pagoda still retains the inherent ancient architectural features, added more elaborate new 
  works.</p><p>Currently, Sac Tu Khai Doan committed suicide is the largest place of Buddhist worship in Dak Lak. 
  It is a must-visit destination for sightseeing and worship when travelling to Buon Ma Thuot city.</p><p>Above 
  are the most beautiful tourist destinations in Buon Ma Thuot, Daklak. Hopefully, with the information provided, 
  you will design yourself an attractive schedule when having the opportunity to stop in this coffee capital.</p>',
 NOW(),'active'),
  ('5 things need to know before travelling to Hoi An', 'HoiAn.jpg',
  '<h2><strong>All things need to know before travelling to Hoi An</strong></h2><p>Hoi An is one of the most favorite
  destinations in Vietnam. Ancient and peaceful. Hoi An town caters to visitors of all tastes and across continents.
  </p><p>This little town is just the perfect candidate for what Vietnam tourism ministry aims to bring for visitors 
  all over the world. Warm-hearted, welcoming and traditional, however, never out of touch with the outside world are
  specail tours in Hoi An.</p><p>In addition, Hoi An people are trying to catch up to their opportunities to find 
  their fame recently. It is a great place for spending time by the river, watching the sunset over the river and 
  sea. Strolling through the old town, and drinking inexpensive beer as well as local traditional cuisines will be
  a great experience.</p><h2><strong>How Hoi An Is Unique?</strong></h2><p>If you have ever visited Hoi An, surely
  you will be impressed with the ancient architecture of houses, streets, roads in this land. The mixed architecture
  helps Hoi An look very special, very beautiful and extremely charming. Because of the influences from historical
  events, the impact of many different cultures. Hoi An ancient town has a perfect combination of many structures,
  creating unique values.</p><h2><strong>Top Things To Do In Hoian</strong></h2><h3><strong>1. Hoian Ancient Town
  </strong></h3><p>The ancient town of Hoi An is located in Quang Nam, Vietnam, about 30km south of Da Nang city.
  Previously, in the 17th and 18th centuries, Hoi An was the busiest international trading port in Southeast Asia.
  However, by the 19th century, Hoi An was in a recession due to unfavourable water transportation. Therefore, the
  number of international ships and boats passing here decreased.</p><p>But also because of that Hoi An retains the
  ancient beauty, perfect integrity of an Asian trading port. In 1999, Hoi An was recognized by UNESCO as a world
  cultural heritage. And since then, Hoi An tourism has grown and become an indispensable destination for 
  international tourists coming to Vietnam.</p><h3><strong>2. Fujian Assembly Hall</strong></h3><p>The forerunner
  of the Assembly Hall is a small shrine worshipping the statue of Thien Hau Thanh Mau (the god blessing merchants
  overcome the ocean waves) picked up on the coast of Hoi An in 1697. Through the repeated restoration with the main
  contribution of the Overseas Chinese in Fujian State. The Assembly Hall became more brilliant and spacious, 
  contributing to the appearance of the ancient architecture of Hoi An.</p><h3><strong>3. Guang Dong Assembly Hall
  </strong></h3><p>An interesting thing about the construction of the Cantonese Assembly Hall is that each part of 
  this building was crafted in China, then transferred by boat and assembled into a complete shape in Hoi An. An 
  interesting thing about the construction of the Cantonese Assembly Hall is that each part of this building was 
  crafted in China. Then transferred by boat and assembled into a complete shape in Hoi An.</p><p>With a unique 
  architecture built in the shape of the country, the Cantonese Assembly Hall is made of wood and stone. The Assembly
  Hall is a closed project consisting of each part such as a three-door gate, a spacious garden decorated with many
  ornamental plants. In the middle is a communal house, flanked by two rows of East-West houses, the main hall and
  the campus backyard,</p><p>This is a traditional architecture quite similar to others. However, with a
  harmonious combination of different materials such as wood and stone in bearing structures. Besides the ornate and
  meticulous motifs, the Cantonese Assembly Hall still has its own unique features that do not overlap with anywhere
  else.</p><h3><strong>4. Japanese Covered Bridge</strong></h3><p>Japanese Covered Bridge is the jewel in the heart
  of Hoi An. The bridge was built in the late 16th century and is called the Japan Bridge. In the middle of the 
  bridge is a small temple to worship Huyen Thien Dai De. The bridge has a quite unique roof with decorative 
  structures and patterns showing a harmonious combination between Vietnamese, Chinese, Japanese, and Western 
  architectural styles.</p><p>Location: The bridge crosses the creek flowing into the Thu Bon river adjacent to 
  Nguyen Thi Minh Khai and Tran Phu streets.</p><h3><strong>5. Old House Of Tan Ky</strong></h3><p>Built nearly 200
  years ago, Tan Ky houses a typical architectural style of Hoi An townhouses with interiors divided into sections,
  each with its own function. The front of the house is the place to open the shop, the back is connected with the
  river wharf to be the place for importing and exporting goods.</p><p>The house is built by traditional materials 
  and crafted by local carpenters and masonry, so it has its own characteristic, agile, elegant and cozy, and shows 
  interaction with architecture styles in the area. On February 17, 1990, the Tan Ky Dynasty was granted as a 
  National Historic-Cultural Monument.</p><h3>&nbsp;</h3><h2><strong>How To Go There?</strong></h2><h3><strong>Travel
  To Hoi An By Air</strong></h3><p><strong>From Danang International airport.</strong> It is the closest airport to
  Hoian, located in the heart of Da Nang city. It is 30 kilometres from Hoi An.</p><p>There are many flights in and 
  out Danang airport daily. So travellers can choose with different options to Danang and then go ahead to Hoian.</p>
  <p><strong>From Chu Lai airport:</strong> This airport belongs to Quang Nam Province. It takes 1 hour and 30 
  minutes (80 km) to reach Hoian ancient town.</p><p>There are some airlines have the flights to Chu Lai airport: 
  Airlines, Vietjet Air &nbsp; Jetstar.</p><p><strong>Domestic flights:</strong> Hanoi, Ho Chi Minh.</p><p><strong>
  International flights:</strong> Bangkok, Vientiane, Beijing with Vietnam airlines, Lao airlines, China Eastern 
  Airlines, Cathay Pacific Airlines, HongKong Airlines, Singapore Airlines. Some have transit in Hanoi or Ho Chi Minh
  City.</p><h2><strong>When Is The Best Time To Go To Hoi An?</strong></h2><p>The best time to visit Hoi An is from 
  February to April every year. It rains less, the climate is pleasant. Avoid going in summer because of the high 
  temperature, very hot. The rainy season from October to November also has the disadvantage of wet space due to 
  heavy rain.</p><p>You should visit Hoi An on the 14th, the full moon of the lunar calendar to attend the old town 
  night. On this day of the full moon, all families in the old town of Hoi An will turn off the lights and light the 
  lanterns. You will have the opportunity to see firsthand the red lanterns spreading across the street, a typical
  setting of Hoi An on the occasion of the festival. Besides, the festivals, the special performances also do not 
  make you regret.</p>', NOW(), 'active'),
  ('The best time to travel to Dalat', 'DaLat-XuanHuong.jpg',
  '<h3><strong>Tourists say about Da Lat</strong></h3><p>Dalat is a dreaming and romantic city. Every time I come to 
  Dalat, I feel like being in somewhere in Europe. The immense pine forest seems like opening a poetic fairy scene.
  Sometimes, my heart is like slow down to feel the gentle breath of Dalat. You should come to Dalat once in your 
  life to be in harmony with the nature and simply to live slowly. The feeling about Dalat of a visitor.</p><h2>
  <strong>Make a self-guided trip in good quality</strong></h2><p>With my own experiences living and working in Dalat
  many years, along with the information source of travel blog for Dalat self-guided trip (the most prominent blog is 
  Andy Nguyen). This blog post can give you some information and experiences in the cheapest Dalat travel with the
  best quality and exploration as possible. You will easily travel Dalat in a self-planned and self-guided trip which
  is flexible in your schedule with the maximum savings after reading through all the useful information that is 
  detailed below. Hope you will have enjoyable travel experiences when coming to Dalat.</p><p>
  <img src=\"https://www.dalattrip.com/media/2018/08/Dalat-self-planned-travel-guide-for-a-cheap-and-saving-trip-%E2%80%93-Dalat-photo-at-night.jpg\" 
  alt=\"Dalat self-planned travel guide for a cheap and saving trip Dalat photo at night\"></p><p>Dalat self-planned 
  travel guide for a cheap and saving trip Dalat photo at night</p><h2><strong>The best time to travel to Dalat
  </strong></h2><h3><strong>For international tourists</strong></h3><p>The best time to visit Dalat is from early 
  October to March of the next year.</p><h3><strong>For domestic visitors</strong></h3><p>Dalat is always a cool 
  respite city but in the summer, it is usually rainy. The best time to travel in Dalat is July, August and September.
  </p><h2><strong>How to go to Dalat?</strong></h2><p>There are two most popular ways to go to Dalat: coach and 
  flight.</p><h3><strong>Airplane (you can save money if hunting promotion air plane tickets)</strong></h3><p>
  If you do not have much time and financial excess, this is a top priority for you. To fly to Da Lat you can go with
  low-cost airlines as Vietjetair (www.vietjetair.com) and Jetstar Pacific (www.jetstar.com) or VietnamAirlines
  (www.vietnamairlines.com). Two low-cost airlines usually have promotion tickets online. You should follow their 
  websites or register mail with them for cheap flight tickets. However, flying is always better than transfer by 
  a bus (it only takes 45 minutes for check-in and wait for only 1 hour more); driving the bus at night time, drivers
  drive very fast and you also heard accidents on the pass of Dalat. In my opinion, Vietjetair and Jetstar tickets
  have prices on average ranging from 400,000 VND to 850,000 VND which are acceptable if you compared to the bus ride
  takes up to 8 hours (+30 minutes waiting).</p><h3><strong>The high-class bus (the most economical way)</strong>
  </h3><p>From Sai Gon or the southwestern provinces, you can select one of two high-quality double-decker buses, 
  Phuong Trang and Thanh Buoi. Service time is very frequent; having a bus every a half of hour starting from 5 AM 
  to 1 AM the next morning.</p><p><strong>From other cities to Dalat</strong></p><p><strong>Phuong Trang or Thanh 
  Buoi, which one should you take?</strong></p><p>I live in Da Lat, so I find that Phuong Trang bus mainly attracts 
  the attention of domestic tourists as well as international tourists. Because Phuong Trang has an easy-to-remember 
  English name (Futabus) and they have two stations in Ho Chi Minh City &nbsp;one in District 3 and one in District 
  1, this is the tourist favorite. As for Thanh Buoi, they only have one bus station in Ho Chi Minh City that is 
  located in district 3. Meanwhile, Thanh Buoi bus has won the hearts of Da Lat people, because Thanh Buoi bus 
  quality can be considered better than Phuong Trang, they have newer bus; if being sleeping bus, the seat is more 
  comfortable than Phuong Trang\'s one.</p>',  NOW(), 'active');
  