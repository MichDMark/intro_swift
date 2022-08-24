import UIKit
import CoreGraphics
import Darwin

//METODOS
// son las funciones ligadas a un objeto o clase

// si van ligadas al objeto, se llaman metodos de instancia


class Counter
{
    var count = 0 //esta variable es global para toda la clase
    
    func increment()
    {
        self.count += 1
    }
    //es una buena practica en las funciones de las clases (metodos) usar el self para referirse a las mismas variables (properties//atributos) de la clase y asi evitar confusiones para ti mismo o para el compilador
    
    func increment(by amount: Int) //las variables definidas en la funcion son locales para ese metodo
    {
        self.count += amount
    }
    
    func reset()
    {
        self.count = 0
    } //las funciones sin static son instancias de la clase
}

let counter = Counter() //creando el objeto

counter.increment() //llamamos al metodo 

counter.increment(by: 8)

counter.reset()

//definir si un punto esta a la izq o derecha de un valor dado
struct Point
{
    var x = 0.0 //variable global de la estructura
    var y = 0.0
    
    func isToTheRight(of x:Double) -> Bool //la x de aqui es local
    {
        return self.x > x
        // retorna verdadero si la x global es mayor que la x local
    }
}

let somePoint = Point(x: 4, y: 5) //declaramos un punto en (4,5)

somePoint.isToTheRight(of: 1)
somePoint.isToTheRight(of: 54)

// MUTATING METHODS
//metodos que pueden modificar las properties de struct y enum,

//retomamos la estructura point de ejemplo pasado

struct PointMove
{
    var x = 0.0 //variable global de la estructura
    var y = 0.0
    
    func isToTheRight(of x:Double) -> Bool //la x de aqui es local
    {
        return self.x > x
        // retorna verdadero si la x global es mayor que la x local
    }
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double)
    {
        self.x += deltaX
        self.y += deltaY
        //self = PointMove(x: self.x + deltaX, y: self.y + deltaY) hace lo mismo pero sobreescribre toda la structura PointMove
        
    }//una funcion mutating puede modidicar las variables de una estructura o enum, que son fijas
}

var starPoint = PointMove(x: 4, y: 5) //se declara un punto constante

//starPoint.x = 5 //no es posible modificar directamente las properties

starPoint.moveBy(x: 2, y: -3) //se ejecuta el metodo mutable y cambia los valores de los properties

starPoint.x = 9 //solo para comprobar cambiando el valor de las properties manualmente porque son variables



//enum con diferentes estados entre los que puede cambiar
enum DifferentStateSwitch
{
    case off, low, high
    
    mutating func next() //metodo que cambia el estado de un ventilador
    {
        switch self
        {
        case .off: //de apagado si activas next pasa a bajo
            self = .low
        case .low: //de bajo si oprimes next pasa a alto
            self = .high
        case .high:
            self = .off //de alto si oprimes next pasa a apagado
        }
    }
}

var controllerStatus = DifferentStateSwitch.off //inicializamos apagado para crear el objeto

controllerStatus.next()
controllerStatus.next()
controllerStatus.next() //pasamos por los tres estados progresivamente como si girara la perilla del ventilador

// METODOS DE CLASE
// un metodo de clase es aquel que puede ser invocado por la misma clase y no por un objeto/instancia

class SomeClass
{
   class func someMethod() //recordar que usas class cuando te interesa la herencia y static cuando no te interesa la herencia
    {
        print("Hola")
    }
}

SomeClass.someMethod()


// ejemplo para juegos de rol, estructura que guarde el nivel de jugador

struct LevelTracker
{
    static var highestUnlockedLevel = 1 //recordar que las static son comunes a todas las instancias
    
    var currentLevel = 1 //nivel acutal, empieza en 1
    
    static func unlock(_ level: Int) //ingresamos el lv desbloqueado y actualizamos
    {
        if level > highestUnlockedLevel
        {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool //metodo que le preguntas si un nivel ya esta desbloqueado, regresa true o false
    {
        return level <= highestUnlockedLevel
    }
    
    //funcion que hace el aumento de lv
    mutating func advance(to level: Int) -> Bool //es mutating pq modifica una variable de la estructura
    {
        //si leveltracker tiene desbloqueado el lv al que quiero acceder, entonces entra al ciclo
        if LevelTracker.isUnlocked(level) //para acceder a otro metodo que es estatico, accedemos desde la structura general, no se puede simplemente llamar al metodo
        {
           currentLevel = level
            return true
        }
        else
        {
            return false
        }
    }
    
}

//creamos una clase jugador, que contenga
class Player
{
    var tracker = LevelTracker()
    let playerName: String //es una variable no inicializada, la inicializamos o declaramos el inicializador de un constructor (explicacion pendiente en futuros modulos)
    
    func complete(level: Int)
    {
        LevelTracker.unlock(level + 1)//invocamos esta funcion desde la structura porque es static
        tracker.advance(to: level + 1) //invocamos esta funcion desde el objeto porque no es static
    }
    
    init (name: String) //inicializador dentro del constructor, pendiente explicacion
    {
        self.playerName = name
    }
}


var player = Player(name: "Mich DMark") //se crea un nuevo jugador que empieza en lv 1

player.complete(level: 9) //indicamos que se completo el lv 1

player //consultado estadisticas del jugador

//hacemos un if para verificar si puede avanzar a otro nivel

let levelIWant = 7

if player.tracker.advance(to: levelIWant) //pregunta si podemos avanzar al lv 7
{
    print("podemos avanzar hasta el lv \(levelIWant)")
}
else
{
    print("el lv \(levelIWant) no esta disponible ahorita ")
}

