<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>List todos</title>
</head>
<body>
	<h2>Hi ${name},</h2>

	<table>
		<caption>Your todos are</caption>
		<thead>
			<tr>
				<th>Id</th>
				<th>Description</th>
				<th>Target date</th>
				<th>Is completed</th>
				<th>User</th>
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
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<a class="button" href="/add-todo">Add todo</a>
</html>