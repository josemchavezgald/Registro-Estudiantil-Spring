<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Actualizar datos de estudiante</title>
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
	      <a class="nav-link" href=" /estudiante">Agregar estudiante</a>
        </li>
       
        <li class="nav-item active">
	      <a class="nav-link" href=" /listarEstudiantes">Lista de estudiantes</a>
        </li>
	  </ul>
	</nav>
</div>
<br>
<div class ="container card card-body">
		
        <form:form action="updateEstudiante" method="post" modelAttribute="estudiante" id = "formUpdateEstudiante">

            <br>
     
			<div class="form-row">
				
				<div class="form-group col-md-12">
	        		<h4>Datos Estudiante</h4>      
	        	</div> 
				
				<form:hidden path = "id" value = "${estudianteBuscado.id}" />
				
				<div class="form-group col-md-9">
					 <label class="col-form-label">Rut:</label>
					 <div class="input-group mb-2">
						<form:input path="rut"  maxlength="8" class="form-control col-md-2 col-6" value="${estudianteBuscado.rut}" readOnly="true"/>
				   	 <div class="input-group-prepend">
				        	<span class="input-group-text">-</span>
				     </div>
				     	<form:input path="dv" placeholder ="" maxlength="1" class="form-control col-md-1 col-2" value="${estudianteBuscado.dv}" readOnly="true" />	
				    </div> 
				    <form:errors path="rut" cssClass="error"></form:errors>
				    <form:errors path="dv" cssClass="error"></form:errors>		     
				</div>
				
	
				<div class="form-group col-md-4 ">
					<label class="col-form-label">Nombre: </label><form:input path="nombre"  onchange ="valNombre()" class="form-control col-md-11" value="${estudianteBuscado.nombre}"/>
					<form:errors path="nombre" cssClass="error"></form:errors>
				</div>
	
				<div class="form-group col-md-4 ">
					<label class="col-form-label">Apellido: </label><form:input path="apellido"  onchange ="valApellido()" class="form-control col-md-11" value="${estudianteBuscado.apellido}" />
					<form:errors path="apellido" cssClass="error"></form:errors>
				</div>
				
				<div class="form-group col-md-4 ">
					<label class="col-form-label">Edad: </label><form:input path="edad" onkeypress="return validarNum(event)"  onchange ="valEdad()" class="form-control col-md-6" value="${estudianteBuscado.edad}"/>
					<form:errors path="apellido" cssClass="error"></form:errors>
				</div>
				
				
				<div class="form-group col-md-4 ">
					<label class="col-form-label">Email: </label><form:input  path="email"  onchange ="valEmail()"  class="form-control col-md-11"  value="${estudianteBuscado.email}"/>
					<form:errors path="email" cssClass="error"></form:errors>
				</div>
	                    
	            <div class="form-group col-md-8 ">
					<label class="col-form-label">Ciudad de residencia</label><form:select path="ciudad"  onchange ="valCiudad()" class="form-control col-md-5" >
						<form:option selected="false" value="" label="Elija ciudad..."/>
						<form:option selected="true" value="${estudianteBuscado.ciudad}" label="${estudianteBuscado.ciudad}"/>
						<form:options items="${ciudades}" />
					</form:select>
					<form:errors path="ciudad" cssClass="error"></form:errors>
				</div>
				
				<div class ="form-group col-md-4 ">
					<label class="col-form-label">Lenguajes de programación favoritos</label>
					<div class="form-control col-md-11 col-12" style="height:110px;">
						<c:forEach var = "i" items = "${estudianteBuscado.lenguajePro}">
	                     	<form:checkbox path ="lenguajePro" value="${i}" checked="checked"/> ${i}<br>
	      				</c:forEach>
						<c:forEach var = "s" items = "${noCheckeados}">
	                     	<form:checkbox path ="lenguajePro" value="${s}"/> ${s}<br>
	                    </c:forEach> 	
					</div>
					<form:errors path="lenguajePro" cssClass="error"></form:errors>
				</div>
				
				<div class="form-group col-md-4">
	            	<label class="col-form-label">Sistema operativo</label>
	            	<div class="form-control col-md-10 col-12" style="height: 90px;">
	            		<form:radiobutton path="sistemaOp" value="${estudianteBuscado.sistemaOp}" checked="checked"/> ${estudianteBuscado.sistemaOp}<br>
	            		<c:forEach var = "e" items = "${noCheckeadosButton}">
	                     	<form:radiobutton path="sistemaOp" value="${e}"/> ${e}<br>  
	      				</c:forEach>
	            	</div>
	            	<form:errors path="sistemaOp" cssClass="error"></form:errors>
	            		 
	            </div>
	            
		    	
				<div class="form-group col-md-6 col-12 mt-4">
					<form:button class="btn btn-dark col-md-6" id="updateButton">Actualizar datos</form:button> 
					
				</div>	
				
			
	
				
			</div>
			
		</form:form>
		
				<div class=" col-md-12 col-12 text-right" >
					<form action="eliminarEstudiante" method="post"  id="del">
						<input type="hidden" name="id" value="${estudianteBuscado.id}"> 
						<input type="button"  class="btn btn-danger col-md-2 " onclick="eliminarAlumno(${estudianteBuscado.id})" value=" &#x233d; Eliminar">
					</form>
				</div>
</div>

	





</body>
<script  src="resources/js/bootstrap/editar.js"></script>
<script  src="resources/js/bootstrap/validaciones.js"></script>
</html>