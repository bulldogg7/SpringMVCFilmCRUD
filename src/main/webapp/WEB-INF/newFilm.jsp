<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>New Film</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.ico">
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<h1>Welcome to Film Findr!</h1>
	<form action="MovieMaker" method="post">
		<!--Creates a form named Movie maker-->
		<h3>Film Title</h3>
		<label for="newTitle">Enter the Film Title:</label> <input type="text"
			id="newTitle" name="newTitle"><br> <br>
		<!--we get a new title (need to use this variables "name" tag (newTitle) to use in other classes-->
		<h3>Film Description</h3>
		<label for="newDescription">Enter the Film Description:</label> <input
			type="text" id="newDescription" name="newDescription"><br>
		<br>
		<!--we get a new description (need to use this variables "name" tag (newDescription) to use in other classes-->
		<h3>Release Year</h3>
		<label for="year">Select the Year the Film Was Released:</label> <input
			type="number" id="year" name="newReleaseYear" min="1900" max="2024"
			value="2024"><br> <br>
		<!--we get a new release year (need to use this variables "name" tag (newReleaseYear) to use in other classes-->
		<h3>Film Language</h3>
		<input type="radio" id="LanguageId" name="languageId" value="English">
		<label for="LanguageId">1.) English</label><br> <input
			type="radio" id="LanguageId" name="languageId" value="Italian">
		<label for="LanguageId">2.) Italian</label><br> <input
			type="radio" id="LanguageId" name="languageId" value="Japanese">
		<label for="LanguageId">3.) Japanese</label><br> <input
			type="radio" id="LanguageId" name="languageId" value="Mandarin">
		<label for="LanguageId">4.) Mandarin</label><br> <input
			type="radio" id="LanguageId" name="languageId" value="French">
		<label for="LanguageId">5.) French</label><br> <input
			type="radio" id="LanguageId" name="languageId" value="German">
		<label for="LanguageId">6.) German</label><br> <br>
		<!-- This section will receive our language input, use name (languageId) -->
		<h3>Rental Duration</h3>
		<input type="radio" id="rentalDuration" name="rentalDuration"
			value="2"> <label for="rentalDuration">| New Release
			Film (Red Box): 2-day Rental Duration</label><br> <input type="radio"
			id="rentalDuration" name="rentalDuration" value="7"> <label
			for="rentalDuration">| Older Film (Blue Box): 7-day Rental
			Duration</label><br> <br>
		<!-- This section lets you select how long the film will be able to be rented for, use name tag (rentalDuration)-->
		<h3>Rental Rate</h3>
		<label for="rentalRate">How Much is it to Rent the Film?</label> <input
			type="number" id="rentalRate" name="rentalRate" value="8.99"
			min="5.99" max="19.99" step="1.0" /><br> <br>
		<!-- This section lets you add how much the film will cost, use name (rentalRate)-->
		<h3>Film Length</h3>
		<label for="filmLength">Select the Film Length (in Minutes):</label> <input
			type="number" id="filmLength" name="filmLength" min="45" max="185"
			value="90" step="5"><br> <br>
		<!-- This section lets you choose how long the film will be, use name (filmLength) -->
		<h3>Replacement Cost</h3>
		<label for="replacementCost">How Much is it to Replace the
			Film?</label> <input type="number" id="replacementCost"
			name="replacementCost" min="9.99" max="29.99" value="14.99"
			step="1.0"><br> <br>
		<!-- This section lets you choose how much the film cost to replace, use name (replacementCost)-->
		<h3>Film Rating</h3>
		<input type="radio" id="rating" name="rating" value="PG"> <label
			for="LanguageId">1.) PG -- Parental Guidance Suggested</label><br>
		<input type="radio" id="rating" name="rating" value="G"> <label
			for="LanguageId">2.) G -- General Audiences (All Ages)</label><br>
		<input type="radio" id="rating" name="rating" value="NC17"> <label
			for="LanguageId">3.) NC-17 -- No One 17 & Under Admitted</label><br>
		<input type="radio" id="rating" name="rating" value="PG13"> <label
			for="LanguageId">4.) PG-13 -- Parents Strongly Cautioned</label><br>
		<input type="radio" id="rating" name="rating" value="R"> <label
			for="LanguageId">6.) R -- Restricted (Under 17 Requires a
			Parent)</label><br> <br>
		<!-- This section lets you choose the rating of the film, use name (rating)-->
		<h3>Special Features</h3>
		<input type="checkbox" id="specialFeatures" name="specialFeatures"
			value="Deleted Scenes"> <label for="specialFeatures">
			Deleted Scenes</label><br> <input type="checkbox" id="specialFeatures"
			name="specialFeatures" value="Behind the Scenes"> <label
			for="specialFeatures"> Behind the Scenes</label><br> <input
			type="checkbox" id="specialFeatures" name="specialFeatures"
			value="Trailers"> <label for="specialFeatures">
			Trailers</label><br> <input type="checkbox" id="specialFeatures"
			name="specialFeatures" value="Commentaries"> <label
			for="specialFeatures"> Commentaries</label><br> <br>
		<!-- This section lets you choose what special features the film has use name (specialFeatures)-->
		<input type="submit" value="Submit">
	</form>
</body>
</html>
