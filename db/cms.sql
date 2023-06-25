-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 07:27 PM
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
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'JavaScript'),
(2, 'PHP'),
(13, 'Bootstrap'),
(14, 'Java'),
(17, 'JavaScript 3'),
(21, 'C#');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(9) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(6, 4, 'Cindy', 'cindy@test.com', 'What an amazing image!', 'approved', '2023-04-26'),
(7, 13, 'Sandy', 'sandy@gmail.com', 'Niiiice course!!!!!!!!!!', 'approved', '2023-04-27'),
(8, 1, 'Some Person', 'person@gmail.com', 'I like writing huuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuge comments c:', 'approved', '2023-04-27'),
(9, 8, 'wow', 'wow.me@test.com', 'Woooooooooow, this course is greate!!!!\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus condimentum ultricies odio sit amet efficitur. Phasellus non ligula dignissim, elementum orci id, sollicitudin tortor. Duis iaculis tortor est, nec fringilla felis faucibus eget. Quisque vel orci ligula. Quisque pretium nibh et metus fringilla ultricies. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer tempor gravida velit at semper. Praesent porttitor tincidunt feugiat. Etiam sit amet libero malesuada, vulputate elit quis, pulvinar nulla. Praesent eu tellus a nisi semper ultricies et vel sem. Pellentesque tincidunt vestibulum odio et consequat.\r\n', 'approved', '2023-04-27'),
(10, 8, 'Peter Pan', 'peter-pan@gmail.com', 'Історії про Пітера Пена неодноразово екранізувалися. Найбільш відомим є однойменний мультик студії Walt Disney Pictures, випущений 1953 року. В 2002 було випущено продовження «Пітер Пен: повернення у Небувалію». Фільм 1991 року «Капітан Гак» мав номінації на Оскар. Також 1987 було випущено радянський однойменний фільм на студії «Беларусьфильм». Відомою екранізацію є фільм студії Universal Pictures спільного виробництва США, Великої Британії та Австралії, випущений 2003 року. У 2011 році був знятий міні-серіал \"Неверленд\", який подав глядачеві альтернативну версію про Пітера Пена. Також цей персонаж фігурував у третьому сезоні серіалу \"Якось у казці\", де йому було відведено місце головного антагоніста. [1].', 'approved', '2023-04-27'),
(11, 8, 'Peter Pan', 'peter-pan@gmail.com', 'Пітер Пен — хлопчик, який не хоче дорослішати. Він втік з дому та полетів у Кенсінгтонські сади (знаходяться у Лондоні), де познайомився з феями. Пізніше він став жити на острові Небувалія (Neverland) в компанії хлопчиків, які загубилися у Кенсінгтонських садах. В нього є власна фея Дзінь-Дзінь (англ. Tinker bell). Його лютий ворог — капітан Гак, якого звуть так з тих пір, як крокодил проковтнув його руку, замість якої довелося приладнати залізний гак. М\'ясо так сподобалось тварині, що вона постійно чекала слушної нагоди з\'їсти решту пірата. Разом з рукою крокодил проковтнув годинник Гака, через що капітан піратів завжди знав, коли загроза близько, і тікав подалі.\r\n\r\nПітер Пен завжди залишається хлопчиком, не дорослішає, має молочні зуби, які не випадають. Він уміє літати, і може навчити літати будь-яку дитину.', 'approved', '2023-04-27'),
(12, 8, 'Peter Pan', 'peter-pan@gmail.com', 'Пітер Пен — хлопчик, який не хоче дорослішати. Він втік з дому та полетів у Кенсінгтонські сади (знаходяться у Лондоні), де познайомився з феями. Пізніше він став жити на острові Небувалія (Neverland) в компанії хлопчиків, які загубилися у Кенсінгтонських садах. В нього є власна фея Дзінь-Дзінь (англ. Tinker bell). Його лютий ворог — капітан Гак, якого звуть так з тих пір, як крокодил проковтнув його руку, замість якої довелося приладнати залізний гак. М\'ясо так сподобалось тварині, що вона постійно чекала слушної нагоди з\'їсти решту пірата. Разом з рукою крокодил проковтнув годинник Гака, через що капітан піратів завжди знав, коли загроза близько, і тікав подалі.\r\n\r\nПітер Пен завжди залишається хлопчиком, не дорослішає, має молочні зуби, які не випадають. Він уміє літати, і може навчити літати будь-яку дитину.', 'approved', '2023-04-27'),
(14, 1, 'Vladick', 'vlad_is_love@gmail.com', '<3', 'unapproved', '2023-04-29'),
(15, 13, 'Heeeey', 'heeeey@gmail.commm', 'Heeeeeeeeeey!\'\'\'', 'unapproved', '2023-04-29'),
(16, 5, 'Mauris tincidunt', 'Suspendisse@potenti.com', 'Aliquam non eros gravida, tristique velit et, luctus urna. Mauris efficitur accumsan scelerisque. Suspendisse potenti. Aliquam erat volutpat. Mauris tincidunt metus vitae pharetra accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam rhoncus sit amet ipsum et facilisis. Donec non suscipit elit. In faucibus, tortor consectetur interdum cursus, odio sapien varius orci, at consequat justo tortor eget lacus.', 'approved', '2023-04-29'),
(17, 1, '', '', '<h4><h3><font color=\"#4a1031\"><b>Greate video!</b></font></h3><b style=\"\"><font color=\"#a54a7b\">Check this one:&nbsp;</font></b><a href=\"https://youtu.be/XGE9B3McEyk\" target=\"_blank\"><font color=\"#ff00ff\">https://youtu.be/XGE9B3McEyk</font></a></h4>', 'approved', '2023-05-01'),
(19, 17, '       ', '         ', '<p>&nbsp; &nbsp; &nbsp; &nbsp;</p>', 'unapproved', '2023-05-02'),
(20, 1, 'Черепашка', 'Аха', 'Черепаха аха аха', 'approved', '2023-05-03'),
(21, 1, 'Cindy', 'cindy@test.com', '<p>Не сподобалось. Жах</p>', 'unapproved', '2023-05-03'),
(22, 17, 'Sofiia', 'sofiykafedor@gmail.com', '<p>Дуже гарний краєвид!</p>', 'unapproved', '2023-05-03'),
(23, 38, 'demo', 'demo@text.com', '<p>=)</p>', 'unapproved', '2023-05-03'),
(24, 16, 'waruyryry', 'waruyryry@dsgdr', '<p>Amazing view!</p>', 'unapproved', '2023-05-03'),
(25, 16, 'aerdfg', 'sdfgh', '<p>sdfghj</p>', 'unapproved', '2023-05-03'),
(26, 16, 'aerdfg', 'sdfgh', '<p>sdfghj</p>', 'unapproved', '2023-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(1, 13, 'Some post tile with a turtle', 'John Doe', '2023-05-05', 'img1.jpg', '<h1 style=\"text-align: center; \"><span style=\"font-family: Impact;\">Some interesting content goes here.</span></h1><h1 style=\"text-align: center; \"><iframe frameborder=\"0\" src=\"//www.youtube.com/embed/Q-SAeLwMg18\" width=\"640\" height=\"360\" class=\"note-video-clip\"></iframe></h1><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras odio mauris, feugiat id orci ut, imperdiet vehicula orci. Nulla imperdiet odio nunc, in dignissim risus pharetra sit amet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla tincidunt lectus congue vestibulum fringilla. Proin libero tellus, tincidunt eu convallis vel, gravida a augue. Ut eleifend nisi nec commodo gravida. Vestibulum ultrices sollicitudin nunc pulvinar eleifend. Proin non elit vitae nunc fermentum accumsan ac quis ipsum. Mauris varius elit sed sapien mattis cursus. Ut vel quam facilisis, eleifend elit non, gravida ex. Duis dignissim lacus et ex semper lacinia sit amet ut quam. Curabitur dictum felis semper sem sagittis cursus.</span></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Donec maximus nibh rhoncus quam pharetra, ut porta sem consequat. Ut placerat faucibus lacus. Pellentesque lacus felis, viverra id accumsan nec, dapibus non ipsum. In sed mi ut urna iaculis interdum. Phasellus rhoncus tortor a varius commodo. Phasellus a sem eget lectus lobortis auctor. Nulla euismod nunc eget velit hendrerit, a tempus ex egestas. Nulla quis tincidunt eros. Quisque rhoncus metus vel orci faucibus, ac venenatis turpis ultrices. Quisque egestas sapien vulputate lorem tristique vulputate. Nunc id nunc ut orci fermentum porttitor at et massa.</span></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Aenean eu ipsum eu ante scelerisque pellentesque. Sed pulvinar ultricies sagittis. Ut tellus orci, convallis id risus in, pharetra pulvinar quam. Phasellus ut magna lorem. Quisque eget urna ac neque mattis commodo vel porta nisl. Pellentesque dapibus semper ipsum, ac vulputate dui consectetur at. Cras ullamcorper leo sit amet nibh porttitor congue. Donec in ultricies ligula. Vestibulum vulputate sapien ut cursus mattis. Fusce congue, erat id pretium efficitur, risus purus rhoncus sem, tempus dignissim sem tortor sed lorem.</span></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Morbi tristique lorem vel erat viverra, at sagittis purus consectetur. Integer iaculis finibus tellus, sit amet placerat est interdum et. Sed iaculis massa non augue pellentesque, id dapibus sem mollis. Phasellus lacus lectus, fermentum sed nibh sit amet, consectetur volutpat tellus. Nullam vestibulum convallis sem at molestie. In sodales libero nunc, eget consectetur justo tempus nec. Integer vitae blandit nulla, in maximus sem. Curabitur dapibus leo eu lectus ullamcorper egestas. Etiam fringilla leo ut rhoncus volutpat. Integer laoreet nunc ac dapibus posuere. Quisque sit amet ipsum feugiat, ultricies dui sed, dapibus quam.</span></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Phasellus egestas velit eget elementum convallis. Proin ipsum lacus, condimentum non sem a, pretium gravida nisl. Nunc vestibulum dictum enim, vitae dapibus mi interdum sed. Suspendisse auctor egestas placerat. Aenean lacus diam, blandit id rutrum id, scelerisque placerat lacus. Etiam consectetur posuere turpis eget dapibus. Nam et ultricies velit, dignissim tincidunt felis. Quisque molestie ligula eget lacus tempor, vel sollicitudin mauris consequat. Fusce tempor sem vel blandit consequat. Nullam dapibus, mi in egestas tempus, dolor neque mollis tortor, vel vulputate mauris lorem sed nulla. Nullam nibh arcu, rutrum non aliquam in, mollis in risus. Quisque sed fermentum lorem. Donec bibendum, nulla eu malesuada sagittis, justo tellus placerat eros, eget rutrum justo magna a justo.</span></p><div id=\"Content\" style=\"margin: 0px; padding: 0px; position: relative; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" center;\"=\"\"><div class=\"boxed\" style=\"margin: 10px 28.7969px; padding: 0px; clear: both;\"><div id=\"lipsum\" style=\"margin: 0px; padding: 0px; text-align: justify;\"><p style=\"margin-bottom: 15px; padding: 0px;\"><br></p></div></div></div>                ', 'edwin, javascript', 5, 'published', 22),
(2, 1, 'Javascript Course Post', 'Belinda', '2023-05-02', 'img3.jpg', '<b>Wow, this is a really cool post!        </b>                                ', 'javascript2, course, class, belinda', 0, 'published', 1),
(4, 1, 'JavaScript', 'Me', '2023-05-02', 'img4.jpg', 'Some post content... ^^                ', 'javascript, course', 4, 'published', 5),
(5, 1, 'HTML 5', 'Me', '2023-05-01', 'img2.jpg', 'Duis sed placerat dui. Nunc cursus egestas lectus, nec blandit dui convallis in. In sit amet sapien a ligula semper condimentum sed sit amet mauris. Aenean sed blandit odio, at posuere orci. Cras scelerisque feugiat sem, sit amet lobortis ex fringilla at. Mauris tortor neque, convallis a nulla vitae, rhoncus semper nisl. Sed placerat, turpis eu lacinia laoreet, justo felis accumsan nibh, eu molestie justo ipsum nec nisi. Integer dictum mi quis mollis lacinia. Fusce volutpat, neque eu consectetur varius, eros libero aliquet purus, non molestie justo eros vitae velit. Proin in nisi quam. Nunc ut nunc sagittis, efficitur lacus eget, rhoncus risus. Duis luctus iaculis tellus, tristique pharetra erat lobortis a. Quisque vitae neque diam.        ', 'javascript, course', 5, 'published', 1),
(7, 1, 'SCSS', 'Some Author', '2023-05-02', 'img1.jpg', '<h4><span style=\"font-family: Impact;\">Very interesting course!</span>                                        </h4>        ', 'SCSS, course', 4, 'published', 7),
(13, 17, 'fsddduytrtearwe', 'ARDFYDGUF', '2023-05-02', 'Perchik.png', 'RSADTSDYGFUHGIJOHIUYTREWARETSYUIOIHUGIYFUTDYDRSAETSDYFUGIHOI                                        ', 'ARTSYDUFIGJ', 5, 'draft', 2),
(16, 21, 'Woman', 'The Woman', '2023-04-29', 'photo.jpg', 'Irene Adler, professionally known as \"The Woman\", was a celebrity dominatrix and extortionist who had a brief attraction to Sherlock Holmes.[1]\r\nWhilst Mycroft is telling Sherlock about Irene, he states that she is a dominatrix who gives out \'recreational scolding\' to people. She has been in the middle of two political scandals in recent years, one of them involving a famous author, in which she had an affair with both sides.', 'photographer, women, movie', 1, 'published', 14),
(17, 1, 'Реклама', 'reclamare', '2023-05-01', 'Vermont.jpg', 'Рекла́ма[1] (лат. reclamare — «гукати раз-у-раз, знову викликати, повторно вигукувати»), забуте вихвала[2] — популяризація товарів, видовищ, послуг і т. ін. з метою привернути увагу покупців, споживачів, глядачів, замовників тощо, поширення інформації про когось, щось для створення популярності, а також візуальна та інша медіа-продукція — плакати, оголошення, відеокліпи, що використовуються як засіб привертання уваги потенційних споживачів[3].        ', 'interesting, news, ads', 2, 'published', 8),
(21, 13, 'Diploma', 'giga', '2023-05-02', 'апр.png', '<p style=\"margin-top: 0.5em; margin-bottom: 0.5em; color: rgb(32, 33, 34); font-family: sans-serif;\">A <b>diploma</b> is a document awarded by an educational institution (such as a college or university) testifying the recipient has <a href=\"https://en.wikipedia.org/wiki/Graduation\" title=\"Graduation\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">graduated</a> by successfully completing their courses of studies.<sup id=\"cite_ref-1\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Diploma#cite_note-1\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">[1]</a></sup> Historically, it has also referred to a charter or official document of <a href=\"https://en.wikipedia.org/wiki/Diplomacy\" title=\"Diplomacy\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">diplomacy</a>.<sup id=\"cite_ref-OED_2-0\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Diploma#cite_note-OED-2\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">[2]</a></sup><sup id=\"cite_ref-3\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Diploma#cite_note-3\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">[3]</a></sup></p><p style=\"margin-top: 0.5em; margin-bottom: 0.5em; color: rgb(32, 33, 34); font-family: sans-serif;\">The diploma (as a document certifying a qualification) may also be called a <b>testamur</b>, <a href=\"https://en.wikipedia.org/wiki/Latin\" title=\"Latin\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">Latin</a> for \"we testify\" or \"certify\" (testari), so called from the word with which the certificate begins;<sup id=\"cite_ref-4\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Diploma#cite_note-4\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">[4]</a></sup> this is commonly used in Australia to refer to the document certifying the award of a degree.<sup id=\"cite_ref-5\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Diploma#cite_note-5\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">[5]</a></sup><sup id=\"cite_ref-6\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Diploma#cite_note-6\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">[6]</a></sup><sup id=\"cite_ref-7\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Diploma#cite_note-7\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">[7]</a></sup> Alternatively, this document can simply be referred to as a degree certificate or graduation certificate, or as a <b>parchment</b>.<sup id=\"cite_ref-8\" class=\"reference\" style=\"line-height: 1; unicode-bidi: isolate; white-space: nowrap; font-size: 11.2px;\"><a href=\"https://en.wikipedia.org/wiki/Diploma#cite_note-8\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">[8]</a></sup> The certificate that a <a href=\"https://en.wikipedia.org/wiki/Nobel_Prize\" title=\"Nobel Prize\" style=\"color: rgb(51, 102, 204); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow-wrap: break-word;\">Nobel</a> laureate receives is also called a diploma.</p>                                        ', 'diploma, work', 0, 'published', 0),
(23, 14, 'Singularity', 'physics', '2023-05-02', 'images.jpg', '<h2 id=\"what-is-a-singularity-3\" style=\"margin: 0px 0px 0.7em; padding: 10px 0px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 700; font-stretch: inherit; line-height: 30px; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-optical-sizing:=\"\" inherit;=\"\" font-kerning:=\"\" font-feature-settings:=\"\" font-variation-settings:=\"\" font-size:=\"\" 24px;=\"\" vertical-align:=\"\" baseline;=\"\" width:=\"\" 853px;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" clear:=\"\" both;\"=\"\">What is a singularity?</h2><p style=\"margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: 1.5; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-optical-sizing:=\"\" inherit;=\"\" font-kerning:=\"\" font-feature-settings:=\"\" font-variation-settings:=\"\" font-size:=\"\" 16px;=\"\" vertical-align:=\"\" baseline;=\"\" width:=\"\" 853px;\"=\"\">Singularities can happen anywhere, and they are surprisingly common in the mathematics that physicists use to understand the universe. Put simply, singularities are places where the mathematics \"misbehave,\" typically by generating infinitely large values. There are examples of mathematical singularities throughout physics: Typically, any time an equation uses 1/X, as X goes to zero, the value of the equation goes to infinity.</p><aside class=\"hawk-nest\" data-render-type=\"fte\" data-skip=\"dealsy\" data-widget-type=\"seasonal\" data-widget-id=\"1d047e5d-58ed-4416-aff1-9c9261f2ef41\" data-result=\"missing\" style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: inherit; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-optical-sizing:=\"\" inherit;=\"\" font-kerning:=\"\" font-feature-settings:=\"\" font-variation-settings:=\"\" font-size:=\"\" 16px;=\"\" vertical-align:=\"\" baseline;=\"\" display:=\"\" inline;=\"\" --black:#1b1b1b;=\"\" --white:#fff;=\"\" --yellow:#ffd800;=\"\" --green:#3c8d0d;=\"\" --orange:#ff6f28;=\"\" --red:red;=\"\" --pink:#e6248a;=\"\" --light-blue:#97edfc;=\"\" --mid-grey:#333;=\"\" --light-grey:#eaeaea;=\"\" --grey:#adadad;=\"\" --dark-grey:#545454;=\"\" --light-mid-grey:#ccc;=\"\" --prime-blue:#00aeef;=\"\" --prime-green:#eaf7e9;=\"\" --lighter-mid-grey:#ebebeb;=\"\" --game-platform-grey:#dbddde;=\"\" --amazon-orange:#ffce00;=\"\" --amazon-prime-day-blue:#70b7d9;=\"\" --error-red:#f33f3f;=\"\" --playstation-blue:#003791;=\"\" --playstation-white:#fff;=\"\" --xbox-green:#107c10;=\"\" --nintendo-red:#e60012;=\"\" --trd-blue:#2f6e91;=\"\" --trd-pink:#e6248a;=\"\" --trd-light-pink:#ea489d;=\"\" --trd-grey:#ededed;=\"\" --trd-dark-grey:#333;=\"\" --trd-dark-blue:#315062;=\"\" --rose-gold:#b76e79;=\"\" --pc-orange:#ff8201;=\"\" --site-color:#5aaf0b;=\"\" --site-color-hover:#005f00;=\"\" --heading-color:#2f6e91;=\"\" --tab-color:var(--trd-blue);=\"\" --cc-border-color:var(--light-mid-grey);=\"\" --cc-filters-title-color:var(--black);=\"\" --expanded-row-color:var(--trd-blue);=\"\" --expanded-row-box-shadow:4px=\"\" 4px=\"\" 20px=\"\" var(--expanded-row-color);=\"\" --toggle-color:var(--trd-blue);=\"\" --toggle-switch-color:var(--trd-blue);=\"\" --postcode-entry-button-color:var(--site-color);=\"\" --comparison-load-more-background-color:#262626;=\"\" --tv-channels-display-label-color:#696969;=\"\" --index-color:#999;=\"\" --editors-pick-background-color:#ededed;=\"\" --editors-pick-promo-color:var(--trd-blue);=\"\" --editors-pick-promo-rgba-color:rgba(47,110,145,0.3);=\"\" --editors-pick-voucher-background-color:#e6248a;=\"\" --filter-border-color:#c1c1c1;=\"\" --filter-hover-border-color:#535353;=\"\" --filter-selected-hover-border-color:#666;=\"\" --countdown-in-progress-color:var(--trd-pink);=\"\" --rows-background-color:var(--white);=\"\" --hawk-footer-background:var(--trd-grey);=\"\" --hawk-footer-game-platform-border:solid=\"\" 1px=\"\" var(--game-platform-grey);=\"\" --hover-panel-color:orange;=\"\" --description-hover-background:#cac7c7;=\"\" --display-price-code-color:var(--site-color);=\"\" --site-font-family:=\"\" --hawk-tab-text-color:#666;=\"\" --hawk-tab-background:#d6d6d6;=\"\" --review-rows-background:var(--white);=\"\" --review-peacock-background:var(--white);=\"\" --product-label-background:var(--light-grey);=\"\" --product-label-text-color:var(--black);=\"\" --seasonal-event-grey:#797979;=\"\" --seasonal-event-dark-grey:#313131;=\"\" --seasonal-event-merchants-background:var(--white);=\"\" --game-platform-background:transparent;=\"\" --price-widget-padding:0=\"\" 0=\"\" 0.8em=\"\" 0;=\"\" --price-widget-padding-mobile:0=\"\" --was-price-text-color:#848484;=\"\" --was-price-promo-color:#be0707;=\"\" --was-price-light-promo-color:#ededed;=\"\" --was-price-light-promo-text-color:#be0707;=\"\" --dotw-header-border-top:1px=\"\" solid=\"\" #ddd;=\"\" --dotw-header-border-bottom:4px=\"\" #006ea9;=\"\" --dotw-toggle-background-color:#1b1b1b;=\"\" --dotw-search-input-border-color:#ddd;=\"\" --dotw-header-background:transparent;=\"\" --dotw-header-text-color:var(--black);=\"\" --user-input-color:#c1c1c1;=\"\" --user-input-hover-color:#535353;=\"\" --user-input-input-background:#f2f2f2;=\"\" --user-input-input-error-color:#838383;=\"\" --radio-button-color:#c1c1c1;=\"\" --checkbox-color:#c1c1c1;=\"\" --range-filter-shadow-color:#a9a9a9;=\"\" --range-filter-background-color:var(--site-color);=\"\" --pre-order-promise-color:#aaa;=\"\" --merchant-link-mona-background-color:var(--site-color);=\"\" --merchant-link-mona-text-color:var(--white);=\"\" --merchant-link-mona-text-color-hover:var(--white);=\"\" --merchant-link-border-radius:3px;=\"\" --mona-site-font-family:=\"\" --mona-site-text-color:=\"\" --mona-widget-extra-background:#a5a5a5;=\"\" --mona-widget-extra-backgound-hover:#a5a5a5;=\"\" --shop-filter-button-background-color:var(--trd-blue);=\"\" --shop-filter-button-text-color:var(--white);=\"\" --shop-font-family-headings:\"source=\"\" serif=\"\" pro\",serif;=\"\" --shop-font-family-secondary-text:sans-serif;=\"\" --available-from:var(--site-color);=\"\" --deal-widget-border-color:#ddd;=\"\" --deal-hero-promo-background:var(--grey);=\"\" --deal-hero-promo-color:#fff;=\"\" --deal-hero-promo-background-progressive:transparent;=\"\" --deal-hero-promo-color-progressive:#d21f26;=\"\" --deal-widget-hero-box-shadow-color:#e9e9e93b;=\"\" --sticky-promo-color:#e19c42;=\"\" --terms-conditions:#c0464a;=\"\" --voucher-promo:#c0464a;=\"\" --text-highlight:var(--site-color);=\"\" --promotion-primary-color:var(--white);=\"\" --promotion-secondary-color:var(--light-mid-grey);=\"\" --promotion-cta-background:var(--site-color);=\"\" --promotion-cta-text-color:var(--white);=\"\" position:=\"\" relative;=\"\" width:=\"\" 100%;\"=\"\"></aside><p style=\"margin-bottom: 1em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: 1.5; font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-optical-sizing:=\"\" inherit;=\"\" font-kerning:=\"\" font-feature-settings:=\"\" font-variation-settings:=\"\" font-size:=\"\" 16px;=\"\" vertical-align:=\"\" baseline;=\"\" width:=\"\" 853px;\"=\"\">Most of these singularities, however, can usually be resolved by pointing out that the equations are missing some factor, or noting the physical impossibility of ever reaching the singularity point. In other words, they are probably not \"real.\"</p>                                                        ', 'science, physics', 0, 'draft', 0),
(25, 13, 'Some post tile', 'John Doe', '2023-05-02', 'img1.jpg', '<h1 style=\"text-align: center; \"><span style=\"font-family: Impact;\">Some interesting content goes here.</span></h1><h1 style=\"text-align: center; \"><iframe frameborder=\"0\" src=\"//www.youtube.com/embed/Q-SAeLwMg18\" width=\"640\" height=\"360\" class=\"note-video-clip\"></iframe></h1><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras odio mauris, feugiat id orci ut, imperdiet vehicula orci. Nulla imperdiet odio nunc, in dignissim risus pharetra sit amet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla tincidunt lectus congue vestibulum fringilla. Proin libero tellus, tincidunt eu convallis vel, gravida a augue. Ut eleifend nisi nec commodo gravida. Vestibulum ultrices sollicitudin nunc pulvinar eleifend. Proin non elit vitae nunc fermentum accumsan ac quis ipsum. Mauris varius elit sed sapien mattis cursus. Ut vel quam facilisis, eleifend elit non, gravida ex. Duis dignissim lacus et ex semper lacinia sit amet ut quam. Curabitur dictum felis semper sem sagittis cursus.</span></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Donec maximus nibh rhoncus quam pharetra, ut porta sem consequat. Ut placerat faucibus lacus. Pellentesque lacus felis, viverra id accumsan nec, dapibus non ipsum. In sed mi ut urna iaculis interdum. Phasellus rhoncus tortor a varius commodo. Phasellus a sem eget lectus lobortis auctor. Nulla euismod nunc eget velit hendrerit, a tempus ex egestas. Nulla quis tincidunt eros. Quisque rhoncus metus vel orci faucibus, ac venenatis turpis ultrices. Quisque egestas sapien vulputate lorem tristique vulputate. Nunc id nunc ut orci fermentum porttitor at et massa.</span></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Aenean eu ipsum eu ante scelerisque pellentesque. Sed pulvinar ultricies sagittis. Ut tellus orci, convallis id risus in, pharetra pulvinar quam. Phasellus ut magna lorem. Quisque eget urna ac neque mattis commodo vel porta nisl. Pellentesque dapibus semper ipsum, ac vulputate dui consectetur at. Cras ullamcorper leo sit amet nibh porttitor congue. Donec in ultricies ligula. Vestibulum vulputate sapien ut cursus mattis. Fusce congue, erat id pretium efficitur, risus purus rhoncus sem, tempus dignissim sem tortor sed lorem.</span></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Morbi tristique lorem vel erat viverra, at sagittis purus consectetur. Integer iaculis finibus tellus, sit amet placerat est interdum et. Sed iaculis massa non augue pellentesque, id dapibus sem mollis. Phasellus lacus lectus, fermentum sed nibh sit amet, consectetur volutpat tellus. Nullam vestibulum convallis sem at molestie. In sodales libero nunc, eget consectetur justo tempus nec. Integer vitae blandit nulla, in maximus sem. Curabitur dapibus leo eu lectus ullamcorper egestas. Etiam fringilla leo ut rhoncus volutpat. Integer laoreet nunc ac dapibus posuere. Quisque sit amet ipsum feugiat, ultricies dui sed, dapibus quam.</span></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\"><span style=\"font-family: \"Courier New\";\">Phasellus egestas velit eget elementum convallis. Proin ipsum lacus, condimentum non sem a, pretium gravida nisl. Nunc vestibulum dictum enim, vitae dapibus mi interdum sed. Suspendisse auctor egestas placerat. Aenean lacus diam, blandit id rutrum id, scelerisque placerat lacus. Etiam consectetur posuere turpis eget dapibus. Nam et ultricies velit, dignissim tincidunt felis. Quisque molestie ligula eget lacus tempor, vel sollicitudin mauris consequat. Fusce tempor sem vel blandit consequat. Nullam dapibus, mi in egestas tempus, dolor neque mollis tortor, vel vulputate mauris lorem sed nulla. Nullam nibh arcu, rutrum non aliquam in, mollis in risus. Quisque sed fermentum lorem. Donec bibendum, nulla eu malesuada sagittis, justo tellus placerat eros, eget rutrum justo magna a justo.</span></p><div id=\"Content\" style=\"margin: 0px; padding: 0px; position: relative; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" center;\"=\"\"><div class=\"boxed\" style=\"margin: 10px 28.7969px; padding: 0px; clear: both;\"><div id=\"lipsum\" style=\"margin: 0px; padding: 0px; text-align: justify;\"><p style=\"margin-bottom: 15px; padding: 0px;\"><br></p></div></div></div>        ', 'edwin, javascript', 0, 'published', 1),
(26, 1, 'Javascript Course Post', 'Belinda', '2023-05-02', 'img3.jpg', '<b>Wow, this is a really cool post!        </b>                                ', 'javascript2, course, class, belinda', 0, 'published', 1),
(36, 1, 'JavaScript', 'Me', '2023-05-02', 'img4.jpg', 'Some post content... ^^                ', 'javascript, course', 0, 'published', 2),
(37, 1, 'HTML 5', 'Me', '2023-05-02', 'img2.jpg', 'Duis sed placerat dui. Nunc cursus egestas lectus, nec blandit dui convallis in. In sit amet sapien a ligula semper condimentum sed sit amet mauris. Aenean sed blandit odio, at posuere orci. Cras scelerisque feugiat sem, sit amet lobortis ex fringilla at. Mauris tortor neque, convallis a nulla vitae, rhoncus semper nisl. Sed placerat, turpis eu lacinia laoreet, justo felis accumsan nibh, eu molestie justo ipsum nec nisi. Integer dictum mi quis mollis lacinia. Fusce volutpat, neque eu consectetur varius, eros libero aliquet purus, non molestie justo eros vitae velit. Proin in nisi quam. Nunc ut nunc sagittis, efficitur lacus eget, rhoncus risus. Duis luctus iaculis tellus, tristique pharetra erat lobortis a. Quisque vitae neque diam.        ', 'javascript, course', 0, 'published', 9),
(38, 1, 'SCSS', 'Some Author', '2023-05-02', 'img1.jpg', '<h4><span style=\"font-family: Impact;\">Very interesting course!</span>                                        </h4>        ', 'SCSS, course', 1, 'published', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`) VALUES
(1, 'rico', 'pass123', 'Ricos', 'Suaves', 'ricosuave@gmail.com', '', 'subscriber'),
(33, 'sofik23', '$2y$10$46b22ef85dec077a61cd6uZ02tdIEuOGn4d.6Pnrm3H/MAmEblny2', '', '', 'sofik@gmail.com', '', 'admin'),
(34, 'sofiykafedor', '$2y$10$9eee6bda49d66463da0e1uvxkH9nRQnd2BYTzgpCVsJP8dTOdSr8e', '', '', 'sofiykafedor@gmail.com', '', 'subscriber'),
(37, 'sofiia', '$2y$10$e3QwtTbRdLjA5PaaCEXFOemjHDw7d4zzwlSK.Bzsln8HB1UuCVBvq', 'Sofiia', 'Fedor', 'sofiia@gmail.com', '', 'subscriber'),
(40, 'demo', '$2y$10$kIK5invs1xvEMFf7M4eMhejleamdjtTZqtr4Qdg6JB5riJ0YasPpe', 'demo', 'test', 'demo@test.com', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(9) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(4, 'bejs262i9kl53gokq5ichvpjsm', 1683887440),
(5, '5j2thcpcv2guei7ql87d12mn4u', 1683142568),
(6, 'ca1jv4mv2gibuhnnuccp63bi3a', 1683142555),
(7, 'du0oj13kr0ds257969tuc3rfk8', 1683143158),
(8, 'mpiu3os2rbnojqe3ohiftp8vj2', 1683143410),
(9, 'h9ntdijot9r19ka7sn5sof38nu', 1683144840),
(10, 'kjvuh4l0oos09pf9rgjigd7u2q', 1683144983);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
