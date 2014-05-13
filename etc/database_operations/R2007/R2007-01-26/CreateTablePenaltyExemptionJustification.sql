CREATE TABLE PENALTY_EXEMPTION_JUSTIFICATION (
  ID_INTERNAL int(11) unsigned NOT NULL auto_increment,
  OJB_CONCRETE_CLASS VARCHAR(255) NOT NULL,
  JUSTIFICATION_TYPE VARCHAR(255) NOT NULL,
  KEY_PENALTY_EXEMPTION INT(11) NOT NULL,
  KEY_ROOT_DOMAIN_OBJECT INT(11) NOT NULL default '1',
  COMMENTS TEXT NULL,
  DISPATCH_DATE VARCHAR(10) NULL,
  PRIMARY KEY  (ID_INTERNAL),
  KEY `KEY_PENALTY_EXEMPTION`  (KEY_PENALTY_EXEMPTION),
  KEY `KEY_ROOT_DOMAIN_OBJECT`  (KEY_ROOT_DOMAIN_OBJECT)
) ENGINE=InnoDB;