<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %> 
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<bean:define id="cases" type="java.util.List" name="cases"/>
<bean:define id="student" type="DataBeans.InfoStudent"  name="student"/>
<bean:define id="curricularCourse" type="DataBeans.InfoCurricularCourse"  name="curricularCourse"/>
<bean:define id="motivation" type="java.lang.String"  name="motivation"/>
<bean:define id="seminary" type="DataBeans.Seminaries.InfoSeminary"  name="seminary"/>
<bean:define id="modality" type="DataBeans.Seminaries.InfoModality"  name="modality"/>

<logic:present name="cases">
	<logic:present name="student">
		<logic:present name="curricularCourse">
			<logic:present name="curricularCourse">
					<logic:present name="motivation">
				<h2><bean:message key="label.viewCandidacyTitle"/></h2>

				<h3><bean:message key="label.seminaries.showCandidacy.Student"/></h3>	
				<table>
					<tr>
						<td>
							<b><bean:message key="label.seminaries.showCandidacy.Student.Number"/></b>
						</td>
						<td>
							<bean:write name="student" property="number"/>
						</td>
					<tr>
					<tr>
						<td>
							<b><bean:message key="label.seminaries.showCandidacy.Student.Name"/></b>
						</td>
						<td>
							<bean:write name="student" property="infoPerson.nome"/>
						</td>
					</tr>
				</table>
				<h3><bean:message key="label.seminaries.showCandidacy.CurricularCourse"/></h3>
				<table>
					<tr>
						<td>
							<b><bean:message key="label.seminaries.showCandidacy.CurricularCourse.Name"/></b>
						</td>
						<td>
							<bean:write name="curricularCourse" property="name"/>
						</td>
					</tr>
					<tr>
						<td>
							<b><bean:message key="label.seminaries.showCandidacy.CurricularCourse.Code"/></b>
						</td>
						<td>
							<bean:write name="curricularCourse" property="code"/>
						</td>
					</tr>
				</table>
				<h3><bean:message key="label.seminaries.showCandidacy.Candidacy"/></h3>
				<table>
					<logic:present name="theme">
						<logic:notEmpty name="theme">
							<tr>
								<td width="0%">
									<b><bean:message key="label.seminaries.showCandidacy.Theme"/></b>
								</td>
								<td>
									<bean:write name="theme" property="name"/>
								</td>
							</tr>
						</logic:notEmpty>
					</logic:present>
					<tr>
						<td width="0%">
							<b><bean:message key="label.seminaries.showCandidacy.Modality"/></b>
						</td>
						<td>
							<bean:write name="modality" property="name"/>
						</td>
					</tr>
					<tr>
						<td>
							<b><bean:message key="label.seminaries.showCandidacy.Motivation"/></b>
						</td>
						<td>
							<bean:write name="motivation"/>
						</td>
					</tr>
					<logic:iterate indexId="index" type="DataBeans.Seminaries.InfoCaseStudy" name="cases" id="caseStudy">
					<tr>
						<td>
							<b><bean:message key="label.seminaries.showCandidacy.Case"/> <%=index.intValue()+1 %></b>
						</td>
						<td>
							<bean:write name="caseStudy" property="code"/> - <bean:write name="caseStudy" property="name"/>
						</td>
					</tr>
					</logic:iterate>
				</table>
				<html:link page="/listAllSeminaries.do"><bean:message key="label.seminaries.showCandidacy.Back"/></html:link>
					</logic:present>
				</logic:present>
			</logic:present>
	</logic:present>
</logic:present>