<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Estudiante</title>
        
        <link href="resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    </head>
<body>
<div class = "container-fluid">
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
	  <ul class="navbar-nav mr-auto">
	    <li class="nav-item ">
	      <a class="nav-link " href="/">Home</a>
        </li>
        <li class="nav-item active">
	      <a class="nav-link " href="/estudiante">Agregar estudiante</a>
        </li>
        <li class="nav-item ">
	      <a class="nav-link" href=" /listarEstudiantes">Lista de estudiantes</a>
        </li>
        
	  </ul>
	  <ul class ="navbar-nav">
        <li class="nav-item" style="text-align:right;" >
	      <a class="nav-link " href="./">Salir</a>
        </li>  
	  </ul>
	</nav>
</div>
<br>
<h3 style="text-align: center;">Estudiante ingresado correctamente</h3><br>


<div class="container-fluid border" style="width: 400px; height: 300px; margin: 0 auto; border: 10px;">
            
    <br>
    

        <div>
            <h5>Datos Estudiante:</h5>
        </div>
    <div>
        <p>
        
        	Rut:  ${estudiante.rut}-${estudiante.dv} <br>
        	
            Nombre:  ${estudiante.nombre} <br>

            Apellido: ${estudiante.apellido} <br>
            
            Edad: ${estudiante.edad} <br>
            
            Email: ${estudiante.email}<br>

            Ciudad: ${estudiante.ciudad}<br>

            Lenguajes de programación predilectos: <br>
            
            <c:forEach var = "i" items = "${estudiante.lenguajePro}">
                     ${i}
      		</c:forEach>
      		
      		 <br>

            Sistema operativo predilecto: ${estudiante.sistemaOp}
            
        </p>
    </div>
 </div>
 
 <br>
 
 
 

 
 
 <div class="row text-center">
 	<div class="col-md-12">
		<a href="./estudiante" ><button  class="btn btn-light">Nuevo estudiante</button></a> 	
 	</div>	
 	<br>
 	<br>
	<div class="col-md-12">
 		<a href="/listarEstudiantes"><button  class="btn btn-primary">Lista de estudiantes</button></a>
 	</div>
 </div>
  
 <br>

 
 <!-- Agregar Lista de estudiantes ya ingresados -->

 
 <div class = "container text-center" style="height:300px">
 	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">Rut</th>
	      <th scope="col">Estudiante</th>
	      <th scope="col">Email</th>
	      <th scope="col">Lenguajes</th>
	      <th scope="col">OS</th>
	      <th scope="col">Edad</th>
	      <th scope="col">Ciudad</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach items="${estudiantes}" var="es">
	  	<tr>
	  	  <th scope="row">${es.rut}-${es.dv}</th>
	      <td >${es.nombre} ${es.apellido }</td>
	     
	      <td>${es.email}</td>
	      <td>
	      	<c:forEach var = "e" items = "${es.lenguajePro}">
                     <c:out value = "${e}"/> 
      		</c:forEach>
	      </td>
	      
	      <td>${es.sistemaOp }</td>
	      <td>${es.edad }</td>
	      <td>${es.ciudad }</td>
	    </tr>
      </c:forEach>
	  </tbody>
	</table>
 </div>
 
    
</body>
</html>