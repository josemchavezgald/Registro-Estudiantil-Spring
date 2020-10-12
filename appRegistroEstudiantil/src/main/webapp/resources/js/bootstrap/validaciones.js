/**
 * 
 */
var expdv = /^\d{1}|[Kk]$/;
var exprut = /^([0-9]{8}|[0-9]{7})+$/;
var expnombre = /^[ñA-Za-z]*[ñA-Za-z][ñA-Za-z]*$/;
var expapellido = /^[ñA-Za-z]*[ñA-Za-z][ñA-Za-z]*$/;
var expdireccion = /[A-Za-z0-9\s]+$/;
var expemail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
var expdigito = /^\d+$/;

function validarDV(e) {
    tecla = (document.all) ? e.keyCode : e.which;

    if (tecla == 8) {
        return true;
    }

    patron = /[K-Kk-k0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
}

function validarNum(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8) return true;
    patron = /\d/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}


 $(document).ready(function(){
   
       
     $("#formEstudiante").change(function(){
        	valRun();
        	valDv();
            valNombre();
            valCiudad();
            valApellido();
            valEmail();
            valEdad();
            
        })
        
        /*$("#formUpdateEstudiante").change(function(){
        	
            valNombre();
            valCiudad();
            valApellido();
            valEmail();
            
        })*/


 })

  




function valDv() {
    if (($("#dv").val()) != "") {
        if (expdv.test($("#dv").val()) == true) {
            

            if($("#dv").hasClass("is-invalid")){
                $("#dv").removeClass("is-invalid");
            }else{
              $("#dv").addClass("is-valid");  
            }
        } else {

            $("#dv").addClass("is-invalid");  
        }          
    }
 }

function valRun() {
     if (($("#rut").val()) != "") {
        if (exprut.test($("#rut").val()) == true) {
           

            if($("#rut").hasClass("is-invalid")){
                $("#rut").removeClass("is-invalid");
            }else{
              $("#rut").addClass("is-valid");  
            }
        } else {

                $("#rut").addClass("is-invalid");  
        }          
    } 
}

function valNombre() {
        
        if (($("#nombre").val()) != "") {
            if (expnombre.test($("#nombre").val()) == true) {
                if($("#nombre").hasClass('is-invalid')){
                    $("#nombre").removeClass('is-invalid');
           			$("#nombre").addClass("is-valid");
                }else{
                    $("#nombre").addClass("is-valid");
                }

            } else {
                $("#nombre").addClass("is-invalid");

            }
        }
        else{
        	 $("#nombre").addClass("is-invalid");
        }
 }
 

 

function valApellido(){

    if ($("#apellido").val() != "") {
                if (expnombre.test($("#apellido").val()) == true) {
                    if($("#apellido").hasClass('is-invalid')){
                        $("#apellido").removeClass('is-invalid');
                        $("#apellido").addClass("is-valid");
                    }else{
                        $("#apellido").addClass("is-valid");
                    }

                } else {
                    $("#apellido").addClass("is-invalid");
                }
            }else{
				$("#apellido").addClass('is-invalid');
                
            }
}

function valEmail(){
	if (($("#email").val()) != "") {
            if (expemail.test($("#email").val()) == true) {
                if($("#email").hasClass('is-invalid')){
                    $("#email").removeClass('is-invalid');
                    $("#email").addClass("is-valid");
                }else{
                    $("#email").addClass("is-valid");
                }

            } else {
                $("#email").addClass("is-invalid");

            }
     }else{
        $("#email").addClass('is-invalid');
     }
}

 function valEdad(){
 
 	if($("#edad").val() != 0){
 		if(expdigito.test($("#edad").val()) == true){
		  if($("#edad").hasClass('is-invalid')){
                    $("#edad").removeClass('is-invalid');
                    $("#edad").addClass("is-valid");
                }else{
                    $("#edad").addClass("is-valid");
                }
 			
 		}else {
                 $("#edad").addClass("is-invalid");
                }
 	
 	
 	}else{
				$("#edad").addClass('is-invalid');
                
            }
 	
 	
 	}

/*function valDireccion() {
     
    if (($("#direccion").val()) != "") {
        
        if (expdireccion.test($("#direccion").val()) == true) {
            if($("#direccion").hasClass('is-invalid')){
                    $("#direccion").removeClass('is-invalid');
                }else{
                    $("#direccion").addClass("is-valid");
                }

        } else {
            $("#direccion").addClass("is-invalid");
        }
    }
 }*/

 function valCiudad() {
    if ($("#ciudad").val() != "") {
        if($("#ciudad").hasClass("is-invalid")){
            $("#ciudad").removeClass("is-invalid");
            $("#ciudad").addClass("is-valid");
        }
        else{
            $("#ciudad").addClass("is-valid")
        }

    } else {
        if($("#ciudad").hasClass("is-valid")){
            $("#ciudad").removeClass("is-valid");
            $("#ciudad").addClass("is-invalid");
        }
        
    }
}


/*function valMarca() {
    var expmarca = /^[ñA-Za-z]*[ñA-Za-z][ñA-Za-z]*$/;
    if (($("#marca").val()) != "") {
        if (expmarca.test($("#marca").val()) == true) {
            if($("#marca").hasClass("is-invalid")){
                $("#marca").removeClass('is-invalid');
            }else{
                $("#marca").addClass("is-valid");
            }
        } else {
             $("#marca").addClass("is-invalid");
        }          
    }
}*/




/*function valAño() {
    var expaño = /^(\d{4}|\d{6})$/;
    if (($("#año").val()) != "") {
        if (expaño.test($("#año").val()) == true) {
            if($("#año").hasClass("is-invalid")){
                $("#año").removeClass('is-invalid');
            }else{
                $("#año").addClass("is-valid");
            }
        } else {
             $("#año").addClass("is-invalid");
        }          
    }
}*/






