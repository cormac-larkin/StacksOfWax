-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 04:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stacks_of_wax`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `name`) VALUES
(25, 'Ace Of Base'),
(26, 'Adele'),
(27, 'Amy Winehouse'),
(28, 'Arctic Monkeys'),
(29, 'Ariana Grande'),
(30, 'Beyonce'),
(31, 'Billie Eilish'),
(32, 'Bjork'),
(33, 'Black Sabbath'),
(34, 'Blind Faith'),
(35, 'Boston'),
(36, 'Britney Spears'),
(37, 'Bruno Mars'),
(38, 'Bryan Adams'),
(39, 'BTS'),
(40, 'Coldplay'),
(41, 'Cream'),
(42, 'Creedence Clearwater Revival'),
(43, 'Aaliyah'),
(44, 'AC/DC'),
(45, 'Aerosmith'),
(46, 'Alanis Morissette'),
(47, 'Alicia Keys'),
(48, 'Avicii'),
(49, 'Bob Dylan'),
(50, 'Bob Marley'),
(51, 'Bon Jovi'),
(52, 'Bruce Springsteen'),
(53, 'David Bowie'),
(54, 'Elton John'),
(55, 'Elvis Presley'),
(56, 'Foo Fighters'),
(57, 'George Michael'),
(58, 'Guns N\' Roses'),
(59, 'Imagine Dragons'),
(60, 'Janet Jackson'),
(61, 'Led Zeppelin'),
(62, 'Linkin Park'),
(63, 'Meat Loaf'),
(64, 'Nirvana'),
(65, 'Nickelback'),
(66, 'Oasis'),
(67, 'Paul Simon'),
(68, 'Paul McCartney'),
(69, 'Phil Collins'),
(70, 'Pink Floyd'),
(71, 'Metallica'),
(72, 'Shakira'),
(73, 'Will.i.am'),
(74, 'ZZ Top'),
(75, '50 Cent'),
(76, 'Rick Ross'),
(77, 'Wu-Tang Clan'),
(78, 'Eminem'),
(79, 'Dr. Dre'),
(80, 'Snoop Dogg'),
(81, 'Ice-Cube'),
(82, 'Aphex Twin'),
(83, 'Eric Clapton'),
(84, 'B.B. King');

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `collection_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`collection_id`, `name`, `timestamp`, `user_id`) VALUES
(18, 'Classics', '2023-04-18', 39),
(19, 'All-Time Classics', '2023-04-18', 39),
(20, '80\'s & 90\'s Rock Classics', '2023-04-19', 39),
(21, 'Cormac\'s Greatest Hits', '2023-04-19', 39),
(22, 'My Childhood Favourites', '2023-04-20', 39),
(23, 'Joe\'s Collection', '2023-04-20', 41),
(24, 'Winter Tunes', '2023-04-20', 39),
(25, 'Hip Hop Favourites', '2023-04-20', 41),
(26, 'Summer 2023 Playlist', '2023-04-21', 41),
(42, 'Renamed Collection', '2023-04-22', 42),
(43, 'Bob\'s Collection', '2023-04-25', 42),
(44, 'Best Of The 00\'s', '2023-04-25', 44),
(45, 'Dancefloor Fillers', '2023-04-25', 44),
(46, 'Mary\'s Pop Hits', '2023-04-25', 45),
(47, 'My renamed hits', '2023-04-25', 47);

-- --------------------------------------------------------

--
-- Table structure for table `collection_vinyl`
--

CREATE TABLE `collection_vinyl` (
  `collection_vinyl_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `vinyl_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collection_vinyl`
--

INSERT INTO `collection_vinyl` (`collection_vinyl_id`, `collection_id`, `vinyl_id`) VALUES
(62, 18, 35),
(63, 18, 30),
(64, 18, 32),
(65, 18, 21),
(66, 18, 44),
(67, 18, 43),
(68, 18, 36),
(69, 19, 38),
(70, 19, 24),
(71, 19, 29),
(72, 19, 40),
(73, 19, 42),
(74, 20, 34),
(75, 20, 41),
(76, 20, 28),
(77, 20, 32),
(78, 20, 44),
(79, 20, 43),
(80, 20, 42),
(81, 20, 36),
(82, 21, 39),
(83, 21, 35),
(84, 21, 33),
(85, 21, 28),
(86, 21, 26),
(87, 21, 30),
(88, 21, 24),
(89, 21, 44),
(90, 21, 43),
(91, 21, 36),
(92, 22, 39),
(93, 22, 34),
(94, 22, 28),
(95, 22, 49),
(96, 22, 59),
(97, 23, 53),
(98, 23, 48),
(99, 23, 35),
(100, 23, 33),
(101, 23, 49),
(102, 23, 59),
(103, 23, 31),
(104, 23, 68),
(105, 23, 55),
(106, 24, 34),
(107, 24, 45),
(108, 24, 53),
(109, 24, 27),
(110, 24, 25),
(111, 25, 47),
(112, 25, 70),
(113, 25, 51),
(114, 25, 52),
(115, 25, 50),
(116, 25, 46),
(117, 25, 58),
(118, 26, 53),
(119, 26, 27),
(120, 26, 25),
(121, 26, 41),
(122, 26, 37),
(123, 26, 48),
(124, 26, 35),
(125, 26, 33),
(126, 26, 28),
(192, 42, 39),
(193, 42, 72),
(194, 42, 34),
(195, 43, 73),
(196, 43, 34),
(197, 43, 45),
(198, 43, 77),
(199, 43, 27),
(200, 43, 25),
(201, 43, 55),
(202, 43, 38),
(203, 43, 63),
(204, 43, 65),
(205, 44, 53),
(206, 44, 27),
(207, 44, 37),
(208, 44, 48),
(209, 44, 38),
(210, 44, 65),
(211, 44, 69),
(212, 44, 23),
(213, 44, 70),
(214, 44, 71),
(215, 44, 50),
(216, 45, 39),
(217, 45, 45),
(218, 45, 31),
(219, 45, 65),
(220, 45, 78),
(221, 45, 30),
(222, 45, 74),
(223, 45, 36),
(224, 45, 76),
(225, 45, 58),
(226, 46, 45),
(227, 46, 65),
(228, 46, 69),
(229, 46, 64),
(230, 46, 67),
(231, 46, 57),
(232, 46, 75),
(233, 46, 74),
(234, 46, 76),
(235, 46, 66),
(236, 47, 73),
(237, 47, 39),
(238, 47, 72),
(239, 47, 34),
(240, 47, 45),
(241, 47, 77);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `name`) VALUES
(34, 'Pop'),
(35, 'Rock'),
(36, 'Punk'),
(37, 'Metal'),
(38, 'Jazz'),
(39, 'Blues'),
(40, 'Electronic'),
(41, 'Dance'),
(42, 'Folk'),
(43, 'Acoustic'),
(44, 'Hip-Hop'),
(45, 'Country'),
(46, 'Funk'),
(47, 'Reggae'),
(48, 'Alternative'),
(49, 'Experimental'),
(50, 'Hard-Rock'),
(51, 'Rap');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `timestamp`, `user_id`, `collection_id`) VALUES
(62, '2023-04-20 11:21:38', 39, 19),
(63, '2023-04-20 11:22:39', 39, 20),
(64, '2023-04-20 11:23:05', 41, 20),
(65, '2023-04-20 11:23:12', 41, 22),
(66, '2023-04-20 11:43:28', 41, 23),
(67, '2023-04-20 11:44:34', 39, 23),
(68, '2023-04-20 14:59:32', 41, 25),
(69, '2023-04-21 15:03:32', 41, 26),
(72, '2023-04-22 16:03:38', 42, 25),
(76, '2023-04-22 16:16:28', 42, 21),
(77, '2023-04-22 16:18:03', 42, 20),
(78, '2023-04-22 16:52:22', 42, 26),
(79, '2023-04-22 17:01:54', 42, 22),
(80, '2023-04-22 18:04:54', 42, 42),
(81, '2023-04-23 12:55:00', 39, 24),
(82, '2023-04-23 15:44:24', 41, 21),
(83, '2023-04-25 06:43:11', 44, 18),
(84, '2023-04-25 06:43:20', 44, 20),
(85, '2023-04-25 06:46:31', 44, 22),
(87, '2023-04-25 06:50:19', 44, 43),
(88, '2023-04-25 06:54:29', 45, 20),
(89, '2023-04-25 06:56:44', 45, 25),
(90, '2023-04-25 07:04:19', 45, 45),
(92, '2023-04-25 09:34:18', 47, 22),
(93, '2023-04-25 09:35:36', 47, 47);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `rating` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `collection_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `title`, `text`, `rating`, `timestamp`, `collection_id`, `user_id`) VALUES
(1, 'Wow, great taste!', 'This is a really good collection!', 4, '2023-04-19', 20, 39),
(4, 'Pretty good collection, has all the classics', 'A fast-paced, foot-tapping rock album, Born in the USA\'s lyrics nevertheless carry emotional weight. Behind the catchy rock melodies that drive these powerhouse classics are stories of the dark side of the American dream. Many tracks deal with the struggles of hard-working ordinary people and the bitterness and anger they feel as life doesn\'t bring them riches or glory. The song Glory Days, for example, is about people in a small town looking back at when they were young and had the world at their feet while Downbound Train tells the story of a young man whose life is ruined when he loses his job. It\'s not hard to imagine that the artist is channelling real people he knew and the life he might have had if he hadn\'t become a star. The album will leave you in no doubt of the unique and extraordinary talent of the Boss.', 4, '2023-04-19', 19, 39),
(5, 'Not My Cup of Tea', 'Didn\'t really enjoy this one, sorry to say...', 2, '2023-04-19', 18, 39),
(6, 'Decent collection, but missing some classic hits', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 3, '2023-04-19', 21, 41),
(7, 'Needs More Elvis!', 'Not bad but needs more Elvis!', 3, '2023-04-19', 19, 41),
(9, 'My Updated Review', 'This is my updated review', 1, '2023-04-23', 20, 41),
(10, 'Good Stuff Updated', 'This is a good collection UPDATED', 5, '2023-04-23', 23, 41),
(11, 'Nice Collection Joe!', 'I like this collection', 5, '2023-04-21', 23, 39),
(24, 'My Review', 'This is my review\r\n', 3, '2023-04-25', 43, 42),
(25, 'Brilliant Collection!', 'I really like this collection, it covers all the best rock classics!', 4, '2023-04-25', 20, 44),
(26, 'Brings back old memories!', 'A decent collection, brings back lots of childhood memories!', 3, '2023-04-25', 22, 44),
(27, 'Not my cup of tea...', 'This one just isn\'t to my tastes unfortunately!', 2, '2023-04-25', 26, 44),
(28, 'This is my favourite collection on the entire website!', 'I\'m obsessed with this collection! Going to use this as inspiration for one of my own!', 5, '2023-04-25', 20, 45),
(29, 'Nice collection Joe!', 'Some really good albums here, nice to see some unique collections !', 4, '2023-04-25', 25, 45),
(30, 'Good stuff Tim!', 'All the club classics are here, great to see!', 5, '2023-04-25', 45, 45);

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `track_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `vinyl_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`track_id`, `name`, `vinyl_id`) VALUES
(46, 'Paranoid', 21),
(47, 'Iron Man', 21),
(48, 'War Pigs', 21),
(49, 'Planet Caravan', 21),
(50, 'Electric Funeral', 21),
(51, 'Hand of Doom', 21),
(52, 'Boogie With Stu', 22),
(53, 'The Little Things', 23),
(54, 'No More Sorrow', 23),
(55, 'Girl From the North Country', 24),
(56, 'Tangled Up In Blue', 25),
(57, 'If You See Her, Say Hello', 25),
(58, 'Meet Me In The Morning', 25),
(59, 'Idiot Wind', 25),
(60, 'Lily, Rosemary and the Jack of Hearts', 25),
(61, 'You\'re a Big Girl Now', 25),
(62, 'Buckets Of Rain', 25),
(63, 'Shelter From The Storm', 25),
(64, 'You\'re Gonna Make Me Lonesome When You Go', 25),
(65, 'Simple Twist of Fate', 25),
(66, 'Highway To Hell', 26),
(67, 'Touch Too Much', 26),
(68, 'Night Prowler', 26),
(69, 'Love Hungry Man', 26),
(70, 'Shot Down In Flames', 26),
(71, 'Girls Got Rhythm', 26),
(72, 'Get It Hot', 26),
(73, 'If You Want Blood (You\'ve Got It)', 26),
(74, 'Walk All Over You', 26),
(75, 'Beating Around The Bush', 26),
(76, 'Smash \'n\' Grab', 27),
(77, 'War Machine', 27),
(78, 'Big Jack', 27),
(79, 'Skies On Fire', 27),
(80, 'Spoilin\' For A Fight', 27),
(81, 'Rock \'n\' Roll Dream', 27),
(82, 'Money Made', 27),
(83, 'Wheels', 27),
(84, 'Anything Goes', 27),
(85, 'She Likes Rock \'n\' Roll', 27),
(86, 'Black Ice', 27),
(87, 'Stormy May Day', 27),
(88, 'Rock \'n\' Roll Train', 27),
(89, 'Decibel', 27),
(90, 'Rocking All The Way', 27),
(91, 'I Need You Tonight', 28),
(92, 'If Only I Could Flag Her Down', 28),
(93, 'Dirty Dog', 28),
(94, 'I Got The Six', 28),
(95, 'Sharp Dressed Man', 28),
(96, 'T.V Dinners', 28),
(97, 'Legs', 28),
(98, 'Thug', 28),
(99, 'Got Me Under Pressure', 28),
(100, 'Bad Girl', 28),
(101, 'Gimme All Your Lovin\'', 28),
(102, 'Feed Me', 29),
(103, 'Hard Luck Story', 29),
(104, 'I Feel Like A Bullet (In The Gun of Robert Ford)', 29),
(105, 'Medley', 29),
(106, 'Dan Dare', 29),
(107, 'Grow Some Funk Of Your Own', 29),
(108, 'Island Girl', 29),
(109, 'Street Kids', 29),
(110, 'Billy Bones And The White Bird', 29),
(111, 'Get Up, Stand Up', 30),
(112, 'Could You Be Loved', 30),
(113, 'Stir It Up', 30),
(114, 'Three Little Birds', 30),
(115, 'Redemption Song', 30),
(116, 'Exodus', 30),
(117, 'One Love', 30),
(118, 'No Woman No Cry', 30),
(119, 'Waiting In Vain', 30),
(120, 'Jamming', 30),
(121, 'I Shot The Sheriff', 30),
(122, 'Is This Love', 30),
(123, 'Satisfy My Soul', 30),
(124, 'Buffalo Soldier', 30),
(125, 'The Bad Thing', 31),
(126, '505', 31),
(127, 'Teddy Picker', 31),
(128, 'Do Me A Favour', 31),
(129, 'Old Yellow Bricks', 31),
(130, 'Brianstorm', 31),
(131, 'If You Were There, Beware', 31),
(132, 'Only Ones Who Know', 31),
(133, 'Balaclava', 31),
(134, 'This House Is A Circus', 31),
(135, 'D Is For Dangerous', 31),
(136, 'Florescent Adolescent', 31),
(137, 'Orion', 32),
(138, 'Leper Messiah', 32),
(139, 'The Thing That Should Not Be', 32),
(140, 'Damage Inc.', 32),
(141, 'Battery', 32),
(142, 'Master Of Puppets', 32),
(143, 'Disposable Heroes', 32),
(144, 'Welcome Home (Sanitarium)', 32),
(145, 'Slide Away', 33),
(146, 'Rock \'n\' Roll Star', 33),
(147, 'Supersonic', 33),
(148, 'Shakermaker', 33),
(149, 'Live Forever', 33),
(150, 'Digsy\'s Dinner', 33),
(151, 'Cigarettes and Alcohol', 33),
(152, 'Bring It On Down', 33),
(153, 'Columbia', 33),
(154, 'Married With Children', 33),
(155, 'Up In The Sky', 33),
(156, 'Welcome To The Jungle', 34),
(157, 'Think About You', 34),
(158, 'Anything Goes', 34),
(159, 'Nightrain', 34),
(160, 'It\'s So Easy', 34),
(161, 'Out Ta Get Me', 34),
(162, 'Paradise City', 34),
(163, 'You\'re Crazy', 34),
(164, 'Mr. Brownstone', 34),
(165, 'Sweet Child O\' Mine', 34),
(166, 'Rocket Queen', 34),
(167, 'My Michelle', 34),
(168, 'Us and Them', 35),
(169, 'Any Colour You Like', 35),
(170, 'On The Run', 35),
(171, 'Eclipse', 35),
(172, 'The Great Gig In The Sky', 35),
(173, 'Money', 35),
(174, 'Time', 35),
(175, 'Brain Damage', 35),
(176, 'Speak To Me/Breathe', 35),
(177, 'Ain\'t It The Life', 36),
(178, 'Live-In Skin', 36),
(179, 'M.I.A', 36),
(180, 'Generator', 36),
(181, 'Next Year', 36),
(182, 'Stacked Actors', 36),
(183, 'Gimme Stitches', 36),
(184, 'Headwires', 36),
(185, 'Learn To Fly', 36),
(186, 'Breakout', 36),
(187, 'Aurora', 36),
(188, 'Womanizer', 37),
(189, 'My Baby', 37),
(190, 'Radar', 37),
(191, 'Mannequin', 37),
(192, 'Out From Under', 37),
(193, 'Blur', 37),
(194, 'Kill The Lights', 37),
(195, 'Shattered Glass', 37),
(196, 'Unusual You', 37),
(197, 'Celebrity', 37),
(198, 'Magic', 38),
(199, 'Always In My Head', 38),
(200, 'Oceans', 38),
(201, 'Midnight', 38),
(202, 'Another\'s Arms', 38),
(203, 'A Sky Full of Stars', 38),
(204, 'Ink', 38),
(205, 'True Love', 38),
(206, 'A Head Full Of Dreams', 39),
(207, 'Birds', 39),
(208, 'Hymn For The Weekend', 39),
(209, 'Everglow', 39),
(210, 'Adventure of a Lifetime', 39),
(211, 'Fun', 39),
(212, 'Kaleidoscope', 39),
(213, 'Army of One', 39),
(214, 'Bossa Nova Baby', 40),
(215, 'In The Ghetto', 40),
(216, 'Hurt', 40),
(217, 'Trouble', 40),
(218, 'Moody Blue', 40),
(219, 'Kentucky Rain', 40),
(220, 'Hurt', 40),
(221, 'Hound Dog', 40),
(222, 'Memories', 40),
(223, 'Return To Sender', 40),
(224, 'Glory Days', 41),
(225, 'I\'m Going Down', 41),
(226, 'Working on the Highway', 41),
(227, 'Darlington County', 41),
(228, 'Cover Me', 41),
(229, 'Bobby Jean', 41),
(230, 'Downbound Train', 41),
(231, 'No Surrender', 41),
(232, 'I\'m on Fire', 41),
(233, 'Born in the U.S.A', 41),
(234, 'My Hometown', 41),
(235, 'Dancing In The Dark', 41),
(236, 'Jackson Cage', 42),
(237, 'Two Hearts', 42),
(238, 'Stolen Car', 42),
(239, 'Crush On You', 42),
(240, 'Fade Away', 42),
(241, 'The Ties That Bind', 42),
(242, 'I\'m a Rocker', 42),
(243, 'You Can Look (But You Better Not Touch)', 42),
(244, 'I Wanna Marry You', 42),
(245, 'Independence Day', 42),
(246, 'Ramrod', 42),
(247, 'Point Blank', 42),
(248, 'Escape', 43),
(249, 'Creeping Death', 43),
(250, 'Ride The Lightning', 43),
(251, 'Fade To Black', 43),
(252, 'For Whom The Bell Tolls', 43),
(253, 'The Call Of Ktulu', 43),
(254, 'Fight Fire With Fire', 43),
(255, 'Trapped Under Ice', 43),
(256, 'The Memory Remains', 44),
(257, 'Where The Wild Things Are', 44),
(258, 'Fixxxer', 44),
(259, 'Bad Seed', 44),
(260, 'Attitude', 44),
(261, 'The Unforgiven II', 44),
(262, 'Fuel', 44),
(263, 'Prince Charming', 44),
(264, 'Better Than You', 44),
(265, 'Low Man\'s Lyric', 44),
(266, 'Devil\'s Dance', 44),
(267, 'Slither', 44),
(268, 'Carpe Diem Baby', 44),
(269, 'Lesson Learned', 45),
(270, 'Tell You Something (Nana\'s Reprise)', 45),
(271, 'As I Am (Intro)', 45),
(272, 'Saviour', 45),
(273, 'Sure Looks Good To Me', 45),
(274, 'I Need You', 45),
(275, 'Like You\'ll Never See Me Again', 45),
(276, 'The Thing About Love', 45),
(277, 'Another Way To Die', 45),
(278, 'Go Ahead', 45),
(279, 'Where Do We Go From Here', 45),
(280, 'Superwoman', 45),
(281, 'Wreckless Love', 45),
(282, 'Doncha Know (Sky is Blue)', 45),
(283, 'Prelude To a Kiss', 45),
(284, 'Teenage Love Affair', 45),
(285, 'No One', 45),
(286, 'In My Hood', 46),
(287, 'This Is 50', 46),
(288, 'Piggy Bank', 46),
(289, 'Candy Shop', 46),
(290, 'Outta Control', 46),
(291, 'Get In My Car', 46),
(292, 'Disco Inferno', 46),
(293, 'Build You Up', 46),
(294, 'Intro', 47),
(295, 'Patiently Waiting', 47),
(296, 'Many Men (Wish Death)', 47),
(297, 'In Da Club', 47),
(298, 'High All The Time', 47),
(299, 'Heat', 47),
(300, 'If I Can\'t', 47),
(301, 'Blood Hound', 47),
(302, 'Like My Style', 47),
(303, '21 Questions', 47),
(304, 'Intro', 48),
(305, 'Man Down', 48),
(306, 'I Get Money', 48),
(307, 'Come & Go', 48),
(308, 'Ayo Technology', 48),
(309, 'Follow My Lead', 48),
(310, 'Movin\' On Up', 48),
(311, 'Amusement Park', 48),
(312, 'Fire', 48),
(313, 'All Of Me', 48),
(314, 'Touch The Sky', 48),
(315, 'Outro', 48),
(316, 'Curtains Up', 49),
(317, 'Evil Deeds', 49),
(318, 'Never Enough', 49),
(319, 'Yellow Brick Road', 49),
(320, 'Like Toy Soldiers', 49),
(321, 'Mosh', 49),
(322, 'Paul - Skit', 49),
(323, 'Rain Man', 49),
(324, 'Business', 50),
(325, 'White America', 50),
(326, 'Cleanin\' Out My Closet', 50),
(327, 'Square Dance', 50),
(328, 'Soldier', 50),
(329, 'Drips', 50),
(330, 'Say Goodbye Hollywood', 50),
(331, 'Without Me', 50),
(332, 'Cold Wind Blows', 51),
(333, 'Talkin 2\' Myself', 51),
(334, 'On Fire', 51),
(335, 'Won\'t Back Down', 51),
(336, 'W.T.P', 51),
(337, 'Going Through Changes', 51),
(338, 'Not Afraid', 51),
(339, 'Seduction', 51),
(340, 'No Love', 51),
(341, 'Space Bound', 51),
(342, 'Cinderella Man', 51),
(343, '25 To Life', 51),
(344, 'Dr. West (Skit)', 52),
(345, '3 a.m.', 52),
(346, 'My Mom', 52),
(347, 'Insane', 52),
(348, 'Bagpipes From Baghdad', 52),
(349, 'Hello', 52),
(350, 'Stay Wide Awake', 52),
(351, 'Old Time\'s Sake', 52),
(352, 'Deja Vu', 52),
(353, 'Rehab', 53),
(354, 'You Know I\'m No Good', 53),
(355, 'Me & Mr Jones', 53),
(356, 'Just Friends', 53),
(357, 'Back To Black', 53),
(358, 'Love Is A Losing Game', 53),
(359, 'Tears Dry On Their Own', 53),
(360, 'Wake Up Alone', 53),
(361, 'Some Unholy War', 53),
(362, 'He Can Only Hold Her', 53),
(363, 'Addicted', 53),
(364, 'Valerie', 53),
(365, 'Cupid', 53),
(366, 'Monkey Man', 53),
(367, 'Don\'t You Lie To Me', 54),
(368, 'I Wonder Why', 54),
(369, 'Medley', 54),
(370, 'Slow & Easy', 54),
(371, 'Got My Mojo Working', 54),
(372, 'Walkin\' In The Sun', 54),
(373, 'Mother Fuyer', 54),
(374, 'The Same Love That Made Me', 54),
(375, 'It\'s Just A Matter Of Time', 54),
(376, 'The Blues', 54),
(377, 'Friends', 55),
(378, 'I Got Them Blues', 55),
(379, 'Baby I\'m Yours', 55),
(380, 'Up At 5 AM', 55),
(381, 'Philadelphia', 55),
(382, 'When Everything Else Is Gone', 55),
(383, 'My Song', 55),
(384, 'In The Flesh?', 56),
(385, 'The Thin Ice', 56),
(386, 'Another Brick In The Wall', 56),
(387, 'The Happiest Day Of Our Lives', 56),
(388, 'Mother', 56),
(389, 'Empty Space', 56),
(390, 'Young Lust', 56),
(391, 'One Of My Turns', 56),
(392, 'Don\'t Leave Me Now', 56),
(393, 'Goodbye Cruel World', 56),
(394, 'Nobody Home', 56),
(395, 'Comfortably Numb', 56),
(396, 'Radioactive', 57),
(397, 'Tiptoe', 57),
(398, 'It\'s Time', 57),
(399, 'Demons', 57),
(400, 'On Top Of The World', 57),
(401, 'Amsterdam', 57),
(402, 'Hear Me', 57),
(403, 'Every Night', 57),
(404, 'Underdog', 57),
(405, 'Wu-Revolution', 58),
(406, 'Reunited', 58),
(407, 'For Heavens Sake', 58),
(408, 'Cash Still Rules', 58),
(409, 'Visionz', 58),
(410, 'As High as Wu-Tang', 58),
(411, 'Severe Punishment', 58),
(412, 'Older Gods', 58),
(413, 'Bring Da Ruckus', 59),
(414, 'Clan In Da Front', 59),
(415, 'Wu-Tang: 7th Chamber', 59),
(416, 'Can It Be All So Simple', 59),
(417, 'C.R.E.A.M', 59),
(418, 'Protect Ya Neck', 59),
(419, 'Tearz', 59),
(420, 'Method Man', 59),
(421, 'Mother and Child Reunion', 60),
(422, 'Duncan', 60),
(423, 'Everything Put Together Falls Apart', 60),
(424, 'Run That Body Down', 60),
(425, 'Peace Like A River', 60),
(426, 'Papa Hobo', 60),
(427, 'Paranoia Blues', 60),
(428, 'Congratulations', 60),
(429, 'Armistice Day', 60),
(430, 'Late In The Evening', 61),
(431, 'That\'s Why God Made The Movies', 61),
(432, 'One-Trick Pony', 61),
(433, 'Oh, Marion', 61),
(434, 'Ace in the Hole', 61),
(435, 'Nobody', 61),
(436, 'Jonah', 61),
(437, 'Spiral Highway', 61),
(438, 'Stranded in a Limosine', 61),
(439, 'Allergies', 62),
(440, 'Hearts and Bones', 62),
(441, 'When Numbers Get Serious', 62),
(442, 'Song About the Moon', 62),
(443, 'Train In The Distance', 62),
(444, 'Cars Are Cars', 62),
(445, 'The Boy In The Bubble', 63),
(446, 'Graceland', 63),
(447, 'I Know What I Know', 63),
(448, 'Gumboots', 63),
(449, 'You Can Call Me Al', 63),
(450, 'Under African Skies', 63),
(451, 'Homeless', 63),
(452, 'Objection', 64),
(453, 'Whenever, Wherever', 64),
(454, 'Rules', 64),
(455, 'The One', 64),
(456, 'Fool', 64),
(457, 'Te Dejo Madrid', 64),
(458, 'Poem to a Horse', 64),
(459, 'Que Me Quedes Tu', 64),
(460, 'Outro', 64),
(461, 'Getting Older', 65),
(462, 'I Didn\'t Change My Number', 65),
(463, 'Billie Bossa Nova', 65),
(464, 'My Future', 65),
(465, 'Oxytocin', 65),
(466, 'Goldwing', 65),
(467, 'Hang On To Yourself', 66),
(468, 'Ziggy Stardust', 66),
(469, 'Watch That Man', 66),
(470, 'All The Young Dudes', 66),
(471, 'Changes', 66),
(472, 'My Death', 66),
(473, 'Cracked Actor', 66),
(474, 'Fantastic Voyage', 67),
(475, 'African Night Flight', 67),
(476, 'Move On', 67),
(477, 'Red Sails', 67),
(478, 'D.J', 67),
(479, 'Boys Keep Swinging', 67),
(480, 'Repetition', 67),
(481, 'This Is a Call', 68),
(482, 'I\'ll Stick Around', 68),
(483, 'Big Me', 68),
(484, 'Alone', 68),
(485, 'Good Grief', 68),
(486, 'Floaty', 68),
(487, 'Oh, George', 68),
(488, 'In Your Honor', 69),
(489, 'No Way Back', 69),
(490, 'Best of You', 69),
(491, 'DOA', 69),
(492, 'Hell', 69),
(493, 'The Last Song', 69),
(494, 'End Over End', 69),
(495, 'Don Doggy', 70),
(496, 'Stoplight', 70),
(497, 'I Believe In You', 70),
(498, 'Lollipop', 70),
(499, 'Ballin\'', 70),
(500, 'Beautiful', 70),
(501, 'Hourglass', 70),
(502, 'The One And Only', 70),
(503, 'minipops 67', 71),
(504, 'XMAS_EVET10', 71),
(505, 'produk 29', 71),
(506, '4 bit 9d api+e+6', 71),
(507, '180db_', 71),
(508, 'CIRCLONT6A', 71),
(509, 'fz pseudotimestretch+e+3', 71),
(510, 'CIRCLONT14', 71),
(511, 'syro u473t8+e', 71),
(512, 'PAPAT4', 71),
(513, 's950tx16wasr10', 71),
(514, 'aisatsana', 71),
(515, 'Do I Wanna Know?', 72),
(516, 'Are You Mine?', 72),
(517, 'One For The Road', 72),
(518, 'Arabella', 72),
(519, 'I Want It All', 72),
(520, 'No.1 Party Anthem', 72),
(521, 'Mad Sounds', 72),
(522, 'Fireside', 72),
(523, 'Why\'d You Only Call Me', 72),
(524, 'Snap Out Of It', 72),
(525, 'Knee Socks', 72),
(526, 'I Wanna Be Yours', 72),
(527, 'Motherless Children', 73),
(528, 'Give Me Strength', 73),
(529, 'Willie And The Hand Jive', 73),
(530, 'Get Ready', 73),
(531, 'I Shot The Sheriff', 73),
(532, 'I Can\'t Hold Out', 73),
(533, 'Please Be With Me', 73),
(534, 'Let It Grow', 73),
(535, 'Steady Rollin\' Man', 73),
(536, 'Mainline Florida', 73),
(537, 'Heart Upon My Sleeve', 74),
(538, 'Shame On Me', 74),
(539, 'You Make Me', 74),
(540, 'Wake Me Up', 74),
(541, 'Lay Me Down', 74),
(542, 'Dear Boy', 74),
(543, 'Liar Liar', 74),
(544, 'Addicted To You', 74),
(545, 'Hey Brother', 74),
(546, 'Hope There\'s Someone', 74),
(547, 'Can\'t Catch Me', 75),
(548, 'Somewhere In Stockholm', 75),
(549, 'Ten More Days', 75),
(550, 'Touch Me', 75),
(551, 'Pure Grinding', 75),
(552, 'City Lights', 75),
(553, 'Sunset Jesus', 75),
(554, 'Gonna Love Ya', 75),
(555, 'For A Better Day ', 75),
(556, 'Broken Arrows', 75),
(557, 'Ghetto Ghetto', 76),
(558, 'Love Bullets', 76),
(559, 'Gettin\' Dumb', 76),
(560, 'Freshy', 76),
(561, 'Scream & Shout', 76),
(562, 'Far Away From Home', 76),
(563, 'The World Is Crazy', 76),
(564, 'Hello', 76),
(565, 'Shake A Leg', 77),
(566, 'Let Me Love You', 77),
(567, 'Givin\' The Dog A Bone', 77),
(568, 'You Shook Me All Night Long', 77),
(569, 'Shoot To Thrill', 77),
(570, 'Have A Drink On Me', 77),
(571, 'Back In Black', 77),
(572, 'What Do You Do For Money', 77),
(573, 'Hells Bells', 77),
(574, 'Rock and Roll Ain\'t Noise Pollution', 77),
(575, 'It\'s A Long Way To The Top', 78),
(576, 'Rock n\' Roll Singer', 78),
(577, 'The Jack', 78),
(578, 'Live Wire', 78),
(579, 'T.N.T', 78),
(580, 'Can I Sit Next To You', 78),
(581, 'Little Lover', 78),
(582, 'She\'s Got It', 78),
(583, 'High Voltage', 78),
(584, 'example 1', 79),
(585, 'example 2', 79),
(586, 'example 3', 79),
(587, 'example 4', 79),
(588, 'example 1', 80),
(589, 'example 2 ', 80),
(590, 'example 3', 80);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `image_url` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `join_date` date NOT NULL,
  `last_login` date DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `date_of_birth`, `image_url`, `email`, `join_date`, `last_login`, `password`) VALUES
(39, 'Cormac', 'Joseph', '1995-01-01', 'https://media.istockphoto.com/id/805011962/photo/portrait-of-young-afro-american-man.jpg?s=612x612&w=0&k=20&c=za82ghBo0XFefDyU5mpGEzXgZiq7dQLMpdiPGgadKLU=', 'cormac@gmail.com', '2023-04-15', '2023-04-23', '$2b$10$DaMOlPLlb4mf8iBkntevduhOPLJky3yopgrgOCf0.IAU6pFgTZXJW'),
(41, 'Joe', 'Smith', '1985-01-01', 'https://media.istockphoto.com/id/1355110818/photo/studio-shot-of-a-handsome-and-happy-young-man-posing-against-a-grey-background.jpg?s=612x612&w=0&k=20&c=T39jUOOjC8H-Op0cfd-uiNXk1a2XBn1sXkQbKIWwY7E=', 'joey@gmail.com', '2023-04-17', '2023-04-23', '$2b$10$.X7PdVcsB6ip1AKYksTrROkiGA/CMUonYARapxS.4WuEZNjlXxLzC'),
(42, 'Bob', 'Jones', '1993-05-04', 'data:image/jpeg;base64,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', 'bob@gmail.com', '2023-04-22', '2023-04-25', '$2b$10$uKQCCHpP9PKafVWgzvQlEOzA2I0eBc9.qYypdelHI2zzIvSodZlka'),
(43, 'New', 'User', '1995-01-01', 'https://blog-pixomatic.s3.appcnt.com/image/22/01/26/61f166e1e3b25/_orig/pixomatic_1572877090227.png', 'new@gmail.com', '2023-04-23', '2023-04-23', '$2b$10$DGSBeEvZK1NeHQ4XMhs4.OxRXiJ4bMO.5Cl92ySBZR4qdAcBMRPRG'),
(44, 'Tim', 'Johnson', '1978-04-05', 'https://media.istockphoto.com/id/805012064/photo/portrait-of-mature-hispanic-man.jpg?s=612x612&w=0&k=20&c=AfNa1ay8LPzaO-NOJZspqULvYavyhXg4rnJ9U_tvJY4=', 'tim@gmail.com', '2023-04-25', '2023-04-25', '$2b$10$qoBmPOaOyy2zS9laOVgDn.qGTSt04hIxcwq5HYTLp8oD8EJZ3Lca.'),
(45, 'Mary', 'McKay', '1996-09-04', 'https://media.istockphoto.com/id/805011810/photo/portrait-of-smiling-young-asian-woman.jpg?s=612x612&w=0&k=20&c=SRnqFueSVusW7-ATZjzdFxaBMxiPntf44UD-YjlVjM8=', 'mary@gmail.com', '2023-04-25', '2023-04-25', '$2b$10$X2wMwMnZmMV2j1XsKObYHOTDqCWZBph1UXtt9u8L8HFeWTwopszIm'),
(47, 'Example', 'User', '1990-01-01', 'https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/e2/09/16/e209168d-f52f-6d5b-b77b-e4c1214170d3/886443981799.jpg/600x600bb.jpg', 'example@gmail.com', '2023-04-25', '2023-04-25', '$2b$10$UTOm4lSfCaK7aFg0PXztFuY3DMnYixDcMoORcDYS6BkIjrfyGTdoG');

-- --------------------------------------------------------

--
-- Table structure for table `vinyl`
--

CREATE TABLE `vinyl` (
  `vinyl_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `image_url` text DEFAULT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vinyl`
--

INSERT INTO `vinyl` (`vinyl_id`, `name`, `year`, `image_url`, `artist_id`) VALUES
(21, 'Paranoid', '1970', 'https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/be/27/91/be279120-2285-16c6-c7ba-9d6643d4a948/075992732727.jpg/600x600bb.jpg', 33),
(22, 'Physical Graffiti', '1975', 'https://is4-ssl.mzstatic.com/image/thumb/Music3/v4/d6/f2/d3/d6f2d379-a21a-947a-48c3-d72fca3f30b9/603497894314.jpg/600x600bb.jpg', 61),
(23, 'Minutes to Midnight', '2007', 'https://is1-ssl.mzstatic.com/image/thumb/Features124/v4/f5/d6/68/f5d6681a-734c-8225-aa28-418c3715b6da/dj.xkwgleci.jpg/600x600bb.jpg', 62),
(24, 'Nashville Skyline', '1969', 'https://is1-ssl.mzstatic.com/image/thumb/Features124/v4/3f/1a/ad/3f1aad23-1f92-4d66-0ca7-d835c3f79b6b/dj.mtxlnrdd.jpg/600x600bb.jpg', 49),
(25, 'Blood On The Tracks', '1975', 'https://is4-ssl.mzstatic.com/image/thumb/Music125/v4/34/6e/4d/346e4d1c-c9ef-cf7f-96d9-aad97286febb/074643323529.jpg/600x600bb.jpg', 49),
(26, 'Highway To Hell', '1979', 'https://is3-ssl.mzstatic.com/image/thumb/Music126/v4/b9/c8/ef/b9c8ef42-bbc9-64df-11f8-717571f6730f/886443673458.jpg/600x600bb.jpg', 44),
(27, 'Black Ice', '2008', 'https://is4-ssl.mzstatic.com/image/thumb/Features114/v4/e3/11/46/e3114613-1163-9c1a-f3ea-70f6a9b38d7e/dj.mtwvirjq.jpg/600x600bb.jpg', 44),
(28, 'Eliminator', '1983', 'https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/c4/f7/c4/c4f7c49e-952a-0ac8-add3-20101fc44d14/075992377423.jpg/600x600bb.jpg', 74),
(29, 'Rock Of The Westies', '1975', 'https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/23/99/e7/2399e7ea-8597-3585-c53f-c8e99edb4735/00731453243224.rgb.jpg/600x600bb.jpg', 54),
(30, 'Legend', '1984', 'https://is3-ssl.mzstatic.com/image/thumb/Music113/v4/ea/20/06/ea2006f9-7512-cf9c-7b44-78116156875e/12UMGIM14712.rgb.jpg/600x600bb.jpg', 50),
(31, 'Favourite Worst Nightmare', '2007', 'https://is4-ssl.mzstatic.com/image/thumb/Features114/v4/20/37/b8/2037b893-4069-106a-3a68-8b4a7f376328/dj.azqjhmve.jpg/600x600bb.jpg', 28),
(32, 'Master Of Puppets', '1986', 'https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/69/f9/05/69f905ed-ff04-58a2-8de2-1b5338745f19/858978005226.png/600x600bb.jpg', 71),
(33, 'Definitely Maybe', '1994', 'https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/00/af/e3/00afe365-35f8-04cb-379a-e12abead71cd/5051961070132.jpg/600x600bb.jpg', 66),
(34, 'Appetite For Destruction', '1987', 'https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/a0/4d/c4/a04dc484-03cc-02aa-fa82-5334fcb4bc16/18UMGIM24878.rgb.jpg/600x600bb.jpg', 58),
(35, 'Dark Side Of The Moon', '1973', 'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/3c/1b/a9/3c1ba9e1-15b1-03b3-3bfd-09dbd9f1705b/dj.mggvbaou.jpg/600x600bb.jpg', 70),
(36, 'There Is Nothing Left To Lose', '1999', 'https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/de/83/0a/de830a06-ba20-249b-909d-f46701a44f19/dj.aevpjurd.jpg/600x600bb.jpg', 56),
(37, 'Circus', '2008', 'https://is3-ssl.mzstatic.com/image/thumb/Music/d5/b2/60/mzi.doisfoll.jpg/600x600bb.jpg', 36),
(38, 'Ghost Stories', '2014', 'https://is1-ssl.mzstatic.com/image/thumb/Features125/v4/60/90/ad/6090adc3-8863-861d-afcc-23c55c6fe5da/dj.vmtulfyu.jpg/600x600bb.jpg', 40),
(39, 'A Head Full Of Dreams', '2015', 'https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/c8/0a/6d/c80a6df9-e55a-fb83-0311-f4776984ac67/mzm.lasidxkv.jpg/600x600bb.jpg', 40),
(40, 'The Essential Elvis Presley', '2007', 'https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/cb/5d/f5/cb5df548-c55a-e28e-dce9-bd91711f1e84/828768904824.jpg/600x600bb.jpg', 55),
(41, 'Born In The Usa', '1984', 'https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/32/72/68/327268ba-b9dd-b322-2a16-bdd0212df48c/074643865326.jpg/600x600bb.jpg', 52),
(42, 'The River', '1980', 'https://is3-ssl.mzstatic.com/image/thumb/Music125/v4/ac/29/8f/ac298fbd-fa23-e8de-09d7-dec9c977f912/074643685429.jpg/600x600bb.jpg', 52),
(43, 'Ride The Lightning', '1984', 'https://is3-ssl.mzstatic.com/image/thumb/Music128/v4/1d/7d/88/1d7d88ea-3bfd-9f20-2c86-630a32aac634/dj.mapicmzf.png/600x600bb.jpg', 71),
(44, 'Reload', '1997', 'https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/68/b0/0e/68b00e47-8c5f-fd9c-9d39-fbee55a4b9d4/0093624986539.jpg/600x600bb.jpg', 71),
(45, 'As I Am', '2007', 'https://is2-ssl.mzstatic.com/image/thumb/Music114/v4/c7/88/df/c788dffe-d06f-8923-ad61-a6194daf6616/888880809919.jpg/600x600bb.jpg', 47),
(46, 'The Massacre', '2005', 'https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/8d/f8/9e/8df89e37-d1b7-9395-ca42-f83d18af8791/06UMGIM13448.rgb.jpg/600x600bb.jpg', 75),
(47, 'Get Rich Or Die Tryin\'', '2003', 'https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/51/a6/c9/51a6c989-f81d-42b3-c94c-e889a7c07885/06UMGIM15592.rgb.jpg/600x600bb.jpg', 75),
(48, 'Curtis', '2007', 'https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/e0/02/69/e00269f5-33f8-7192-090a-44b229fd0fe1/00602517506220.rgb.jpg/600x600bb.jpg', 75),
(49, 'Encore', '2004', 'https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/8b/bf/10/8bbf10dc-5dcb-9b81-6ec2-83341286ff72/00602498646717.rgb.jpg/600x600bb.jpg', 78),
(50, 'The Eminem Show', '2002', 'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/b4/13/e9/b413e91d-40aa-a1a8-b8e3-2bacc3b3e222/00606949329020.rgb.jpg/600x600bb.jpg', 78),
(51, 'Recovery', '2010', 'https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/6a/da/5f/6ada5fd5-5e05-20bc-4bb0-6c0f1f0d91cd/10UMGIM14533.rgb.jpg/600x600bb.jpg', 78),
(52, 'Relapse', '2009', 'https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/cc/f0/df/ccf0dff7-a38f-caa0-79a3-05cb869b0380/09UMGIM08254.rgb.jpg/600x600bb.jpg', 78),
(53, 'Back To Black', '2006', 'https://is3-ssl.mzstatic.com/image/thumb/Music112/v4/5a/72/3f/5a723fec-965d-3483-89f8-d66b79f88419/15UMGIM24224.rgb.jpg/600x600bb.jpg', 27),
(54, 'King Size', '1977', 'https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/16/c0/d5/16c0d5c6-e638-0d4f-58b3-4310274b6907/00602537090518.rgb.jpg/600x600bb.jpg', 84),
(55, 'Friends', '1974', 'https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/5f/0a/00/5f0a0057-655e-5da1-6832-f426f42b0be0/19UMGIM60745.rgb.jpg/600x600bb.jpg', 84),
(56, 'The Wall', '1979', 'https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/3c/b4/e3/3cb4e3d0-cd77-8f18-7465-d60e6949b435/886445635850.jpg/600x600bb.jpg', 70),
(57, 'Night Visions', '2012', 'https://is5-ssl.mzstatic.com/image/thumb/Music112/v4/1f/fa/09/1ffa092f-f52f-4a66-7d10-4cc5982dc747/12UMGIM46901.rgb.jpg/600x600bb.jpg', 59),
(58, 'Wu-Tang Forever', '1997', 'https://is5-ssl.mzstatic.com/image/thumb/Music115/v4/da/8f/eb/da8feb7d-1b8b-a996-7e19-5f9c15d9d10d/mzi.jzuvxawy.jpg/600x600bb.jpg', 77),
(59, 'Enter The Wu-Tang', '1993', 'https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/54/d3/cd/54d3cd0a-109f-930b-8fee-0acf35e81754/dj.brdcktik.jpg/600x600bb.jpg', 77),
(60, 'Paul Simon', '1972', 'https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/39/e8/5c/39e85c62-83f6-cced-9a56-122f2361566e/dj.jicohfwb.jpg/600x600bb.jpg', 67),
(61, 'One-Trick Pony', '1980', 'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/c9/0f/07/c90f0706-6fae-c886-7354-40fbb3171aac/dj.ccouxvni.jpg/600x600bb.jpg', 67),
(62, 'Hearts And Bones', '1983', 'https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/f0/bc/53/f0bc5343-290f-0f43-047e-4ab0c9309104/dj.dfebnvko.jpg/600x600bb.jpg', 67),
(63, 'Graceland', '1986', 'https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/a7/73/c1/a773c1f0-281c-324c-204f-540444080ea8/886443445697.jpg/600x600bb.jpg', 67),
(64, 'Laundry Service', '2001', 'https://is3-ssl.mzstatic.com/image/thumb/Music124/v4/c5/4b/ff/c54bffa0-2333-1a55-e67e-a9c640e06f6f/mzi.hwxgzhsl.jpg/600x600bb.jpg', 72),
(65, 'Happier Than Ever', '2021', 'https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/2d/f3/c9/2df3c9fd-e0eb-257c-c035-b04f05a66580/21UMGIM36691.rgb.jpg/600x600bb.jpg', 31),
(66, 'Ziggy Stardust', '1983', 'https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/5f/fa/56/5ffa56c2-ea1f-7a17-6bad-192ff9b6476d/825646124206.jpg/600x600bb.jpg', 53),
(67, 'Lodger', '1979', 'https://is5-ssl.mzstatic.com/image/thumb/Music62/v4/fb/2b/40/fb2b4061-9d2e-f1d2-4fa4-172af91b3539/190295842659.jpg/600x600bb.jpg', 53),
(68, 'Foo Fighters', '1995', 'https://is2-ssl.mzstatic.com/image/thumb/Features125/v4/be/d0/cc/bed0cc3e-8f1f-0f62-a434-e624f847d96e/dj.qasnqsul.jpg/600x600bb.jpg', 56),
(69, 'In Your Honor', '2005', 'https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/36/0c/34/360c3405-0a45-a006-7664-115f42fe283e/mzi.ytrcscra.jpg/600x600bb.jpg', 56),
(70, 'Paid Tha Cost To Be Da Bo$$', '2002', 'https://is1-ssl.mzstatic.com/image/thumb/Music118/v4/88/77/63/887763e8-b673-7e5a-fe8e-92d69cc7c9dd/00602557357073.rgb.jpg/600x600bb.jpg', 80),
(71, 'Syro', '2014', 'https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/d5/7f/6e/d57f6e8e-068c-ef83-2a62-663e47d3f002/Syro_digital_packshot_RGB_1400.jpg/600x600bb.jpg', 82),
(72, 'AM', '2013', 'https://is3-ssl.mzstatic.com/image/thumb/Music113/v4/cc/0f/2d/cc0f2d02-5ff1-10e7-eea2-76863a55dbad/887828031795.png/600x600bb.jpg', 28),
(73, '461 Ocean Boulevard', '1974', 'https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/43/62/7d/43627db0-7bb4-63a2-37bc-f6fd0a798d90/00602537803217.rgb.jpg/600x600bb.jpg', 83),
(74, 'The Nights', '2013', 'https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/63/e5/39/63e53993-0eff-18e2-d756-ce3d56d98270/00602537491377.rgb.jpg/600x600bb.jpg', 48),
(75, 'Stories', '2015', 'https://is5-ssl.mzstatic.com/image/thumb/Music112/v4/e0/f4/25/e0f425ba-2848-f1c2-e102-9ddcef5e9d9d/15UMGIM35223.rgb.jpg/600x600bb.jpg', 48),
(76, 'Will Power', '2013', 'https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/99/25/d4/9925d475-1ef4-a536-d45d-adb8101ef539/13UMGIM26865.rgb.jpg/600x600bb.jpg', 73),
(77, 'Back In Black', '1980', 'https://is2-ssl.mzstatic.com/image/thumb/Music115/v4/1e/14/58/1e145814-281a-58e0-3ab1-145f5d1af421/886443673441.jpg/600x600bb.jpg', 44),
(78, 'High Voltage', '1976', 'https://is1-ssl.mzstatic.com/image/thumb/Features125/v4/2d/a8/b5/2da8b582-64aa-d25f-2cdf-ad63a3e04920/dj.jnlhrcpf.jpg/600x600bb.jpg', 44),
(79, 'Example Aerosmith', '1998', 'https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/75/4a/e5/754ae506-e55a-b45c-f139-912e5102f30f/07UMGIM14958.rgb.jpg/600x600bb.jpg', 45),
(80, 'Example', '1993', 'https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/e2/09/16/e209168d-f52f-6d5b-b77b-e4c1214170d3/886443981799.jpg/600x600bb.jpg', 47);

-- --------------------------------------------------------

--
-- Table structure for table `vinyl_genre`
--

CREATE TABLE `vinyl_genre` (
  `vinyl_genre_id` int(11) NOT NULL,
  `vinyl_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vinyl_genre`
--

INSERT INTO `vinyl_genre` (`vinyl_genre_id`, `vinyl_id`, `genre_id`) VALUES
(31, 21, 35),
(32, 21, 37),
(33, 22, 37),
(34, 22, 35),
(35, 23, 37),
(36, 23, 35),
(37, 24, 43),
(38, 24, 42),
(39, 25, 43),
(40, 25, 42),
(41, 26, 50),
(42, 26, 35),
(43, 27, 50),
(44, 27, 35),
(45, 28, 50),
(46, 28, 35),
(47, 29, 34),
(48, 29, 35),
(49, 30, 47),
(50, 30, 46),
(51, 31, 35),
(52, 31, 34),
(53, 32, 37),
(54, 32, 35),
(55, 33, 48),
(56, 33, 35),
(57, 34, 35),
(58, 34, 50),
(59, 35, 35),
(60, 35, 49),
(61, 36, 50),
(62, 36, 35),
(63, 37, 34),
(64, 37, 41),
(65, 38, 35),
(66, 38, 48),
(67, 39, 35),
(68, 39, 48),
(69, 40, 35),
(70, 40, 34),
(71, 41, 50),
(72, 41, 35),
(73, 42, 50),
(74, 42, 35),
(75, 43, 50),
(76, 43, 37),
(77, 44, 37),
(78, 44, 50),
(79, 45, 43),
(80, 45, 34),
(81, 46, 51),
(82, 46, 44),
(83, 47, 51),
(84, 47, 44),
(85, 48, 51),
(86, 48, 44),
(87, 49, 51),
(88, 49, 44),
(89, 50, 51),
(90, 50, 44),
(91, 51, 51),
(92, 51, 44),
(93, 52, 51),
(94, 52, 44),
(95, 53, 38),
(96, 53, 39),
(97, 54, 39),
(98, 54, 38),
(99, 55, 39),
(100, 55, 38),
(101, 56, 35),
(102, 56, 49),
(103, 57, 35),
(104, 57, 34),
(105, 58, 51),
(106, 58, 44),
(107, 59, 51),
(108, 59, 44),
(109, 60, 42),
(110, 60, 43),
(111, 61, 42),
(112, 61, 43),
(113, 62, 42),
(114, 62, 43),
(115, 63, 42),
(116, 63, 43),
(117, 64, 34),
(118, 64, 41),
(119, 65, 34),
(120, 65, 41),
(121, 66, 48),
(122, 66, 35),
(123, 67, 48),
(124, 67, 35),
(125, 68, 50),
(126, 68, 35),
(127, 69, 35),
(128, 69, 50),
(129, 70, 44),
(130, 70, 51),
(131, 71, 49),
(132, 71, 48),
(133, 72, 34),
(134, 72, 35),
(135, 73, 39),
(136, 73, 38),
(137, 74, 40),
(138, 74, 41),
(139, 75, 41),
(140, 75, 40),
(141, 76, 41),
(142, 76, 44),
(143, 77, 35),
(144, 77, 50),
(145, 78, 35),
(146, 78, 50),
(147, 79, 36),
(148, 79, 35),
(149, 80, 48),
(150, 80, 34);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`collection_id`),
  ADD KEY `collection.user_id=>user.user_id` (`user_id`);

--
-- Indexes for table `collection_vinyl`
--
ALTER TABLE `collection_vinyl`
  ADD PRIMARY KEY (`collection_vinyl_id`),
  ADD KEY `collection_vinyl.collection_id=>collection.collection_id` (`collection_id`),
  ADD KEY `collection_vinyl.vinyl_id=>vinyl.vinyl_id` (`vinyl_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `likes.user_id=>user.user_id` (`user_id`),
  ADD KEY `likes.collection_id=>collection.collection_id` (`collection_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review.collection_id =>collection.collection_id` (`collection_id`),
  ADD KEY `review.user_id=>user.user_id` (`user_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `track.vinyl_id=>vinyl.vinyl_id` (`vinyl_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vinyl`
--
ALTER TABLE `vinyl`
  ADD PRIMARY KEY (`vinyl_id`),
  ADD KEY `vinyl.artist_id=>artist.artist_id` (`artist_id`);

--
-- Indexes for table `vinyl_genre`
--
ALTER TABLE `vinyl_genre`
  ADD PRIMARY KEY (`vinyl_genre_id`),
  ADD KEY `vinyl_genre.genre_id=>genre.genre_id` (`genre_id`),
  ADD KEY `vinyl_genre.vinyl_id=>vinyl.vinyl_id` (`vinyl_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `collection_vinyl`
--
ALTER TABLE `collection_vinyl`
  MODIFY `collection_vinyl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=591;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `vinyl`
--
ALTER TABLE `vinyl`
  MODIFY `vinyl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `vinyl_genre`
--
ALTER TABLE `vinyl_genre`
  MODIFY `vinyl_genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `collection.user_id=>user.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `collection_vinyl`
--
ALTER TABLE `collection_vinyl`
  ADD CONSTRAINT `collection_vinyl.collection_id=>collection.collection_id` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collection_vinyl.vinyl_id=>vinyl.vinyl_id` FOREIGN KEY (`vinyl_id`) REFERENCES `vinyl` (`vinyl_id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes.collection_id=>collection.collection_id` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes.user_id=>user.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review.collection_id =>collection.collection_id` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review.user_id=>user.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track.vinyl_id=>vinyl.vinyl_id` FOREIGN KEY (`vinyl_id`) REFERENCES `vinyl` (`vinyl_id`);

--
-- Constraints for table `vinyl`
--
ALTER TABLE `vinyl`
  ADD CONSTRAINT `vinyl.artist_id=>artist.artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`);

--
-- Constraints for table `vinyl_genre`
--
ALTER TABLE `vinyl_genre`
  ADD CONSTRAINT `vinyl_genre.genre_id=>genre.genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  ADD CONSTRAINT `vinyl_genre.vinyl_id=>vinyl.vinyl_id` FOREIGN KEY (`vinyl_id`) REFERENCES `vinyl` (`vinyl_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
