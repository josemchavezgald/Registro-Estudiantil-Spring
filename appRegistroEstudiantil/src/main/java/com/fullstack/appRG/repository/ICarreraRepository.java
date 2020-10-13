package com.fullstack.appRG.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fullstack.appRG.modelo.Carrera;

public interface ICarreraRepository extends JpaRepository<Carrera, Integer> {
	
	List<Carrera> findAllByOrderByDescripcionAsc();
}
