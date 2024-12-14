
package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.film.data.FilmDAO;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String goHome(Model model) {
		// return "WEB-INF/home.jsp";
		return "home";
	}
	
	@RequestMapping(path = { "newFilm.jsp" })
	public String goNewFilm(Model model) {
		// return "WEB-INF/newFilm.jsp";
		return "newFilm";
	}
}
