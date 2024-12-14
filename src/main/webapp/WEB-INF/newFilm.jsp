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
        <input type="radio" id="LanguageId" name="languageId" value="languageId">
        <label for="LanguageId">1.) English</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="languageId">
        <label for="LanguageId">2.) Italian</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="languageId">
        <label for="LanguageId">3.)Japanese</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="languageId">
        <label for="LanguageId">4.) Mandarin</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="languageId">
        <label for="LanguageId">5.) French</label><br>
        <input type="radio" id="LanguageId" name="languageId" value="languageId">
        <label for="LanguageId">6.) German</label><br><br>
        <!-- This section will receive our language input -->
        
        <h3> Rental Duration</h3>
        <input type="radio" id="rentalDuration" name="rentalDuration" value="2">
        <label for="rentalDuration">| Brand new movie (red box), 2 day rental duration</label><br>
        <input type="radio" id="rentalDuration" name="rentalDuration" value="7">
        <label for="rentalDuration">| Older movie (blue box), 7 day rental duration</label><br><br>
        
        <h3>Rental Rate</h3>
        <input type="number" value="8.99" min="5.99" max="19.99" step="1.0" />

        <input type="submit" value="Submit">
        
    </form>
   
  </body>
</html>