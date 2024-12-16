package com.skilldistillery.film.entities;

import java.util.Objects;

public class Category {
	//fields
	private int filmId;
	private String name;
	
	//constructors
	public Category() {
		super();
	}
	public Category(int filmId, String name) {
		super();
		this.filmId = filmId;
		this.name = name;
	}
	
	//Getters and Setters for Category fields filmId and categoryId
	public int getFilmId() {
		return filmId;
	}
	public void setFilmId(int filmId) {
		this.filmId = filmId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	//hashcode and equals
	@Override
	public int hashCode() {
		return Objects.hash(filmId, name);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		return filmId == other.filmId && Objects.equals(name, other.name);
	}
	//toString
	
	@Override
	public String toString() {
		return name;
	}

	
}