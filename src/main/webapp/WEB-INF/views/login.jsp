<!-- Add jsp fragement (.jspf) in the jsp  -->
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
<div class="container">
<p>
	<font color="red">${errorMessage}</font>
</p>
<form action="/login" method="POST">
	<label>Name : </label>
	<input name="name" type="text" class="form-control input-sm" size="20"/> 
	<label>Password : </label>
	<input name="password" type="password" class="form-control input-sm"  size="20"/> 
	<br>
	<input type="submit" class="btn btn-success"/>
</form>
</div>
<%@ include file="common/footer.jspf"%>