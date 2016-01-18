<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Manager</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap-select.min.css"/>" type="text/css" />
<link rel="stylesheet" href="<spring:url value="/resources/css/global.css"/>" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="<spring:url value="/resources/js/bootstrap-select.min.js"/>"></script>

</head>
<body>

	<jsp:include page="../views/fragments/header.jsp"></jsp:include>

	<div class="container">
	
		<div class="row">
			<h1>Client</h1>
		</div>
		
		<spring:url value="/client/save" var="formUrl"/>
		
		<form:form action="${formUrl}" method="POST" modelAttribute="client" commandName="clientAdd">
			
			<div class="row">
				
				<div class="form-group">
					<label for="client_nom">Nom</label> 
					<form:input path="nom" cssClass="form-control" id="client_nom"/>
				</div>
				
				<div class="form-group">
					<label for="client_prenom">Prénom</label> 
					<form:input path="prenom" cssClass="form-control" id="client_prenom"/>
				</div>
				
				<div class="form-group">
					<label for="client_">Login</label> 
					<form:input path="login" cssClass="form-control" id="client_Login"/>
				</div>
				
				<div class="form-group">
					<label for="client_email">Email</label> 
					<form:input path="email" cssClass="form-control" id="client_email"/>
				</div>
				
				<div class="form-group">
					<label for="client_telephone">Telephone</label> 
					<form:input path="telephone" cssClass="form-control" id="client_telephone"/>
				</div>
				
				<div class="form-group">
					<label for="client_ville">Ville</label> 
					<form:input path="ville" cssClass="form-control" id="client_ville"/>
				</div>

				
						
				<button type="submit" class="btn btn-default">Submit</button>

			</div>
		
		</form:form>
		
	</div>
</body>
</html>