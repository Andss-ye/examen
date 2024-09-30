// Esta Funcion lo que hace es pedir una opcion 
// para retornar a mi algoritmo y poder ejecutar alguna opcion 
Funcion x <- menu
	Escribir ''
	Escribir 'Bienvenido'
	Escribir '1. Agregar estudiantes'
	Escribir '2. Asignar 3 notas parciales'
	Escribir '3. Registrar el numero de inasistencias de cada estudiante'
	Escribir '4. Mostrar el listado de estudiante'
	Escribir '5. Calcular nota final'
	Escribir '0. Salir del programa'
	Leer x
FinFuncion
 
//Esta funcion lo que hace es verificar el rango de mis notas que sera de 0 a 5

Funcion nuevoN <- verificarRango(n)
	Mientras n < 0 o n > 5 Hacer
		Escribir 'La nota tiene que estar entre 0 y 5'
		Leer n
		nuevoN <- n
	Fin Mientras
	nuevoN <- n 				// un valor default se devuelve si el mientras no se cumple
FinFuncion

// Esta funcion lo que hace es agregar estudiantes usando la ayuda de un bucle

Funcion arr <- agregarEstudiantes(arr, rango)
	Para i <- 1 Hasta rango Con Paso 1 Hacer
		Escribir 'Escriba el nombre del ' i ' estudiante: '
		Leer name
		Para j <- 1 Hasta 7 Con Paso 1 Hacer
			arr[i, 1] = ConvertirATexto(i) 			// El convertirATexto se usa para que no nos de problemas al momento de agregar el nombre a la matriz
			arr[i, 2] = name
		Fin Para
	Fin Para
FinFuncion

// Esta funcion sirve para asignar las notas parciales a cada estudiante

Funcion arr <- asignarNotasParciales(arr, rango)
	Escribir 'Si no asigna ninguna nota o deja vacio el espacio la nota por default sera 0'
	Para i <- 1 Hasta rango Con Paso 1 Hacer
		Escribir 'Le va ingresar notas al estudiante numero: ' i // la i significa el estudiante al cual le esta aplicando los cambios
		Leer n1
		resultado1 = verificarRango(n1) 				// se usa la funcion para verificar que el rango de notas sea el correcto
		Leer n2
		resultado2 = verificarRango(n2)
		Leer n3
		resultado3 = verificarRango(n3)

		arr[i, 3] = ConvertirATexto(resultado1) 		// Esto sirve para no dar problemas al momento de meterlo a la matriz
		arr[i, 4] = ConvertirATexto(resultado2)
		arr[i, 5] = ConvertirATexto(resultado3)
		
	Fin Para
FinFuncion

// Esta funcion sirve para registrar las inasistencias usando un bucle

Funcion arr <- registrarInasistencias(arr, rango)
	Para i <- 1 Hasta rango Con Paso 1 Hacer
		Escribir 'Cuantas inasistencias tiene el estudiante numero ' i ' :'
		Leer inasistencias
		arr[i, 6] = ConvertirATexto(inasistencias)
	Fin Para
FinFuncion

// Esta funcion lo que hace es calcular la nota final de cada estudiante

Funcion arr <- calcularNotaFinal(arr, rango)
	Para i <- 1 Hasta rango Con Paso 1 Hacer
		n1 = ConvertirANumero(arr[i, 3]) 			// se sacan las notas y se convierten a numero para poderla operar
		n2 = ConvertirANumero(arr[i, 4])
		n3 = ConvertirANumero(arr[i, 5])
		inasistencias = ConvertirANumero(arr[i, 6]) // se obtienen las inasistencias de la matriz
		cantidadARestar = 0 						// inicializo la variable por si no se cumple la condicion de abajo tener un valor "default"
		
		// Condiciones que determinan la cantidad a restar en la nota final teniendo en cuenta las inasistencias
		
		Si inasistencias >= 10 y inasistencias < 15 Entonces
			cantidadARestar = 0.5 
		Fin Si
		Si inasistencias >= 15 Entonces
			cantidadARestar = 1
		Fin Si
		
		notaFinal = ((n1 + n2 + n3)/3) - cantidadARestar		// Se opera la cantidad que debe ir en la nota final y se resta teniendo en cuenta las inasistencias
		Si notaFinal < 0 Entonces								// esta pequena condicional lo que hace es poner un valor en 0 si el valor llega a ser negativo
			notaFinal = 0
		Fin Si
		arr[i, 7] = ConvertirATexto(notaFinal)					// Se convierte a texto para no tener inconvenientes de tipos en la matriz al momento de agregarlos
	Fin Para
FinFuncion

// La ultima funcion sirve para mostrar los estudiantes que hay actualmente en el programa

Funcion arr <- mostrarEstudiantes(arr, rango)
	Para i <- 1 Hasta rango Con Paso 1 Hacer
		Escribir Sin Saltar 'ID: ' arr[i, 1] ' |' ' Nombre: ' arr[i, 2] ' |' ' N1: ' arr[i, 3] ' |' ' N2: ' arr[i, 4] ' |' ' N3: ' arr[i, 5] ' |' ' inasistencias: ' arr[i, 6] ' |' ' Nota final: ' arr[i, 7]
		Escribir ''
	Fin Para
FinFuncion

Algoritmo examen
	rango = 10							// Se define el rango para ver cuantos estudiantes quiero en mi matriz
	Dimension estudiantes[rango, 7]
	opc = 10							// Inicializo el opc para que el menu se pueda ejecutar
	Mientras opc <> 0 Hacer
		x = menu						// Llamo mi funcion menu para obtener una accion a hacer
		Segun x Hacer
			1:
				resultado = agregarEstudiantes(estudiantes, rango)
				Escribir resultado
			2:
				resultado = asignarNotasParciales(estudiantes, rango)
				Escribir resultado
			3:
				resultado = registrarInasistencias(estudiantes, rango)
				Escribir resultado
			4:
				resultado = mostrarEstudiantes(estudiantes, rango)
				Escribir resultado
			5:
				resultado = calcularNotaFinal(estudiantes, rango)
				Escribir 'Notas calculadas :)'
			0:
				Escribir 'Saliendo del programa...'
				opc = 0
			De Otro Modo:
				Escribir 'Escoja una opc entre 0 y 4'
				Leer x
		Fin Segun
	Fin Mientras
FinAlgoritmo
