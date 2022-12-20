--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id bigint NOT NULL,
    total_cart_price real,
    total_price real,
    user_id bigint
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_item (
    id bigint NOT NULL,
    quantity integer,
    cart_id bigint,
    product_id bigint
);


ALTER TABLE public.cart_item OWNER TO postgres;

--
-- Name: cart_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_item_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_item_seq OWNER TO postgres;

--
-- Name: cart_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_seq OWNER TO postgres;

--
-- Name: order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_item (
    id bigint NOT NULL,
    quantity integer,
    order_id bigint,
    product_id bigint
);


ALTER TABLE public.order_item OWNER TO postgres;

--
-- Name: order_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_item_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_item_seq OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    address1 character varying(255),
    address2 character varying(255),
    city character varying(255),
    country character varying(255),
    created_at timestamp(6) without time zone,
    order_notes character varying(255),
    order_status character varying(255),
    payment_status character varying(255),
    phone character varying(255),
    state character varying(255),
    total_order_price real,
    total_price real,
    zip character varying(255),
    user_id bigint NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_seq OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    brand character varying(255),
    created_at timestamp(6) without time zone,
    description character varying(255),
    images character varying(255)[],
    price real,
    thumbnail character varying(255),
    title character varying(255),
    category_id bigint
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- Name: product_category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_seq OWNER TO postgres;

--
-- Name: product_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    email character varying(255),
    full_name character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_seq OWNER TO postgres;

--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart (id, total_cart_price, total_price, user_id) VALUES (1, 13998, 13998, 1);


--
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart_item (id, quantity, cart_id, product_id) VALUES (1, 2, 1, 1);


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (1, 'Redmi', '2022-12-19 23:39:54.445', '13MP rear camera with AI portrait, AI scene recognition, HDR, pro mode | 5MP front camera. 16.58 centimeters (6.53 inch) HD+ multi-touch capacitive touchscreen with 1600 x 720 pixels resolution, 268 ppi pixel density and 20:9 aspect ratio Memory, Storage ', '{https://ik.imagekit.io/4jrxgq1gm/redmi9A1.jpg,https://ik.imagekit.io/4jrxgq1gm/redmi9A2.jpg}', 6999, 'https://ik.imagekit.io/4jrxgq1gm/redmi9A1.jpg', 'Redmi 9A (Nature Green, 2GB RAM, 32GB Storage)', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (2, 'Samsung', '2022-12-19 23:39:54.458', 'Quad Camera Setup - 64MP (F1.8) Main Camera +8MP (F2.2) Ultra Wide Camera +5MP(F2.2) Depth Camera +5MP(F2.4) Macro Camera and 32MP (F2.0) front facing Camera 6.4-inch(16.21 centimeters) Super Amoled - Infinity U Cut Display , FHD+ Resolution (2340 x 1080)', '{https://ik.imagekit.io/4jrxgq1gm/SamsungM311.jpg,https://ik.imagekit.io/4jrxgq1gm/SamsungM312.jpg}', 14999, 'https://ik.imagekit.io/4jrxgq1gm/SamsungM311.jpg', 'Samsung Galaxy M31 (Ocean Blue, 6GB RAM, 128GB Storage)', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (3, 'Apple', '2022-12-19 23:39:54.462', '6.7-inch (17 cm diagonal) Super Retina XDR display Ceramic Shield, tougher than any smartphone glass A14 Bionic chip, the fastest chip ever in a smartphone Pro camera system with 12MP Ultra Wide, Wide and Telephoto cameras; 5x optical zoom range; Night mo', '{https://ik.imagekit.io/4jrxgq1gm/iphone12M1.jpg,https://ik.imagekit.io/4jrxgq1gm/iphone12M2.jpg}', 119999, 'https://ik.imagekit.io/4jrxgq1gm/iphone12M1.jpg', 'Apple iPhone 12 Pro Max (128GB)', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (4, 'OnePlus', '2022-12-19 23:39:54.465', '64MP+8MP+2MP triple rear camera with 1080p video at 30/60 fps, 4k 30 fps | 16MP front camera with 1080p video at 30/60 fps 6.43-inch, 90Hz fluid AMOLED display with 2400 x 1080 pixels resolution | 410ppi Memory, Storage & SIM: 8GB RAM | 128GB internal mem', '{https://ik.imagekit.io/4jrxgq1gm/oneplusN1.jpg,https://ik.imagekit.io/4jrxgq1gm/oneplusN2.jpg}', 24999, 'https://ik.imagekit.io/4jrxgq1gm/oneplusN1.jpg', 'OnePlus Nord CE 5G (Charcoal Ink, 8GB RAM, 128GB Storage)', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (5, 'Jio', '2022-12-19 23:39:54.469', '2MP rear and 0.3MP front camera Internal Storage 4GB 1500mAh battery Access to Jio apps 1 cr+ songs with JioMusic, 6000+ movies with JioCinema ', '{https://ik.imagekit.io/4jrxgq1gm/jioPhone1.jpg,https://ik.imagekit.io/4jrxgq1gm/jioPhone2.jpg}', 1999, 'https://ik.imagekit.io/4jrxgq1gm/jioPhone1.jpg', 'Jio Phone 3 (Black, 4 MB RAM, 4GB Storage)', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (6, 'Realme', '2022-12-19 23:39:54.473', '6 GB RAM | 128 GB ROM | Expandable Upto 256 GB 16.51 cm (6.5 inch) Full HD+ Display 48MP + 2MP + 2MP | 16MP Front Camera 5000 mAh Battery MediaTek Helio G95 Processor ', '{https://ik.imagekit.io/4jrxgq1gm/realmeNazro1.jpg,https://ik.imagekit.io/4jrxgq1gm/realmeNazro2.jpg}', 14999, 'https://ik.imagekit.io/4jrxgq1gm/realmeNazro1.jpg', 'realme narzo 30 (Racing Blue, 6GB RAM, 128GB Storage)', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (7, 'Oppo', '2022-12-19 23:39:54.477', '6.51'' Inch (16.5cm) HD+ Puch-hole Display with 1600x720 pixels. Larger screen to body ratio of 89.2%.|Side Fingerprint Sensor. MediaTek Helio P35 GPU IMG GE8320 @ 680 MHz| Powerful 2.3 GHz Octa-core processor, support LPDDR4X memory 13MP Quad Camera ( 13M', '{https://ik.imagekit.io/4jrxgq1gm/oppophone1.jpg,https://ik.imagekit.io/4jrxgq1gm/oppophone2.jpg}', 15490, 'https://ik.imagekit.io/4jrxgq1gm/oppophone1.jpg', 'OPPO A54 (Starry Blue, 4GB RAM, 128GB Storage)', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (8, 'Vivo', '2022-12-19 23:39:54.48', '48+8+2+2MP rear camera | 32MP front camera Front camera Memory, Storage & SIM: 8GB RAM, 128GB internal memory | Dual SIM (nano+nano) dual-standby (4G+4G) Android v9 based on OS 9.1 operating system with Qualcomm Snapdragon 665AIE octa core processor 1 yea', '{https://ik.imagekit.io/4jrxgq1gm/vivo1.jpg}', 29999, 'https://ik.imagekit.io/4jrxgq1gm/vivo1.jpg', 'Vivo S1 Pro (Jazzy Blue, 8GB RAM, 128GB Storage)', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (9, 'Mi', '2022-12-19 23:39:54.485', 'Processor: Qualcomm Snapdragon 870 5G with Kryo 585 Octa-core; 7nm process; Up to 3.2GHz clock speed; Liquidcool technology Camera: 48 MP Triple Rear camera with 8MP Ultra-wide and 5MP Super macro | 20 MP Front camera Display: 120Hz high refresh rate FHD+', '{https://ik.imagekit.io/4jrxgq1gm/miphone1.jpg}', 31999, 'https://ik.imagekit.io/4jrxgq1gm/miphone1.jpg', 'Mi 11X 5G Cosmic Black 8GB RAM 128GB ROM', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (10, 'Apple', '2022-12-19 23:39:54.488', '6.1-inch (15.5 cm diagonal) Liquid Retina HD LCD display Water and dust resistant (1 meter for up to 30 minutes, IP67) Single 12MP Wide camera with Portrait mode, Portrait Lighting, Depth Control, Smart HDR, and 4K video up to 60fps 7MP TrueDepth front ca', '{https://ik.imagekit.io/4jrxgq1gm/iphonXR1.jpg,https://ik.imagekit.io/4jrxgq1gm/iphonXR2.jpg}', 41999, 'https://ik.imagekit.io/4jrxgq1gm/iphonXR1.jpg', 'Apple iPhone XR (64GB) - White', 1);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (11, 'Men', '2022-12-19 23:39:54.492', 'Size: Medium Color name: Light Ceramic Material: Cotton Pattern: Solid Long Sleeve ', '{https://ik.imagekit.io/4jrxgq1gm/shirt.jpg}', 549, 'https://ik.imagekit.io/4jrxgq1gm/shirt.jpg', 'AEROPOSTALE Men''s Casual Shirt', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (12, 'Women', '2022-12-19 23:39:54.495', 'Saree Color: Beige and Red Saree Fabric: Khadi Silk Wash Care: Dry Clean for the first time ', '{https://ik.imagekit.io/4jrxgq1gm/saaree.jpg}', 299, 'https://ik.imagekit.io/4jrxgq1gm/saaree.jpg', 'ANNI DESIGNER Khadi Silk with Blouse Piece Saree', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (13, 'Women', '2022-12-19 23:39:54.5', 'Fit Type: Regular Fit Fabric Type: Cotton Pattern name: Solid Closure Type: Pull On Sleeve Type: Short Sleeve; Collar Style: Collarless ', '{https://ik.imagekit.io/4jrxgq1gm/womentop.jpg}', 449, 'https://ik.imagekit.io/4jrxgq1gm/womentop.jpg', 'Women''s Stylish Plain Up and Down Cotton Tshirt', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (14, 'Kids', '2022-12-19 23:39:54.505', 'Fit Type: Regular Fabric: Made by high quality natural skin friendly 100% tested cotton fabrics ', '{https://ik.imagekit.io/4jrxgq1gm/kidvest1.jpg,https://ik.imagekit.io/4jrxgq1gm/kidvest2.jpg}', 499, 'https://ik.imagekit.io/4jrxgq1gm/kidvest1.jpg', 'Unisex-Baby Regular Vest (100% Cotton)', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (15, 'Men', '2022-12-19 23:39:54.508', 'Size: 34 Fit Type: Relaxed; Occasion: Casual Material: Cotton Color: Dark Blue ', '{https://ik.imagekit.io/4jrxgq1gm/mensjeans.jpg}', 698, 'https://ik.imagekit.io/4jrxgq1gm/mensjeans.jpg', 'Ben Martin Men''s Regular Fit Denim Jeans', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (16, 'Men', '2022-12-19 23:39:54.513', 'Size: 34 Care Instructions: Machine Wash Fit Type: Regular Style Name: Polo Model Name: Team Polo Brand Color: Puma White ', '{https://ik.imagekit.io/4jrxgq1gm/pumatshirt1.jpg,https://ik.imagekit.io/4jrxgq1gm/pumatshirt2.jpg}', 899, 'https://ik.imagekit.io/4jrxgq1gm/pumatshirt1.jpg', 'Puma Men''s Regular T-Shirt @899', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (17, 'Kids', '2022-12-19 23:39:54.515', 'SIZE: 70cm, Fits for AGE: 0-6 Months Premium Flannel Material: The Baby Costumes with Panda Hat are Crafted in soft flannel material that has a napped finish on both sides, high absorbent and breathable, cozy feel of this baby Pajamas to keep little baby ', '{https://ik.imagekit.io/4jrxgq1gm/babycostume.jpg}', 1299, 'https://ik.imagekit.io/4jrxgq1gm/babycostume.jpg', 'Unisex Baby Infant Kids Costume Flannel Jumpsuit Panda Style Cosplay Clothes Bunting Outfits Snowsuit Hooded Romper Outwear', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (18, 'Kids', '2022-12-19 23:39:54.521', 'Color: White Occassion: Wedding, Party, Ceremony, Festival Kurta Pyjama For Boys ', '{https://ik.imagekit.io/4jrxgq1gm/kidkurtha.jpg}', 449, 'https://ik.imagekit.io/4jrxgq1gm/kidkurtha.jpg', 'Festive & Party Kurta Pyjama Set for Baby Boys (WKP)', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (19, 'Women', '2022-12-19 23:39:54.524', 'Fit Type: Regular Fabric: Cambric Cotton 60x60 Salwar Suits: Straight Kurta Pant And Solid Dupatta Set ', '{https://ik.imagekit.io/4jrxgq1gm/womenkurtha.jpg}', 1049, 'https://ik.imagekit.io/4jrxgq1gm/womenkurtha.jpg', 'Women''s Cotton Straight Kurta Pant With Dupatta Set', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (20, 'Women', '2022-12-19 23:39:54.529', 'Fit Type: Regular A fully stitched blouse with short sleeves Traditional Patola printed silky polyester blouse with cotton lining Sizes available are 34(XXS) TO 42 ( XL). Size 38 is S size which has a bust size of 38'' all round The front has a boat neck a', '{https://ik.imagekit.io/4jrxgq1gm/womenblouse.jpg}', 749, 'https://ik.imagekit.io/4jrxgq1gm/womenblouse.jpg', 'Studio Shringaar Women''s Green Pink Patola Printed Saree Blouse', 3);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (21, 'Bath and Body', '2022-12-19 23:39:54.534', 'Quantity: 800 ml Nourishes deep into the surface layers of the skin Mild, gentle formula is kind to your skin. Ideal For Men & Women Dove body wash is better than milk ', '{https://ik.imagekit.io/4jrxgq1gm/dovebodylotion.jpg}', 324, 'https://ik.imagekit.io/4jrxgq1gm/dovebodylotion.jpg', 'Dove Deeply Nourishing Body Wash', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (22, 'Fragrance', '2022-12-19 23:39:54.537', 'Quantity: 150ml Item Form: Spray Skin Type: All Skin Types For: Men ', '{https://ik.imagekit.io/4jrxgq1gm/parkavenueperfume.jpg}', 159, 'https://ik.imagekit.io/4jrxgq1gm/parkavenueperfume.jpg', 'Park Avenue Good Morning Perfume Intense Body Spray, 150ml', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (23, 'Fragrance', '2022-12-19 23:39:54.542', 'Quantity: 150ml Item Form: Spray Skin Type: All Skin Types For: Men The optimal combination of reliable deodorant protection and Nivea care ', '{https://ik.imagekit.io/4jrxgq1gm/fragrancedeonevia.jpg}', 299, 'https://ik.imagekit.io/4jrxgq1gm/fragrancedeonevia.jpg', 'NIVEA Men Deodorant Fresh Active Original, 150ml', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (24, 'Skin Care', '2022-12-19 23:39:54.546', 'Quantity: 150ml Skin Type: All Skin Types Bioacitve-rich with pure Apple Cider Vinegar, Aloe Vera Extract and Vitamins B5 & E PREVENTS future breakouts and REDUCES active breakouts using natural NOT chemical ingredients ', '{https://ik.imagekit.io/4jrxgq1gm/wowskincare.jpg}', 359, 'https://ik.imagekit.io/4jrxgq1gm/wowskincare.jpg', 'WOW Skin Science Apple Cider Vinegar Foaming Face Wash, 150ml', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (25, 'Hair Care', '2022-12-19 23:39:54.55', 'Quantity: 600ml Hair Type: All Item Form: Oil Nothing but 100% pure coconut oil Made with the finest hand-picked & naturally sun dried coconuts Contains no added preservatives or chemicals. Sulfate Free ', '{https://ik.imagekit.io/4jrxgq1gm/coconutoil.jpg}', 227, 'https://ik.imagekit.io/4jrxgq1gm/coconutoil.jpg', 'Parachute jumbo pack 100% pure coconut oil, 600ml', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (26, 'Skin Care', '2022-12-19 23:39:54.555', 'Quantity: 250ml Skin Type: Dry Scent: Rose Ingredients: Rose Extract. Is there anything classier than a bunch of roses? We use extract from English roses for their impossibly sweet smell. Package Type: Bottle ', '{https://ik.imagekit.io/4jrxgq1gm/roseShowerGel.jpg}', 345, 'https://ik.imagekit.io/4jrxgq1gm/roseShowerGel.jpg', 'The Body Shop British Rose Shower Gel, 250ml', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (27, 'Skin Care', '2022-12-19 23:39:54.56', 'Quantity: 400ml Skin Type: All Item Form: Lotion Ingredients: Glycerin Package Type: Bottle Daily body lotion best for: dry skin, rough skin ', '{https://ik.imagekit.io/4jrxgq1gm/vaslinebodylotion.jpg,https://ik.imagekit.io/4jrxgq1gm/vaslinebodylotion2.jpg}', 276, 'https://ik.imagekit.io/4jrxgq1gm/vaslinebodylotion.jpg', 'Vaseline Intensive Care Deep Moisture Body Lotion, 400ml', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (28, 'Hair Care', '2022-12-19 23:39:54.563', 'Hair Type: All SteamPod 3.0 by L''Or├⌐al Professionnel is the 3rd generation of the original patented professional steam hair straightener & styling tool. 2x faster & 2x smoother styling vs a regular straightener. 91% less damage vs a regular straightener a', '{https://ik.imagekit.io/4jrxgq1gm/Straightener1.jpg,https://ik.imagekit.io/4jrxgq1gm/Straightener2.jpg}', 24800, 'https://ik.imagekit.io/4jrxgq1gm/Straightener1.jpg', 'L''Or├⌐al Professionnel Steampod 3.0 Steam Hair Straightener & Styling Tool', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (29, 'Makeup', '2022-12-19 23:39:54.567', 'Smudge proof and convenient twist- up format for deep stroke Water proof, lasts up to 22 hrs It is dermatologically tested and is safe for the eyes Easy twist up format Can be used water line and eye lids Deep black finish ', '{https://ik.imagekit.io/4jrxgq1gm/kajal1.jpg,https://ik.imagekit.io/4jrxgq1gm/kajal2.jpg}', 268, 'https://ik.imagekit.io/4jrxgq1gm/kajal1.jpg', 'Lakm├⌐ Eyeconic Kajal Twin Pack, Smudge Proof, Water Proof', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (30, 'Makeup', '2022-12-19 23:39:54.571', 'Brand: O.P.I Colour: You''re Such a Budapest Finish Type: Glossy A vivacious chianti Nail Polish that shade will draw gazes with pearly, opalescent coverage. ', '{https://ik.imagekit.io/4jrxgq1gm/nailpolsih1.jpg,https://ik.imagekit.io/4jrxgq1gm/nailpolsih2.jpg}', 850, 'https://ik.imagekit.io/4jrxgq1gm/nailpolsih1.jpg', 'O.P.I Nail Lacquer, You''re Such a Budapest, 15ml', 4);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (31, 'Office Chair', '2022-12-19 23:39:54.576', 'Furniture Base: Swivel Color: Black Frame Material: Nylon Base dimension-24'', Seat dimension - 18''x18'' 1 year warranty against breakage DIY assembly ', '{https://ik.imagekit.io/4jrxgq1gm/officechairumbrella.jpg}', 3199, 'https://ik.imagekit.io/4jrxgq1gm/officechairumbrella.jpg', 'Umbrella Base Office Chair (Standard, Black)', 5);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (32, 'Desk', '2022-12-19 23:39:54.581', 'Item Dimensions: 103 x 40 x 73 Centimeters Material: Engineered Wood Study Table Desk Without Keyboard Shelf For home and office ', '{https://ik.imagekit.io/4jrxgq1gm/desk.jpg}', 3775, 'https://ik.imagekit.io/4jrxgq1gm/desk.jpg', 'Wood Study Desk(Wenge Finish,Wenge)', 5);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (33, 'Beds', '2022-12-19 23:39:54.584', 'Size: King Size Item Dimensions: 186 x 215 x 100.5 Centimeters Material: Engineered Wood Frame is made of Particle board which is produced by compressing wood dust, glue and resin. The chips in the surface layer are thinner than those in the middle layer,', '{https://ik.imagekit.io/4jrxgq1gm/bedwithstorage.jpg}', 21950, 'https://ik.imagekit.io/4jrxgq1gm/bedwithstorage.jpg', 'King Size Sliding Door Bed with Box Storage', 5);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (34, 'Sofas', '2022-12-19 23:39:54.59', 'Seating Capacity: Five Seat Seat filling: Foam with spring Item Dimensions: Length (184 cm), Width (92 cm), Height (88 cm) Material: Engineered Wood, Fabric and Polyester Warranty: 1 year on product ', '{https://ik.imagekit.io/4jrxgq1gm/sofa1.jpg}', 32899, 'https://ik.imagekit.io/4jrxgq1gm/sofa1.jpg', 'Home Centre Emily Fabric 5 Seater Sectional Sofa Set (Beige)', 5);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (35, 'Wardrobes', '2022-12-19 23:39:54.593', 'Seating Capacity: Five Seat Seat filling: Foam with spring Item Dimensions: Length (184 cm), Width (92 cm), Height (88 cm) Material: Engineered Wood, Fabric and Polyester Warranty: 1 year on product ', '{https://ik.imagekit.io/4jrxgq1gm/wardrobe1.jpg}', 9089, 'https://ik.imagekit.io/4jrxgq1gm/wardrobe1.jpg', 'Solimo Pyxis Engineered Wood Wardrobe Mahogany, 2 Doors', 5);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (50, 'Historical', '2022-12-19 23:39:54.681', 'As the right wing tries to claim Kabir for itself, while other conservatives disown him and yet others portray him as a secular idol beyond religion, the poet has never been so misunderstood. Coming from the Nirgun bhakti tradition, the words of this fift', '{https://ik.imagekit.io/4jrxgq1gm/kabirkabir.jpg}', 431, 'https://ik.imagekit.io/4jrxgq1gm/kabirkabir.jpg', 'Kabir: The life and work of the early modern poet', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (36, 'HP', '2022-12-19 23:39:54.598', 'Display: 15.6-inch FHD (1920 x 1080), IPS, micro-edge, anti-glare, 250 nits, 45% NTSC Processor: AMD ΓÇÄRyzen 3 Processor Speed: ΓÇÄ2.6 GHz RAM Size: ΓÇÄ8 GB Hard Drive Size: 1 TB Graphics Chipset: AMD Radeon Vega 6 Graphics Operating System: ΓÇÄWindows 10 Home ', '{https://ik.imagekit.io/4jrxgq1gm/studentLaptophp1.jpg,https://ik.imagekit.io/4jrxgq1gm/studentLaptophp2.jpg}', 37590, 'https://ik.imagekit.io/4jrxgq1gm/studentLaptophp1.jpg', 'HP 15 (2021) Thin & Light Ryzen 3-3250 Laptop, 8 GB RAM, 1TB HDD, 39.62 cms (15.6`) FHD Screen, Windows 10, MS Office (15s-gr0011AU)', 6);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (37, 'Dell', '2022-12-19 23:39:54.603', 'Processor:11th Generation Intel Core i3-1115G4 Processor (6MB Cache, up to 4.1 GHz) Memory & Storage: 4GB, 4Gx1, DDR4, 2666MHz | 256GB M.2 PCIe NVMe Solid State Drive Display: 15.6-inch FHD (1920 x 1080) Anti-glare LED Backlight Narrow Border WVA Display ', '{https://ik.imagekit.io/4jrxgq1gm/travelLaptop1.jpg,https://ik.imagekit.io/4jrxgq1gm/travelLaptop2.jpg}', 38890, 'https://ik.imagekit.io/4jrxgq1gm/travelLaptop1.jpg', 'Dell Inspiron 3501 15.6` FHD Display Laptop (i3-1115G4 / 4GB / 256GB SSD / Integrated Graphics / Win10 + MSO / Accent Black)', 6);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (38, 'Lenovo', '2022-12-19 23:39:54.606', 'Processor: 10th Gen Intel Core i5-1035G1 | Speed: 1.0 GHz (Base) - 3.6 GHz (Max) | 4 Cores | 6MB Cache OS: Pre-Loaded Windows 10 Home with Lifetime Validity Pre-Installed: MS Office Home and Student 2019 Memory and Storage: 8GB RAM DDR4-2666, Upgradable u', '{https://ik.imagekit.io/4jrxgq1gm/codingLaptop1.jpg}', 57200, 'https://ik.imagekit.io/4jrxgq1gm/codingLaptop1.jpg', 'Lenovo IdeaPad Slim 3 10th Gen Intel Core i5 15.6` (39.62cms) Full HD IPS Thin and Light Laptop (8GB/512GB SSD/Windows 10/MS Office 2019/Fingerprint Reader/Platinum Grey/1.85Kg)', 6);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (39, 'Asus', '2022-12-19 23:39:54.611', 'Processor: AMD Ryzen 9 4900HS Processor, 3.0 GHz (8MB Cache, up to 4.3 GHz, 8 Cores, 16 Threads) Memory: 16GB (2x 8GB) DDR4 3200MHz Dual-Channel RAM, Upgradeable up to 24GB using 1x SO-DIMM Slot Storage: 1TB M.2 NVMe PCIe 3.0 SSD Graphics: Dedicated NVIDI', '{https://ik.imagekit.io/4jrxgq1gm/gamingLaptop1.jpg,https://ik.imagekit.io/4jrxgq1gm/gamingLaptop2.jpg}', 111990, 'https://ik.imagekit.io/4jrxgq1gm/gamingLaptop1.jpg', 'ASUS ROG Zephyrus G14, 14` (35.56 cms) QHD, Ryzen 9 4900HS, GTX 1660Ti Max-Q 6GB GDDR6 Graphics, Gaming Laptop (16GB/1TB SSD/MS Office 2019/Windows 10/ White/Anime Matrix/1.7 Kg)', 6);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (40, 'Apple', '2022-12-19 23:39:54.615', 'Processor: Ninth-generation 8-core Intel Core i9 processor Memory: Stunning 40.65cm (16-inch) Retina display with True Tone technology Storage: 1TB M.2 NVMe PCIe 3.0 SSD Graphics: AMD Radeon Pro 5500M graphics with GDDR6 memory Display: Stunning 40.65cm (', '{https://ik.imagekit.io/4jrxgq1gm/appleLaptop1.jpg,https://ik.imagekit.io/4jrxgq1gm/appleLaptop2.jpg}', 215490, 'https://ik.imagekit.io/4jrxgq1gm/appleLaptop1.jpg', 'Apple MacBook Pro 2019 (16-inch/40.65 cm, 16GB RAM, 1TB Storage, 2.3GHz 9th Gen Intel Core i9) - Space Grey', 6);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (41, 'Fiction', '2022-12-19 23:39:54.619', 'A renowned inspirational fiction, The Monk Who Sold His Ferrari is a revealing story that offers the readers a simple yet profound way to live life. The plot of this story revolves around Julian Mantle, a lawyer who has made his fortune and name in the pr', '{https://ik.imagekit.io/4jrxgq1gm/monksoldhisferrari.jpg}', 159, 'https://ik.imagekit.io/4jrxgq1gm/monksoldhisferrari.jpg', 'The Monk Who Sold His Ferrari', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (42, 'Historical', '2022-12-19 23:39:54.625', 'The Immortals of Meluha is a series of short stories by the Indian author, K. S. Shukla, that tell the story of the Immortals of Meluha, who are the most powerful and powerful figures in the history of the Indian subcontinent. ', '{https://ik.imagekit.io/4jrxgq1gm/meluha.jpg}', 299, 'https://ik.imagekit.io/4jrxgq1gm/meluha.jpg', 'The Immortals of Meluha (Shiva Trilogy)', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (43, 'Romance', '2022-12-19 23:39:54.631', 'Wuthering Heights is a story of love, hate, social status, and revenge set in the moorlands of Northern England at the end of the 18th century. The novel follows the repercussions of the ill-fated love between the impetuous, strong-willed protagonists Cat', '{https://ik.imagekit.io/4jrxgq1gm/Wuthering.jpg}', 69, 'https://ik.imagekit.io/4jrxgq1gm/Wuthering.jpg', 'Wuthering Heights (Emily Bront├½)', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (44, 'Mystery', '2022-12-19 23:39:54.636', 'αñ╕αñ╛αñ░αñªαÑçαñéαñªαÑü αñ¼αñéαñªαÑìαñ»αÑïαñ¬αñ╛αñºαÑìαñ»αñ╛αñ» αñòαÑÇ αñ╡αñ┐αñ╢αñ┐αñ╖αÑìαñƒαññαñ╛ αñëαñ¿αñòαÑç αñ£αñ╛αñ╕αÑéαñ╕αÑÇ αñ▓αÑçαñûαñ¿ αñòαÑç αñàαññαñ┐αñ░αñ┐αñòαÑìαññ αñëαñ¿αñòαÑÇ αñàαñªαÑìαñ╡αñ┐αññαÑÇαñ» αñ▓αÑçαñûαñ¿-αñ╢αÑêαñ▓αÑÇ αñòαÑç αñ╕αñ╛αñÑ-αñ╕αñ╛αñÑ αñëαñ¿αñòαÑç αñÜαñ░αñ┐αññαÑìαñ░αÑïαñé αñòαñ╛ αñ╕αÑéαñòαÑìαñ╖αÑìαñ« αñ£αÑÇαñ╡αñéαññ αñÜαñ┐αññαÑìαñ░αñú αñ╣αÑêαÑñ αñ¼αÑÇαñ╕αñ╡αÑÇαñé αñ╕αñªαÑÇ αñòαÑç αñ¬αÑìαñ░αñ╛αñ░αñéαñ¡ αñòαÑç αñ¼αñéαñùαñ╛αñ▓ αñ«αÑçαñé αñ▓αÑçαñûαñò αñöαñ░ αñ¬αñ╛αñáαñò αñ╕αñ«αñ╛αñ¿ αñ░αÑéαñ¬ αñ╕αÑç αñàαñ¬αñ░αñ╛αñº αñöαñ░ αñ£αñ╛αñ╕αÑéαñ╕αÑÇ αñ╕αñ╛αñ╣αñ┐αññαÑìαñ» αñòαÑï αñ¿αÑÇαñÜαÑÇ αñ¿αñ┐αñùαñ╛αñ╣αÑïαñé αñ╕αÑç αñªαÑçαñûαññαÑç αñÑαÑçαÑñ ', '{https://ik.imagekit.io/4jrxgq1gm/bumkeshbakshi.jpg}', 139, 'https://ik.imagekit.io/4jrxgq1gm/bumkeshbakshi.jpg', 'Byomkesh Bakshi ki Rahasyamayi Kahaniyan', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (45, 'Historical', '2022-12-19 23:39:54.642', 'The story follows the main character Elizabeth Bennet as she deals with issues of manners, upbringing, morality, education, and marriage in the society of the landed gentry of early 19th-century England. Elizabeth is the second of five daughters of countr', '{https://ik.imagekit.io/4jrxgq1gm/prideandprejudice.jpg}', 79, 'https://ik.imagekit.io/4jrxgq1gm/prideandprejudice.jpg', 'Pride and Prejudice', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (46, 'Humour', '2022-12-19 23:39:54.65', 'A phenomenon across all formats, this 42nd anniversary paperback omnibus contains the complete Hitchhiker''s Guide trilogy in five parts, charting the whole of Arthur Dent''s odyssey through space and time. Share and enjoy. Collected together in this omnibu', '{https://ik.imagekit.io/4jrxgq1gm/guidetogalaxy.jpg}', 507, 'https://ik.imagekit.io/4jrxgq1gm/guidetogalaxy.jpg', 'The Ultimate Hitchhiker''s Guide to the Galaxy: The Complete Trilogy in Five Parts', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (47, 'Humour', '2022-12-19 23:39:54.658', 'Green Humour For A Greying Planet is a curation of gag cartoons and comic strips based exclusively on wildlife and nature, perhaps the first of its kind. At a time when global warming, wildlife crimes and man-animal conflicts are at their worst, ''Green Hu', '{https://ik.imagekit.io/4jrxgq1gm/greyhumour.jpg}', 258, 'https://ik.imagekit.io/4jrxgq1gm/greyhumour.jpg', 'Green Humour for a Greying Planet', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (48, 'Historical', '2022-12-19 23:39:54.664', 'Sunderkand, believed to be the most beautiful (Sunder) part of the Ramayana, describes Lord Hanuman journey to Lanka. This book elucidates his pristine lifestyle, following which brings karmic and spiritual knowledge and bhakti (devotion) in oneΓÇÖs life. I', '{https://ik.imagekit.io/4jrxgq1gm/sunderkand.jpg}', 99, 'https://ik.imagekit.io/4jrxgq1gm/sunderkand.jpg', 'Sunderkand (Hindi) - Goswami Tulsidas', 2);
INSERT INTO public.product (id, brand, created_at, description, images, price, thumbnail, title, category_id) VALUES (49, 'Poetry', '2022-12-19 23:39:54.673', 'Reading books is a kind of enjoyment. Reading books is a good habit. We bring you a different kinds of books. You can carry this book where ever you want. It is easy to carry. It can be an ideal gift to yourself and to your loved ones. Care instruction ke', '{https://ik.imagekit.io/4jrxgq1gm/phirmeriyaad.jpg}', 159, 'https://ik.imagekit.io/4jrxgq1gm/phirmeriyaad.jpg', 'Phir Meri Yaad - Hindi - Kumar Vishwas', 2);


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_category (id, name) VALUES (1, 'Mobiles');
INSERT INTO public.product_category (id, name) VALUES (2, 'Books');
INSERT INTO public.product_category (id, name) VALUES (3, 'Clothings');
INSERT INTO public.product_category (id, name) VALUES (4, 'Beauty');
INSERT INTO public.product_category (id, name) VALUES (5, 'Furniture');
INSERT INTO public.product_category (id, name) VALUES (6, 'Laptops');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, created_at, email, full_name, password) VALUES (1, '2022-12-19 23:54:50.315', 'test@test.com', 'Test User', '$2a$10$2.0Se3phwxIhN2LIgzcbVOT318B2jBt660Imgy45utW12yH/6RZrS');


--
-- Name: cart_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_item_seq', 1, true);


--
-- Name: cart_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_seq', 1, true);


--
-- Name: order_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_item_seq', 1, false);


--
-- Name: orders_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_seq', 1, false);


--
-- Name: product_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_seq', 51, true);


--
-- Name: product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_seq', 51, true);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_seq', 1, true);


--
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: cart_item fk1uobyhgl1wvgt1jpccia8xxs3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT fk1uobyhgl1wvgt1jpccia8xxs3 FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: orders fk32ql8ubntj5uh44ph9659tiih; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk32ql8ubntj5uh44ph9659tiih FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: order_item fk551losx9j75ss5d6bfsqvijna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk551losx9j75ss5d6bfsqvijna FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product fk5cypb0k23bovo3rn1a5jqs6j4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk5cypb0k23bovo3rn1a5jqs6j4 FOREIGN KEY (category_id) REFERENCES public.product_category(id);


--
-- Name: cart fkg5uhi8vpsuy0lgloxk2h4w5o6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fkg5uhi8vpsuy0lgloxk2h4w5o6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: cart_item fkjcyd5wv4igqnw413rgxbfu4nv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT fkjcyd5wv4igqnw413rgxbfu4nv FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: order_item fkt4dc2r9nbvbujrljv3e23iibt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fkt4dc2r9nbvbujrljv3e23iibt FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

