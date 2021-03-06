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
	<h1>Créer Bulletin</h1>
</header>


<div class="container">
	<div class="row">
		<div class="col">
			<header>
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand" href="#">Employés</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
						aria-expanded="false" aria-label="Toggle navigation">
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
			<h1>Créer Bulletin de Salaire</h1>
		</div>
	
	
			
			<div class="row">
		<div class="col-4">
			<a href="<c:url value="/mvc/employes/creer"/>" class="btn btn-primary">Creer employé</a>
		</div>
	</div>
	</div>
	<form:form method="POST" modelAttribute="bulletin">
		<div class="form-group">
			<div class="row">


				<div class="row">
					<div class="col-5">
						<label for="periode">Période</label>
					</div>
					<div class="col-4">
						<form:select path="periode.id" items="${periode}" itemValue="id">
						</form:select>
					</div>
				</div>

				<div class="row">
					<div class="col-5">
						<label for="matricule">Matricule</label>
					</div>
					<div class="col-4">
						<form:select path="remunerationEmploye.id" items="${matricule}"
							itemValue="id" itemLabel="matricule">
						</form:select>
					</div>
				</div>


				<div class="col-5">
					<label for="prime">Prime exceptionnelle</label>
				</div>
				<div class="col-4">
					<form:input type="text" class="form-control" path="primeExceptionnelle"
						placeholder="Prime" required="" />
				</div>
			</div>

		</div>

		<div class="row justify-content-center">
			<div class="col-8">
				<button type="submit" class="form-control">Créer</button>
			</div>
		</div>
	</form:form>
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
