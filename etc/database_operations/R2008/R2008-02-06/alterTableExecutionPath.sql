alter table EXECUTION_PATH add column CONTENT_ID varchar(255);

update CONTENT, EXECUTION_PATH set EXECUTION_PATH.CONTENT_ID = CONTENT.CONTENT_ID where CONTENT.ID_INTERNAL = EXECUTION_PATH.KEY_FUNCTIONALITY;