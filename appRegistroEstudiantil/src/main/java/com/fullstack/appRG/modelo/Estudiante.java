package com.fullstack.appRG.modelo;

import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;



@Entity
public class Estudiante {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@NotEmpty(message = "Error en el Rut. Debe rellenar el campo sin puntos\n")
	@Column(length=8, nullable = false) //name = nombre distinto en BD
	private String rut;

	@NotEmpty(message = "\nError en el Digito verificador. Debe rellenar el campo con un valor numerico o K")
	@Column(length=1, nullable = false) //name = nombre distinto en BD
	private String dv;
	
	@Column(length = 50, nullable = false)
	@Size(min=1, max = 50, message ="Error: El campo debe tener entre 1 y 30 caracteres" )
	private String nombre;
	
	@Column(length = 50, nullable = false)
	@Size( min= 1,max =50, message ="Error: El campo debe tener entre 1 y 30 caracteres" )
	private String apellido;
	
	@Column(nullable = false)
	@Min(0)
	@Max(130)
	private int edad;
	
	@ManyToOne
	private Carrera carrera;
	
	@NotEmpty(message="Debe rellenar el campo")
	@Email
	@Column(length = 50, nullable = false)
	private String email;
	
	@Column(length = 50, nullable = false)
	@NotEmpty(message = "Debe elegir una ciudad")
	private String ciudad;
	
	//REVISAR TIPO
	@Column(length = 200, nullable = false)
	@NotEmpty(message = "Debe seleccionar al menos un lenguaje")
	private String[] lenguajePro;
	
	@Column(length = 50, nullable = false)
	@NotEmpty(message = "Debe seleccionar un sistema operativo")
	private String sistemaOp;
	
		
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getRut() {
		return rut;
	}
	
	public void setRut(String rut) {
		this.rut = rut;
	}
	
	public String getDv() {
		return dv;
	}
	
	public void setDv(String dv) {
		this.dv = dv;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre)  {
		
		this.nombre = nombre;
		
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido)  {
		
		this.apellido = apellido;
	}
	
	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}
	
	public Carrera getCarrera() {
		return carrera;
	}

	public void setCarrera(Carrera carrera) {
		this.carrera = carrera;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad)  {
		
		this.ciudad = ciudad;
		
	}

	public String[] getLenguajePro() {
		
		return lenguajePro;
	}

	public void setLenguajePro(String[] lenguajePro)  {
		
		this.lenguajePro = lenguajePro;
		
	}

	public String getSistemaOp() {
		return sistemaOp;
	}

	public void setSistemaOp(String sistemaOp) {
		this.sistemaOp = sistemaOp;
		
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email)  {
		this.email = email;
	}
	

	@Override
	public String toString() {
		return "Estudiante [id_estudiante=" + id + ", nombre=" + nombre + ", apellido=" + apellido
				+  ", email=" + email +", ciudad=" + ciudad + ", lenguajePro=" + lenguajePro + ", sistemaOp=" + sistemaOp + "]";
	}
	
}
