UPDATE ACADEMIC_PERIOD SET OJB_CONCRETE_CLASS = "net.sourceforge.fenixedu.domain.ExecutionSemester" WHERE OJB_CONCRETE_CLASS = "net.sourceforge.fenixedu.domain.ExecutionPeriod";
RENAME TABLE ACADEMIC_PERIOD TO EXECUTION_INTERVAL;
ALTER TABLE CANDIDACY_PERIOD CHANGE COLUMN KEY_ACADEMIC_PERIOD KEY_EXECUTION_INTERVAL int(11) NOT NULL;
ALTER TABLE EXECUTION_INTERVAL CHANGE COLUMN EXECUTION_INTERVAL ACADEMIC_INTERVAL text;
UPDATE DOMAIN_CLASS_INFO SET DOMAIN_CLASS_NAME = "net.sourceforge.fenixedu.domain.ExecutionSemester" WHERE DOMAIN_CLASS_NAME = "net.sourceforge.fenixedu.domain.ExecutionPeriod";