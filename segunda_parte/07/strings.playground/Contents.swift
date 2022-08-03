import UIKit

let someString = "Soy un string cualquiera"

//el \ sirve para que siga en la misma linea
let multiLineString = """
Este es un string multilinea\
 que se da de alta con triple comilla doble
y vemos como aparecen los saltos de linea
"""
print(multiLineString)

//caracteres especiales

// \sirve para poder usar caracteres prohibidos
let wiseWords = "\"La imaginacion es mas importante que el saber\" -ALBERT EINSTEIN"
print(wiseWords)
print("\n")

//buscar los codigos de caracteres especiales
let dolarSing = "\u{24}"
let blackHeart = "\u{2665}"
let heart = "\u{1F496}"
print(heart)
print("\n")

let taco = "\u{1F32E}"
print("Soy Mich y soy un \(taco) De pastor \n" )

//inicializacion y mutabilidad
//declarar string vacios y concatenacion

//declarar strings vacios
var emptyString = ""

//esta sintaxis es mas util, porque se utiliza para declarar objetos
var anotherEmptyString = String()


if emptyString.isEmpty
{
    print("Nada que ver aqui")
}
else
{
    print("el string tiene valor")
}

var newSomeString = "un caballo"
newSomeString += "y un carruaje"
newSomeString += "y un soldado"



var a = "A"
var b = "B"
print("a vale \(a) y la b vale \(b)")
b = a
print("a vale \(a) y la b vale \(b)")
b = "C"
print("a vale \(a) y la b vale \(b)")
a = "D"
print("a vale \(a) y la b vale \(b)")


//hasta ahora todos los tipos de datos han sido evaluados
//su valor no cambia si cambia otro dato
//pero no todos los datos son asi, existen datos no evaluados en el futuro


//caracteres

let name = "Mich DMark 👻"
//revisar cuantos caracteres tiene
for ch in name
{
    print(ch)
} //este for recorre el bucle e imprime los caracteres

//solo necesitas buscar en los metodos para contar los datos
print(name.count)

//crea un char
let exclamationMark : Character = "!"

//crea varios char y luego crea un string con ellos
let nameChars: [Character] = ["m","i","c","h"]
var nameString = String(nameChars)

//crea un string concatenando 2 strings

let compoundName = "Mich " + "DMark"

//no puedes unir un char y un string
//nameString + exclamationMark

//poner un caracter a la cadena de string de manera sencilla sin cast
nameString.append(exclamationMark)

let multiplier = 3

//creando un string y haciendo operaciones
var message = "El produto de \(multiplier) x3.5 da \(Double(multiplier)*3.5)"

//no se puede usar el metodo append al crear la variable
//se debe usar cuando la variable ya esta creada
message.append(exclamationMark)
