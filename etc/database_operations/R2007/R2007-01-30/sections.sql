INSERT INTO `SITE` (`OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `SITE_TYPE`) 
	VALUES ('net.sourceforge.fenixedu.domain.SiteTemplate', 1, 'net.sourceforge.fenixedu.domain.homepage.Homepage');

INSERT INTO `ACCESSIBLE_ITEM` (`OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `VISIBLE`, `KEY_SITE`, `SECTION_ORDER`, `KEY_FUNCTIONALITY`) 
	SELECT 'net.sourceforge.fenixedu.domain.FunctionalitySection', 1, 1, -1, 0, AI.ID_INTERNAL
	FROM `ACCESSIBLE_ITEM` AS AI WHERE AI.UUID = '777c4663-1201-4281-b0cd-78ce5dbef5e9';

INSERT INTO `ACCESSIBLE_ITEM` (`OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `VISIBLE`, `KEY_SITE`, `SECTION_ORDER`, `KEY_FUNCTIONALITY`) 
	SELECT 'net.sourceforge.fenixedu.domain.FunctionalitySection', 1, 1, -1, 1, AI.ID_INTERNAL
	FROM `ACCESSIBLE_ITEM` AS AI WHERE AI.UUID = '129fcf2c-4edb-4273-a58e-6d504ea3964c';

INSERT INTO `ACCESSIBLE_ITEM` (`OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `VISIBLE`, `KEY_SITE`, `SECTION_ORDER`, `KEY_FUNCTIONALITY`) 
	SELECT 'net.sourceforge.fenixedu.domain.FunctionalitySection', 1, 1, -1, 2, AI.ID_INTERNAL
	FROM `ACCESSIBLE_ITEM` AS AI WHERE AI. UUID = '31fd792e-73c4-4a78-88ee-36d73347caf4';

INSERT INTO `ACCESSIBLE_ITEM` (`OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `VISIBLE`, `KEY_SITE`, `SECTION_ORDER`, `KEY_FUNCTIONALITY`) 
	SELECT 'net.sourceforge.fenixedu.domain.FunctionalitySection', 1, 1, -1, 3, AI.ID_INTERNAL
	FROM `ACCESSIBLE_ITEM` AS AI WHERE AI.UUID = '9d51e9a0-801f-48f1-b0f0-09a44c423010';

UPDATE `ACCESSIBLE_ITEM` AS AI, `SITE` AS S
	SET AI.`KEY_SITE` = S.`ID_INTERNAL`
	WHERE AI.`OJB_CONCRETE_CLASS` LIKE 'net.sourceforge.fenixedu.domain.FunctionalitySection'
		AND AI.`KEY_SITE` = -1
		AND S.`OJB_CONCRETE_CLASS` LIKE 'net.sourceforge.fenixedu.domain.SiteTemplate'
		AND S.`SITE_TYPE` LIKE 'net.sourceforge.fenixedu.domain.homepage.Homepage';