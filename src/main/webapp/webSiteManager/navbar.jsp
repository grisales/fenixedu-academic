<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<html:xhtml/>

<ul>
	<li>
		<html:link page="<%= "/index.do" %>">
			<bean:message key="link.website.listSites"/>
		</html:link>
	</li>
</ul>