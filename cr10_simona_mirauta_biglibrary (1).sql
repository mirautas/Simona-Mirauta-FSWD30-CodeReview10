-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Feb 2018 um 15:18
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr10_simona_mirauta_biglibrary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'Jojo', 'Moyes'),
(2, 'Jeffrey', 'Archer'),
(3, 'Gertrude', 'Pressburger'),
(4, 'Norbert', 'Pautner'),
(5, 'Mikael', 'Lindnord'),
(6, 'Martin', 'Wehrle'),
(7, 'Tone', 'Finnanger'),
(8, 'Barbara', 'Berckhan'),
(9, 'Simona', 'Ahrnstedt'),
(10, 'Camilla', 'Läckberg'),
(11, 'Jamie', 'Oliver'),
(12, 'Nadia', 'Damaso'),
(13, 'Riccardo', 'Muti'),
(14, 'Michael', 'Bublé'),
(15, 'Michael', 'Bublé'),
(16, 'Rend', 'Collective'),
(17, 'Sia', 'Sia'),
(18, 'The Piano', 'Guys'),
(19, 'Nick', 'Cassavetes'),
(20, 'Hermine', 'Huntgeburth'),
(21, 'Marcus', 'O. Rosenmüller'),
(22, 'Bruno', 'Chiche');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

CREATE TABLE `media` (
  `media_id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `photo` varbinary(100) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `ISBN` mediumint(20) DEFAULT NULL,
  `short_description` varchar(300) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `status` enum('available','reserved') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `media`
--

INSERT INTO `media` (`media_id`, `title`, `photo`, `author_id`, `ISBN`, `short_description`, `publish_date`, `publisher_id`, `type`, `status`) VALUES
(1, 'Mein Herz in zwei Welten', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f35363934393339362d30302d30302e6a7067, 1, 1000301, '\"Trag deine Ringelstrumpfhosen mit Stolz. Führe ein unerschrockenes Leben. Fordere dich heraus. Lebe einfach.\"', '0000-00-00', 1, 'book', 'reserved'),
(2, 'Kain und Abel', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f36323239353032362d30302d30302e6a7067, 2, 8388607, 'Nach russischer Kriegsgefangenschaft gelangt Abel Rosnovski, unehelicher Sohn eines polnischen Adligen, mit einem Auswandererschiff nach Amerika.', '2018-01-09', 2, 'book', 'available'),
(3, 'Gelebt, erlebt, überlebt', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f38323937363634382d30302d30302e6a7067, 3, 8388607, 'Gertrude Pressburger war zehn, als Hitler in Österreich einmarschierte. Obwohl die jüdische Familie katholisch getauft worden war, musste sie fliehen.', '2018-01-29', 3, 'book', 'reserved'),
(4, 'Handlettering. Die 33 schönste', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f36323338393035372d30302d30302e6a7067, 4, 8388607, '... man muss nur wissen, wie es geht. In diesem Praxisbuch werden Buchstabe für Buchstabe die 33 schönsten Schriften vorgestellt.', '2017-10-02', 4, 'book', 'reserved'),
(5, 'Arthur', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f34353335313932342d30302d30302e6a7067, 5, 8388607, 'Im November 2014 starten vier Ausnahmesportler ein Rennen der Extraklasse. Inmitten der Wildnis treffen sie auf einen herrenlosen Hund, der ihnen nach einer gemeinsamen Kötbullar-Mahlzeit nicht mehr von der Seite weicht.', '2016-10-06', 5, 'book', 'available'),
(6, 'Der Klügere denkt nach', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f34373837383338362d30302d30302e6a7067, 6, 8388607, 'Der Erfolgsautor Martin Wehrle ist Deutschlands bekanntester Karriere- und Lebenscoach. Seine Bücher haben rund um den Globus begeisterte Leser gefunden.', '2017-04-10', 6, 'book', 'available'),
(7, 'Tildas Haus', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f31343537353932312d30302d30302e6a7067, 7, 8388607, 'Willkommen in Tildas Welt\r\nTreten Sie ein in Tildas Haus und entdecken Sie eine Welt voller himmlischer Dekorationen.', '2007-09-21', 7, 'book', 'reserved'),
(8, 'Wahre Stärke muss nicht kämpfe', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f34323534313230332d30302d30302e6a7067, 8, 8388607, 'Wer immer nur nett ist und macht, was andere von einem wollen, verrät seine eigenen Bedürfnisse und lässt sich steuern, anstatt selbst die Richtung zu bestimmen.', '2015-09-05', 8, 'book', 'available'),
(9, 'After Work', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f36343438313431382d30302d30302e6a7067, 9, 8388607, 'Stell dir vor, du triffst einen Mann in einer Bar. Und er ist sehr nett, gutaussehend und interessant. Und du küsst ihn. Dann stell dir vor, du kommst am nächsten Morgen ins Büro und er ist dein neuer Chef. ', '2018-03-29', 9, 'book', 'reserved'),
(10, 'Die Eishexe', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f36343738383235342d30302d30302e6a7067, 10, 8388607, 'Ganz Fjällbacka ist auf den Beinen, denn ein kleines Mädchen wird vermisst. Vor 30 Jahren ist in den Wäldern des beschaulichen Küstenorts schon einmal ein Mädchen verschwunden und kurze Zeit später tot aufgefunden worden.', '2018-01-02', 10, 'book', 'available'),
(11, 'Genial Gesund', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f34353236313136392d30302d30302e6a7067, 11, 8388607, 'In »Genial gesund – Superfood for Family & Friends« dreht sich alles um gesundes Essen, das supereinfach und natürlich auch superlecker ist.', '2016-07-21', 11, 'book', 'available'),
(12, 'Eat Better Not Less', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f34323734373439392d30302d30302e6a7067, 12, 8388607, 'Nadia Damaso ist neben ihrer Ausbildung an der Film-Schauspielschule eine leidenschaftliche Food-Bloggerin aus der Schweiz. Sie liebt es, zu experimentieren, und kreiert täglich neue Rezepte, auf die unterdessen Menschen auf der ganzen Welt warten.', '2015-10-15', 12, 'book', 'available'),
(13, 'Neujahrskonzert 2018', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f38313631313935352d30302d30302e6a7067, 13, 8388607, 'Neujahrskonzert 2018, Wiener Philharmoniker,Riccardo Muti', '2018-01-08', 13, 'cd', 'available'),
(14, 'Nobody But Me (Deluxe Version)', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f34363138363031312d30302d30302e6a7067, 14, 8388607, 'Die aufregende neue Song-Kollektion, die aus großartigen Eigenkompositionen und wunderschönen Interpretationen von Standards besteht und insgesamt 13 Titel enthält, zeigt einmal mehr, dass MICHAEL BUBLÉ ein brillanter Interpret amerikanischer Klassiker und gleichzeitig ein begnadeter Songwriter und ', '2016-10-21', 14, 'cd', 'reserved'),
(15, 'To Be Loved', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f33343530323836382d30302d30302e6a7067, 15, 8388607, 'To Be Loved ist der direkte Nachfolger seines weltweit 7 Millionen Mal verkauften Weihnachtsalbums Christmas, das als zweitmeist verkauftes Album des Jahres 2011 in die Musikgeschichte einging und sich Ende 2012 auf Platz 1 in den deutschen Charts platzierte, nachdem es schon 2011 Platz 3 erreicht h', '2013-04-12', 15, 'cd', 'available'),
(16, 'Campfire Christmas Vol.1', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f34333833343536302d30302d30302e6a7067, 16, 8388607, 'Wunderschöner Weihnachtsalbum mit einem Hauch irish Volk.', '2015-10-23', 16, 'cd', 'reserved'),
(17, 'Some People Have Real Problems', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f31363430313539342d30302d30302e6a7067, 17, 8388607, 'Extraordinär, originell, überirdisch gut! Die Solo-CD der ehemaligen Zero 7-Sängerin ist mit Abstand die beste des Jahres.', '2009-01-30', 17, 'cd', 'reserved'),
(18, 'Christmas Together', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f37383438363637322d30302d30302e6a7067, 18, 8388607, 'Christmas Together ist das Motto für das zweite Weihnachtsalbum der Piano Guys! Zusammen mit musikalischen Freunden und Weggefährten zündet die legendäre Klassik-Pop Gruppe aus Utha (USA) ein Feuerwerk der Weihnachtshits und verbindet auf ihre einmalige Art die ewigen Klassiker mit den schönsten Pop', '2017-10-27', 18, 'cd', 'available'),
(19, 'Wie ein einziger Tag', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f31363330393531342d30302d30302e6a7067, 19, 8388607, 'Ein Mann liest in einem Pflegeheim einer unter Alzheimer leidenden Frau Geschichten aus einem alten Notizbuch vor. Diese erzählen von der Liebe zwischen Noah und Allie, Teenager unterschiedlicher Herkunft, die sich um 1940 in einem Küstenstädtchen in North Carolina kennen lernen,...', '2005-03-07', 19, 'DVD', 'reserved'),
(20, 'Huck Finn & Tom Sawyer (2 DVDs', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f33373232373238332d30302d30302e6a7067, 20, 8388607, 'Tom Sawyer hat den Kopf voller Streiche und treibt sich, wenn er nicht gerade ein neues Abenteuer ausheckt, am liebsten mit seinem besten Kumpel Huck Finn herum - sehr zum Leidwesen seiner Tante Polly, die Tom zu einem verantwortungsbewussten, anständigen Menschen erziehen möchte.', '2013-10-01', 20, 'DVD', 'available'),
(21, 'Wunderkinder', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f33303634323132382d30302d30302e6a7067, 21, 8388607, 'Ukraine, 1941: Der junge, hochbegabte Violinist Abrascha und die Pianistin Larissa werden als Wunderkinder gefeiert. Die jüdischen Kinder spielen in den großen Konzertsälen Russlands, vor der Parteielite und sogar vor Stalin. Hanna Reich, Tochter eines deutschen Brauers, wünscht sich nichts sehnlich', '2012-04-19', 21, 'DVD', 'available'),
(22, 'Small World', 0x68747470733a2f2f6d656469612e627563682e64652f696d672d6164622f32383133363430372d30302d30302e6a7067, 22, 8388607, 'Mit fortschreitendem Alter rücken bisweilen Erinnerungen aus der Kindheit stärker ins Bewusstsein als die Erlebnisse des gerade vergangenen Tages. So geht es auch dem alternden Freigeist Konrad, den es zurück in den Schoß der Industriellen-Familie Senn zieht, bei der er seine Kindheit verbracht hat.', '2011-06-10', 22, 'DVD', 'available');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `adress` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `adress`) VALUES
(1, 'Wunderlich', 'Hamburger Straße 17,  D-21465 Reinbek'),
(2, 'Heyne', 'Neumarkter Str. 28,  D-81673 München'),
(3, 'Zsolnay', 'Prinz-Eugen-Straße 30, A-1040 Wien'),
(4, 'Bassermann', 'Neumarkter Str. 28,  D-81673 München'),
(5, 'Edel', 'Neumühlen 17,  D-22763 Hamburg'),
(6, 'Mosaik Verlag', 'Neumarkter Str. 28,  D-81673 München'),
(7, 'Droemer Knaur V', 'Gänsheidestraße 26,  D-70184 Stuttgart'),
(8, 'Gräfe & Unzer', 'Grillparzerstraße 12,  D-81675 München'),
(9, 'LYX', 'Bernstorffstr.120, D-22767 Hamburg'),
(10, 'List Medien AG', 'Seestrasse 104, CH-6052 Hergiswil'),
(11, 'Dorling Kinders', 'Arnulfstraße 124, D-80636 München'),
(12, 'FONA', 'Aarauerstrasse 25,  CH-5600 Lenzburg 1'),
(13, 'Sony Music Ente', 'Mariahilfer Straße 77-79, A-1060 Wien'),
(14, 'Warner Music', 'Alter Wandrahm 14, D-20457 Hamburg'),
(15, 'Warner Music', 'Alter Wandrahm 14, D-20457 Hamburg'),
(16, 'Gerth Medien', 'Dillerberg 1, D-35614 Asslar'),
(17, 'Universal Music', 'Schwarzenbergplatz 2, A-1010 Wien'),
(18, '	Sony Music Ent', 'Mariahilfer Straße 77-79, A-1060 Wien'),
(19, 'Warner Home Vid', 'Humboldtstraße 62, D-22083 Hamburg '),
(20, '20th Century Fo', 'Hintzerstraße 11/3 A-1030 Wien'),
(21, 'Arthaus', 'Neue Promenade 4, D-10178 Berlin'),
(22, '20th Century Fo', 'Hintzerstraße 9/3, 1030 Wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`) VALUES
(0, 'simona', 'mirauta@gmx.at', 'c41bcb58b468a5a8a6fbb4bb3164a9c4c292fe9358aa875606d675b729894d81'),
(1, 'Celina Hunt', 'hunt@yahoo.com', 'celina123'),
(2, 'Erich Zettel', 'erich@gmail.com', 'erich123'),
(3, 'Marlene Schust', 'm.schust@yahoo.com', 'marlene123'),
(4, 'Diego Santes', 'santes@gmx.de', 'diego123'),
(5, 'Johanna Engelbert', 'engelbert@gmail.com', 'johanna123'),
(6, 'Daniel Egger', 'egger.d@gmx.de', 'daniel123'),
(7, 'Michael Bauer', 'bauer@yahoo.com', 'michael123'),
(8, 'David Green', 'd.green@gmail.com', 'david123'),
(9, 'Andrea Richter', 'richter@aol.de', 'andrea123'),
(10, 'Li Ming', 'ming@yahoo.com', 'li123'),
(11, 'Kevin Wood', 'wood@gmx.at', 'kevin123');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `FK_author_id` (`author_id`),
  ADD KEY `FK_publisher_id` (`publisher_id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `FK_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
