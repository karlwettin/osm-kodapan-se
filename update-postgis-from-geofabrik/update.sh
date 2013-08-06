#!/bin/bash

# This script downloads the latest dumps from Geofabrik, import them to PostGIS and restarts the tileserver.


rm -rf tmp
mkdir tmp
cd tmp
mkdir download
cd download


wget http://download.geofabrik.de/europe/denmark-latest.osm.bz2
wget http://download.geofabrik.de/europe/estonia-latest.osm.bz2
wget http://download.geofabrik.de/europe/faroe-islands-latest.osm.bz2
wget http://download.geofabrik.de/europe/finland-latest.osm.bz2
wget http://download.geofabrik.de/europe/iceland-latest.osm.bz2
wget http://download.geofabrik.de/europe/latvia-latest.osm.bz2
wget http://download.geofabrik.de/europe/lithuania-latest.osm.bz2
wget http://download.geofabrik.de/europe/norway-latest.osm.bz2
wget http://download.geofabrik.de/europe/sweden-latest.osm.bz2

wget http://download.geofabrik.de/europe/germany/mecklenburg-vorpommern-latest.osm.bz2
wget http://download.geofabrik.de/europe/germany/schleswig-holstein-latest.osm.bz2

bunzip2 *

cd ..
../osmconvert --verbose --merge-versions -o=merged.osm download/*.osm
osm2pgsql --slim -C 1500 merged.osm

sudo touch /var/lib/mod_tile/planet-import-complete
sudo /etc/init.d/renderd restart

cd ..

