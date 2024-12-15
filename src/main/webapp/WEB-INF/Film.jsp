<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Film</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.ico">
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<h1>Film - ${film.id}</h1>
	<div>
		<p>
			<b>Film ID: </b> ${film.id}
		</p>
		<p>
			<b>Title:</b> ${film.title}
		</p>
		<p>
			<b>Description:</b> ${film.description}
		</p>
		<p>
			<b>Release Year:</b> ${film.releaseYear}
		</p>
		<p>
			<b>Language:</b> ${film.language}
		</p>
		<p>
			<b>Rental Duration:</b> ${film.rentalDuration}
		</p>
		<p>
			<b>Rental Rate:</b> ${film.rentalRate}
		</p>
		<p>
			<b>Length:</b> ${film.length}
		</p>
		<p>
			<b>Replacement Cost:</b> ${film.replacementCost}
		</p>
		<p>
			<b>Rating:</b> ${film.rating}
		</p>
		<p>
			<b>Special Features:</b> ${film.specialFeatures}
		</p>

		<form action="updateFilm.do" method="GET">
			<div class="form-group">
				<input type="hidden" class="form-control" id="id" name="id"
					value="<c:out value='${film.id}' />">
			</div>
			<br>
			<button type="submit" class="edit-button">Edit Film</button>
		</form>
		<br> <br>
		<form action="deleteFilm.do" method="POST"
			onsubmit="return window.confirm('Confirm Delete?');">
			<div class="form-group">
				<input type="hidden" class="form-control" id="id" name="id"
					value="<c:out value='${film.id}' />">
			</div>
			<button type="submit" class="delete-button">Delete Film</button>
		</form>
	</div>
</body>
</html>