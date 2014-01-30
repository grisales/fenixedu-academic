drop table ACADEMIC_CALENDAR;

alter table ACADEMIC_CALENDAR_ENTRY drop column KEY_ACADEMIC_CALENDAR;
alter table ACADEMIC_CALENDAR_ENTRY drop column KEY_BASED_ENTRY;

alter table ACADEMIC_CALENDAR_ENTRY add column KEY_ROOT_DOMAIN_OBJECT_FOR_ROOT_ENTRIES int(11) default NULL;
alter table ACADEMIC_CALENDAR_ENTRY add KEY KEY_ROOT_DOMAIN_OBJECT_FOR_ROOT_ENTRIES (KEY_ROOT_DOMAIN_OBJECT_FOR_ROOT_ENTRIES);