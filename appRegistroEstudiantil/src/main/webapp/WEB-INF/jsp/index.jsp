<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>

<html>
<head>
	<title>Home</title>
	<link href="resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class = "container-fluid">
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
	  <ul class="navbar-nav mr-auto">
	    <li class="nav-item ">
	      <a class="nav-link active" href=" ./home">Home</a>
        </li>
         <li class="nav-item ">
	      <a class="nav-link " href="./estudiante">Agregar estudiante</a>
        </li>
         
      	 <li class="nav-item ">
	      <a class="nav-link" href=" ./listarEstudiantes">Estudiantes ingresados</a>
        </li>  
        </ul>
     
	</nav>
</div>
<br>
<h1 class="text-center">
	Bienvenido
</h1>

<div class="container text-center">
	<p>Para agregar un nuevo estudiante haz click en el siguiente boton</p>
	<a href="./estudiante"><button type="submit" class="btn btn-light">Nuevo estudiante</button></a>
</div>




</body>
</html>