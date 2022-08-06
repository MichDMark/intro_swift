import UIKit

//ciclo for-in

//recorrer un array

let names = ["plasma", "mallicius", "diamond"]

//si el contador idx no se usa en el for puede ser reemplazado con un guion bajo
//for name in names
for _ in names
{
    print("Hola \(names)")
}

//recorrer un diccionario
let numberOfLegs = ["spider": 8, "ant": 6, "dog":4]

for (animalName, legCount) in numberOfLegs
{
    print("Animal: \(animalName), numero de patas: \(legCount)")
}

//for para rangos
for idx in 1...5
{
    print("\(idx) x3 = \(idx*3)")
}

//potencias
let base = 2
let power = 10
var answer = 1

//si el contador idx no se usa en el for puede ser reemplazado con un guion bajo
//for idx in 1...power
for _ in 1...power
{
    answer *= base
    print(answer)
}

//contador de un reloj
var hour = 9
let minutes = 60
for _ in 0..<minutes
{
    //print("\(hour) : \(tickMark)")
}

//contando en rangos con la funcion stride
let minuteInterval = 5

for tickMark in stride(from: 0, to: minutes, by: minuteInterval)
{
    print("\(hour) : \(tickMark)")
}

//ciclo while

//hacer un contador hasta 10
var i = 0
while i <= 10
{
    i+=1
}
i //el contador si guarda su valor, en el for no se guarda

while i <= 10
{
    i+=1
}
//este while no hace nada porque i ya es mayor a 10 antes de entrar


//repeat while es el do while de otros lenguajes
repeat
{
    i+=1
}while i <= 10
print(i)
//el repeat while entra al menos 1 vez aunque no se cumpla la condicion

        

//sacar los numeros primos del 1 al 100
var nums = [Int](2...100)
let end = 100
var primeNum: [Int] = []
var prime100 = [2,3,5,7]

nums
primeNum.isEmpty

var count = 0
/*
while count <= 98
{
    nums[count] *= 2
    count+=1
}
nums


for idx in 0...98
{
    primeNum.append(nums[idx])
}
        
for idx in nums
{
    primeNum.append(idx%3)
}
 */
nums
while count <= 98
{
    if (nums[count] % 2 != 0) && (nums[count] % 3 != 0) && (nums[count] % 5 != 0) && (nums[count] % 7 != 0)
    {
        primeNum.append(nums[count])
        prime100.append(nums[count])
        count += 1
    }
    else
    {
        count += 1
    }
}
primeNum
prime100

//IF ELSE

//termostato
var temp = 18

if temp <= 15
{
    print("\nhace frio, enciende calefaccion")
}
else if temp >= 25
{
    print("empieza a hacer calor, apaga la calefaccion")
}
else
{
    print("La sencion termica es agradable, no hace falta modificarla")
}

// SWITCH CASE

let someChar: Character = "d"

//en swift se pueden juntar varios casos en una misma linea 😮
switch someChar
{
case "a", "A":
    print("es la primera letra del alfabeto")
case "z":
    print("es la ultima letra del alfabeto")
default:
    print("es alguna otra letra")
}

//switch usando rangos -- interval matching

//cuantas lunas tiene saturno
let moons: Int = 62
//vamos a escribir con un switch una frase

let phrase = "lunas en Saturno"
let naturalCount : String

switch moons
{
case 0:
    naturalCount = "No hay"
case 1..<5:
    naturalCount = "Hay unas pocas"
case 5..<12:
    naturalCount = "Hay bastantes"
case 12..<100:
    naturalCount = "Hay decenas de"
case 100..<1000:
    naturalCount = "Hay centenares de"
default:
    naturalCount = "Hay muchisimas"
}
print("\(naturalCount) \(phrase) ")


//switch usando tuplas

//comprobar la existencia de dos valores
//compara ambos o solo 1 de los valores de la tupla
//se ignoran casos con la barra baja
//tambien aqui se pueden usar rangos
let somePoint = (1,1)

switch somePoint
{
case (0,0):
    print("El punto \(somePoint) es el origen de las coordenas")
case (_,0): //toma solo 1 de los dos casos
    print("El punto \(somePoint) se encuentra sobre el eje x ")
case (0,_): //toma solo 1 de los dos casos
    print("El punto \(somePoint) se encuentra sobre el eje y ")
case (-2...2, -2...2):
    print("El punto \(somePoint) se encuentra en el interior del cuadrado central l=4")
default:
    print("El punto \(somePoint) esta en algun otro lado")
}

//comprobar si el punto esta sobre el eje de las x o y
//se pueden declaran las variables en los case y usarlas
//se pueden hacer comparaciones dentro de los casos
let anotherPoint = (2,-2)
switch anotherPoint
{
case(let x, 0):
    print("Sobre el eje de las X, con valor \(x)")
case (0, let y):
    print("Sobre el eje de las y, con valor \(y)")
case let (x,y) where x == y:
    print("El punto se encuentra sobre la recta x=y en (\(x), \(y))")
case let (x,y) where x == -y:
    print("El punto se encuentra sobre la recta x= -y en (\(x), \(y))")
case let(x,y):
    print("En algun otro lugar del plano, en (\(x), \(y))")

}


// SWITCH CON CASOS COMPUESTOS

let anotherCharacter: Character = "e"

switch anotherCharacter
{
case "a","e","i","o","u":
    print("se trata de una vocal")
case "b","c","d","f","g","h","j","k":
    print("se trata de una consonante")
default:
    print("se trata de un caracter no vocal ni consonante")
}

//calcular la distancia del punto al eje
let stillAnotherPoint = (9,0)

//este case permite comparar ambos casos que se encuentran juntos y evita usar un if
switch stillAnotherPoint
{
case (let distance, 0), (0, let distance):
    print("se encuentra sobre el eje, a distanica \(distance)  del origen")
default:
    print("no esta en el eje")
}


//CONTROL TRANSFER SENTENCES ---> CONTINUE, BREAK, FALLTHROUHG, RETURN, THROW

let sentence = "las mentes grandes piensan igual"
var filteredSentence = ""
//recorrer todas las letras y eliminar vocales
let charToRemove: [Character] = ["a","e", "i", "o", "u"]
var breakSentence = ""
for ch in sentence
{
    if charToRemove.contains(ch)
    {
        continue // pasa a la siguiente iteracion del bucle sin continuar con lo demas de la iteracion actual
    }
    filteredSentence.append(ch)
}
filteredSentence

//ademas acabar el recorrido cuando encuentra una letra D

for ch in sentence
{
    if charToRemove.contains(ch)
    {
        continue // pasa a la siguiente iteracion
    }
    breakSentence.append(ch)
    if ch == "d"
    {
        break //termina el bucle y sale de el
    }
}
breakSentence
//se puede usar el break en switch en el default para que salga del ciclo al llegar ahi


// Fallthrough -- pasar hacia adelante
//se usa en el switch
//el switch en swift es exahustivo, cumple una condicion y ya no revisa las demas
//usamos esta sentencia para revisar varias condiciones

let integerToDescribe: Int = 5

var description = "El numero \(integerToDescribe) es: "
switch integerToDescribe
{
case 2,3,5,7,11,13,17,19:
    description += " un numero primo"
    fallthrough //sigue revisando los demas casos, aunque este se cumpla
default:
    description += " un numero entero"
}
print(description)


// RETURN GUARD

//crear un diccionario
//al ser la clave siempre string y el valor diferentes datos, se pide que se declare el diccionario con string para la clave y any para el valor
var people = ["name": "Mich DMark", "age": 31, "isMale": true] as [String: Any]


//el guard funciona en las funciones y es decir la frase contraria al if
func testUserValidation(person:[String: Any])
{
    guard let surname = people["surname"]
    else{
        print("El apellido de la persona es desconocido")
        return
    }
    print(surname)
    guard let age = person["age"]
    else{
        print("la edad de la persona es desconocida")
        return
    }
    print("la edad de la persona es \(age)")
}

people["surname"] = "DMark" //agrega la clave surname y el valor Dmark al diccionario
testUserValidation(person: people)


// available en api: Manejo de versiones

//para revisar compatibilidad con hardware, software, manejo de versiones etc

if #available(iOS 12, macOS 10.12, *)
{
    //ejecutar las acciones apartir de esas versiones determinadas
}
else
{
    //mantener el codigo con versiones anteriores
}
