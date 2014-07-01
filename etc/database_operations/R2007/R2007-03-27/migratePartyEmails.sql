SELECT 
CONCAT('INSERT INTO PARTY_CONTACT (KEY_ROOT_DOMAIN_OBJECT, OJB_CONCRETE_CLASS, VISIBLE, DEFAULT_CONTACT, TYPE, KEY_PARTY, VALUE) VALUES (1, "net.sourceforge.fenixedu.domain.contacts.EmailAddress", ', PARTY.AVAILABLE_EMAIL, ', 0, "PERSONAL", ', PARTY.ID_INTERNAL, ', "', TRIM(PARTY.EMAIL), '");') AS ""
FROM PARTY WHERE PARTY.EMAIL IS NOT NULL AND PARTY.EMAIL REGEXP '@';

SELECT 
CONCAT('INSERT INTO PARTY_CONTACT (KEY_ROOT_DOMAIN_OBJECT, OJB_CONCRETE_CLASS, VISIBLE, DEFAULT_CONTACT, TYPE, KEY_PARTY, VALUE) VALUES (1, "net.sourceforge.fenixedu.domain.contacts.EmailAddress", 1, 1, "INSTITUTIONAL", ', PARTY.ID_INTERNAL, ', "', TRIM(PARTY.INSTITUTIONAL_EMAIL), '");') AS ""
FROM PARTY WHERE PARTY.INSTITUTIONAL_EMAIL IS NOT NULL AND PARTY.INSTITUTIONAL_EMAIL REGEXP '@';