ALTER TABLE ACADEMIC_SERVICE_REQUEST CHANGE COLUMN INTERNSHIP INTERNSHIP_ABOLISHED tinyint(1) NOT NULL default '0';
ALTER TABLE ACADEMIC_SERVICE_REQUEST ADD COLUMN INTERNSHIP_APPROVED tinyint(1) NOT NULL default '0';
ALTER TABLE ACADEMIC_SERVICE_REQUEST ADD COLUMN EXCEPTIONAL_CONCLUSION_DATE date default NULL;