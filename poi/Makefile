ORIGINALPOIS=Airport.ov2 Amusement\ Park.ov2 Beach.ov2 Camping\ Ground.ov2 Car\ Dealer.ov2 Car\ Repair\ Facility.ov2 Casino.ov2 Cinema.ov2 College\ University.ov2 Company.ov2 Concert\ Hall.ov2 Convention\ Centre.ov2 Courthouse.ov2 Cultural\ Center.ov2 Dentist.ov2 Doctor.ov2 Embassy.ov2 Exhibition\ Center.ov2 Ferry\ Terminal.ov2 Frontier\ Crossing.ov2 Golf\ Course.ov2 Government\ Office.ov2 Hospital\ Polyclinic.ov2 Hotel-Motel.ov2 Library.ov2 mountain\ Peak.ov2 museum.ov2 Nightlife.ov2 Open\ Parking.ov2 Opera.ov2 Park\ and\ Recreation\ Area.ov2 Parking\ Garage.ov2 Petrol\ Station.ov2 Pharmacy.ov2 Place\ of\ Worship.ov2 Police\ Station.ov2 Post\ Office.ov2 Railway\ Station.ov2 Rent\ Car\ Facility.ov2 Rent\ Car\ Parking.ov2 Rest\ Area.ov2 Restaurant.ov2 scenic-Panoramic\ View.ov2 shop.ov2 shopping\ Center.ov2 sports\ Centre.ov2 stadium.ov2 swimming\ Pool.ov2 Tennis\ Court.ov2 Theatre.ov2 Tourist\ Attraction.ov2 Tourist\ Information\ Office.ov2 Turisticke_znamky.ov2 Undef9359.ov2 Undef9372.ov2 Veterinarian.ov2 Water\ Sport.ov2 Winery.ov2 yacht\ Basin.ov2 Zoo.ov2

POIDATAPOIS=$(addprefix poi.dat/, ${ORIGINALPOIS})

default: all

cleancz: clean_todevice clean_poi.dat_cz

clean: clean_todevice clean_poi.datA

clean_poi.dat_cz:
	echo Cleaning poi.dat CZ POIs
	cd poi.dat; rm CZ-*.ov2 CZ-*.bmp SK-*.ov2 SK-*.bmp *.poi *.asc 2> /dev/null; true

clean_poi.dat:
	echo Cleaning poi.dat all POIs
	cd poi.dat; rm *.ov2 *.bmp *.poi *.asc 2> /dev/null; true

clean_todevice:
	echo Cleaning todevice
	#cd todevice; rm *.ov2 *.asc *.poi *.bmp poi.dat 2> /dev/null; true
	cd todevice; rm * 2> /dev/null; true


pois:
	echo Extracting POIs from poi.dat
	./bin/extract_ttpoi.pl -f fromdevice/poi.dat -w poi.dat/ -o -z us

$(POIDATAPOIS):
ifeq ($(POISDONE), 1)
	echo At least $@ is missing => Extract POIs from poi.dat
	./bin/extract_ttpoi.pl -f fromdevice/poi.dat -w poi.dat/ -o -z us
	POISDONE=1
endif

separate:
	echo Separating POIs
	sleep 3
	cp -p data/*.ov2 data/*.bmp todevice
	#cat "etc/merge.lst" | cut -f2 -d= | while read i; do; echo -n "#"; name=`basename "$$i" .ov2`; [ -w "todevice/$$name.bmp" ] && mv "todevice/$$name.bmp" "poi.dat"; [ -w "todevice/$$i" ] && mv "todevice/$$i" "poi.dat"; done; echo
	TMPF=/tmp/poitodevice.tmp; echo > $$TMPF; cat "etc/merge.lst" | cut -f2 -d= | while read i; do; name="`basename "$$i" .ov2`"; [ -w "todevice/$$name.bmp" ] && echo "mv \"todevice/$$name.bmp\" poi.dat" >> $$TMPF; [ -w "todevice/$$i" ] &&  echo "mv \"todevice/$$i\" poi.dat" >> $$TMPF; done; source $$TMPF && rm $$TMPF
	#mv `cat "etc/merge.lst" | cut -f2 -d= | sed -n 's# #\\ #g;s#\(.*\)\.ov2$$#"todevice/\1.bmp" "todevice/&"#p'` poi.dat

todevice/poi.dat: ./etc/merge.lst $(POIDATAPOIS) separate
	echo Creating poi.dat
	cd ./poi.dat; ../bin/create_ttpoi.pl -i ../etc/merge.lst -o ../todevice/poi.dat

all: clean_todevice clean_poi.dat_cz todevice/poi.dat

test:
	echo '$(POIDATAPOIS)'

.PHONY: all default clean cleancz pois separate

.SILENT:
