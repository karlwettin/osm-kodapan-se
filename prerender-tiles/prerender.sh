#!/bin/bash

# This script executes prerendering of all the tiles listed in the .txt files in the tilelists subdirectory.
# At the time of writing this text that ment the some 40 largest cities in Sweden at all but the greatest zoom levels.
#
# If you want to render more than style "hyddafull" you'll need to add another identical line using antother style name as suffix
# E.g. 
# cat tilelists/*.txt | render_list -s /var/run/renderd/renderd.sock -m foobar
#
# I lost the script that creates tilelist files, but read here on how to convert bbox to tile numbers:
# http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames
#
# Java example:
# public class slippytest {
#   public static void main(String[] args) {
#     int zoom = 10;
#     double lat = 47.968056d;
#     double lon = 7.909167d;
#     System.out.println("http://tile.openstreetmap.org/" + getTileNumber(lat, lon, zoom) + ".png");
#   }
#   public static String getTileNumber(final double lat, final double lon, final int zoom) {
#     int xtile = (int)Math.floor( (lon + 180) / 360 * (1<<zoom) ) ;
#     int ytile = (int)Math.floor( (1 - Math.log(Math.tan(Math.toRadians(lat)) + 1 / Math.cos(Math.toRadians(lat))) / Math.PI) / 2 * (1<<zoom) ) ;
#     return("" + zoom + "/" + xtile + "/" + ytile);
#   }
# }

cat tilelists/*.txt | render_list -s /var/run/renderd/renderd.sock -m hyddafull
