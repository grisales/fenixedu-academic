DROP TABLE IF EXISTS PARTY_CONTACT;
CREATE TABLE PARTY_CONTACT (
  ID_INTERNAL int(11) NOT NULL auto_increment,
  KEY_ROOT_DOMAIN_OBJECT int(11) NOT NULL default '1',
  OJB_CONCRETE_CLASS varchar(250) NOT NULL default '',
  KEY_PARTY int(11) NOT NULL,
  VISIBLE tinyint(1) NOT NULL,
  DEFAULT_CONTACT tinyint(1) NOT NULL,
  TYPE varchar(250) NOT NULL,
  URL varchar(200),
  VALUE varchar(100),
  ADDRESS varchar(255),
  AREA_CODE varchar(8),
  AREA_OF_AREA_CODE varchar(100),
  AREA varchar(100),
  PARISH_OF_RESIDENCE varchar(100),
  DISTRICT_SUBDIVISION_OF_RESIDENCE varchar(100),
  DISTRICT_OF_RESIDENCE varchar(100),
  KEY_COUNTRY_OF_RESIDENCE int(11),
  NUMBER varchar(50),

  PRIMARY KEY (ID_INTERNAL),
  KEY KEY_ROOT_DOMAIN_OBJECT (KEY_ROOT_DOMAIN_OBJECT),
  KEY KEY_PARTY (KEY_PARTY),
  KEY KEY_COUNTRY_OF_RESIDENCE (KEY_COUNTRY_OF_RESIDENCE)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;