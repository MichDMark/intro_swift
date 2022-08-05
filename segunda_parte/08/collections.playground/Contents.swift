import UIKit

//tipos de colecciones
//array
//conjuntos
//diccionarios

//ARRAY
var someInts = [Int]() //declarar un array de enteros vacio

someInts.count //cuenta los items del array
someInts.append(31) //genera espacio para 31 elementos
someInts.count
someInts = [] //vacia el array
someInts.count

//otra forma de inicializar el array
var someDoubles = Array(repeating: 3.14159, count: 3)
someDoubles.count
var moreDoubles = Array(repeating: 2.5, count: 4)

//juntar 2 array es muy sencillo
var aLotOfDoubles = someDoubles + moreDoubles
aLotOfDoubles.count

//otra manera de crear un array
var shoppingList :[String] = ["papas", "pimiento", "tortillas", "cerdo", "cebolla"]
shoppingList.count

//ACCEDER Y MODIFICAR ELEMENTOS DE ARRAYs

//consultar si un objeto esta vacio
if shoppingList.isEmpty
{
    print("la lista de la compra esta vacia")
}
else
{
    print("manda a alguien a comprar las cosas")
}

// agregar elementos al array
shoppingList.append("Coca-cola") //agrega al final del array el nuevo elemento
shoppingList.count

//otra forma de agregar elementos
shoppingList += ["totopos", "guacamole", "pico de gallo"]

//revisar el primer elemento
var firstElement = shoppingList[0]

//cambiar el primer elemento del item
shoppingList[0] = "Huevos"

//revisar elementos del 4 al 6
shoppingList[4...6]

//cambiar los elemementos 4 a 6
shoppingList[4...6] = ["naranja", "platano", "mango"]

//eliminar elemento y se puede agregar a una constante
//shoppingList.remove(at: 1) se puede borrar sin agregarlo a una variable
let pepper = shoppingList.remove(at: 1)

//remover ultimo item
shoppingList.removeLast()
shoppingList

//remover primeros y ultimos items sirve para las listas (pilas y colas)


//ITERANDO EN ARRAYS

//hacer una iteracion a los elementos de la lista

for item in shoppingList
{
    print(item)
}

print("\n")
//guardando los datos en una tupla directamente en el for
for (idx, item) in shoppingList.enumerated()
{
    print("Item \(idx+1): \(item)")
}

//CONJUTOS (SET)

//LOS CONJUNTOS NO PUEDEN TENER ELEMENTOS REPETIDOS !!!!

//los conjuntos no llevan orden
//los conjuntos no pueden usar append o similares porque no existe un orden
var letters = Set<Character>()
//para estar en un set o conjunto los objetos deben ser comparables
letters.count
letters.insert("a")
letters.insert("d")
letters.insert("m")
letters

var favouritesGames : Set<String> = ["Final Fantasy", "World of Warcraft", "Farcry"]
//la mayoria de metodos que no sean de orden funcionan en los sets
favouritesGames.count //el count funciona en los set

//se lee si favourites gams esta vacio entonces
if favouritesGames.isEmpty
{
    print("No hay juegos favoritos")
}
else
{
    print("tienes mucho que jugar")
}

//insertar items en el set
favouritesGames.insert("Metal Gear")

//para remover items ya que no hay un orden lo hacemos de la siguente manera
//se tiene que hacer con if let, ya que si se hace directo y no esta el item, el resultado da nulo

if let removedGame = favouritesGames.remove("Farcry")
{
    print("he Eliminado de la lista \(removedGame)")
}
else
{
    print("No ha sido posible eliminar el juego del conjunto")
}

//tambien se puede hacer al reves, primero consultado con un if, si el string existe en el set
//y despues remueves
if favouritesGames.contains("Metal Gear")
{
    print("Me encanta ese juego, esta en el conjunto")
}

//iterar dentro del conjunto
print("\n")
for vg in favouritesGames.sorted()
{
    print(vg)
}

//OPERACIONES CON CONJUNTOS (algebra de conjuntos)

let oddDigits: Set =  [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let primeNumbers: Set = [2,3,5,7]

//A union con B = elementos que son de A o B o de los dos
oddDigits.union(evenDigits).sorted() //metodo sorted acomoda

//A interseccion con B = elementos que son a la vez de A y B
oddDigits.intersection(evenDigits) //interseccion de par e impar da un conjunto vacio
evenDigits.intersection(primeNumbers).sorted() //interseccion de pares y primos
oddDigits.intersection(primeNumbers).sorted() //interseccion de impares y primos


//A - B = elementos que son de A pero no de B (a los elementos de A se le quita los que comparte con B)
oddDigits.subtracting(primeNumbers).sorted()


//A+B = (A-B) union (B-A)
oddDigits.symmetricDifference(primeNumbers).sorted()

//conjuntos y subconjuntos

let houseAnimals: Set = ["🐶","😼"]
let farmAnimals: Set = ["🐮","🐓","🐑","🐶","😼"]
let cityAnimals: Set = ["🐁","🕊"]

//verificar si un conjunto es subconjunto de otro

//se lee: los animales de casa son subconjunto de los animales de granja
houseAnimals.isSubset(of: farmAnimals)

farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)



//DICCIONARIO
//no tienen orden, cada elemento tiene una clave para acceder a el y un valor que es el que guarda en el diccionario

//diccionario vacio
//del lado izq la clave, del derecho el valor
//en este caso: la clave va a ser un valor entero y el valor un string
var nameOfIntegers = [Int : String]()
nameOfIntegers[15] = "quince" //no se refiere a la posicion 15, el 15 es la clave

//vaciar el diccionario
nameOfIntegers = [:]

//declarar un diccionario de aeropuertos
var airports: [String : String] =
[
    "YYZ" : "Toronto",
    "DUB" : "Dublin",
    "PMI" : "Palma de Mallorca"
]

//funcionan los metodos para analizar los items
airports.count
airports.isEmpty

//agregar items, en los corchetes va la clave, luego igual al valor
airports["LHR"] = "London City Airport"

airports
//que pasa si duplicas una clave, se reescribe el valor
airports["LHR"] = "London Heathrow"
airports

//otra forma de reescribir valores y guardar los datos anteriores

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB")
{
    print("El aeropuerto tenia el nombre de \(oldValue)")
}

//verificando si existe un valor para la clave y lo guardas en una variable
if let airportName = airports["DUB"]
{
    print("El aeropuerto de DUB es: \(airportName)")
}


//remover items del diccionario de diferentes maneras

airports["PMI"] = nil //elimina la clave y el valor del diccionario
airports

airports.removeValue(forKey: "DUB")

//ITERACION EN DICCIONARIOS

//imprimir todos los valores de claves y valores
for (key, value) in airports
{
    print("\(key) - \(value)")
}

//imprimir solo las claves
for airportKey in airports.keys
{
    print(airportKey)
}

//imprimir solo los value
for airportName in airports.values
{
    print(airportName)
}

//crear arrays apartir de los diccionarios

//recordar que los array si tienen orden y los diccinarios no

//array de las claves del diccionario
let airportKeys = [String](airports.keys)

//array de los valores del diccionario
let airportNames = [String](airports.values.sorted())
