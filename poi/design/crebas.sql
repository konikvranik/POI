/*==============================================================*/
/* DBMS name:      PostgreSQL 7                                 */
/* Created on:     15.9.2007 11:50:45                           */
/*==============================================================*/


drop index Category_PK;

drop index category_source_FK;

drop index category_symbol_FK;

drop index category_type_FK;

drop index Country_PK;

drop index """Group""_PK";

drop index POI_PK;

drop index poi_category_FK;

drop index poi_source_FK;

drop index poi_symbol_FK;

drop index poi_type_FK;

drop index Region_PK;

drop index Source_PK;

drop index Symbol_PK;

drop index Type_PK;

drop index WPT_PK;

drop index group2_FK;

drop index group2_PK;

drop index group_FK;

drop index reference_PK;

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

drop sequence sq_poi;

drop sequence sq_source;

drop sequence sq_symbol;

drop sequence sq_type;

drop sequence sq_wpt;

create sequence sq_category;

create sequence sq_poi;

create sequence sq_source;

create sequence sq_symbol;

create sequence sq_type;

create sequence sq_wpt;

/*==============================================================*/
/* Table: Category                                              */
/*==============================================================*/
create table Category (
id                   NUMERIC              not null default nextval('sq_category'),
name                 VARCHAR(256)         not null,
symbol               NUMERIC              null,
radius_of_duplicity  NUMERIC(5,3)         null,
description          VARCHAR(1024)        null,
duplicity_radius     NUMERIC              null,
code                 VARCHAR(32)          not null,
Source_id            NUMERIC              null default nextval('sq_source'),
Source_code          VARCHAR(32)          null,
Symbol_id            NUMERIC              null default nextval('sq_ymbol'),
Type_id              NUMERIC              null default nextval('sq_type')
);

alter table Category
   add constraint PK_CATEGORY primary key (id, code);

/*==============================================================*/
/* Index: Category_PK                                           */
/*==============================================================*/
create unique index Category_PK on Category (
id,
code
);

/*==============================================================*/
/* Index: category_symbol_FK                                    */
/*==============================================================*/
create  index category_symbol_FK on Category (
Symbol_id
);

/*==============================================================*/
/* Index: category_type_FK                                      */
/*==============================================================*/
create  index category_type_FK on Category (
Type_id
);

/*==============================================================*/
/* Index: category_source_FK                                    */
/*==============================================================*/
create  index category_source_FK on Category (
Source_id,
Source_code
);

/*==============================================================*/
/* Table: Country                                               */
/*==============================================================*/
create table Country (
id                   NUMERIC              not null,
name                 VARCHAR(256)         null,
description          VARCHAR(1024)        null
);

alter table Country
   add constraint PK_COUNTRY primary key (id);

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
id                   NUMERIC              not null,
name                 VARCHAR(256)         not null,
description          VARCHAR(1024)        null
);

alter table "Group"
   add constraint PK_GROUP primary key (id);

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
id                   NUMERIC              not null default nextval('sq_poi'),
Symbol_id            NUMERIC              null default nextval('sq_symbol'),
Type_id              NUMERIC              null default nextval('sq_type'),
Category_id          NUMERIC              not null default nextval('sq_category'),
Category_code        VARCHAR(32)          not null,
Source_id            NUMERIC              not null default nextval('sq_source'),
Source_code          VARCHAR(32)          not null,
Country_id           NUMERIC              null,
name                 VARCHAR(256)         not null,
description          VARCHAR(1024)        null,
comment              VARCHAR(1024)        null,
link                 VARCHAR(1024)        null,
timestamp            TIMESTAMP            null
);

SELECT AddGeometryColumn('public', 'poi', 'position', 4326, 'POINT', 2);

alter table POI
   add constraint PK_POI primary key (id);

alter table POI
   constraint AK_POI_UNIQ_POI unique ("position", name);

/*==============================================================*/
/* Index: POI_PK                                                */
/*==============================================================*/
create unique index POI_PK on POI (
id
);

/*==============================================================*/
/* Index: poi_source_FK                                         */
/*==============================================================*/
create  index poi_source_FK on POI (
Source_id,
Source_code
);

/*==============================================================*/
/* Index: poi_type_FK                                           */
/*==============================================================*/
create  index poi_type_FK on POI (
Type_id
);

/*==============================================================*/
/* Index: poi_symbol_FK                                         */
/*==============================================================*/
create  index poi_symbol_FK on POI (
Symbol_id
);

/*==============================================================*/
/* Index: poi_category_FK                                       */
/*==============================================================*/
create  index poi_category_FK on POI (
Category_id,
Category_code
);

/*==============================================================*/
/* Table: Region                                                */
/*==============================================================*/
create table Region (
id                   NUMERIC              not null,
name                 VARCHAR(256)         null,
description          VARCHAR(1024)        null,
Country_id           NUMERIC              null
);

alter table Region
   add constraint PK_REGION primary key (id);

/*==============================================================*/
/* Index: Region_PK                                             */
/*==============================================================*/
create unique index Region_PK on Region (
id
);

/*==============================================================*/
/* Table: Source                                                */
/*==============================================================*/
create table Source (
id                   NUMERIC              not null default nextval('sq_source'),
name                 VARCHAR(256)         not null,
priority             NUMERIC              null,
code                 VARCHAR(32)          not null,
description          VARCHAR(1024)        null
);

alter table Source
   add constraint PK_SOURCE primary key (id, code);

/*==============================================================*/
/* Index: Source_PK                                             */
/*==============================================================*/
create unique index Source_PK on Source (
id,
code
);

/*==============================================================*/
/* Table: Symbol                                                */
/*==============================================================*/
create table Symbol (
id                   NUMERIC              not null default nextval('sq_ymbol'),
img                  VARCHAR(1024)        null
);

alter table Symbol
   add constraint PK_SYMBOL primary key (id);

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
id                   NUMERIC              not null default nextval('sq_type'),
name                 VARCHAR(256)         not null,
description          VARCHAR(1024)        null
);

alter table Type
   add constraint PK_TYPE primary key (id);

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
POI_id               NUMERIC              not null default currval('sq_poi'),
time                 DATE                 null,
fix                  NUMERIC(2,2)         null,
satellites           NUMERIC              null,
hdop                 NUMERIC(2,2)         null,
vdop                 NUMERIC(2,2)         null,
pdop                 NUMERIC(2,2)         null,
ageofdgpsdata        TIME                 null,
dgpsid               NUMERIC              null,
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
Group_id             NUMERIC              not null,
Category_id          NUMERIC              not null default nextval('sq_category'),
Category_code        VARCHAR(32)          not null
);

alter table categorys_group
   add constraint PK_CATEGORYS_GROUP primary key (Group_id, Category_id, Category_code);

/*==============================================================*/
/* Index: group2_PK                                             */
/*==============================================================*/
create unique index group2_PK on categorys_group (
Group_id,
Category_id,
Category_code
);

/*==============================================================*/
/* Index: group_FK                                              */
/*==============================================================*/
create  index group_FK on categorys_group (
Group_id
);

/*==============================================================*/
/* Index: group2_FK                                             */
/*==============================================================*/
create  index group2_FK on categorys_group (
Category_id,
Category_code
);

/*==============================================================*/
/* Table: pois_region                                           */
/*==============================================================*/
create table pois_region (
Region_id            NUMERIC              not null,
POI_id               NUMERIC              not null default nextval('sq_poi')
);

alter table pois_region
   add constraint PK_POIS_REGION primary key (Region_id, POI_id);

/*==============================================================*/
/* Index: reference_PK                                          */
/*==============================================================*/
create unique index reference_PK on pois_region (
Region_id,
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
   add constraint FK_CATEGORY_REFERENCE_SOURCE foreign key (Source_id, Source_code)
      references Source (id, code)
      on delete restrict on update restrict;

alter table POI
   add constraint FK_POI_REFERENCE_COUNTRY foreign key (Country_id)
      references Country (id)
      on delete restrict on update restrict;

alter table POI
   add constraint FK_POI_REFERENCE_SOURCE foreign key (Source_id, Source_code)
      references Source (id, code)
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
   add constraint FK_POI_REFERENCE_CATEGORY foreign key (Category_id, Category_code)
      references Category (id, code)
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
   add constraint FK_CATEGORY_CATEGORYS_CATEGORY foreign key (Category_id, Category_code)
      references Category (id, code)
      on delete restrict on update restrict;

alter table pois_region
   add constraint FK_POIS_REG_POIS_REGI_REGION foreign key (Region_id)
      references Region (id)
      on delete restrict on update restrict;

alter table pois_region
   add constraint FK_POIS_REG_REFERENCE_POI foreign key (POI_id)
      references POI (id)
      on delete restrict on update restrict;

