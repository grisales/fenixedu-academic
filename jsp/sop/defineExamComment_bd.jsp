<%@ page language="java" %>
<%@ page import="org.apache.struts.action.Action" %>
<%@ page import ="ServidorApresentacao.Action.sop.utils.SessionConstants" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="#FFFFFF" class="infoselected"><p>O curso seleccionado
        	&eacute;:</p>
			<strong><jsp:include page="context.jsp"/></strong>
         </td>
    </tr>
</table>
<br/>

<h2><bean:message key="title.exam.comment"/></h2>
<span class="error"><html:errors /></span>

<html:form action="/defineExamComment">
	<html:hidden property="page" value="1"/>
	<table cellpadding="0" cellspacing="2">
        <tr>
            <td nowrap="nowrap" class="formTD" align="right">
                <bean:message key="property.exam.comment"/>
            </td>
            <td nowrap="nowrap" align="left">
            	<html:textarea property="comment"
            				   value='<%= request.getParameter("comment")%>'
            				   rows="2"
            				   cols="56"/>
            </td>
       	</tr>
	</table>

	<br/>
    <table align="lef">
    	<tr align="center">
        	<td>
			    <html:hidden property="executionCourseCode" value='<%= request.getParameter("executionCourseCode")%>'/>
			    <html:hidden property="executionPeriodName" value='<%= request.getParameter("executionPeriodName")%>'/>
        		<html:hidden property="executionYear" value='<%= request.getParameter("executionYear")%>'/>
        		<html:hidden property="method" value='define'/>

		<html:hidden property="<%= SessionConstants.EXECUTION_PERIOD_OID %>"
					 value="<%= pageContext.findAttribute("executionPeriodOID").toString() %>"/>
		<html:hidden property="<%= SessionConstants.EXECUTION_DEGREE_OID %>"
					 value="<%= pageContext.findAttribute("executionDegreeOID").toString() %>"/>
		<html:hidden property="<%= SessionConstants.CURRICULAR_YEAR_OID %>"
					 value="<%= pageContext.findAttribute("curricularYearOID").toString() %>"/>
		<html:hidden property="<%= SessionConstants.EXECUTION_COURSE_OID %>"
					 value="<%= pageContext.findAttribute("executionCourseOID").toString() %>"/>

	<logic:iterate id="year" name="<%= SessionConstants.CURRICULAR_YEARS_LIST %>" scope="request">
		<logic:equal name="year" value="1">
			<html:hidden property="<%= SessionConstants.CURRICULAR_YEARS_1 %>"
						 value="1"/>
		</logic:equal>
		<logic:equal name="year" value="2">
			<html:hidden property="<%= SessionConstants.CURRICULAR_YEARS_2 %>"
						 value="2"/>
		</logic:equal>
		<logic:equal name="year" value="3">
			<html:hidden property="<%= SessionConstants.CURRICULAR_YEARS_3 %>"
						 value="3"/>
		</logic:equal>
		<logic:equal name="year" value="4">
			<html:hidden property="<%= SessionConstants.CURRICULAR_YEARS_4 %>"
						 value="4"/>
		</logic:equal>
		<logic:equal name="year" value="5">
			<html:hidden property="<%= SessionConstants.CURRICULAR_YEARS_5 %>"
						 value="5"/>
		</logic:equal>
	</logic:iterate>

            	<html:submit styleClass="inputbutton">
              		<bean:message key="label.create"/>
             	</html:submit>
            </td>
            <td width="20"> </td>
            <td>
            	<html:reset value="Limpar" styleClass="inputbutton">
                	<bean:message key="label.clear"/>
                </html:reset>
            </td>
		</tr>
	</table>
</html:form>