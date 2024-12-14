package com.skilldistillery.film.data;

import java.util.List;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface FilmDAO {
	
	// Actors ---> CRUD
		// CREATE
		public Actor createActor(Actor actor);
		
		// READ
		public Actor readActorById(int actorId);
		public List<Actor> readAllActors();
		public List<Actor> readActorsByFilmId(int filmId);
		
		
		// UPDATE
		public Actor updateActor(Actor actor);
		
		// DELETE
		public boolean deleteActor(int actorId);

		// Films ---> CRUD
		// CREATE
		public Film createFilm(Film film);
		
		// READ
		public Film readFilmById(int filmId);
		public List<Film> readAllFilms();
		public List<Film> readFilmsByActorId(int actorId);
		public List<Film> readFilmsByKeyword(String keyword);
		
		// UPDATE
		public Film updateFilmById(Film film);
		
		// DELETE
		public boolean deleteFilm(int filmId);
	}