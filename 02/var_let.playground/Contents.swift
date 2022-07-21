import UIKit
//codigo para hacer un login en 3 intentos o se bloquea la cuenta
let maximumNumberOfLoginAttempts = 3 //let es para declarar constantes
//var es para variables
var currentLoginAttempt = 0

//declarar varias variables juntas
//ej poner unas coordenadas
var x = 0.0 , y = 0.0, z = 0.0

//para declarar una variable sin valor inicial, decir tipo de variable
var welcomeMessage  : String

var count_i : Int

var red, green, blue : Double


count_i = 4
red = 255
welcomeMessage = "Hola soy Mich DMark"

//se pueden usar simbolos en variables
//no recomendable
let π = 3.141592

/* swift tiene autocompletar en los
 comentarios multilineas*/

print("el numero de login actual es: \(currentLoginAttempt) de un total disponible de: \(maximumNumberOfLoginAttempts)")
