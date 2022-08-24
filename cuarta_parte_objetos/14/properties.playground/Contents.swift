import UIKit
import CoreGraphics

//STORED PROPERTIES
// nota personal: las properties parecen ser los atributos

struct FixedLengthRange
{
    var firstValue: Int
    let length: Int //ambas son stored properties
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3) //aqui incializamos las propiedades

rangeOfThreeItems.firstValue = 6 // la estructura ya fue inicializada, aqui se puede modificar porque fue declarada var
//si rangeofthreeitems fuera constante, no se podrian cambiar los valores con los que fue declarado


let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

//rangeOfFourItems.firstValue = 5 //esta operacion no es posible, es una constante

//LAZY STORED PROPERTIES
// las lazy no se inicializa su valor hasta que sea necesario

class DataImporter
{
    var filename = "data.txt"
}

class DataManager
{
   lazy var importer = DataImporter() //esta variable no es creada al crear el objeto, si no hasta que sea necesario
    var data = [String]()
} //las lazy var nos permiten ahorrar memoria o poder de computo al no llamar procesos innecesarios


let manager = DataManager()
manager.data.append("algo de datos")
manager.data.append("muchos mas datos") //podemos meter datos a data porque no es lazy
manager //el importer da nil
//hasta este momento el importer no ha sido creado

manager.importer.filename //hasta este momento que fue llamado, se crea la variable/propertie importer
manager //aqui el importer ya ha sido creado


//COMPUTED PROPERTIES
//variables calculadas por un algoritmo, no accedemos directamente a ellas


struct Point
{
    var x = 0.0
    var y = 0.0
}

struct Size
{
    var width = 0.0
    var height = 0.0
}

struct Rec //rectangulo
{
    var origin = Point()
    var size = Size()
    //centro es una variable que debe ser automaticamente calculada, segun el origin y el tamaño, no puede ser agregada por el usuario
    // para evitar errores
    var center: Point
    {
        get //se usa para obtener el centro apartir de los parametros de origen y tamano
        {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) //si queremos calcular un nuevo centro y apartir de el establecer otro origen
        {
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
            //dentro del set existe una variable llamada newValue que puede ser usada para modificar a center
            // sin declarar el newcenter
        }
    }
}

//crear una figura utilizanod las estructuras anteriores
var square = Rec(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
square.center //el get calcula automaticamente el centro con los parametros ingresados

let initialSquareCenter = square.center //declaramos en una variable la estructura del centro actual
square.center = Point(x: 20, y: 20) // al declarar un nuevo centro, para square, automaticamente cambia el origen


// COMPUTED PROPERTIES DE SOLO LECTURA
// si solo geter y no tiene seter, por lo tanto su valor no puede ser modificado, solo obtenido

//mediante los datos de un cubo, obtener su volumen

/* Asi es como normalmente se haria
struct Cuboid
{
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    var volume: Double
    {
        get
        {
            return width * height * depth
        }
    }
} Swift permite declarar el get implicito para una variable de solo lectura
 */

struct Cuboid
{
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    var volume: Double
    { //no es necesario declarar el get, si no se va a poner set, el toma implicito el get
        return width * height * depth
    }
}

let cuboide = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
cuboide.volume
//cuboide.volume = 57 //esto no es posible, la variable no puede ser modificada, es de solo lectura


// PROPERTY OBSERVERS
// una propiedad que al ser modificada, se tiene que realizar alguna accion

// willset -> indica prescencia de futuro //se activa justo antes de cambiar el valor de una property

// didset -> indica prescencia de pasado //se activa justo despues de cambiar el valor de una property

//un podometro para revisar un numero de pasos

class StepCounter //queremos mandar notificaciones del numero de pasos que ha ido dando
{
    var totalSteps: Int = 0
    {
        willSet(newTotalSteps) //se va a actualizar el valor total de pasos que lleva
        {
            print("el numero de pasos va a subir hasta \(newTotalSteps)")
        }
        
        didSet
        {   // preguntar cuantos pasos se han anadido
            
            if totalSteps > oldValue //oldvalue es una varibale interna de didset, no es necesario declarar
            {
                print("el numero de pasos a incrementando en \(totalSteps-oldValue)")
            }
        }
    }
}

let stepOfTheDay = StepCounter()

stepOfTheDay.totalSteps = 200 //se agregan una cantidad de pasos dados
//primero se hace el willset
//segundo se hace el didset

//volvemos a actualizar el valor
stepOfTheDay.totalSteps = 520
//se actualiza a 520 la cantidad de pasos dados por el willset
//se muestra que se han aumentado 320 pasos con el didset

stepOfTheDay.totalSteps += 1234 //se agregan 1234 a los 520 que ya estaban

//RETO DE CLASE crear una clase lifeplayer
// si la vida pasa de 100, regresarla a 100
// si la vida baja de 0, mandar a game over

class LifePlayer
{
    var life: Int = 0
    {
        willSet(newLife)
        {
            if newLife >= 100
            {
                print("vida al maximo")
                
            }
        }
        
        didSet
        {
            if life >= 100
            {
                self.life = 100
            }
            else if life <= 0
            {
                self.life = 0
                print("GAME OVER!!!")
            }
        }
        
    }
}

var playerOneLife = LifePlayer()

playerOneLife.life = 123

playerOneLife.life = -9


//TYPE PROPERTIES

//las computed properties son 1 por cada instancia, es decir cada objeto tendra la suya

//a veces vamos a necesitar una variable que sea compartida por varias instancias de una misma clase/struct o enum

// static es una variable comun a todos los objetos que son instanciados de esa clase

// para las computed properties que necesiten ser staticas se tiene que usar la palabra reservada class


struct SomeStruct
{
    var counter = 0
    static var storedTypeProperty = "Some Value" //esta es una variable comun a todas las instancias
    static var computedTypeProperty: Int
    {
        return 1
    }
}

var instanceStr = SomeStruct() //no se muestran las statics porque son comunes de todas las instancias

var otherInstanceStr = SomeStruct() //creamos otra instancia para comprobar que no es posible

// la unica forma de acceder a las statics es mediante la propia estrcutura/ clase, no mediante las instancias

SomeStruct.computedTypeProperty

//ejemplo con un enum

enum SomeEnum
{
    static var storedTypeProperty = "SomeValue"
    static var computedTypePropoerty: Int
    {
        return 5
    }
}

//acedemos a los statics desde el enum directamente
SomeEnum.storedTypeProperty


//ejemplo mediante clases, se hace de la misma manera

class SomeClass
{
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int
    {
        return -9
    } //esta no puede ser modificada por ninguna clases hija o padre cuando se declara como static
    
    
    class var OverrideableComputedTypeProperty: Int
    {
        return 1089
    } // las que se declaran como class en vez de static, van a poder ser modificas en las herencias por padres o hijos
}
// en estos casos se debe poner mucha atencion a las computed properties por las subclases
