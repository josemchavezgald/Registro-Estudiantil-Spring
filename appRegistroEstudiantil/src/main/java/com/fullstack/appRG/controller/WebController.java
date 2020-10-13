package com.fullstack.appRG.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fullstack.appRG.modelo.Carrera;
import com.fullstack.appRG.modelo.Ciudad;
import com.fullstack.appRG.modelo.Estudiante;
import com.fullstack.appRG.repository.ICarreraRepository;
import com.fullstack.appRG.repository.IEstudianteRepository;

@Controller
public class WebController {
	
	@Autowired
	private IEstudianteRepository repo;
	
	@Autowired
	private ICarreraRepository repoCarrera;
	
	@ModelAttribute("estudiante")
	public Estudiante setEstudiante() {
		
		return new Estudiante();
	}
	
	@ModelAttribute("carreras")
	public List<Carrera> setCarreras() {
		
		return repoCarrera.findAllByOrderByDescripcionAsc();
	}
	
	
	@ModelAttribute("lenguajes")
	public List<String> lenguajes(){
		List<String> leng = new ArrayList<String>();
		leng.add("Java");
		leng.add("Python");
		leng.add("C++");
		leng.add("Ruby");
		return leng;
	}
	
	@ModelAttribute("sistemas")
	public List<String> sistemas(){
		List<String> sis = new ArrayList<String>();
		sis.add("Windows 10");
		sis.add("Mac OS");
		sis.add("Linux");
		return sis;
		
	}
	
	@ModelAttribute("ciudades")
	public List<String> ciudades(){
		
		Ciudad c1 = new Ciudad(1,"Arica");
		Ciudad c2 = new Ciudad(2,"Iquique");
		Ciudad c3 = new Ciudad(3,"Calama");
		Ciudad c4 = new Ciudad(4,"Copiapo");
		Ciudad c5 = new Ciudad(5,"Coquimbo");
		Ciudad c6 = new Ciudad(6,"Valparaiso");
		Ciudad c7 = new Ciudad(7,"Santiago");
		Ciudad c8 = new Ciudad(8,"Talca");
		Ciudad c9 = new Ciudad(9,"Puerto Varas");
		Ciudad c10 = new Ciudad(10,"Punta Arenas");
		
		ArrayList<Ciudad> ciudades = new ArrayList<Ciudad>();
		

		ciudades.add(c1);
		ciudades.add(c2);
		ciudades.add(c3);
		ciudades.add(c4);
		ciudades.add(c5);
		ciudades.add(c6);
		ciudades.add(c7);
		ciudades.add(c8);
		ciudades.add(c9);
		ciudades.add(c10);
		
		List<String> cities = new ArrayList<String>();
		
		for(Ciudad c: ciudades) {
			cities.add(c.getNombre());
		}
		
		return cities;
	}
	
	
	@GetMapping("/")
	public String getIndex()
	{
		return "index";
	}
	
	@GetMapping("/estudiante")
	public String getAddEstudiante(Model model)
	{
				return "estudiante";
	}
	
	@PostMapping(value="addEstudiante")
	public String addEstudiante(@Valid @ModelAttribute("estudiante")Estudiante alumno,BindingResult br, Model model) {
		if(br.hasErrors()) {
			return "estudiante";
			
		}else {
			String rut = alumno.getRut();
			
			if(repo.findByRut(rut).size() == 0) {
				System.out.print("pasa");
				repo.save(alumno);
				model.addAttribute("estudiante",alumno);
				List<Estudiante> estudiantes =repo.findAllByOrderByIdDesc();
				model.addAttribute("estudiantes", estudiantes);
				return "correcto";
				
			}else {
				System.out.print("Repetido");
				return "errorRut";
			}
		}
	}
	
	
	@GetMapping("listarEstudiantes")
	public String listarEstudiantes(Model model) {
		List<Estudiante> estudiantes = repo.findAllByOrderByNombreAsc();
		model.addAttribute("estudiantes", estudiantes);
		return "listarEstudiantes";
	}
	
	//Carga de estudiante a modificar
	@PostMapping(value="cargarEstudianteMOD")
	public String cargarEstudiante(String id, Model model) {
		Estudiante alumnoBuscado = repo.getOne(Integer.parseInt(id));
		
		String sistemaSel = alumnoBuscado.getSistemaOp();
		List<String> lengSel = Arrays.asList( alumnoBuscado.getLenguajePro());
		List<String> noChecked = new ArrayList<String>();
		List<String> noButtons = new ArrayList<String>();
		
		for(String lenguaje: lenguajes()) {
			if(!lengSel.contains(lenguaje)) {
				noChecked.add(lenguaje);
			}
		}

		for(String sist: sistemas()) {
			if(!sistemaSel.equals(sist)) {
				noButtons.add(sist);
			}
		}
		
		model.addAttribute("estudianteBuscado",alumnoBuscado);
		model.addAttribute("noCheckeados",noChecked);
		model.addAttribute("noCheckeadosButton",noButtons);

		return "editar";
	}
	
	
	
	//Añadir js para dejar espacios en blanco y confirm solo con todos los datos llenos
	@PostMapping("updateEstudiante")
	public String actualizarEstudiante(@Valid @ModelAttribute("estudiante") Estudiante alumno, BindingResult br, Model model) {
		String id = Integer.toString(alumno.getId());
		
		if(br.hasErrors()) {
			return cargarEstudiante(id,model);
		}
		else {
			String mensaje = "Los datos del alumno: "+alumno.getRut()+"-"+alumno.getDv() +" fueron actualizados exitosamente";
			repo.save(alumno);
			List<Estudiante> estudiantes = repo.findAllByOrderByNombreAsc();
			model.addAttribute("estudiantes", estudiantes);
			model.addAttribute("updateCorrecto", mensaje);
			return "listarEstudiantes";
		}
	}
	
	
	@PostMapping(value="eliminarEstudiante")
	public String eliminar(String id, Model model) {
		System.out.println(id);
		repo.deleteById(Integer.parseInt(id));
		List<Estudiante> estudiantes = repo.findAllByOrderByNombreAsc();
		model.addAttribute("estudiantes", estudiantes);
		return "listarEstudiantes";
	}
	
	@PostMapping("buscarEstudianteRut")
	public String buscarEstudianteRut(String rut, Model model) 
	{
		List<String> run = Arrays.asList(rut.split("-"));
		String digitos = run.get(0);
		model.addAttribute("estudiantes", repo.findByRut(digitos));
		return "listarEstudiantes";
	}
	
	@PostMapping("buscarEstudianteCarrera")
	public String buscarEstudianteRut(int carrera, Model model) 
	{
		System.out.print(carrera);
		Carrera c = new Carrera();
		c.setId(carrera);
		List<Estudiante> alumnos_por_carrera = repo.findByCarrera(c);
		model.addAttribute("estudiantes", alumnos_por_carrera);
		return "listarEstudiantes";
	}
	
	
	@PostMapping("buscarEstudianteNombre")
	public String buscarEstudianteNombre(String nombreCompleto, Model model) 
	{
		List<String> nombre_apellido = Arrays.asList(nombreCompleto.split(" "));
		System.out.println(nombre_apellido);
		if(nombre_apellido.size() == 1) {
			String nombre = nombre_apellido.get(0);
			model.addAttribute("estudiantes", repo.findByNombre(nombre));
		}else {
			String nombre = nombre_apellido.get(0);
			String apellido = nombre_apellido.get(1);
			System.out.println(nombre);
			System.out.println(apellido);
			model.addAttribute("estudiantes", repo.findByNombreAndApellido(nombre, apellido));
		}
		
		return "listarEstudiantes";
	}
	
	
	
	
	
	
	
	
	
	
}
