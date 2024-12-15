<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Findr</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.ico">
<link rel="stylesheet" href="styles.css" />
</head>
<h1>Welcome to Film Findr!</h1>
<body>
	<div class="container">
		<h2>Films</h2>
		<form action="readFilm.do" method="GET">
			<label for="id" class="form-label">Search Film By Id: </label> <br>
			<br> <input type="number" name="id" required="required" min="1"
				step="1" placeholder="777" /><br> <br> <input
				class="submit-button" type="submit" value="Search By ID" />
		</form>
		<br>
		<hr>
		<br>
		<form action="readFilms.do" method="POST">
<<<<<<< HEAD
			<label for="name" class="form-label">Search Film by Keyword:
			</label> <br> <br> <input type="text" name="name" minlength="1"
				maxlength="255" placeholder="Superman" /> <br> <br> <input
				class="btn btn-success" type="submit" value="Search By Keyword" />
				
		</form>

=======
			<label for="name" class="form-label">Search Film By Keyword:
			</label> <br> <br> <input type="text" name="name"
				required="required" maxlength="255" placeholder="Superman" /> <br>
			<br> <input class="submit-button" type="submit"
				value="Search By Keyword" />
		</form>
>>>>>>> f9ce996e3e43e52f9d2c9c7c410a0a1ffffbe2bd
		<br>
		<hr>
		<br>
<<<<<<< HEAD
		<form action="newFilm.do" method="GET">
			<input type="submit" class="btn btn-outline btn-add"
				value="Add New Film" title="Add New Film" />
			</form>
		<br> <br>
		<form action="addFilm.do" method="GET">
			<input type="submit" class="add-film-button" value="Add Film" />
			<a href="newFilm.jsp">Add Film</a><br/>

		</form>
=======
>>>>>>> f9ce996e3e43e52f9d2c9c7c410a0a1ffffbe2bd

		<form action="newFilm.do" method="GET">
			<input type="submit" class="submit-button" value="Add New Film"
				title="Add New Film" />
		</form>
	</div>
</body>
</html>