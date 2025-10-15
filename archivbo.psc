Proceso Test_Course_Navette
	Definir i Como Entero
	Definir nombre Como Cadena
	Definir edad, nivel, shuttle Como Entero
	Definir V, VO2_simple, VO2_leger Como Real
	Definir clasificacion Como Cadena
	Definir suma_simple, suma_leger Como Real
	
	suma_simple <- 0
	suma_leger <- 0
	
	Para i <- 1 Hasta 10 Con Paso 1 Hacer
		Escribir "=============================="
		Escribir "Participante ", i
		
		// Solicitar nombre
		Escribir Sin Saltar "Ingrese el nombre: "
		Leer nombre
		
		// Validar edad
		Repetir
			Escribir Sin Saltar "Ingrese la edad (> 0): "
			Leer edad
			Si edad <= 0 Entonces
				Escribir "⚠️ Edad inválida. Debe ser mayor que 0."
			FinSi
		Hasta Que edad > 0
		
		// Validar nivel
		Repetir
			Escribir Sin Saltar "Ingrese el nivel (≥ 1): "
			Leer nivel
			Si nivel < 1 Entonces
				Escribir "⚠️ Nivel inválido. Debe ser 1 o más."
			FinSi
		Hasta Que nivel >= 1
		
		// Validar shuttle
		Repetir
			Escribir Sin Saltar "Ingrese el número de shuttle (≥ 0): "
			Leer shuttle
			Si shuttle < 0 Entonces
				Escribir "⚠️ Shuttle inválido. Debe ser 0 o más."
			FinSi
		Hasta Que shuttle >= 0
		
		// Calcular velocidad final
		V <- 8 + 0.5 * nivel
		
		// Calcular VO2 simple
		VO2_simple <- 3.46 * V + 12.2
		
		// Calcular VO2 Léger (considerando la edad)
		VO2_leger <- 31.025 + (3.238 * V) - (3.248 * edad) + (0.1536 * V * edad)
		
		// Clasificación
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
		
		// Mostrar resultados del participante
		Escribir "------------------------------"
		Escribir "Participante: ", nombre
		Escribir "Edad: ", edad, " años"
		Escribir "Nivel: ", nivel
		Escribir "Velocidad final: ", V, " km/h"
		Escribir "VO2 simple: ", Redon(VO2_simple,2), " ml/kg/min"
		Escribir "VO2 Léger: ", Redon(VO2_leger,2), " ml/kg/min"
		Escribir "Clasificación: ", clasificacion
		Escribir "------------------------------"
		
		// Sumar para promedios
		suma_simple <- suma_simple + VO2_simple
		suma_leger <- suma_leger + VO2_leger
	FinPara
	
	// Promedios grupales
	Escribir "=============================="
	Escribir "Promedio grupal VO2 simple: ", Redon(suma_simple / 10,2), " ml/kg/min"
	Escribir "Promedio grupal VO2 Léger: ", Redon(suma_leger / 10,2), " ml/kg/min"
	Escribir "=============================="
FinProceso
