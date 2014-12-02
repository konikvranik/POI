CREATE TABLE POI(
-- Attributes --
id int,
latitude float,
longitude float,
elevation float,
name string,
description string,
comment string,
source string,
link string,
symbol int,
type int,
category int);

CREATE TABLE Kategorie(
-- Attributes --
id int,
name string,
symbol int);

CREATE TABLE Typ(
-- Attributes --
id int);

CREATE TABLE Symbol(
-- Attributes --
id int,
type string,
img string);

CREATE TABLE WPT(
-- Attributes --
id int,
time datetime,
fix string,
sat int,
hdop int,
vdop int,
pdop int,
ageofdgpsdata int,
dgpsid int);

