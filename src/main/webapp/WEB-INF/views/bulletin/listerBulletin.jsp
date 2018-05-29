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
	<h1>Liste des Bulletins</h1>
</header>

	<div class="container">
		<div class="row">
			<div class="col">
				<header>
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<a class="navbar-brand" href="#">Liste des bulletins</a>
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
				<h1>Liste des Bulletins</h1>
			</div>
		</div>
		
			<div class="row justify-content-center">
				<div class="offset-3 col-7">
					<a href="creer" class="btn btn-info" role="button">Ajouter un bulletin</button></a>
				</div>
			</div>
			
			<div class="row">
		<div class="col-4">
			<a href="<c:url value="/mvc/employes/creer"/>" class="btn btn-primary">Creer employé</a>
		</div>
	</div>
			
	
		<div class="col-12">
		<table>
		<tr>
					<th> Date/heure création</th>
					<th> Période</th>				
					<th> Matricule</th>
					<th> Salaire brut</th>
					<th> Net Imposable </th>
					<th> Net A Payer</th>
					<th> Actions</th>
				</tr>
		<c:forEach var="bulletin" items="${bulletin}"> 
		
			<tr>
					<td> <c:out value="${bulletin.key.date}" /></td>	
					<td> <c:out value="${bulletin.key.periode}" /> </td>			
					<td> <c:out value="${bulletin.key.remunerationEmploye.matricule}" /></td>
					<td> <c:out value="${bulletin.value.salaireBrut}" /> </td>
					<td> <c:out value="${bulletin.value.netImposable}" /> </td>
					<td> <c:out value="${bulletin.value.netAPayer}" /> </td>
					<td><a class="navbar-brand" href="<c:url value="/mvc/bulletin/lister/${bulletin.key.id}"/>"> Visualiser</a></td>		
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
