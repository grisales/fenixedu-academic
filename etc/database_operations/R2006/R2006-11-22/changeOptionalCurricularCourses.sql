UPDATE DEGREE_MODULE SET  DEGREE_MODULE.OJB_CONCRETE_CLASS = "net.sourceforge.fenixedu.domain.degreeStructure.OptionalCurricularCourse" WHERE DEGREE_MODULE.CURRICULAR_STAGE <> "OLD" AND DEGREE_MODULE.TYPE = "OPTIONAL_COURSE";