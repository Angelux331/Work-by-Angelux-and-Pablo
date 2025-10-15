Proceso Test_Course_Navette
	Definir i, edad, nivel, shuttle Como Entero
	Definir nombre, clasificacion Como Cadena
	Definir V, VO2_simple, VO2_leger, suma_simple, suma_leger Como Real
	Definir participantes Como Entero
	
	// Configuración inicial
	suma_simple <- 0
	suma_leger <- 0
	participantes <- 10
	
	Escribir "======================================="
	Escribir "     TEST COURSE NAVETTE (LÉGER)       "
	Escribir "======================================="
	
	Para i <- 1 Hasta participantes Con Paso 1 Hacer
		Escribir "---------------------------------------"
		Escribir "Participante ", i
		
		// Ingreso de nombre
		Escribir Sin Saltar "Ingrese el nombre: "
		Leer nombre
		
		// Validar edad
		Repetir
			Escribir Sin Saltar "Ingrese la edad (> 0): "
			Leer edad
			Si edad <= 0 Entonces
				Escribir "[!] Edad inválida. Debe ser mayor que 0."
			FinSi
		Hasta Que edad > 0
		
		// Validar nivel
		Repetir
			Escribir Sin Saltar "Ingrese el nivel (≥ 1): "
			Leer nivel
			Si nivel < 1 Entonces
				Escribir "[!] Nivel inválido. Debe ser 1 o más."
			FinSi
		Hasta Que nivel >= 1
		
		// Validar número de shuttle
		Repetir
			Escribir Sin Saltar "Ingrese el número de shuttle (≥ 0): "
			Leer shuttle
			Si shuttle < 0 Entonces
				Escribir "[!] Shuttle inválido. Debe ser 0 o más."
			FinSi
		Hasta Que shuttle >= 0
		
		// Calcular velocidad final (según Léger)
		V <- 8 + 0.5 * (nivel - 1)
		
		// Calcular VO2 estimado (fórmulas)
		VO2_simple <- 3.46 * V + 12.2
		VO2_leger <- 31.025 + (3.238 * V) - (3.248 * edad) + (0.1536 * V * edad)
		
		// Clasificación según VO2 simple
		Si VO2_simple < 35 Entonces
			clasificacion <- "Baja"
		Sino
			Si VO2_simple < 45 Entonces
				clasificacion <- "Promedio"
			Sino
				Si VO2_simple < 55 Entonces
					clasificacion <- "Buena"
				Sino
					clasificacion <- "Excelente"
				FinSi
			FinSi
		FinSi
		
		// Mostrar resultados individuales
		Escribir "---------------------------------------"
		Escribir "Nombre: ", nombre
		Escribir "Edad: ", edad, " años"
		Escribir "Nivel: ", nivel
		Escribir "Velocidad final: ", Redon(V, 2), " km/h"
		Escribir "VO2 simple: ", Redon(VO2_simple, 2), " ml/kg/min"
		Escribir "VO2 Léger: ", Redon(VO2_leger, 2), " ml/kg/min"
		Escribir "Clasificación: ", clasificacion
		Escribir "---------------------------------------"
		
		// Acumular para promedios
		suma_simple <- suma_simple + VO2_simple
		suma_leger <- suma_leger + VO2_leger
	FinPara
	
	// Promedios grupales
	Escribir "======================================="
	Escribir "         RESULTADOS DEL GRUPO          "
	Escribir "======================================="
	Escribir "Promedio VO2 simple: ", Redon(suma_simple / participantes, 2), " ml/kg/min"
	Escribir "Promedio VO2 Léger: ", Redon(suma_leger / participantes, 2), " ml/kg/min"
	Escribir "======================================="
FinProceso
