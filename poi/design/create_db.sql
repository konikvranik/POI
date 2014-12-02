/*==============================================================*/
/* DBMS name:      PostgreSQL 7                                 */
/* Created on:     17.9.2007 14:45:00                           */
/*==============================================================*/

/*
drop index Category_PK;

drop index reference6_FK;

drop index reference7_FK;

drop index reference8_FK;

drop index Country_PK;

drop index """Group""_PK";

drop index POI_PK;

drop index reference10_FK;

drop index reference2_FK;

drop index reference3_FK;

drop index reference4_FK;

drop index reference5_FK;

drop index Region_PK;

drop index reference9_FK;

drop index Source_PK;

drop index Symbol_PK;

drop index Type_PK;

drop index WPT_PK;

drop index categorys_group2_FK;

drop index categorys_group_FK;

drop index categorys_group_PK;

drop index pois_region2_FK;

drop index pois_region_FK;

drop index pois_region_PK;

drop table Category;

drop table Country;

drop table "Group";

drop table POI;

drop table Region;

drop table Source;

drop table Symbol;

drop table Type;

drop table WPT;

drop table categorys_group;

drop table pois_region;

drop sequence sq_category;

drop sequence sq_country;

drop sequence sq_group;

drop sequence sq_poi;

drop sequence sq_region;

drop sequence sq_source;

drop sequence sq_symbol;

drop sequence sq_type;

*/

create sequence sq_category;

create sequence sq_country;

create sequence sq_group;

create sequence sq_poi;

create sequence sq_region;

create sequence sq_source;

create sequence sq_symbol;

create sequence sq_type;

/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category (
id                   INT4                 not null default nextval('sq_category'),
Source_id            INT4                 null default currval('sq_source'),
Symbol_id            INT4                 null default currval('sq_symbol'),
Type_id              INT4                 null default currval('sq_type'),
name                 VARCHAR(256)         not null,
symbol               INT4                 null,
radius_of_duplicity  NUMERIC(5,3)         null,
description          VARCHAR(1024)        null,
code                 VARCHAR(32)          not null
);

alter table Category
   add constraint PK_CATEGORY primary key (id);

alter table Category
   constraint AK_IDENTIFIER_2_CATEGORY unique (code);

/*==============================================================*/
/* Index: Category_PK                                           */
/*==============================================================*/
create unique index Category_PK on Category (
id
);

/*==============================================================*/
/* Index: reference6_FK                                         */
/*==============================================================*/
create  index reference6_FK on Category (
Symbol_id
);

/*==============================================================*/
/* Index: reference7_FK                                         */
/*==============================================================*/
create  index reference7_FK on Category (
Type_id
);

/*==============================================================*/
/* Index: reference8_FK                                         */
/*==============================================================*/
create  index reference8_FK on Category (
Source_id
);

/*==============================================================*/
/* Table: Country                                               */
/*==============================================================*/
create table Country (
id                   INT4                 not null default nextval('sq_country'),
name                 VARCHAR(256)         null,
description          VARCHAR(1024)        null,
code                 VARCHAR(32)          not null
);

alter table Country
   add constraint PK_COUNTRY primary key (id);

alter table Country
   constraint AK_IDENTIFIER_2_COUNTRY unique (code);

/*==============================================================*/
/* Index: Country_PK                                            */
/*==============================================================*/
create unique index Country_PK on Country (
id
);

/*==============================================================*/
/* Table: "Group"                                               */
/*==============================================================*/
create table "Group" (
id                   INT4                 not null default nextval('sq_group'),
name                 VARCHAR(256)         not null,
description          VARCHAR(1024)        null,
code                 VARCHAR(32)          not null
);

alter table "Group"
   add constraint PK_GROUP primary key (id);

alter table "Group"
   constraint AK_IDENTIFIER_2_GROUP unique (code);

/*==============================================================*/
/* Index: """Group""_PK"                                        */
/*==============================================================*/
create unique index """Group""_PK" on "Group" (
id
);

/*==============================================================*/
/* Table: POI                                                   */
/*==============================================================*/
create table POI (
id                   INT4                 not null default nextval('sq_poi'),
Symbol_id            INT4                 null default currval('sq_symbol'),
Type_id              INT4                 null default currval('sq_type'),
Category_id          INT4                 not null default currval('sq_category'),
Source_id            INT4                 not null default currval('sq_source'),
Country_id           INT4                 null default currval('sq_country'),
name                 VARCHAR(256)         not null,
description          VARCHAR(1024)        null,
comment              VARCHAR(1024)        null,
link                 VARCHAR(1024)        null,
timestamp            DATE                 null,
phone                VARCHAR(256)         null
);

SELECT AddGeometryColumn('public', 'poi', 'position', 4326, 'POINT', 2);

alter table POI
   add constraint PK_POI primary key (id);

/*==============================================================*/
/* Index: POI_PK                                                */
/*==============================================================*/
create unique index POI_PK on POI (
id
);

/*==============================================================*/
/* Index: reference2_FK                                         */
/*==============================================================*/
create  index reference2_FK on POI (
Source_id
);

/*==============================================================*/
/* Index: reference3_FK                                         */
/*==============================================================*/
create  index reference3_FK on POI (
Type_id
);

/*==============================================================*/
/* Index: reference4_FK                                         */
/*==============================================================*/
create  index reference4_FK on POI (
Symbol_id
);

/*==============================================================*/
/* Index: reference5_FK                                         */
/*==============================================================*/
create  index reference5_FK on POI (
Category_id
);

/*==============================================================*/
/* Index: reference10_FK                                        */
/*==============================================================*/
create  index reference10_FK on POI (
Country_id
);

/*==============================================================*/
/* Table: Region                                                */
/*==============================================================*/
create table Region (
id                   INT4                 not null default nextval('sq_region'),
name                 VARCHAR(256)         null,
description          VARCHAR(1024)        null,
code                 VARCHAR(32)          not null,
Country_id           INT4                 null default currval('sq_country')
);

alter table Region
   add constraint PK_REGION primary key (id);

alter table Region
   add constraint AK_IDENTIFIER_2_REGION unique (code);

/*==============================================================*/
/* Index: Region_PK                                             */
/*==============================================================*/
create unique index Region_PK on Region (
id
);

/*==============================================================*/
/* Index: reference9_FK                                         */
/*==============================================================*/
create  index reference9_FK on Region (
Country_id
);

/*==============================================================*/
/* Table: Source                                                */
/*==============================================================*/
create table Source (
id                   INT4                 not null default nextval('sq_source'),
name                 VARCHAR(256)         not null,
priority             INT4                 not null,
code                 VARCHAR(32)          not null,
description          VARCHAR(1024)        null
);

alter table Source
   add constraint PK_SOURCE primary key (id);

alter table Source
   add constraint AK_IDENTIFIER_2_SOURCE unique (code);

/*==============================================================*/
/* Index: Source_PK                                             */
/*==============================================================*/
create unique index Source_PK on Source (
id
);

/*==============================================================*/
/* Table: Symbol                                                */
/*==============================================================*/
create table Symbol (
id                   INT4                 not null default nextval('sq_symbol'),
img                  VARCHAR(1024)        null,
code                 VARCHAR(32)          not null
);

alter table Symbol
   add constraint PK_SYMBOL primary key (id);

alter table Symbol
   add constraint AK_IDENTIFIER_2_SYMBOL unique (code);

/*==============================================================*/
/* Index: Symbol_PK                                             */
/*==============================================================*/
create unique index Symbol_PK on Symbol (
id
);

/*==============================================================*/
/* Table: Type                                                  */
/*==============================================================*/
create table Type (
id                   INT4                 not null default nextval('sq_type'),
name                 VARCHAR(256)         not null,
description          VARCHAR(1024)        null,
code                 VARCHAR(32)          not null
);

alter table Type
   add constraint PK_TYPE primary key (id);

alter table Type
   add constraint AK_IDENTIFIER_2_TYPE unique (code);

/*==============================================================*/
/* Index: Type_PK                                               */
/*==============================================================*/
create unique index Type_PK on Type (
id
);

/*==============================================================*/
/* Table: WPT                                                   */
/*==============================================================*/
create table WPT (
POI_id               INT4                 not null default currval('sq_poi'),
time                 DATE                 null,
fix                  NUMERIC(2,2)         null,
satellites           INT4                 null,
hdop                 NUMERIC(2,2)         null,
vdop                 NUMERIC(2,2)         null,
pdop                 NUMERIC(2,2)         null,
ageofdgpsdata        TIME                 null,
dgpsid               INT4                 null,
timestamp            DATE                 null
);

alter table WPT
   add constraint PK_WPT primary key (POI_id);

/*==============================================================*/
/* Index: WPT_PK                                                */
/*==============================================================*/
create unique index WPT_PK on WPT (
POI_id
);

/*==============================================================*/
/* Table: categorys_group                                       */
/*==============================================================*/
create table categorys_group (
Group_id             INT4                 not null default currval('sq_group'),
Category_id          INT4                 not null default currval('sq_category')
);

alter table categorys_group
   add constraint PK_CATEGORYS_GROUP primary key (Group_id, Category_id);

/*==============================================================*/
/* Index: categorys_group_PK                                    */
/*==============================================================*/
create unique index categorys_group_PK on categorys_group (
Group_id,
Category_id
);

/*==============================================================*/
/* Index: categorys_group_FK                                    */
/*==============================================================*/
create  index categorys_group_FK on categorys_group (
Group_id
);

/*==============================================================*/
/* Index: categorys_group2_FK                                   */
/*==============================================================*/
create  index categorys_group2_FK on categorys_group (
Category_id
);

/*==============================================================*/
/* Table: pois_region                                           */
/*==============================================================*/
create table pois_region (
Region_id            INT4                 not null default currval('sq_region'),
POI_id               INT4                 not null default currval('sq_poi')
);

alter table pois_region
   add constraint PK_POIS_REGION primary key (Region_id, POI_id);

/*==============================================================*/
/* Index: pois_region_PK                                        */
/*==============================================================*/
create unique index pois_region_PK on pois_region (
Region_id,
POI_id
);

/*==============================================================*/
/* Index: pois_region_FK                                        */
/*==============================================================*/
create  index pois_region_FK on pois_region (
Region_id
);

/*==============================================================*/
/* Index: pois_region2_FK                                       */
/*==============================================================*/
create  index pois_region2_FK on pois_region (
POI_id
);

alter table Category
   add constraint FK_CATEGORY_REFERENCE_SYMBOL foreign key (Symbol_id)
      references Symbol (id)
      on delete restrict on update restrict;

alter table Category
   add constraint FK_CATEGORY_REFERENCE_TYPE foreign key (Type_id)
      references Type (id)
      on delete restrict on update restrict;

alter table Category
   add constraint FK_CATEGORY_REFERENCE_SOURCE foreign key (Source_id)
      references Source (id)
      on delete restrict on update restrict;

alter table POI
   add constraint FK_POI_REFERENCE_COUNTRY foreign key (Country_id)
      references Country (id)
      on delete restrict on update restrict;

alter table POI
   add constraint FK_POI_REFERENCE_SOURCE foreign key (Source_id)
      references Source (id)
      on delete restrict on update restrict;

alter table POI
   add constraint FK_POI_REFERENCE_TYPE foreign key (Type_id)
      references Type (id)
      on delete restrict on update restrict;

alter table POI
   add constraint FK_POI_REFERENCE_SYMBOL foreign key (Symbol_id)
      references Symbol (id)
      on delete restrict on update restrict;

alter table POI
   add constraint FK_POI_REFERENCE_CATEGORY foreign key (Category_id)
      references Category (id)
      on delete restrict on update restrict;

alter table Region
   add constraint FK_REGION_REFERENCE_COUNTRY foreign key (Country_id)
      references Country (id)
      on delete restrict on update restrict;

alter table WPT
   add constraint FK_WPT_REFERENCE_POI foreign key (POI_id)
      references POI (id)
      on delete restrict on update restrict;

alter table categorys_group
   add constraint FK_CATEGORY_CATEGORYS_GROUP foreign key (Group_id)
      references "Group" (id)
      on delete restrict on update restrict;

alter table categorys_group
   add constraint FK_CATEGORY_CATEGORYS_CATEGORY foreign key (Category_id)
      references Category (id)
      on delete restrict on update restrict;

alter table pois_region
   add constraint FK_POIS_REG_POIS_REGI_REGION foreign key (Region_id)
      references Region (id)
      on delete restrict on update restrict;

alter table pois_region
   add constraint FK_POIS_REG_POIS_REGI_POI foreign key (POI_id)
      references POI (id)
      on delete restrict on update restrict;

