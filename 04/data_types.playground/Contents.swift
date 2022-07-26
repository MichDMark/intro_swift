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
