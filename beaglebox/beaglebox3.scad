// Box for beagleboard, (c) 2010 - Koen Kooi, licensed under CC-BY-SA

use <../mcad/bitmap/bitmap.scad>;

chars = ["B","e","a","g","l","e","B","o","a","r","d"];
char_count = 11;

difference() {
	import_stl("beaglebox-xm-nologo.stl");

	#translate(v=[45.8,-32, 12]) {
   		rotate(a = [0, 90, 0]) 8bit_str(chars, char_count, 0.8, 1);
	}
}