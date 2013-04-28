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
	levelHint.insert(0, "Energy, Mass and a Constant"); //e=mc2
	levelHint.insert(1, "Crawl before you stand, stand before you..."); //standing,walking,running
	levelHint.insert(2, "GO starts everything"); //traffic lights
	levelHint.insert(3, "3x W"); //world wide web
	levelHint.insert(4, "Earth is SMALL in comparison"); //planet size
	levelHint.insert(5, "Count points or just play the pawn"); //chess
	levelHint.insert(6, "1000 grams = 1 KILOgram"); //weight kilo
	levelHint.insert(7, "We need a TERAbit of RAM on a phone"); //size tera
	levelHint.insert(8, "CENTI is smack in the middle"); // measurement centi
	levelHint.insert(9, "A MICRO chip is small, but it could be smaller"); //size micro,nano
	levelHint.insert(10, "Don't let the seconds fool you"); // speed
	levelHint.insert(11, "Just kill it!"); //ctrl, alt, del
	levelHint.insert(12, "As easy as A, B, C"); //letters
	levelHint.insert(13, "Like taking candy from a baby"); //numbers
	levelHint.insert(14, "IV < V"); //roman numerals
	levelHint.insert(15, "Don't let ASCENDING binary scare you"); //roman numerals
	levelHint.insert(16, "As easy as 1, 2, 3 but with EDGES"); //shapes
	levelHint.insert(17, "Kelvin can be very, very cold"); //temperature
	levelHint.insert(18, "What's your TYPE?"); //qwerty
	levelHint.insert(19, "Everything STARTs from the sun"); //planet order from the sun
	levelHint.insert(20, "Short ISN'T what it seems"); //starbucks cup sizes
	levelHint.insert(21, "Pi is the prize"); //pi
	levelHint.insert(22, "What goes up, must come down"); //gravity
	levelHint.insert(23, "Visible light aka colors of the rainbow"); //light spectrum
	levelHint.insert(24, "Always START with a tbsp of sugar in my coffee"); //volume
	levelHint.insert(25, "As reliable as an ATOMIC NUMBER"); //h, li, b (lighest elements???)
	levelHint.insert(26, "Hydrogen is a very COMMON element"); //most common elemts in the universe
	levelHint.insert(27, "Increasing destruction"); //weapons across time
	levelHint.insert(28, "Warriors from the beginning of time"); //warriors
	levelHint.insert(29, "King of the Jungle is always last"); //top of the food chain
	levelHint.insert(30, "A, B, E are exactly what they seem"); //greek
	levelHint.insert(31, "Xray wavelengths are SHORT. Start with long"); //electromagnetic spectrum
	levelHint.insert(32, "TRAVELing through history"); //travel types
	levelHint.insert(33, "Aries is the sign of rebirth aka the beginning"); //zodiac
	levelHint.insert(34, "Danger Will Robinson. Danger!"); //danger to you
	levelHint.insert(35, "The mysterious 8-track is 2rd"); //evolution of listening to audio
	levelHint.insert(36, "In storage capacity, SIZE does matters"); //evolution of storage capacity
	levelHint.insert(37, "Morse code anyone?"); //morse code
	levelHint.insert(38, "Don't touch the braille"); //braille
	levelHint.insert(39, "One last level..."); //wp7

}

LevelHints::~LevelHints() {
}

QString LevelHints::getHint(int level) {

	QString hint;
	if (level <= levelHint.count()) {
		hint = levelHint[level];
	}

	return hint;
}

