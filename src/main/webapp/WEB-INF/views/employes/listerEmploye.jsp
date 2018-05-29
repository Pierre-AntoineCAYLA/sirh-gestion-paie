

<%@page import="java.util.List"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Index</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
</head>



<header>
	<h1>Liste des employés</h1>
</header>
<body onload="formIsValid()">

	<div class="container">
		<div class="row">
			<div class="col">
				<header>
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<a class="navbar-brand" href="#">Collaborateurs</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNavDropdown">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="#">Statistiques</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Activités</a>
								</li>
							</ul>
						</div>
					</nav>
				</header>
			</div>
		</div>

		<div class="row">
			<div class="col-8">
				<h1>Liste des collaborateurs</h1>
			</div>
		</div>
		
		<form method="GET" path="RemunerationEmploye">
			<div class="row">
			
			<div class="row justify-content-center">
				<div class="offset-3 col-7">
					<a href="creer" class="btn btn-info" role="button">Ajouter un employé</button></a>
				</div>
			</div>
		<div class="col-12">
		<table>
		<tr>
					<th> Date/heure création</th>				
					<th> Matricule</th>
					<th> Grade </th>
				</tr>
		<c:forEach var="remunerationEmploye" items="${remunerationEmploye}"> 
		
			<tr>
					<td> <c:out value="${remunerationEmploye.date}" /></td>				
					<td> <c:out value="${remunerationEmploye.matricule}" /></td>
					<td> <c:out value="${remunerationEmploye.grade}" /> </td>			
				</tr>
			
		</c:forEach>
		</table>
		</div>
		

				

			
		</form>
	</div>



	

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>

</body>

</html>
