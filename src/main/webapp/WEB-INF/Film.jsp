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
			<strong>Film ID:</strong> ${film.id}
		</p>
		<p>
			<strong>Title:</strong> ${film.title}
		</p>
		<p>
			<strong>Description:</strong> ${film.description}
		</p>
		<p>
			<strong>Release Year:</strong> ${film.releaseYear}
		</p>
		<p>
			<strong>Language:</strong> ${film.language}
		</p>
		<p>
			<strong>Length (Minutes):</strong> ${film.length}
		</p>
		<p>
			<strong>Rating:</strong> ${film.rating}
		</p>
		<p>
			<strong>Genre:</strong>
			<!-- What is the call for this? -->
		</p>
		<p>
			<strong>Special Features:</strong> ${film.specialFeatures}
		</p>
		<hr>
		<p>
			<strong>Actors:</strong>
			<!-- What is the call for this? -->
			<c:forEach var="actor" items="${film.filmActors}">
				<li>${actor}</li>
			</c:forEach>
		</p>
		<hr>
		<p>
			<strong>Rental Duration (Days):</strong> ${film.rentalDuration}
		</p>
		<p>
			<strong>Daily Rental Rate:</strong> ${film.rentalRate}
		</p>
		<p>
			<strong>Replacement Cost:</strong> ${film.replacementCost}
		</p>

		<form action="updateFilm.do" method="GET">
			<div class="form-group">
				<input type="hidden" class="form-control" id="id" name="id"
					value="<c:out value='${film.id}' />">
			</div>
			<br>
			<button type="submit" class="edit-button">Edit Film</button>
		</form>
		<br>
		<form action="deleteFilm.do" method="POST"
			onsubmit="return window.confirm('Confirm Delete?');">
			<div class="form-group">
				<input type="hidden" class="form-control" id="id" name="id"
					value="<c:out value="${film.id}" />">
			</div>
			<button type="submit" class="delete-button">Delete Film</button>
		</form>
		<br>
		<br>
		<button type="submit" onclick="window.location.href='/MVCFilmSite/'">Return To Home</button>
	</div>
</body>
</html>