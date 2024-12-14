<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Movie Maker</title>
    <link rel="stylesheet" href="styles.css" />
  </head>
  <body>
      <h1 class="title">Welcome to Movie Maker! </h1>
      <form action="MovieMaker" method="post">
        <!--Creates a form named Movie maker-->
        <h3>Title</h3>
        <label for="newTitle">Enter in film title:</label>
         <input type="text" id="newTitle" name="newTitle"><br><br>
         <!--we get a new title (need to use this variables "name" tag (newTitle) to use in other classes-->
         <h3>Description</h3>
         <label for="newDescription">Enter in the films description:</label>
         <input type="text" id="newDescription" name="newDescription"><br><br>
          <!--we get a new description (need to use this variables "name" tag (newDescription) to use in other classes-->

         <h3>Release Year</h3>
        <label for="year">Select a year the film was made:</label>
        <input type="number" id="year" name="newReleaseYear" min="1900" max="2024" value="2024"><br><br>
                 <!--we get a new release year (need to use this variables "name" tag (newReleaseYear) to use in other classes-->
        <h3>Film Language</h3>
        <input type="radio" id="LanguageId" name="languageId" value="English">
        <label for="LanguageId">1.) English</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="Italian">
        <label for="LanguageId">2.) Italian</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="Japanese">
        <label for="LanguageId">3.)Japanese</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="Mandarin">
        <label for="LanguageId">4.) Mandarin</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="French">
        <label for="LanguageId">5.) French</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="German">
        <label for="LanguageId">6.) German</label><br><br>
        <!-- This section will receive our language input, use name (languageId) -->
        
        <h3> Rental Duration</h3>
        <input type="radio" id="rentalDuration" name="rentalDuration" value="2">
        <label for="rentalDuration">| Brand new movie (red box), 2 day rental duration</label><br>
        <input type="radio" id="rentalDuration" name="rentalDuration" value="7">
        <label for="rentalDuration">| Older movie (blue box), 7 day rental duration</label><br><br>
        <!-- This section lets you select how long the film will be able to be rented for, use name tag (rentalDuration)-->
        
        <h3>Rental Rate</h3>
        <label for="rentalRate">How much is it to rent the film?:</label>
        <input type="number" id="rentalRate" name="rentalRate" value="8.99" min="5.99" max="19.99" step="1.0" /><br><br>
        <!-- This section lets you add how much the film will cost, use name (rentalRate)-->
        <h3>Film Lenth</h3>
        <label for="filmLength">Select how long the film is:</label>
        <input type="number" id="filmLength" name="filmLength" min="45" max="185" value="60"step="5"><br><br>
        <!-- This section lets you choose how long the film will be, use name (filmLength) -->
        
        <h3>Replacement cost</h3>
        <label for="replacementCost">How much is it to replace the film?:</label>
        <input type="number" id="replacementCost" name="replacementCost" min="9.99" max="29.99" value="14.99"step="1.0"><br><br>
        <!-- This section lets you choose how much the filn cost to replace, use name (replacementCost)-->
        
        <h3>Film Rating</h3>
        <input type="radio" id="rating" name="rating" value="PG">
        <label for="LanguageId">1.) PG --Parental Guidance Suggested</label><br>
        <input type="radio" id="rating" name="rating" value="G">
        <label for="LanguageId">2.) G. --General Audiences (all ages)</label><br>
        <input type="radio" id="rating" name="rating" value="NC17">
        <label for="LanguageId">3.) NC17 --No One 17 and Under Admitted</label><br>
        <input type="radio" id="rating" name="rating" value="PG13">
        <label for="LanguageId">4.) PG13 --Parents Strongly Cautioned</label><br>
        <input type="radio" id="rating" name="rating" value="R">
        <label for="LanguageId">6.) R --Restricted (under 17 requires a parent)</label><br><br>
        <!-- This section lets you choose the rating of the film, use name (rating)-->
        <h3>Special Features</h3>
        
        <input type="checkbox" id="specialFeatures" name="specialFeatures" value="Deleted Scenes">
        <label for="specialFeatures"> Deleted Scenes</label><br>
        <input type="checkbox" id="specialFeatures" name="specialFeatures" value="Behind the Scenes">
        <label for="specialFeatures"> Behind the Scenes</label><br>
        <input type="checkbox" id="specialFeatures" name="specialFeatures" value="Trailers">
        <label for="specialFeatures"> Trailers</label><br>
        <input type="checkbox" id="specialFeatures" name="specialFeatures" value="Commentaries">
        <label for="specialFeatures"> Commentaries</label><br><br>
        <!-- This section lets you choose what special features the film has use name (specialFeatures)-->
        
        <input type="submit" value="Submit">
        
        
    </form>
   
  </body>
</html>
