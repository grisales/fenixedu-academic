--  SQL file representing changes to the functionalities model
--  Generated at Mon Nov 26 18:06:15 WET 2007
--  DO NOT EDIT THIS FILE, run the generating script instead

--  Preamble
SET AUTOCOMMIT = 0;

START TRANSACTION;

-- 
--  Inserting new functionalities
-- 

--  ID: 370319 UUID: '9d4c09be-294b-4bc6-9639-c1ab612e60ce'
INSERT INTO `ACCESSIBLE_ITEM` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`, `KEY_SUPERIOR_SECTION`, `SECTION_ORDER`, `KEY_SITE`, `LAST_MODIFIED_DATE_YEAR_MONTH_DAY`, `KEY_SECTION`, `ITEM_ORDER`, `INFORMATION`, `KEY_FUNCTIONALITY`, `SHOW_NAME`, `KEY_INTRODUCTION_UNIT_SITE`) SELECT '9d4c09be-294b-4bc6-9639-c1ab612e60ce', 'net.sourceforge.fenixedu.domain.functionalities.Module', 1, `ID_INTERNAL`, `ID_INTERNAL`, NULL, 'pt6:Pautas', NULL, NULL, '', '/', 1, 1, NULL, 21, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '4d6686aa-9e47-4a47-a08a-a37d69f94eb5';

--  ID: 370320 UUID: '0d1be6bd-289c-4a6f-a781-bde3b35df484'
INSERT INTO `ACCESSIBLE_ITEM` (`UUID`, `OJB_CONCRETE_CLASS`, `KEY_ROOT_DOMAIN_OBJECT`, `KEY_PARENT`, `KEY_MODULE`, `KEY_AVAILABILITY_POLICY`, `NAME`, `TITLE`, `DESCRIPTION`, `PATH`, `PREFIX`, `RELATIVE`, `ENABLED`, `PARAMETERS`, `ORDER_IN_MODULE`, `VISIBLE`, `MAXIMIZED`, `PRINCIPAL`, `KEY_SUPERIOR_SECTION`, `SECTION_ORDER`, `KEY_SITE`, `LAST_MODIFIED_DATE_YEAR_MONTH_DAY`, `KEY_SECTION`, `ITEM_ORDER`, `INFORMATION`, `KEY_FUNCTIONALITY`, `SHOW_NAME`, `KEY_INTRODUCTION_UNIT_SITE`) SELECT '0d1be6bd-289c-4a6f-a781-bde3b35df484', 'net.sourceforge.fenixedu.domain.functionalities.ConcreteFunctionality', 1, NULL, `ID_INTERNAL`, NULL, 'pt12:Anular Pauta', NULL, NULL, '/markSheetManagement.do?method=prepareSearchMarkSheet', NULL, 1, 1, NULL, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL FROM `ACCESSIBLE_ITEM` WHERE `UUID` = '9d4c09be-294b-4bc6-9639-c1ab612e60ce';

COMMIT;