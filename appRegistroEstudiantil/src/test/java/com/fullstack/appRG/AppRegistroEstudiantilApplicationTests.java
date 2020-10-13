package com.fullstack.appRG;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fullstack.appRG.modelo.Carrera;
import com.fullstack.appRG.repository.ICarreraRepository;

@SpringBootTest
class AppRegistroEstudiantilApplicationTests {

	
	@Autowired
	private ICarreraRepository repoCarrera;
	
	
	
	@Test
	void contextLoads() {
		
//		Carrera c1 = new Carrera();
//		c1.setDescripcion("Ingeniería en Informática");
//		
//		Carrera c2 = new Carrera();
//		c2.setDescripcion("Ingeniería en Electrónica");
//		
//		Carrera c3 = new Carrera();
//		c3.setDescripcion("Ingeniería en MedioAmbiente");
//		
//		Carrera c4 = new Carrera();
//		c4.setDescripcion("Ingeniería en Electricidad");
//		
//		Carrera c5 = new Carrera();
//		c5.setDescripcion("Ingeniería en Mecanica");
//		
//		Carrera c6 = new Carrera();
//		c6.setDescripcion("Ingeniería en Ciencias de Datos");
//		
//		repoCarrera.save(c1);
//		repoCarrera.save(c2);
//		repoCarrera.save(c3);
//		repoCarrera.save(c4);
//		repoCarrera.save(c5);
//		repoCarrera.save(c6);
	}

}
