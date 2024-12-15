<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<title>Films By Keyword</title>
<link rel="icon" type="image/x-icon" href="/images/favicon.ico">
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<h1>Films By Keyword: '${keyword}'</h1>
	<c:if test="${! empty films}">
		<p>
			<strong>Showing ${films.size()} Results</strong>
		</p>
		<hr>
	</c:if>
	<c:if test="${empty films}">
		<p>
			<strong>No Results Found For: </strong>'${keyword}'
		</p>
	</c:if>
	<div>
		<table>
			<thead>
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Rating</th>
					<th>Language</th>
					<th>Rental Rate</th>
					<th>Special Features</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="film" items="${films}">
					<c:if test="${empty rating}">
						<tr>
					</c:if>
					<c:if test="${! empty rating}">
						<c:if test="${film.rating == rating}">
							<tr class="found">
						</c:if>
						<c:if test="${film.rating != rating}">
							<tr>
						</c:if>
					</c:if>
					<td><a
						href="<c:url value='readFilm.do'><c:param name='id' value='${film.id}'/></c:url>">
							${film.id}: ${film.title} </a></td>
					<td>
						<h5 class="card-text">${film.description}</h5>
					</td>
					<td>${film.rating}</td>
					<td>${film.language}</td>
					<td>${film.rentalRate}</td>
					<td>${film.specialFeatures}</td>
					<td>
						<form action="updateFilm.do" method="GET">
							<div class="form-group">
								<input type="hidden" class="form-control" id="id" name="id"
									value="<c:out value='${film.id}' />">
							</div>
							<button type="submit" class="edit-button">Edit Film</button>
						</form>
					</td>
					<td>
						<form action="deleteFilm.do" method="POST"
							onsubmit="return window.confirm('Delete?');">
							<div>
								<input type="hidden" class="form-control" id="id" name="id"
									value="<c:out value='${film.id}' />">
							</div>
							<button type="submit" class="delete-button">Delete Film</button>
						</form>
					</td>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>