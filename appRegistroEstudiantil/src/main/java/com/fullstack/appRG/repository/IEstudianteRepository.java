package com.fullstack.appRG.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fullstack.appRG.modelo.Estudiante;

public interface IEstudianteRepository extends JpaRepository<Estudiante, Integer>{
	
  	List<Estudiante> findByRut(String rut);

  	
  	List<Estudiante> findAllByOrderByNombreAsc();
  	List<Estudiante> findAllByOrderByIdDesc();
  	List<Estudiante> findByNombreAndApellido(String nombre, String apellido);
  	List<Estudiante> findByNombre(String nombre);
  	



}
