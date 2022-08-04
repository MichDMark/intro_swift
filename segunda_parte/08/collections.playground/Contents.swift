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

//los conjuntos no llevan orden
var letters = Set<Character>()
letters.count
letters.insert("a")
letters.insert("d")
letters.insert("m")
letters

//var favo
