<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>List todos</title>
</head>
<link href="webjars/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<body>
	<div class="container">
		<h2>Hi ${name},</h2>

		<table class="table table-striped">
			<caption>Your todos are</caption>
			<thead>
				<tr>
					<th>Id</th>
					<th>Description</th>
					<th>Target date</th>
					<th>Is completed</th>
					<th>User</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${todos}" var="todo">
					<tr>
						<td>${todo.id}</td>
						<td>${todo.desc}</td>
						<td>${todo.targetDate}</td>
						<td>${todo.done}</td>
						<td>${todo.user}</td>
						<td><a class="btn btn-danger" href="delete-todo?id=${todo.id}"> Delete </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div>
			<a class="btn btn-success" href="/add-todo">Add todo</a>
		</div>
	</div>
	<script src="webjars/jquery/2.1.4/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>