<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Add jsp fragement (.jspf) in the jsp  -->
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<body>
	<div class="container">
		<h1>Add a Todo</h1>
		<form:form method="post" modelAttribute="todo">
			<form:hidden path="id" />
			<form:hidden path="user" />
			<fieldset class="form-group">
				<form:label path="desc">Description</form:label>
				<form:input path="desc" type="text" class="form-control"
					required="required" />
				<!-- To display form validation error using hibernate-validator -->
				<form:errors path="desc" cssClass="text-warning"></form:errors>
			</fieldset>
			<fieldset class="form-group">
				<form:label path="targetDate">Target Date</form:label>
				<form:input path="targetDate" type="text" class="form-control"
					required="required" />
				<!-- To display form validation error using hibernate-validator -->
				<form:errors path="targetDate" cssClass="text-warning"></form:errors>
			</fieldset>
			<input type="submit" value="Submit" class="btn btn-info" />
		</form:form>
	</div>
<%@ include file="common/footer.jspf"%>