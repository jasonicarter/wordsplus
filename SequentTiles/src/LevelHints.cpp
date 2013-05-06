/*
 * LevelHints.cpp
 *
 *  Created on: 2013-04-28
 *      Author: Jason
 */

#include "LevelHints.hpp"

LevelHints::LevelHints() {

	//better if pulled from config/xml file?
	//START AT '1' BECAUSE LEVELS START AT 1
	levelHint.insert(1, "As easy as A, B, C...D");
	levelHint.insert(2, "Like taking candy from a baby");
	levelHint.insert(3, "If it's not the Q10...");
	levelHint.insert(4, "Everyone knows about Einstein"); //e=mc2
	levelHint.insert(5, "6 O'Clock is the best time for news");
	levelHint.insert(6, "aka Image Maximum");
	levelHint.insert(7, "If you can't backflip, try this instead");
	levelHint.insert(8, "Prevent this with socks");
	levelHint.insert(9, "You break out in hives, they live in it");
	levelHint.insert(10, "Http://");
	levelHint.insert(11, "Real news always has one of these");
	levelHint.insert(12, "Breathe out");
	levelHint.insert(13, "2 Hydrogens, 1 Oxygen");
	levelHint.insert(14, "Use a compass to point these out");
	levelHint.insert(15, "It's an Organic type of tv");
	levelHint.insert(16, "It's a barcode, but better");
	levelHint.insert(17, "What's your TYPE?"); //qwerty
	levelHint.insert(18, "Never drive through one of these");
	levelHint.insert(19, "Sunset anyone?");
	levelHint.insert(20, "Even the Greeks thought gold was first");
	levelHint.insert(21, "2 pies make a whole circle");
	levelHint.insert(22, "Whenever you want the latest software");
	levelHint.insert(23, "Between a boat and cruise liner");
	levelHint.insert(24, "It's a cooke!");
	levelHint.insert(25, "Normally 6-8 characters long");
	levelHint.insert(26, "I love my Air Jordan's");
	levelHint.insert(27, "As a pet where would it live?");
	levelHint.insert(28, "It runs like...");
	levelHint.insert(29, "Wise people are educated");
	levelHint.insert(30, "You lock your Windows with it"); //ctrl, alt, del
	levelHint.insert(31, "Goldfish love them");
	levelHint.insert(32, "Put the horse before the cart");
	levelHint.insert(33, "To show in advance");
	levelHint.insert(34, "Some your smoke, this you plant");
	levelHint.insert(35, "If you teach a man to fish, you're a...");
	levelHint.insert(36, "We all have these on our head");
	levelHint.insert(37, "Use these to listen to music");
	levelHint.insert(38, "If you're on this, you probably have a jacket to match");
	levelHint.insert(39, "To serve and protect");
	levelHint.insert(40, "x2, x4, x5, x10, ...");
	levelHint.insert(41, "Doing nice things makes you...");
	levelHint.insert(42, "If you are or were confined here");
	levelHint.insert(43, "aka fooling around");
	levelHint.insert(44, "If you want to postpone take one of these");
	levelHint.insert(45, "You're in the Army now");
	levelHint.insert(46, "OMG, LOL, ...");
	levelHint.insert(47, "Count points or just play the pawn");
	levelHint.insert(48, "Crawl before you stand, stand before you...");
	levelHint.insert(49, "Always eat your fruit");
	levelHint.insert(50, "A different kind of food chain");
	levelHint.insert(51, "A lavatory");
	levelHint.insert(52, "The day starts at 00:00");
	levelHint.insert(53, "What goes up, must come down"); //gravity
	levelHint.insert(54, "A cookie house made of ginger???");
	levelHint.insert(55, "You don't put a cup of sugar in your coffee");
	levelHint.insert(56, "Think robinhood, midevil and castles");
	levelHint.insert(57, "If it's cloudy outside it's probably this");
	levelHint.insert(58, "Hand drawn images are sometimes called");
	levelHint.insert(59, "All about icons");
	levelHint.insert(60, "Cassette tapes are old school"); //evolution of listening to audio
	levelHint.insert(61, "It's hard to find the right size");
	levelHint.insert(62, "When it's too hot to hold without one");
	levelHint.insert(63, "On a browser it's a back button");
	levelHint.insert(64, "Chirping birds is a sweet song");
	levelHint.insert(65, "It aint no jackhammer");
	levelHint.insert(66, "Strolling around in space");
	levelHint.insert(67, "Bing vs Google");
	levelHint.insert(68, "IV < V"); //roman numerals
	levelHint.insert(69, "Don't let ASCENDING binary scare you");
	levelHint.insert(70, "This Pi you can't eat"); //pi
	levelHint.insert(71, "You can only pause something that's playing first");
	levelHint.insert(72, "Earth is SMALL in comparison");
	levelHint.insert(73, "GO starts everything");
	levelHint.insert(74, "Cruise liners hold a lot of passengers");
	levelHint.insert(75, "Everything starts from the sun"); //planet order from the sun
	levelHint.insert(76, "Turn right first");
	levelHint.insert(77, "A and B are exactly what they seem"); //greek
	levelHint.insert(78, "Grande is not that grand"); //starbucks cup sizes
	levelHint.insert(79, "Don't let the m/s fool you");
	levelHint.insert(80, "As easy as 1, 2, 3 but with edges");
	levelHint.insert(81, "Work your way up to kilo");
	levelHint.insert(82, "Let's stop at terabytes");
	levelHint.insert(83, "Centi is smack in the middle");
	levelHint.insert(84, "A micro chip is small, but it could be smaller");
	levelHint.insert(85, "In storage capacity, size does matters"); //evolution of storage capacity
	levelHint.insert(86, "Quart and Oz are bookends, but which ends?"); //volume
	levelHint.insert(87, "Visible light aka colors of the rainbow"); //light spectrum
	levelHint.insert(88, "History lessons start from the beginning"); //light spectrum
	levelHint.insert(89, "Kelvin can be very, very cold"); //temperature
	levelHint.insert(90, "As reliable as an atomic number"); //h, li, b (lighest elements???)
	levelHint.insert(91, "Hydrogen is a very common element"); //most common elemts in the universe
	levelHint.insert(92, "Reach for the stars"); //light spectrum
	levelHint.insert(93, "Travelling through history"); //travel types
	levelHint.insert(94, "Danger Will Robinson. Danger!"); //danger to you
	levelHint.insert(95, "Warriors from the beginning of time"); //warriors
	levelHint.insert(96, "History of mass destruction"); //weapons across time
	levelHint.insert(97, "Visible light wavelengths are SHORT. Start with long"); //electromagnetic spectrum
	levelHint.insert(98, "Aries is the sign of rebirth aka the beginning"); //zodiac
	levelHint.insert(99, "Morse code anyone?"); //morse code
	levelHint.insert(100, "Don't touch the braille"); //braille


}

LevelHints::~LevelHints() {
}

QString LevelHints::getHint(int level) {

	QString hint;
	if (level <= levelHint.count()) {
		hint = levelHint[level];
	}else {
		hint = "Hint doesn't exist for this level";
	}

	return hint;
}

