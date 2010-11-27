// Box for beagleboard, (c) 2010 - Koen Kooi, licensed under CC-BY-SA

include <../bitmap.scad>

chars = ["B","e","a","g","l","e","b","o","a","r","d"];
char_count = 11;

import_stl("beaglebox2.stl");

translate(v=[42.8,-32, 12]) {
   rotate(a = [0, 90, 0]) 8bit_str(chars, char_count, 0.8, 1);
}