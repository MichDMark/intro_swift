import UIKit

//ENUMERATIONS
//estructura sencilla que puede guardar varios casos
//son clases que estan restringuidas en lo que pueden hacer

enum SomeEnumeration
{
    //aqui va la definicion del enumerado
}

//enumerado de puntos cardinales

enum CompassPoint: String //se le asigna el string para poder adquirir el raw value como string
{
    case north
    case south
    case east
    case west
} //solo puede tomar alguno de los valores, no es posible tomar un other

enum Planet
{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
} //se puede crear asi o escribieno caso por caso, por ahora ambas son correctas

var directionToGo = CompassPoint.east //es una variable de tipo enum y guarda uno de los casos

//como swift ya sabe que es una variable de tipo enum, solo con el punto ya te deja elegir

directionToGo = .north //ya no es necesario el compasspoint

switch directionToGo
{
    
case .north:
    print("Hay que ir al norte")
case .south:
    print("hay pinguinos en el sur")
case .east:
    print("mordor se extiende a las tierras del este")
case .west:
    print("cuidado con los vaqueros")
}
directionToGo

//ejemplo si solo quieres tomar una de las opciones y descartar las demas
let somePlanet = Planet.mars

switch somePlanet
{
case .earth:
    print("la tierra es segura")
default:
    print("no es seguro ir a este planeta")

}

//bucles dentro de enumerados
enum Beverage: CaseIterable //le das la capacidad de contar y usar la cantidad de casos
{
    case coffee, tea, juice, water, redbull
}
let numberOfChoices = Beverage.allCases.count

for beverage in Beverage.allCases
{
    print(beverage)
}


//enumerados codigos de barras

//crear un enumerado para codigos de barra, que guarde tuplas

enum Barcode
{
    case upc(Int,Int,Int,Int) //codigos de barras convencionales de solo numeros
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("asdfghjkl")

switch productBarcode
{
    
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR: \(productCode)")
}


//ENUMERADORES CON RAW VALUES
//raw values valores crudos sin procesar

enum ASCIIControlCharacter: Character //a cada caso se le asocia un caracter de control
{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//swift por default le da numeros a los casos apartir de cero, pero se pueden asignar numeros
//reescrbienod el enum de los planetas para ejemplificar
enum PlanetNumerate: Int
{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
} //con asignar el numero 1 a mercurio los demas los inferiere en secuencia


let earthOrder = PlanetNumerate.earth.rawValue //entrega el valor que se ha indicado

let northDirection = CompassPoint.north.rawValue //entrega el nombre del caso como un string

let possiblePlanet = PlanetNumerate(rawValue: 5) //este valor entrega un optional

//solo hay 8 casos en los planetas, ejemplo si quisieramos acceder a algo fuera de ese rango

let planetPosition = 11 //gracias a los raw value podemos revisar opciones

//hacemos un casting seguro por si piden evalugar otro valor fuera de los enum indicados
if let anyPlanet = PlanetNumerate(rawValue: planetPosition)
{
    switch anyPlanet
    {
    case .earth:
        print("la tierra es segura")
    default:
        print("no es seguro ir a este planeta")

    }
}
else
    {
        print("el planeta indicado no existe")
    }

