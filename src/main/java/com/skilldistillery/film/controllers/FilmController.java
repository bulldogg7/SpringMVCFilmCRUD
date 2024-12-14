package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.skilldistillery.film.data.FilmDAO;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDao;
	
	@RequestMapping(path = { "/", "home.do" })
	public String goHome(Model model) {
		return "home";
	}

	@GetMapping(path = { "newFilm.do" })
	public String goNewFilm(Model model) {
<<<<<<< HEAD
		// return "WEB-INF/newFilm.jsp";
=======
>>>>>>> 5f6b39d3750fc5da71d8833cd2ddb17d6bc1e6c9
		return "newFilm";
	}
}
