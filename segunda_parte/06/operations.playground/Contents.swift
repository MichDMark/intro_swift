import UIKit

//operadores aritmeticos

let b = 10
var a = 5
a = b
//declarar tuplas
let (x,y) = (1,2)

if a == b
{
    print("los valores de a y b son iguales")
}

5/2.45

//el operador suma puede concatenar
"Hello " + "world"

//divison de enteros da entero
9/4 //hay que especificar el float para obtener los decimales
9.0/4.0


var number = 5
number += 3 //toma el valor de number y le incrementa 3
number -= 2 //reduce 2 el valor de number

//comparaciones

1 == 1
1 == 2
1 != 2
2 > 1
2 < 1
2 >= 1
1 >= 1
2 <= 1

let name = "Mich DMark"

if name == "Mich DMark"
{
    print("Bienvenido \(name), eres invitado")
}
else
{
    print("no es la persona invitada")
}

//se pueden usar con tuplas
(1, "Mich") < (2, "DMark") //da verdad porque compara los elementos de cada tupla
//en los string compara el orden del abecedario

//la comparaciones no se pueden hacer a valores booleanos

//operaciones ternarias

/*
 if question
 {
    answer1
 }
 else
 {
    answer2
 }
 
*/

//revisando una tabla
let contentHeight = 40 //tamano de una columna de datos de facebook
var hasImage = true //revisar si tiene foto de perfil
var rowHeight = 0
if hasImage
{
    rowHeight = contentHeight + 50 // aumenta el tamano si tiene foto
}
else
{
    rowHeight = contentHeight + 10 //no sube tanto porque no tiene foto
}

//hacer el mismo if con un operador ternario
rowHeight = contentHeight + (hasImage ? 50:10)


//nil coalescing operator

//dar un valor por defecto a un valor nulo
let defaultAge = 18 //crear un valor por defecto para rellenar
var userAge: Int?

//la edad que va a ser usada es la userAge y si es nula usa la defaultAge
var ageToUsed = userAge ?? defaultAge

//ejemplo con colores
let defaultColorName = "red"
var userColorName: String? = "green"

//usa el userColorName, si es nulo, usa el defaultColorName
var colorNameToUse = userColorName ?? defaultColorName

//reto usa una variable para guardar el nombre del usuario
//si es nulo da un nombre por defecto
let defaultname = "Cosme Fulanito"
var userName: String?
var nameToUse = userName ?? defaultname
print(nameToUse, "\n")


//Rangos
for idx in 1...5 //rango cerrado
{
    print(idx)
}

//rango semiabierto, valor de inicio cerrado, valor de fin abierto
for idx in 1..<5
{
    print(idx)
}

let names = ["Ricardo", "Juan Gabriel", "Pedro"]

for i in 0..<names.count
{
    print("\nLa persona: \(i+1) se llama \(names[i])")
}

//bucle de un solo rango
for name in names[1...] //empieza el rango en la posicion 1 no en la cero
{
    print(name)
}

for name in names[..<2] //rango abierto al final
{
    print(name)
}

//rangos en variables, no son muy usados
let range = ...5
range.contains(7)
range.contains(4)
range.contains(-7)

// OPERADORES LOGICOS

//definir una variable para permitir entrada
let allowEntry = false

//if allowEntry esto se lee como: si permitimos la entrada, haz lo de corchetes

//operador Not
//se lee, Si No permitimos la entrada, has lo que esta en corchetes
// es mas facil leer asi
if !allowEntry
{
   print("acceso denegado")
}

//operador and
let enterDoorCode = true
let passRetinaScan = false

if enterDoorCode && passRetinaScan //operador and
{
  print("bienvenido a la empresa")
}
else
{
    print("acceso denegado")
}

//operador OR
let hasMoney = true
let hasInvitation = false

if hasMoney || hasInvitation
{
    print("bienvenido a la fiesta")
}
else
{
    print("no eres bienvenido aqui")
}

// usar operadores combinados
//no es necesario el parentesis, se usa para visualizacion
if (enterDoorCode && passRetinaScan) || hasMoney || hasInvitation
{
    print("has entrado")
}
else
{
    print("igual no has podido entrar")
}


