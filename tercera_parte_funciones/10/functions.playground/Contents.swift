import UIKit

//funciones

// -> marca lo que va a retornar la funcion de salida
// lo que esta entre parentesis son los parametros de entrada, puede tener o no

func greeting(person:String) -> String
{
    let greet = "Hola, \(person)!"
    return greet
}

greeting(person: "Mich DMark")
greeting(person: "plasma")
//guardar la salida de una funcion en una variable
let saludo = greeting(person: "Aster")

//parametros de entrada

//sin parametro de entrada
func sayHelloWorld() -> String
{
    return "Hello World"
}
sayHelloWorld()
//usando la salida de la funcion en un print
print("Mich \(sayHelloWorld())")

//funciones con varios parametros de entrada

func greet(person: String, isMale: Bool) -> String
{
    if isMale
    {
        return "Bienvenido caballero \(person)"
    }
    else
    {
        return "Bienvenida senorita \(person)"
    }
}

greet(person: "Mich", isMale: true)
greet(person: "Ana", isMale: false)

//PARAMETROS DE SALIDA
//VALORES DE RETORNO, OPTIONALS Y PARAMETROS DE SALIDA

//sin valor de salida
func greet2(person: String)
{
    print("Hola \(person)")
}
greet2(person: "Astro Phoenix")

func printAndCount (strName : String) -> Int
{
    print(strName)
    return strName.count
}


func printWithOutCount (strName: String)
{
    let _ = printAndCount(strName: strName)
}
printAndCount(strName: "Hola cuantos caracteres tengo?")
printWithOutCount(strName: "Hola cuantos caracteres tengo?" )

// doble valor de retorno
//minimo y maximo de un array de valores

/* la funcion de maximos y minimos que explican en la clase
 
 func minMax(array:[Int]) ->(min: Int, max: Int)
 {
     var currentMin = array[0]
     var currentMax = array[0]
     
     for value in array[1..<array.count]
     {
         if value < currentMin
         {
             currentMin = value
         }
         else if value > currentMax
         {
             currentMax = value
         }
     }
     return(currentMin, currentMax)
 }
 */



// mi funcion de maximos y minimos
func minMax(array:[Int]) ->(valueMin: Int, valueMax: Int)?
{
    if array.isEmpty
    {
        return nil
    }
    else
    {
        let IntMin = Int(array.min() ?? 0)
        let IntMax = Int(array.max() ?? 0 )
        return (IntMin,IntMax)
    }
    
}

let data = minMax(array: [1,2,3,4,-5,56,9])
print("los valores se hayan entre \(data!.valueMin) y \(data!.valueMax)  ")

let testDataNull: [Int] = []

minMax(array: testDataNull)


// ETIQUETAS DE PARAMS Y VARIADICS

// f1 y f2 funcionan como etiquetas
//se puede dar un valor por defecto y si no se especifica otro valor usa esos
func someFunction(f1 firtParamName: Int, f2 secondParamName: Int = 6)
{
    print(firtParamName + secondParamName)
}

//usamos las etiquetas en vez de las variables para que sea mas facil y rapido 
someFunction(f1: 5, f2: 2)

//podemos usar la funcion solo declarando 1 dato y tomara el otro por default
someFunction(f1: 4)

func greeting2 (_ person: String, from hometown: String) -> String
{
    return "Hola \(person) un placer que nos visites desde \(hometown)"
}

//las etiquetas nos ayudan a leer o redactar las funciones de mejor manera
//puedes poner guion bajo en vez de nombre de etiqueta y simplica mucho la redaccion
greeting2( "Mich", from: "Mexico")


//calcular la media aritmetica
// n cantidad de valores posibles
//los puntos suspensivos significa que pueden entrar cantidad indefinida de datos de ese tipo a esa funcion

func mean(_ numbers: Double...) -> Double
{
    var total: Double = 0
    for idx in numbers
    {
        total += idx
    }
    return total / Double(numbers.count)
}

mean(1,2,3,4,5,6,7,8)
mean(2.7,1.5)


//PARAMETROS TIPO INOUT

var x = 5

//los parametros en los parentesis son de solo lectura, por eso no podemos agregar directamente el valor de una variable
//se crea una variable interna para trabajar
func addOne(number: Int)
{
    var number2 = number
    number2 += 1
    print("el numero ahora vale \(number2)")
}
//aun asi el valor de x no es modificado dentro de la funcion
addOne(number: x)
x

//alterar los valores declarados en la funcion es declarandolos como parametros inout
func swapTwoInts(_ a: inout Int,_ b: inout Int) //funcion que intercambia los valores de 2 enteros
{
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var otherInt = 7
print("someInt vale \(someInt) y otherInt vale \(otherInt)")
//al declarar los datos como inout, ponemos el & al usar la funcion
//porque estamos usando la referencia del valor
swapTwoInts(&someInt, &otherInt)
print("someInt vale \(someInt) y otherInt vale \(otherInt)")
