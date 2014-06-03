select @RootPortal := KEY_ROOT_PORTAL FROM ROOT_DOMAIN_OBJECT;
select @PortalUUID := CONTENT_ID FROM CONTENT WHERE ID_INTERNAL=@RootPortal;
select @NODE_ORDER := MAX(NODE_ORDER) FROM NODE WHERE KEY_PARENT=@RootPortal;
select @KEY_TutorUnit := ID_INTERNAL FROM PARTY WHERE PARTY_NAME LIKE '%Tutorado%';
select @SITE := KEY_SITE FROM PARTY WHERE ID_INTERNAL=@KEY_TutorUnit;

update PARTY SET OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.organizationalStructure.TutorUnit'
WHERE ID_INTERNAL=@KEY_TutorUnit;

update CONTENT SET OJB_CONCRETE_CLASS='net.sourceforge.fenixedu.domain.TutorSite' WHERE ID_INTERNAL=@SITE;

insert into META_DOMAIN_OBJECT(KEY_ROOT_DOMAIN_OBJECT,TYPE) values('1','net.sourceforge.fenixedu.domain.TutorSite');

SELECT @MDO_ID := ID_INTERNAL FROM META_DOMAIN_OBJECT WHERE TYPE='net.sourceforge.fenixedu.domain.TutorSite';

insert into CONTENT (OJB_CONCRETE_CLASS, KEY_ROOT_DOMAIN_OBJECT,CONTENT_ID,NAME,PERSONALIZED_LOGO,
SHOW_BANNER,SHOW_INTRODUCTION,SHOW_ANNOUNCEMENTS,SHOW_EVENTS,LAYOUT,SHOW_FLAGS,SHOW_INSTITUTION_LOGO,KEY_META_DOMAIN_OBJECT)
values('net.sourceforge.fenixedu.domain.contents.MetaDomainObjectPortal',1,'ce709e5e-1bd7-102b-a709-0013d3b09da0', 'pt8:tutorado',0,1,1,1,1,'BANNER_INTRO',1,1,@MDO_ID);

SELECT @MDO_PORTAL := ID_INTERNAL FROM CONTENT WHERE CONTENT_ID='ce709e5e-1bd7-102b-a709-0013d3b09da0';

insert into NODE(OJB_CONCRETE_CLASS,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,
NODE_ORDER,VISIBLE,ASCENDING,CONTENT_ID) 
select 'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode', '1', @RootPortal, C.ID_INTERNAL, @NODE_ORDER+1,'1','1',concat(@PortalUUID,C.CONTENT_ID) FROM CONTENT C WHERE ID_INTERNAL=@MDO_PORTAL;

insert into NODE(OJB_CONCRETE_CLASS,KEY_ROOT_DOMAIN_OBJECT,KEY_PARENT,KEY_CHILD,
NODE_ORDER,VISIBLE,ASCENDING,CONTENT_ID) select 'net.sourceforge.fenixedu.domain.contents.ExplicitOrderNode', '1', @MDO_PORTAL, C.ID_INTERNAL,'1','1','1',concat('ce709e5e-1bd7-102b-a709-0013d3b09da0',C.CONTENT_ID) FROM CONTENT C WHERE ID_INTERNAL=138837;