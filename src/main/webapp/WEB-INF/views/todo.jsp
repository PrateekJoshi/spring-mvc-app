<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="webjars/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container">
		<h1>Add a Todo</h1>
		<form:form method="post" modelAttribute="todo" >
			<fieldset class="form-group">
				<form:label path="desc">Description</form:label> 
				<form:input path="desc" type="text" class="form-control" required="required"/>
				<!-- To display form validation error using hibernate-validator -->
				<form:errors path="desc" cssClass="text-warning"></form:errors>
			</fieldset>
			<input type="submit" value="Add" class="btn btn-info" />
		</form:form>
	</div>
</body>
</html>