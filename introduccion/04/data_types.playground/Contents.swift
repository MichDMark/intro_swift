import UIKit

let orangesAreOrange = true
let foodIsDelicius = false

var isAged : Bool

isAged = true

if isAged //en este if entra si la condicion es true sin poner condicion
{
    print("Puedes entrar en la fiesta")
}
else
{
    print("No puedes entrar a la fiesta")
}

var age:UInt8 = 31
if age >= 18
{
    print("tienes edad para entrar a la fiesta \n")
}
else
{
    print("no puedes entrar a la fiesta \n")
}

//tuplas en swift

//juntar codigo de error y mensaje
let http404Error = (404, "pagina no encontrada")
//pasa a variables los valores guardados en la tupla
let (statusCode, statusMessage) = http404Error

print("imprimir el codigo del estado: \(statusCode)")
print("El mensaje del servidor es: \(statusMessage)")


let (justStatusCode, _) = http404Error
print("\nel codigo del estado es \(justStatusCode) \n")

//sacar la informacion directamente de la tupla sin pasarlo a variables

print("El codigo de error es: \(http404Error.0) y el mensaje es: \(http404Error.1) \n")

//se le puede poner un nombre a cada variable en la tupla
// de esta manera es mas facil buscar un valor para usarlo
let http200Status = (statusCode: 200, description: "OK")
//imprimir usando sus alias
print("El codigo del estado es \(http200Status.statusCode) y el mensajes es: \(http200Status.description) \n")


//desafio de tuplas
//crear tupla con edad y datos y usarla para imprimir
let michID = (name: "Mich", nickName: "DMark", edad: 31)
print("Hola soy \(michID.name), mi usuario es \(michID.nickName) y mi edad es \(michID.edad)\n")


// valores opcionales y Nil, no existe NULL en swift

let possibleAge = "31"

let convertedAge = Int8(possibleAge) //esto es un entero opcional Int?
// es opcional pues la conversion no siempre sera posible

//se declara con ? si el tipo de dato sera opcional
//que pueda tomar un valor entero o pueda ser nulo
var serverResponseCode: Int? = 404
serverResponseCode = nil //si se declara sin ?, no podria dejarse nulo

//declarar el dato opcional
var surveyAnswer : String?
surveyAnswer = "42"
//print(surveyAnswer) //da un warning por el cambio de dato


//uso de fuerza bruta para usar datos opcionales
//el force unwrapping solo se debe hacer si comprobamos que
//la variable opcional no tiene un valor nulo

if convertedAge != nil
{
    print("\nla edad del usuario no es nula, es: \(convertedAge!)")
    //el ! despues de la variable es el force unwrapping
    //sirve para forzar la conversion de una variable opcional a varible regular
}
else
{
    print("\nla edad del usuario es nula")
}


// optional binding
/*
para no usar fuerza bruta, creamos una serie de variables que comprueban
un casting exitoso, un variable opcional, una no opcional del mismo tipo y un casteo entre ellas para comprobar que el dato no es nulo
 */

//comprobamos si surveyAnswer no es nulo

//el if se lee como:
//si puedo crear una constante actualAnswer apartir de surveyAnswer
//entonces entra al if
if let actualAnswer = surveyAnswer
{
    //si entra aqui es que surveyAnswer no es nulo
    print("\nel string surveyAnswer tiene el valor de: \(actualAnswer) \n")
}
else
{
    //si llega aqui es que surveyAnswer fue nulo
    print("\n el string surveyAnswer es nil...\n")
}


// optional binding en cadena
//comprueba que no sean nulos y luego los usa en una condicion

//swift permite anidar varios if con comas

if let firstNumber = Int("4"),
   let secondNumber = Int("42"),
   firstNumber < secondNumber && secondNumber<100
{
    print("\(firstNumber) < \(secondNumber) <100")
}

// unwrap implicito

let possibleString: String? = "Un string opcional"

//nunca hacerlo asi sin comprobar con algun metodo
let forcedString: String = possibleString!

//forma correcta
let assumedString: String! = "Un string unwrapped de forma implicita a partir de un optional"
let implicitString : String = assumedString
