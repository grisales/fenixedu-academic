<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>

<em><bean:message key="label.academicAdminOffice" bundle="ACADEMIC_OFFICE_RESOURCES"/></em>
<h2><bean:message key="label.studentDismissal.management" bundle="ACADEMIC_OFFICE_RESOURCES"/></h2>

<html:messages id="message" message="true" bundle="ACADEMIC_OFFICE_RESOURCES">
	<p>
		<span class="error"><!-- Error messages go here --><bean:write name="message" /></span>
	</p>
</html:messages>

<p class="mvert2">
	<span class="showpersonid">
		<bean:message key="label.student" bundle="ACADEMIC_OFFICE_RESOURCES"/>: 
		<fr:view name="studentCurricularPlan" property="student" schema="student.show.personAndStudentInformation.short">
			<fr:layout name="flow">
				<fr:property name="labelExcluded" value="true"/>
			</fr:layout>
		</fr:view>
	</span>
</p>


<ul>
	<li>
		<bean:define id="url2">/studentSubstitutions.do?method=prepare&amp;scpID=<bean:write name="studentCurricularPlan" property="idInternal" /></bean:define>
		<html:link action='<%= url2 %>'><bean:message key="label.studentSubstitution.create" bundle="ACADEMIC_OFFICE_RESOURCES"/></html:link>
	</li>
	<li>
		<bean:define id="url2">/studentEquivalences.do?method=prepare&amp;scpID=<bean:write name="studentCurricularPlan" property="idInternal" /></bean:define>
		<html:link action='<%= url2 %>'><bean:message key="label.studentEquivalence.create" bundle="ACADEMIC_OFFICE_RESOURCES"/></html:link>
	</li>
	<li>
		<bean:define id="url3">/studentCredits.do?method=prepare&amp;scpID=<bean:write name="studentCurricularPlan" property="idInternal" /></bean:define>
		<html:link action='<%= url3 %>'><bean:message key="label.studentCredits.create" bundle="ACADEMIC_OFFICE_RESOURCES"/></html:link>
	</li>
	
	<li>
		<bean:define id="url4">/studentInternalSubstitutions.do?method=prepare&amp;scpID=<bean:write name="studentCurricularPlan" property="idInternal" /></bean:define>
		<html:link action='<%= url4 %>'><bean:message key="label.studentInternalSubstitution.create" bundle="ACADEMIC_OFFICE_RESOURCES"/></html:link>
	</li>
	
</ul>

<bean:define id="scpID" name="studentCurricularPlan" property="idInternal" />
<bean:define id="registrationId" name="studentCurricularPlan" property="registration.idInternal" />
<bean:define id="studentId" name="studentCurricularPlan" property="registration.student.idInternal" />
<fr:form action="<%= "/studentDismissals.do?scpID="+ scpID.toString() + "&studentId=" + studentId.toString() + "&registrationId=" + registrationId.toString() %>">

	<html:hidden property="method" value="deleteCredits"/>
	
	<logic:notEmpty name="studentCurricularPlan" property="credits">
		<p class="mtop15 mbottom05"><strong><bean:message key="label.existingStudentDismissal" bundle="ACADEMIC_OFFICE_RESOURCES"/></strong></p>
		<fr:view name="studentCurricularPlan" property="credits" schema="student.Dismissal.view.dismissals">
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle4 thlight thcenter mtop05" />
				<fr:property name="columnClasses" value=",inobullet ulmvert0,acenter,inobullet ulmvert0,nowrap,nowrap" />
				<fr:property name="checkable" value="true" />
				<fr:property name="checkboxName" value="creditsToDelete" />
				<fr:property name="checkboxValue" value="idInternal" />	
			</fr:layout>
		</fr:view>
		<html:submit><bean:message key="button.delete" bundle="ACADEMIC_OFFICE_RESOURCES"/></html:submit>
	</logic:notEmpty>

	<logic:empty name="studentCurricularPlan" property="credits">
		<p class="mvert15">
			<em><bean:message key="label.studentDismissal.management.no.credits" bundle="ACADEMIC_OFFICE_RESOURCES"/></em>
		</p>
	</logic:empty>
	
	<html:cancel onclick="this.form.method.value='backViewRegistration'; return true;"><bean:message key="button.back" bundle="ACADEMIC_OFFICE_RESOURCES"/></html:cancel>

</fr:form>