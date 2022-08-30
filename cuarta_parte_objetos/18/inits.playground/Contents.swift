import UIKit

// la inicializacion es el proceso para crear objetos apartir de clases/struct

//en otros lenguajes se llama constructor, en swift el meotodo se llama inicializador

//struct de grados Fahrenheit

struct Fahrenheit
{
    var temperature: Double
    
    init() //el inicializador aqui solamente se usa para darle
    {
        self.temperature = 32
    }
}

var f1 = Fahrenheit()

//se puede tener mas de un constructur por clase/estructura

struct Celsius
{
    var temperature: Double
    
    init(fromFahrenheit fahrenheit: Double)
    {
        self.temperature = (fahrenheit - 32) / 1.8
    }
    
    init(fromKelvin kelvin: Double)
    {
        self.temperature = kelvin - 273.15
    }
    
    init(_ celsius: Double) //un constructor que llama a la misma variable, solo para mostrar que se puede eliminar la etiqueta
    {
        self.temperature = celsius
    }
}

//creando objetos con los inicializadores

let boilingPointOfWater = Celsius(fromFahrenheit: 212)

let freezingPointOfWater = Celsius(fromKelvin: 273.15)


//NOMBRES, ETIQUETAS Y OPTIONALS

//como modificar los constructores

struct Color
{
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double)
    {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    //creamos otro inicializador, pero este basado en la escala de grises
    init( white: Double)
    {
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1, green: 0, blue: 1)
let halfGrey = Color(white: 0.5)
let green = Color(red: 0, green: 1, blue: 0)

//objeto para usar el constructor sin etiqueta de temperatura
let bodyTemperature = Celsius(37) //solo pasamos el parametro, porque la etiqueta se puso como un guion bajo, para facilitar tu lectura


//parametros opcionales

//clase de preguntas y respuestas
class SurveyQuestion
{
    let text: String //solo la pregunta es obligatoria
    var response: String? //dejamos response como opcional porque el usuario no esta obligado a responder
    
    init(text :String) //el inicializador solo nos obliga a iniciar las variables obligatorias, no las opcionales
    {
        self.text = text
    }
    
    func ask() //metodo que imprime la pregunta realizada
    {
        print(text)
    }
}

//crear objeto
let q1 = SurveyQuestion(text: "Te gustan los tacos???")

// visualizas la pregunta
q1.ask()

q1.response = "si, me encantan todos los tacos"


//INICIALIZADORES EN SUBCLASES
//los constructores en la herencia se pueden llamar unos a otros

//REGLAS a seguirse en la herencia de constructores

//inicializador designado solo puede llamar a uno designado de una clase superior
//designado -> designado de super clase

//inicializador de conveniencia solo puede llamar a otro init de la misma clase

//el ultimo init que se llame siempre debe ser designado


class Vehicle
{
    var numberOfWheels = 0 //le damos un valor inicial, entonces no hay necesidad de declarar el constructor
    //propiedad autocomputada
    var description: String
    {
        return "\(numberOfWheels) ruedas"
    }
} //cuando no hay un init declarado, igualmente existe un constructor

let someVehicle = Vehicle()
someVehicle.description

//creando la subclase bicicleta

class Bicycle: Vehicle
{
    override init() //override se escribe automaticamente, aunque no hay un constructor escrito arriba
    {
        super.init() //siempre se debe poner esto, aunque no haya un init superior declarado, para llamar al constructor designado de la superclase
        numberOfWheels = 2
    }
}

let someBicycle = Bicycle()
someBicycle.description

//creamos la clase hoverboard, tambien heredada

class Hoverboard: Vehicle
{
    var color: String
    init(color: String) //inicializador por conveniencia, no modifica variables del padre
    {
        self.color = color
        //cualquier inicializador de conveniencia, llama implicitamente a super.init()
    }
    
    override var description: String //sobreescribimos la property del padre con el init de esta clase hija
    {
        return "\(super.description) en el color \(self.color)"
    }
}

let someHoverboard = Hoverboard(color: "silver") //creamos el objeto con el constructor aqui declarado
someHoverboard.description //el resultado es la nueva property descripcion del padre, modificiada por el hijo

//FAILABLE INITIALIZER
//que pasa si la inicializacion no es posible


enum TemperatureUnit
{
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character) //un init que puede retornar un valor nulo entre sus posibilidades, lleva el signo de interrogacion
    {
        switch symbol
        {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let someUnit = TemperatureUnit(symbol: "F")

let otherUnit = TemperatureUnit(symbol: "D") //el constructuor crea un objeto nulo


//clase de un producto en amazon
class Product
{
    let name: String
    
    init?(name: String) //se deja el init con ?, por si se deja el nombre vacio
    {
        if name.isEmpty
        {
            return nil
        }
        self.name = name
    }
}


//clase carrito de compras, que hereda de producto

class CarItem: Product
{
    let quantity: Int
    
    init?(name: String, quantity: Int)
    {
        if quantity < 1 //que pasa si escogemos 0 de un producto o un numero negativo, no se puede hacer la compra, el carrito es nulo
        {
            return nil
        }
        self.quantity = quantity
        super.init(name: name) //con el init de esta clase, podemos regresar al init del padre y arreglar el problema si el producto fue dejado con nombre nulo
    }
}

if let someSocks = CarItem(name:"Socks" , quantity: 2) //para comprar un par de items, si colocas cero o negativos o sin nombre, el objeto nisiquiera es creado
{
    print("\(someSocks.name) - \(someSocks.quantity)")
}


//DESTRUCCION DE OBJETOS CON DEINIT

//creamos algunas clases basicas de un juego, interaccion de un jugador y un banco

class Bank
{   //recordar que las static son properties o metodos de la clase, no del objeto
    static var coinsInBank = 2_000
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int //funcion que pide dinero en el banco
    {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)//obtiene el valor minimo, entre las monedas que pideas y las que hay en el banco
        coinsInBank -= numberOfCoinsToVend //resta de las monedas del banco, las monedas que se pudieron retirar
        return numberOfCoinsToVend //valor de salida, las monedas que pediste, que pueden ser entregadas
        
    }
    
    static func receive(coins: Int) //metodo que hace lo contrario, ingresa dinero en el banco
    {
        coinsInBank += coins
    }
}

class Player
{
    var coinsInPurse: Int //guarda cuantas monedas tiene el jugador
    
    init(coins: Int)
    {
        self.coinsInPurse = Bank.distribute(coins: coins) //creamos el objeto, tomando las monedas del banco al crear el jugador
    }
    
    func win(coins: Int)
    {
        coinsInPurse += Bank.distribute(coins: coins) //cada que gana monedas, las toma del banco
    }
    
    //si el jugador muere o quiere retirar el monedero acutal, tiene que regresar todas las monedas
    
    deinit //destructor o desinicializador, cuando el objeto se destruye, se activa
    {
        Bank.receive(coins: coinsInPurse) //al destruirse el jugador, automaticamente sus monedas pasan al banco
    }
}

var playerOne: Player? = Player(coins: 100) //se creo el objeto como opcional, por si al intentar crearlo tomas mas monedas de las que tiene el banco
//tambien se crea el objeto como opcional, porque el destructor solo funciona con objetos de tipo ?

Bank.coinsInBank //el banco tiene 100 monedas menos, que se tomaron al crear al playerOne

playerOne!.win(coins: 2_000) // ganaste 2000 monedas pero el banco solo tiene 1900, asi que solo obtienes esas
playerOne?.coinsInPurse //tienes ya en total 2000 monedas
Bank.coinsInBank //el banco se ha quedado sin monedas

playerOne = nil //destruimos el objeto playerOne
Bank.coinsInBank //al ser destruido el playerOne todo lo que tenia regresa automaticamente al banco
