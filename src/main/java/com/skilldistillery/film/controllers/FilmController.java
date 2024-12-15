package com.skilldistillery.film.controllers;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDao;

	@RequestMapping(path = { "/", "home.do" })
	public String goHome(Model model) {
		return "home";
	}

	@GetMapping(path = { "readFilm.do" })
	public String readFilmById(@RequestParam(name = "id", required = true, defaultValue = "0") int id, Model model) {
		Film film = null;
		film = filmDao.readFilmById(id);
		model.addAttribute("film", film);
		return "Film";
	}

	@RequestMapping(path = { "readFilms.do" })
	public String searchFilmsByKeyword(@RequestParam(name = "name", required = true, defaultValue = "") String name,
			@RequestParam(name = "rating", required = false, defaultValue = "") String rating, Model model) {
		List<Film> films = new ArrayList<>();
		films = filmDao.readFilmsByKeyword(name);
		model.addAttribute("films", films);
		model.addAttribute("keyword", name);
		model.addAttribute("rating", rating);
		return "keywordFilms";
	}

	@GetMapping(path = { "newFilm.do" })
	public String goNewFilm(Model model) {
		return "newFilm";
	}

	@PostMapping(path = { "newFilm.do" })
	public String createNewFilm(Film film, Model model) {
		System.out.println("Film data: " + film);
		film = filmDao.createFilm(film);
		return "redirect:/readFilm.do?id=" + film.getId();
	}

	@PostMapping(path = { "deleteFilm.do" })
	public String goDeleteFilm(Film film, Model model) {
		filmDao.deleteFilm(film);
		
		return "deleteFilm";
	}
	
	@GetMapping(path = { "updateFilm.do" })
	public String goUpdateFilm(@RequestParam(name = "id", required = true, defaultValue = "0") int id, Model model) {
		Film film = null;
		film = filmDao.readFilmById(id);
		model.addAttribute("film", film);
		return "updateFilm";
	}
	
	@PostMapping(path = { "updateFilm.do" })
	public String updateFilm(Film film, Model model) {
	    System.out.println("Film data: " + film.getId());
	    film = filmDao.updateFilmById(film);
	    return "redirect:/readFilm.do?id=" + film.getId();
	}
}