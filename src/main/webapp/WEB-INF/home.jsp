<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
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
		<form action="Film" method="GET">
			<label for="find-id">Search Film By Id: </label> <input type="number"
				name="film-id" min="1" step="1" placeholder="777" /><br> <br>
			<input class="search-button" type="submit" value="Search By Id" />
		</form>
		<br> <br>
		<form action="filmResults" method="POST">
			<label for="find-keyword" class="form-label">Search Film By
				Keyword: </label><input type="text" name="name" minlength="0"
				maxlength="255" placeholder="Superman" /> <br> <br>
			<input class="search-button" type="submit" value="Search By Keyword" />
		</form>
		<br> <br>
		<form action="newFilm" method="GET">
			<input type="submit" class="add-film-button" value="Add Film" />
		</form>
	</div>
</body>
</html>