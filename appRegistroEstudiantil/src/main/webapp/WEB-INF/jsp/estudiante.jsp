<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro de estudiantes</title>
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
	      <a class="nav-link active" href=" /estudiante">Agregar estudiante</a>
        </li>
        
        <li class="nav-item ">
	      <a class="nav-link" href=" /listarEstudiantes">Lista de estudiantes</a>
        </li>
	  </ul>
	</nav>
</div>

<div class ="container">
        <form:form action="addEstudiante" method="post" modelAttribute="estudiante" id = "formEstudiante">
        
            
            <br>
	
                
        <div class="form-row col-md-12">
                    <h4 style="margin-left: -15px;">Datos Estudiante</h4>
                  
        </div> 
                
		<div class="form-row">
		
			
			<div class="form-group col-md-9">
				 <label class="col-form-label">Rut:</label>
				 <div class="input-group mb-2">
					<form:input path="rut"  maxlength="8" class="form-control col-md-3 col-6 " onkeypress="return validarNum(event)" />
			   	 <div class="input-group-prepend">
			        	<span class="input-group-text">-</span>
			     </div>
			     	<form:input path="dv" placeholder ="" maxlength="1" class="form-control col-md-1 col-2" onkeypress="return validarDV(event)"/>	
			    </div> 
			    <form:errors path="rut" cssClass="error"></form:errors>
			    <form:errors path="dv" cssClass="error"></form:errors>		     
			</div>
			

			<div class="form-group col-md-4 ">
				<label class="col-form-label">Nombre: </label><form:input path="nombre"  class="form-control col-md-11" />
				<form:errors path="nombre" cssClass="error"></form:errors>
			</div>

			<div class="form-group col-md-4 ">
				<label class="col-form-label">Apellido: </label><form:input path="apellido" class="form-control col-md-11"  />
				<form:errors path="apellido" cssClass="error"></form:errors>
			</div>
			
			<div class="form-group col-md-4 ">
				<label class="col-form-label">Edad: </label><form:input path="edad" class="form-control col-md-6"  onkeypress="return validarNum(event)" />
				<form:errors path="apellido" cssClass="error"></form:errors>
			</div>
			
				
			<div class="form-group col-md-4 ">
				<label class="col-form-label">Email: </label><form:input  path="email" class="form-control col-md-11"  />
				<form:errors path="email" cssClass="error"></form:errors>
			</div>
			
			<div class="form-group col-md-4 ">
				<label class="col-form-label">Carrera: </label>
				<form:select class="form-control col-md-11" path="carrera">
					<form:option selected="true" value="" label="Elija carrera..."/>
					<form:options itemLabel="descripcion" itemValue="id" items="${carreras}"/>
				</form:select>
				<form:errors path="carrera" cssClass="error"></form:errors>
			</div>
			
                    
            <div class="form-group col-md-4 ">
				<label class="col-form-label">Ciudad de residencia</label><form:select path="ciudad" class="form-control col-md-6" >
					<form:option selected="true" value="" label="Elija ciudad..."/>
					<form:options items="${ciudades}" />
				</form:select>
				<form:errors path="ciudad" cssClass="error"></form:errors>
			</div>
			
			<div class ="form-group col-md-4 ">
				<label class="col-form-label">Lenguajes de programación favoritos</label>
				<div class="form-control col-md-11 col-12" style="height:110px;">
					<c:forEach var = "s" items = "${lenguajes}">
                     	<form:checkbox path="lenguajePro" name="lenguajeSel" value="${s}"/> ${s}<br>
      				</c:forEach>
				</div>
				<form:errors path="lenguajePro" cssClass="error"></form:errors>
			</div>

     
            <div class="form-group col-md-8">
            	<label class="col-form-label">Sistema operativo</label>
            	<div class="form-control col-md-5 col-12" style="height: 90px;">
            		<c:forEach var = "e" items = "${sistemas}">
                     	<form:radiobutton path="sistemaOp" value="${e}"/> ${e}<br>  
      				</c:forEach>
            	</div>
            	<form:errors path="sistemaOp" cssClass="error"></form:errors>
            </div>
            
			<div class="form-group col-md-12 mt-4">
				 <form:button class="btn btn-dark mb-4">Agregar estudiante</form:button>
			</div>	
		</div>
			
		</form:form>
</div>

	





</body>
<script src="resources/js/bootstrap/validaciones.js"></script>
</html>