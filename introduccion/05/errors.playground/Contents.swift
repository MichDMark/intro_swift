import UIKit
//introduccion al manejo de errores

//se agrega throws despues de declarar la funcion para decir que la funcion puede dar error
func canThrowError() throws
{
    //aqui hay codigo que puede causar error
}

//se lee como
//intenta llamar a la funcion puede dar error
do
{
    try canThrowError()
    //si llegamos aqui no ha habido error
}
catch
{
    //si llegamos aqui ha habido error
}

//probar errores
//crea un funcion haz un sandwich
func makeASandwich() throws
{
    
}

do
{
    try makeASandwich()
    //si entro aqui hizo el sandwich y podemos continuar
}
catch
{
    //si entro aqui no pudo hacer el sandwich
    // en el catch se puede checar porque ha fallado la funcion
    //que elementos faltan para hacer el sandwich
    //poner metodos para cumplir la funcion
}


//aserciones y precondiciones
//la asercion es una condicion que se debe llevar acabo para que el codigo continue, solo para modo debug

//las precondiciones se puede usar en build

let age = -5
// vamos a revisar que la edad sea posible para que el codigo continue

//esta asercion se coloca despues del valor
//assert(age >= 0, "la edad de una persona no puede ser negativa")

//la precondicion se declara exactamente igual pero se puede usar ya en produccion
//precondition(age >= 0, "la edad de una persona no puede ser negativa")

if age > 10
{
    
}
else if age >= 0
{
    print("no puedes subir a la montana rusa")
}
else
{
    //este else asume una edad negativa
    //se puede hacer una asercion que ya se sabe que esta en una condicion incorrecta
    //assertionFailure("La edad no puede ser negativa")
    
    //la precondicion se declara exactamente igual
    //preconditionFailure("La edad no puede ser negativa")
}
