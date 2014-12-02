/*==============================================================*/
/* DBMS name:      PostgreSQL 7                                 */
/* Created on:     8.9.2007 14:31:36                            */
/*==============================================================*/


drop index Category_PK;

drop index category_source_FK;

drop index category_symbol_FK;

drop index category_type_FK;

drop index POI_PK;

drop index poi_category_FK;

drop index poi_source_FK;

drop index poi_symbol_FK;

drop index poi_type_FK;

drop index Source_PK;

drop index Symbol_PK;

drop index Type_PK;

drop index WPT_PK;

drop table Category;

drop table POI;

drop table Source;

drop table Symbol;

drop table Type;

drop table WPT;

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
Source_id            NUMERIC              null default nextval('sq_source'),
Symbol_id            NUMERIC              null default nextval('sq_ymbol'),
Type_id              NUMERIC              null default nextval('sq_type'),
name                 VARCHAR(256)         not null,
symbol               NUMERIC              null,
radius_of_duplicity  NUMERIC(5,3)         null,
description          VARCHAR(1024)        null
);

alter table Category
   add constraint PK_CATEGORY primary key (id);

/*==============================================================*/
/* Index: Category_PK                                           */
/*==============================================================*/
create unique index Category_PK on Category (
id
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
Source_id
);

/*==============================================================*/
/* Table: POI                                                   */
/*==============================================================*/
create table POI (
id                   NUMERIC              not null default nextval('sq_poi'),
Symbol_id            NUMERIC              null default nextval('sq_ymbol'),
Type_id              NUMERIC              null default nextval('sq_type'),
Category_id          NUMERIC              not null default nextval('sq_category'),
Source_id            NUMERIC              null default nextval('sq_source'),
"position"           GEOMETRY             not null,
name                 VARCHAR(256)         not null,
description          VARCHAR(1024)        null,
comment              VARCHAR(1024)        null,
link                 VARCHAR(1024)        null,
timestamp            TIMESTAMP            null
);

alter table POI
   add constraint PK_POI primary key (id);

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
Source_id
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
Category_id
);

/*==============================================================*/
/* Table: Source                                                */
/*==============================================================*/
create table Source (
id                   NUMERIC              not null default nextval('sq_source'),
name                 VARCHAR(256)         not null
);

alter table Source
   add constraint PK_SOURCE primary key (id);

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
dgpsid               NUMERIC              null
);

alter table WPT
   add constraint PK_WPT primary key (POI_id);

/*==============================================================*/
/* Index: WPT_PK                                                */
/*==============================================================*/
create unique index WPT_PK on WPT (
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

alter table WPT
   add constraint FK_WPT_REFERENCE_POI foreign key (POI_id)
      references POI (id)
      on delete restrict on update restrict;

