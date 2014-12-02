select put_poi( '14.645 52.0261', 'TestPoint1', 'Textovaci bod pro provereni funkcnosti procky', 'Pouze k testovani; naplatna data', '<a href="http://phoenix.suteren.net/">phoenix</a>', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 2, NULL, NULL);
select put_poi( '14G64M5S 52G02M61S', 'TestPoint2', 'Textovaci bod pro provereni funkcnosti procky', 'Pouze k testovani; naplatna data', '<a href="http://phoenix.suteren.net/">phoenix</a>', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 2, NULL, NULL);

select * from POI;
select * from Source;


/*
SELECT * FROM table WHERE the_geom && expand( <GEOMETRY>, <BOX SIZE> ) AND distance(transform(the_geom,<SRID>), transform(<GEOMETRY>,<SRID>) < <DIST>
*/
/*
   < GEOMETRY > = point thats the centre of your circle
   <BOX SIZE>      =  this is the step #3 conversion factor (degrees)
    <SRID>   =  step #2's SRID in the spatial_ref_sys table
    <DIST>  = distance (meters)

*/

DECLARE test numeric;
drop table test;
SELECT id INTO test FROM Source WHERE id = 9;
select * from test;

