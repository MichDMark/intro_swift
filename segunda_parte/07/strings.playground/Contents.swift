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

//INDICES DE STRINGS

let greeting = "Hola, ¿que tal?"
greeting[greeting.startIndex] //primer caracter de la cadena
//greeting[greeting.endIndex]
//no se puede acceder directamente al ultimo porque se pasa en el contador

//usamos los metodos del index y accedemos 1 antes del final
//recordar que la cuenta empieza en 0 por eso debe hacerse asi
greeting[greeting.index(before: greeting.endIndex)]

//acceder al segundo elemento
greeting[greeting.index(after: greeting.startIndex)]


//aceder a todos los datos
for idx in greeting.indices
{
    print("\(greeting[idx]) ", terminator:"")  //quita el salto de linea
}

var welcome = "Hola"

//insertar elementos
welcome.insert("!", at: welcome.endIndex) //inserta al final del string

//inserta un string nuevo antes del ultimo elmento del string que ya existe

welcome.insert(contentsOf: " soy Mich", at: welcome.index(before: welcome.endIndex))

//remover elementos

//remueve el ultimo elemento
welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome //queda el string sin el ultimo valor

//acota un rango de 6 elementos y los corta del final
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
welcome

//SUBSTRINGS
//el substring solo es un trozo de memoria del string original
//sacar un pedazo de un string
greeting

//buscar la coma en greeting
//usamos el operador ?? por si no existe el caracter en la cadena
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex

//crea un substring desde el inicio hasta donde encuentra el caracter guardado en index
let firstPart = greeting[..<index]
//hacer un string de un substring
let newString = String(firstPart)


//PREFIJOS Y SUFIJOS

let newGreeting = "Hola, soy Mich DMark"

//entrega true o false si cumple la pregunta
newGreeting.hasPrefix("Hola")
newGreeting.hasSuffix("!")

let collection = [ "act 1 scene 1", "act 1 scene 2", "act 1 scene 3",
                   "act 2 scene 1", "act 2 scene 2", "act 2 scene 3",
                   "act 3 scene 1", "act 3 scene 2"
]

//cuantas escenas tiene el acto 1, contamos cuantos strings del array empiezan por el act 1

var act1Count = 0
for scene in collection
{
    if scene.hasPrefix("act 1")
    {
        act1Count += 1
    }
}
print("\nel numero de escenas en el acto 1 es: \(act1Count)")

//REPRESENTACIONES UNICODE

let ghost = "¡¡Fantasma!! 👻"

for codeUnit in ghost.utf8
{
    print(codeUnit, terminator: " ")
}

print("\n")
for codeUnit in ghost.utf16
{
    print(codeUnit, terminator: " ")
}

print("\n")

for codeUnit in ghost.unicodeScalars
{
    print(codeUnit, terminator: " ")
}
