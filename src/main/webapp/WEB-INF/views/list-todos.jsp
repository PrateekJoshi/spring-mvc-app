
<!-- Add jsp fragement (.jspf) in the jsp  -->
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
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
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${todos}" var="todo">
				<tr>
					<td>${todo.id}</td>
					<td>${todo.desc}</td>
					<td><fmt:formatDate value="${todo.targetDate}"
							pattern="dd/MM/yyyy" /></td>
					<td>${todo.done}</td>
					<td>${todo.user}</td>
					<td><a class="btn btn-info" href="update-todo?id=${todo.id}">
							Update </a></td>
					<td><a class="btn btn-danger" href="delete-todo?id=${todo.id}">
							Delete </a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<div>
		<a class="btn btn-success" href="/add-todo">Add todo</a>
	</div>
</div>
<%@ include file="common/footer.jspf"%>
