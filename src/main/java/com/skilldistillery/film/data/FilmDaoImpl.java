package com.skilldistillery.film.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Component
public class FilmDaoImpl implements FilmDAO {
	private static String URL = "jdbc:mysql://localhost:3306/sdvid";
	String user = "student";
	String password = "student";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
			System.err.println("Unable to load JDBC driver.");
		}
	}

	// ACTOR METHODS

	// CREATE
	@Override
	public Actor createActor(Actor actor) {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(URL, user, password);
			connection.setAutoCommit(false);
			String sqlTxt = "INSERT INTO actor (first_name, last_name) " + " VALUES (?,?)";
			PreparedStatement statement = connection.prepareStatement(sqlTxt, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, actor.getFirstName());
			statement.setString(2, actor.getLastName());
			int updateCount = statement.executeUpdate();
			if (updateCount == 1) {
				ResultSet results = statement.getGeneratedKeys();
				if (results.next()) {
					int newActorId = results.getInt(1);
					actor.setId(newActorId);
					if (actor.getFilms() != null && actor.getFilms().size() > 0) {
						sqlTxt = "INSERT INTO film_actor (film_id, actor_id) VALUES (?,?)";
						statement = connection.prepareStatement(sqlTxt);
						for (Film film : actor.getFilms()) {
							statement.setInt(1, film.getId());
							statement.setInt(2, newActorId);
							updateCount = statement.executeUpdate();
						}
					}
				}
			} else {
				actor = null;
			}
			connection.commit();
		} catch (SQLException sqle1) {
			sqle1.printStackTrace();
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error Initiating Rollback");
				}
			}
			throw new RuntimeException("Error Creating Actor : " + actor);
		}
		return actor;
	}

	// READ
	@Override
	public Actor readActorById(int actorId) {
		Actor actor = null;
		try {
			Connection connection = DriverManager.getConnection(URL, user, password);
			actor = null;
			String sqlText = "SELECT * FROM actor WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(sqlText);
			statement.setInt(1, actorId);
			ResultSet results = statement.executeQuery();
			while (results.next()) {
				actor = new Actor();
				actor.setId(results.getInt("id"));
				actor.setFirstName(results.getString("first_name"));
				actor.setLastName(results.getString("last_name"));
			}
			results.close();
			statement.close();
			connection.close();
			return actor;
		} catch (SQLException sqle) {
			System.out.println("Error Getting Actor " + actorId);
			sqle.printStackTrace();
		}
		return actor;
	}

	@Override
	public List<Actor> readAllActors() {
		Actor actor = null;
		List<Actor> actors = new ArrayList<>();
		try {
			Connection connection = DriverManager.getConnection(URL, user, password);
			String sqlText = "SELECT * FROM actor";
			PreparedStatement statement = connection.prepareStatement(sqlText);
			ResultSet results = statement.executeQuery();
			while (results.next()) {
				actor = new Actor();
				actor.setId(results.getInt("id"));
				actor.setFirstName(results.getString("first_name"));
				actor.setLastName(results.getString("last_name"));
				actors.add(actor);
			}
			results.close();
			statement.close();
			connection.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return actors;
	}

	@Override
	public List<Actor> readActorsByFilmId(int filmId) {
		Actor actor = null;
		List<Actor> actorsList = new ArrayList<>();
		try {
			Connection connection = DriverManager.getConnection(URL, user, password);
			String sqlText = "SELECT actor.* FROM actor JOIN film_actor on actor.id = film_actor.actor_id WHERE film_actor.film_id = ?";
			PreparedStatement statement = connection.prepareStatement(sqlText);
			statement.setInt(1, filmId);
			ResultSet results = statement.executeQuery();
			while (results.next()) {
				actor = new Actor();
				actor.setId(results.getInt("id"));
				actor.setFirstName(results.getString("first_name"));
				actor.setLastName(results.getString("last_name"));
				actorsList.add(actor);
			}
			results.close();
			statement.close();
			connection.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return actorsList;
	}

	// UPDATE
	@Override
	public Actor updateActor(Actor actor) {
		// TODO Auto-generated method stub
		return null;
	}

	// DELETE
	@Override
	public boolean deleteActor(int actorId) {
		boolean deleted = false;
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(URL, user, password);
			connection.setAutoCommit(false);
			String sqlTxt = "DELETE FROM actor WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(sqlTxt);
			statement.setInt(1, actorId);
			int updateCount = statement.executeUpdate();
			if (updateCount == 1) {
				deleted = true;
			} else {
				deleted = false;
			}
			connection.commit();
		} catch (SQLException sqle1) {
			sqle1.printStackTrace();
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error Initiating Rollback");
				}
			}
			throw new RuntimeException("Error Deleting Actor : " + actorId);
		}
		return deleted;
	}

	// FILM METHODS

	// CREATE
	@Override
	public Film createFilm(Film film) {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(URL, user, password);
			connection.setAutoCommit(false);
			String sqlTxt = "INSERT INTO film (title, description,release_year,language_id,rental_duration,"
							+ "rental_rate,length,replacement_cost,rating, special_features) "
							+ " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			PreparedStatement statement = connection.prepareStatement(sqlTxt, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, film.getTitle());
			statement.setString(2, film.getDescription());
			if (film.getReleaseYear() != null) {
				statement.setInt(3, film.getReleaseYear());
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}
			statement.setInt(4, film.getLanguageId());
			statement.setInt(5, film.getRentalDuration());
			statement.setDouble(6, film.getRentalRate());
			if (film.getLength() != null) {
				statement.setInt(7, film.getLength());
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			statement.setDouble(8, film.getReplacementCost());
			if (film.getRating() != null && !film.getRating().equals("")) {
				statement.setString(9, film.getRating());
			} else {
				statement.setNull(9, java.sql.Types.VARCHAR);
			}
			statement.setString(10, film.getSpecialFeatures());
			int updateCount = statement.executeUpdate();
			if (updateCount == 1) {
				ResultSet results = statement.getGeneratedKeys();
				if (results.next()) {
					int newFilmId = results.getInt(1);
					film.setId(newFilmId);
				}
				connection.commit();
			} else {
				film = null;
			}
		} catch (SQLException sqle1) {
			film = null;
			sqle1.printStackTrace();
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error Initiating Rollback");
				}
			}
			System.out.println(sqle1.getMessage());
			throw new RuntimeException("Error Inserting Film: " + film);
		}
		System.out.println(film.getId());
		System.out.println(film);
		return film;
	}

	// READ
	@Override
	public Film readFilmById(int filmId) {
		Film film = null;
		try {
			Connection connection = DriverManager.getConnection(URL, user, password);
			film = null;
			String sqlTxt = "SELECT film.*, language.name FROM film JOIN language on film.language_id = language.id WHERE film.id = ?";
			PreparedStatement statement = connection.prepareStatement(sqlTxt);
			statement.setInt(1, filmId);
			ResultSet results = statement.executeQuery();
			if (results.next()) {
				film = new Film();
				film.setId(results.getInt("Id"));
				film.setTitle(results.getString("title"));
				film.setDescription(results.getString("description"));
				film.setReleaseYear(results.getInt("release_year"));
				if (film.getReleaseYear() == 0) {
					film.setReleaseYear(null);
				}
				film.setLanguageId(results.getInt("language_id"));
				film.setRentalDuration(results.getInt("rental_duration"));
				film.setRentalRate(results.getDouble("rental_rate"));
				film.setLength(results.getInt("length"));
				if (film.getLength() == 0) {
					film.setLength(null);
				}
				film.setReplacementCost(results.getDouble("replacement_cost"));
				film.setRating(results.getString("rating"));
				film.setSpecialFeatures(results.getString("special_features"));
				film.setLanguage(results.getString("name"));
				List<Actor> actorList = readActorsByFilmId(filmId);
				film.setFilmActors(actorList);
//				film.setCategory(results.getString("film_category"));
			}
			results.close();
			statement.close();
			connection.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return (film);
	}

	@Override
	public List<Film> readAllFilms() {
		List<Film> films = new ArrayList<>();
		try {
			Connection connection = DriverManager.getConnection(URL, user, password);
			String sqlTxt = "SELECT film.*, language.name as language FROM film JOIN language ON film.language_id = language.id order by id asc";
			PreparedStatement statement = connection.prepareStatement(sqlTxt);
			ResultSet results = statement.executeQuery();
			while (results.next()) {
				int filmId = results.getInt("id");
				String title = results.getString("title");
				String description = results.getString("description");
				Integer releaseYear = results.getInt("release_year");
				int languageId = results.getInt("language_id");
				int rentalDuration = results.getInt("rental_duration");
				double rate = results.getDouble("rental_rate");
				Integer length = results.getInt("length");
				double replacementCost = results.getDouble("replacement_cost");
				String rating = results.getString("rating");
				String specialFeatures = results.getString("special_features");
				String language = results.getString("language");
//				String category = results.getString("film_category");
				Film film = new Film(filmId, title, description, releaseYear, languageId, rentalDuration, rate, length,
						replacementCost, rating, specialFeatures, language);
				films.add(film);
			}
			results.close();
			statement.close();
			connection.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return films;
	}

	@Override
	public List<Film> readFilmsByActorId(int actorId) {
		List<Film> films = new ArrayList<>();
		try {
			Connection connection = DriverManager.getConnection(URL, user, password);
			String sqlTxt = "SELECT * FROM film JOIN film_actor ON film.id = film_actor.film_id" + "WHERE actor_id = ?";
			PreparedStatement statement = connection.prepareStatement(sqlTxt);
			statement.setInt(1, actorId);
			ResultSet results = statement.executeQuery();
			while (results.next()) {
				int filmId = results.getInt("id");
				String title = results.getString("title");
				String description = results.getString("description");
				Integer releaseYear = results.getInt("release_year");
				int languageId = results.getInt("language_id");
				int rentalDuration = results.getInt("rental_duration");
				double rate = results.getDouble("rental_rate");
				Integer length = results.getInt("length");
				double replacementCost = results.getDouble("replacement_cost");
				String rating = results.getString("rating");
				String specialFeatures = results.getString("special_features");
				String language = results.getString("language");
//				String category = results.getString("film_category");
				Film film = new Film(filmId, title, description, releaseYear, languageId, rentalDuration, rate, length,
						replacementCost, rating, specialFeatures, language);
				film.setFilmActors(readActorsByFilmId(filmId));
				films.add(film);
			}
			results.close();
			statement.close();
			connection.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return films;
	}

	@Override
	public List<Film> readFilmsByKeyword(String keyword) {
		Film film = null;
		List<Film> films = new ArrayList<>();
		try {
			Connection connection = DriverManager.getConnection(URL, user, password);
			String sqlText = "SELECT film.id, title, description, release_year, rental_duration, rental_rate, length, "
					+ "replacement_cost, rating, special_features,"
					+ "language.name AS language_name " + "FROM film "
					+ "JOIN language ON film.language_id = language.id " 
					+ "WHERE title LIKE ? OR description LIKE ?";
			keyword = "%" + keyword + "%";
			PreparedStatement statement = connection.prepareStatement(sqlText);
			statement.setString(1, keyword);
			statement.setString(2, keyword);
			System.out.println(statement);
			ResultSet results = statement.executeQuery();
			while (results.next()) {
				film = new Film();
				film.setId(results.getInt("id"));
				film.setTitle(results.getString("title"));
				film.setDescription(results.getString("description"));
				film.setReleaseYear(results.getInt("release_year"));
				film.setLanguage(results.getString("language_name"));
				film.setRentalDuration(results.getInt("rental_duration"));
				film.setRentalRate(results.getDouble("rental_rate"));
				film.setRentalDuration(results.getInt("length"));
				film.setReplacementCost(results.getDouble("replacement_cost"));
				film.setRating(results.getString("rating"));
				film.setSpecialFeatures(results.getString("special_features"));
//				film.setCategory(results.getString("film_category"));
				film.setFilmActors(this.readActorsByFilmId(film.getId()));
				films.add(film);
			}
			results.close();
			statement.close();
			connection.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return films;
	}

	// UPDATE
	@Override
	public Film updateFilmById(Film film) {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(URL, user, password);
			connection.setAutoCommit(false); // START TRANSACTION
			String sqlTxt = "UPDATE film SET title = ?, description = ?, release_year = ?, language_id = ?, "
					+ "rental_duration = ?, rental_rate = ?, length = ?, replacement_cost = ?, rating = ?,"
					+ " special_features = ? WHERE id = ?;";
			PreparedStatement statement = connection.prepareStatement(sqlTxt);
			statement.setString(1, film.getTitle());
			statement.setString(2, film.getDescription());
			if (film.getReleaseYear() != null) {
				statement.setInt(3, film.getReleaseYear());
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}
			System.out.println(film.getLanguageId());
			statement.setInt(4, film.getLanguageId());
			statement.setInt(5, film.getRentalDuration());
			statement.setDouble(6, film.getRentalRate());
			if (film.getLength() != null) {
				statement.setInt(7, film.getLength());
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			statement.setDouble(8, film.getReplacementCost());
			if (film.getRating() != null && !film.getRating().equals("")) {
				statement.setString(9, film.getRating());
			} else {
				statement.setNull(9, java.sql.Types.VARCHAR);
			}
			statement.setString(10, film.getSpecialFeatures());
			statement.setInt(11, film.getId());
			int updateCount = statement.executeUpdate();
			if (updateCount == 1) {
				connection.commit();
				return film;
			}
		} catch (SQLException sqle1) {
			sqle1.printStackTrace();
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error Updating Film: " + sqle1.getMessage());
		}
		System.out.println("Updated Film: " + film);
		return film;
	}

	// DELETE
	@Override
	public boolean deleteFilm(Film filmId) {
		boolean deleted = false;
		Connection connection = null;
		int idFilm = filmId.getId();
		try {
			connection = DriverManager.getConnection(URL, user, password);
			connection.setAutoCommit(false);
			String sqlTxt = "DELETE FROM film WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(sqlTxt);
			
			statement.setInt(1, filmId.getId());
			int updateCount = statement.executeUpdate();
			if (updateCount == 1) {
				deleted = true;
			} else {
				deleted = false;
			}
			connection.commit();
		} catch (SQLException sqle1) {
			sqle1.printStackTrace();
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error Initiating Rollback");
				}
			}
			throw new RuntimeException("Error Deleting Film : " + idFilm);
		}
		return deleted;
	}
}