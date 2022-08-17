import UIKit

//CLOSURES es un tipo de funcion
//es una funcion mas ligera, sin nombre y con optimizaciones

let names = [ "plasma", "phoenix", "doom", "dasher", "divine"]

//ordenar los nombres

//hacer un funcion que reciba 2 strings y vea cual es mayor, retornando un valor booleano
func backward(_ s1: String, _ s2: String) -> Bool
{
    return s1 > s2 //con esto se compara alfabeticamente 2 strings
}
backward("plasma", "divine") //alfabeticamente plasma es mayor que divine, retorna true

//crea un string donde con sorted ordenamos
//la funcion sorted by es una funcion donde entran 2 string y retorna un bool
//la funcion que creamos es exactamente de esas caracteristicas, por lo tanto la usa directamente
//como metodo de ordenamiento
var reversedNames = names.sorted(by: backward) //entrega el string en orden decendente

/*
 el closueres se declara sin nombre, es de esta manera, entre llaves parametros, salida y el codigo
 
 { (params) -> return type in
    //codigo del closure
 }
 el closure es una funcion descafeinada
 

//haciendola con un closure
//con doble enter despues del sorted, crea la plantilla del closure


var sortedNames = names.sorted(by:
{
    //s1, s2 in s1 > s2
    $0 > $1 //significa argmento en la posicion 0 mayor que argumento en la posicion 1
})
//se sobre simplifico el closure eliminando las palabras string y bool que ya se inferian al llamarlo
 */

//var sortedNames = names.sorted(by: { $0 > $1 }) //forma mas reducida del closure de ordenamiento descendente

//aun se puede reducir mas indicando unicamente el simbolo de mayor, para indicar cual debe ir primero

var sortedNames = names.sorted(by: > ) //forma exageradamente reducida, solo usar cuando ya comprendes los closure

// todas las maneras en que se puede llamar al closure de la menos a la mas reducida

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1>s2 })
reversedNames = names.sorted(by: { s1, s2 in return s1>s2 })
reversedNames = names.sorted(by: { s1, s2 in s1>s2 })
reversedNames = names.sorted(by: { $0>$1 })
reversedNames = names.sorted(by: >)


// TRAILING CLOSURES
//es un closure que se escribe despues de una funcion, etre parentesis

func someFunctionThatTakesAClosure(closure: () -> Void)
{
    //aqui iria el cuerpo de la funcion
}

someFunctionThatTakesAClosure(closure:
{
    //aqui iria el cuerpo de la funcion
})

//se ha adoptado esta nueva sintaxis

someFunctionThatTakesAClosure {
    //aqui iria el codigo
}

//ejemplo de trailing closure con la funcion anterior de ordenamiento

reversedNames = names.sorted{ $0 > $1 }


//ejemplo de un numero obtener sus digitos

let digitNames = [ 0: "cero", 1: "uno", 2: "dos", 3: "tres", 4: "cuatro",
                   5: "cinco", 6: "seis", 7: "siete", 8: "ocho", 9: "nueve"]

let numbers = [16, 58, 510, 2985]

let numberString = numbers.map
{ (number) -> String in //el number de aqui es constante, no se puede modificar
    
    var number = number //convierte la constante number a una variable number interna para modificar
    var output = ""
    repeat
    {
            output = digitNames[number % 10]! + output
            number /= 10
    }while number > 0
    return output
}


// reto hacer la funcion de obtener digitos para numeros negativos tambien

let testNegativeNumbers = [-9, 17, 23, -49, 0, -987, 29]

let numberNegativeString = testNegativeNumbers.map
{ (number) -> String in //el number de aqui es constante, no se puede modificar
    
    var number = number //convierte la constante number a una variable number interna para modificar
    var output = ""
    let sign = "menos"
    
    if number >= 0
    {
        repeat
        {
                output = digitNames[number % 10]! + output
                number /= 10
        }while number > 0
        return output
    }
    else
    {
        number = number * -1
        repeat
        {
                output = digitNames[number % 10]! + output
                number /= 10
        }while number > 0
        return sign + output
    }
}


// CAPTURAR VALORES
// closure que capturan valores de otras partes y estan dentro de una funcion

/*
 -> () -> Int
significa que devuelve un closure sin nada de entrada y con un entero de salida
 
el primer -> es la salida de la funcion
 () -> Int es el closure que no tiene nada de entrada y un entero de salida
 */
func makeIncrementer(forIncrement amount: Int) -> () -> Int
{
    var runningTotal = 0
    func incrementer () -> Int //esta funcion interna no recibe nada y de salida tiene un entero
    {
        runningTotal += amount //esta usando running total que es de la funcion contenedora y amount que no existe dentro de ninguna de las funciones, las puede utilizar porque "estan cerca" (declaradas)
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10) //es una constante pero tambien es una funcion
incrementByTen //se le llama como si fuera una constante pero vemos que dentro tiene una funcion
incrementByTen() //se le puede llamar como si fuera una funcion

incrementByTen()
incrementByTen() // cada vez que llamamos la funcion va incrementando en 10

let incrementBySeven = makeIncrementer(forIncrement: 7) //se crea otra variable que llama a la funcion
incrementBySeven() //lleva su propio contador

incrementByTen() // al volver a llamar a la otra constante vemos que conserva su propio contador

//cada vez que llama una variable propia que llama a la funcion makeIncrementer lleva su propio contador


//ESCAPING CLOSURE
//cuando tienes un closure que no quieres que se ejecute en el momento si no en el futuro

// un array de completionHanler es un complejo que se ejecuta cuando se ha completado una tarea anterior
// es un array de elementos que no reciben nada ni entregan nada
var completionHandlers: [() -> Void]   = [] //declarado vacio

completionHandlers.count //esta vacio porque fue declarado sin elementos

//a medida que va saliendo guardarlo en el array
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) //el @escaping permite guardarlo
{
    completionHandlers.append(completionHandler)
}

completionHandlers.count //esta vacio porque fue declarado sin elementos y todavia nadie llama la funcion


//funcion que recibe los mismos closure pero no se guardan para mas tarde, se ejecuta en el momento
func someFunctionWhithNonEscapingClosure(closure: () -> Void )
{
  closure()
}

//ejemplo declaramos una funcion que haga algo y llame a las funciones anteriores
class SomeClass
{
    var x = 10
    func doSometing()
    {
        someFunctionWithEscapingClosure
        {
            self.x = 100 //el self se usa para decir que estamos usando la misma x declarada internamente de la clase
            //como se puede llamar despues se tiene que declarar forzosamente donde esta la x
        }
        someFunctionWhithNonEscapingClosure
        {
            x = 200 //no tiene que usar el self porque al ser no escaping, se ejecuta en el momento
        }
    }
}

let instance = SomeClass()
print(instance.x) //al crear el objeto la variable vale 10
instance.doSometing() //al ejecutar el metodo de la clase
print(instance.x) //despues de ejecutar el metodo la variable vale 200

completionHandlers.count //ya se ejecuto 1 vez
completionHandlers.first?() //ejecutamos el closure que fue guardado para despues y que ya esta almacenado en el array
//en el primer elemento del array se guardo el someFunctionWithEscapingClosure que no se ejecuto y que se llamo ahora  en el completionHandlers.first?() por lo tanto ahora cambia la variable dentro del objeto

print(instance.x) //cambio el valor de la variable


