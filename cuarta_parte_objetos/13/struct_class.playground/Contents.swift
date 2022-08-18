import UIKit

//ESTRUCTURAS vs CLASES

//las estructuras tienen su propio espacio de memoria
// las clases son referencias, apuntan a un espacio de memoria

//estructuras

struct SomeStruct
{
    //la definicion de la estructura va aqui
}

//clases
class SomeClass
{
    // la definicion de la clase va aqui
}

// las estructuras se suelen usar para cosas mas simples

struct Resolution
{
    var width = 0
    var height = 0
}

// parece ser que en swift les dicen stored property a los atributos
class VideoMode
{
    var resolution = Resolution() //una clase puede usar una estructura asociada a la misma
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//instanciar estructuras y clases

let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)
someVideoMode.resolution.width = 1280 //tenia un valor de 0 y se edita aunque sea una cte, el objeto
print(someVideoMode.resolution.width)

//UNA ESTRUCTURA UNA VEZ CREADA QUEDA FIJA (SI ES CTE),
//LA INSTANCIA DE UNA CLASE AUNQUE SEA DECLARADA COMO CTE, SUS VALORES INTERNOS PUEDEN CAMBIAR
//POR ESO SE PUEDEN CAMIBAR LOS DATOS DEL OBJETO SOMEVIDEOMODE AUNQUE FUE DECLARADO CONSTANTE


//INICIALIZADORES POR DEFECTO
// ESTRUCTURAS: DATOS COPIADOS POR VALOR

//como se declaro como cte, se deben dar los datos iniciales al declarar la instancia de la estrcutura
let vga = Resolution(width: 640, height: 480) //inicializadores de serie

vga.width
vga.height

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd //creamos una variable que es copia de la estructura que fue declarada cte
print("\(cinema.width) x \(cinema.height)")

//queremos modificar el cinema
cinema.width = 2048
print("\(cinema.width) x \(cinema.height)") //se cambio el width

print("\(hd.width) x \(hd.height)") //hd sigue igual, las estructuras son cajas independientes


//los enumerados siguen el mismo sistema de las estructuras

enum CompassPoint
{
    case north, south, east, west
}

var currentDirection = CompassPoint.north
var oldDirection = currentDirection //olddirection toma el valor de current direction
//cambiamos el valor actual de currentdirection
currentDirection = .south

print(currentDirection)
print(oldDirection) //al modificar currentDirection, oldDirection no se modifica, son copias independientes
