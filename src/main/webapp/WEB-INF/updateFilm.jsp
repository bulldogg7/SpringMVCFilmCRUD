<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Film</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.ico">
<link rel="stylesheet" href="styles.css" />
</head>
<h1>Update Film</h1>
<body>
	<form action="updateFilm.do" method="POST">
		<strong>Film ID:</strong> ${film.id} <br> <br> <strong>Title:</strong>
		${film.title} <br> <label for="title">Enter the Film
			Title:</label> <input type="text" id="title" name="title"
			value="${film.title}" required><br> <br> <strong>Description:</strong>
		${film.description} <br> <label for="description">Enter
			the Film Description:</label> <input type="text" id="description"
			name="description" size="90" required="required"
			value="${film.description}"><br> <br> <strong>Release
			Year:</strong> ${film.releaseYear} <br> <label for="releaseYear">Select
			the Year the Film Was Released:</label> <input type="number" id="releaseYear"
			name="releaseYear" min="1930" max="2024" value="${film.releaseYear}"><br>
		<br> <strong>Language:</strong> ${film.language} <br> <input
			type="radio" id="languageId" name="languageId" value="1"
			required="required"> <label for="languageId">1.)
			English</label><br> <input type="radio" id="languageId"
			name="languageId" value="2" required="required"> <label
			for="languageId">2.) Italian</label><br> <input type="radio"
			id="languageId" name="languageId" value="3" required="required">
		<label for="languageId">3.) Japanese</label><br> <input
			type="radio" id="languageId" name="languageId" value="4"
			required="required"> <label for="languageId">4.)
			Mandarin</label><br> <input type="radio" id="languageId"
			name="languageId" value="5" required="required"> <label
			for="language_id">5.) French</label><br> <input type="radio"
			id="languageId" name="languageId" value="6" required="required">
		<label for="languageId">6.) German</label><br> <br> <strong>Length
			(Minutes):</strong> ${film.length} <br> <label for="length">Select
			the Film Length (in Minutes):</label> <input type="number" id="length"
			name="length" min="45" max="185" value="${film.length}" step="5"><br>
		<br> <strong>Rating:</strong> ${film.rating} <br> <input
			type="radio" id="rating" name="rating" value="PG"
			value="${film.rating}" required> <label for="rating">1.)
			PG -- Parental Guidance Suggested</label><br> <input type="radio"
			id="rating" name="rating" value="G"> <label for="rating">2.)
			G -- General Audiences (All Ages)</label><br> <input type="radio"
			id="rating" name="rating" value="NC17"> <label for="rating">3.)
			NC-17 -- No One 17 & Under Admitted</label><br> <input type="radio"
			id="rating" name="rating" value="PG13"> <label for="rating">4.)
			PG-13 -- Parents Strongly Cautioned</label><br> <input type="radio"
			id="rating" name="rating" value="R"> <label for="rating">6.)
			R -- Restricted (Under 17 Requires a Parent)</label><br> <br> <strong>Special
			Features:</strong> ${film.specialFeatures} <br> <input type="checkbox"
			id="specialFeatures" name="specialFeatures" value="Deleted Scenes">
		<label for="specialFeatures"> Deleted Scenes</label><br> <input
			type="checkbox" id="specialFeatures" name="specialFeatures"
			value="Behind the Scenes"> <label for="specialFeatures">
			Behind the Scenes</label><br> <input type="checkbox"
			id="special_features" name="specialFeatures" value="Trailers">
		<label for="specialFeatures"> Trailers</label><br> <input
			type="checkbox" id="specialFeatures" name="specialFeatures"
			value="Commentaries"> <label for="specialFeatures">
			Commentaries</label><br> <br>
		<hr>
		<strong>Rental Duration (Days):</strong> ${film.rentalDuration} <br>
		<input type="radio" id="rentalDuration" name="rentalDuration"
			value="2" required> <label for="rentalDuration">| New
			Release Film (Red Box): 2-day Rental Duration</label><br> <input
			type="radio" id="rentalDuration" name="rentalDuration" value="7">
		<label for="rentalDuration">| Older Film (Blue Box): 7-day
			Rental Duration</label><br> <br> <strong>Daily Rental
			Rate:</strong> ${film.rentalRate} <br> <label for="rentalRate">How
			Much is it to Rent the Film?</label> <input type="number" id="rentalRate"
			name="rentalRate" value="8.99" min="5.99" max="19.99" step="1.0"><br>
		<br> <strong>Replacement Cost:</strong> ${film.replacementCost} <br>
		<label for="replacementCost">How Much is it to Replace the
			Film?</label> <input type="number" id="replacementCost"
			name="replacementCost" min="9.99" max="29.99" value="14.99"
			step="1.0"><br> <br> <input type="submit"
			class="submit-button" value="Update Film">
	</form>
	<br>
	<button type="submit" onclick="window.location.href='/MVCFilmSite/'">Return
		To Home</button>
</body>
</html>