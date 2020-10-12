<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de estudiantes</title>

<link href="resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="resources/js/bootstrap/bootstrap.min.js"></script>
<link href="resources/css/cssapp.css" rel="stylesheet"/>
</head>
<body>
<div class = "container-fluid">
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
	  <ul class="navbar-nav mr-auto">
	  <li class="nav-item ">
	      <a class="nav-link" href=" /">Home</a>
        </li>
	    <li class="nav-item ">
	      <a class="nav-link " href=" /estudiante">Agregar estudiante</a>
        </li>
        
        <li class="nav-item active">
	      <a class="nav-link" href=" /listarEstudiantes">Lista de estudiantes</a>
        </li>
	  </ul>
	</nav>
</div>

<br>



<div class = "container text-center" style="height:1000px">

	<div class="form-row col-md-12">
             <h4 style="margin-left: -15px;">Lista de estudiantes</h4>
             
     </div>
     <br> 
 
	
	
	<div class="row card-body">
		<div class="col-md-6 ">
			<form class="form-inline" action="buscarEstudianteRut" method="post" id="buscarRut" >
			  <div class="form-group mb-2">
			    <label>    Ingrese rut alumno:</label>
			  </div>
			  <div class="form-group mx-sm-3 mb-2">
			    <input type="text" class="form-control" id="rut" name="rut" placeholder="ej: 12345678-0"  onkeypress="return validarRun(event)"  maxlength="10" required="required">
				<div class="invalid-tooltip">
				     Ingrese un rut valido.
				</div>
			  </div>
			  <input type="button" onclick="validarBusquedaRut()"  class="btn btn-secondary mb-2"  value="Buscar">
			   
			</form>
		</div>
		<div class="col-md-6">
			<form class="form-inline" action="buscarEstudianteNombre" style="margin-left:15px;"  method="post" id="buscarNombre" >
			  <div class="form-group mb-2">
			    <label >Ingrese nombre alumno:</label>
			  </div>
			  <div class="form-group mx-sm-3 mb-2">
			    <input type="text" class="form-control" id="nombreCompleto" name="nombreCompleto" required="required">
			    <div class="invalid-tooltip" style="margin-left:25px;">
				     Ingrese un nombre valido
				</div>
			  </div>
			  <input type="button"  onclick ="validarBusquedaNombre()" class="btn btn-secondary mb-2"  value="Buscar">
			</form>
		</div>
	</div>
				
		<c:if test="${updateCorrecto != null }">
			<div class="alert alert-success" role="alert" >
  				${updateCorrecto}
			</div>
		</c:if>
		
     <br> 

	  <c:choose>
	  
	  <c:when test="${estudiantes.size() != 0}">
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
		      <th scope="col"><span style="font-size:25px;line-height:0px;margin-left:100%;">&#x2699;</span><th>
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
		      <td >
		      
		      		<form action="cargarEstudianteMOD" style="margin-top:-5px; margin-right:-10px;"method="post">
						<input type="hidden" name="id" value="${es.id}">
						<input type="submit"  class="btn btn-light  " value="Actualizar">
					</form>	
			   
		    
				</td>
				<td>
					<form action="eliminarEstudiante" method="post" style="margin-top:-5px; margin-left:-10px;" id="del">
						<input type="hidden" name="id" value="${es.id}"> 
						<input type="button"  class="btn btn-danger " onclick="eliminarAlumno(${es.id})" value=" &#x233d; Eliminar">
					</form>
				</td>
				
		    </tr>
	      	</c:forEach>
	       </tbody>
		</table>
	  </c:when>
	  <c:otherwise>
	  	<tr>
	  		<td>
	  			<h4>La busqueda no arrojo ningun resultado.</h4> 
	  		</td>
	  	</tr>	
	  	<br>
	  </c:otherwise>
	  
	  
	  </c:choose>
	  
	
	
	<div class="text-center">
 		<a href="/listarEstudiantes"><button  class="btn btn-primary">Lista de estudiantes</button></a>
 	</div>
 </div>

</body>
<script  src="resources/js/bootstrap/listaEstudiantes.js"></script>

</html>