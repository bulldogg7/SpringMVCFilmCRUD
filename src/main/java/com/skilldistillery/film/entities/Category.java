package com.skilldistillery.film.entities;

import java.util.Objects;

public class Category {
	private String filmCategory;

	public Category() {
		super();
	}

	public Category(String filmCategory) {
		super();
		this.filmCategory = filmCategory;
	}
	
	public String getFilmCategory() {
		return filmCategory;
	}
	public void setFilmCategory(String filmCategory) {
		this.filmCategory = filmCategory;
	}

	@Override
	public int hashCode() {
		return Objects.hash(filmCategory);
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
		return Objects.equals(filmCategory, other.filmCategory);
	}

	@Override
	public String toString() {
		return "Category [filmCategory=" + filmCategory + "]";
	}	
}