import UIKit

//HERENCIA

//ejemplo con vehiculos de un juego

class Vehicle //clase padre
{
    var currentSpeed = 0.0
    var description: String //propiedad autocomputada
    {
        return "Viajando a \(currentSpeed) km/hr"
    }
    
    func makeNoise() //simular el ruido del vehiculo en el juego
    {
        // do nothing porque cada vehiculo, tiene su propia forma de hacer ruido
        print("cada vehiculo hace su propio ruido")
    }
}

//creando un objeto

let someVehicle = Vehicle()

print(someVehicle.description)


//creando una clase hija

class Bicycle: Vehicle //la clase bicycle es hija y vehicle es la super clase o clase padre
{
    //tengo las mismas variables y metodos de vehicle y se pueden agregar mas
    var hasBasket = false
}

let someBicycle = Bicycle() //creando un objeto que tiene las propiedades y metodos de la clase padre y la clase hija

someBicycle.hasBasket = true
someBicycle.currentSpeed = 15.0

print(someBicycle.description)

//creamos una clase hija de bicycle, tandem es un tipo de bicicleta para dos o mas personas

class Tandem: Bicycle
{
    var currentNumberOfPassengers = 0
}

//creando un objeto de tandem

let someTandem = Tandem()
// el objeto puede modificar variables de todas sus clases padre
someTandem.hasBasket = true
someTandem.currentNumberOfPassengers = 2
someTandem.currentSpeed = 22.0
print(someTandem.description)

//SOBRE ESCRITURA DE VARIABLES Y METODOS

//Hay variables o metodos del padre que queremos que el hijo sobreescriba
//y tambien a prevenir la sobreescritura

//FINAL evita que una variable/metodo/subindice pueda ser sobreescrito
class Train: Vehicle
{
    final var numberOfWagons = 0 //final es el modificador para que una clase/variable no pueda ser modificada al heredarse
    //swift automaticamente nos da el override, que significa que se va a sobreescribir el metodo
    override func makeNoise()
    {
        print("CHOOO CHOOOO !!!!!")
    }
}

let someTrain = Train()

//aunque en el padre makenoise haga algo, al sobreescribir la funcion, lo que importa es lo que haga la sobreescrita
someTrain.makeNoise()

someTandem.makeNoise() //aqui hace lo que tiene la clase padre, porque no fue sobreescrita


//la sobreescritura tambien funciona con properties, ademas de metodos

class Car: Vehicle //queremos sobreescribir la property, current speed y agregar la marcha
{
    var gear = 1 //la marcha del carro
    
    override var description: String
    {
        return super.description + " en la marcha \(gear)" //super, es la manera en que se refiere a la clase padre o super clase
    }// le sumamos la salida de la funcion anterior y le agregamos algo extra
}

let someCar = Car()
someCar.currentSpeed = 55
someCar.gear = 3
print(someCar.description) //muestra el string de la clase padre y la parte agregada del string en la clase hijo

print(someTandem.description) //al no estar sobreescrita, hace lo que tiene solamente la clase padre, que es donde esta declarado


//crear clase de un carro automatico, cuya marcha cambia de manera automatica


class AutomaticCar: Car
{
    override var currentSpeed: Double //sobreescribimos la property
    {
        didSet
        {
            gear = Int(currentSpeed / 15.0) + 1 //solo es una formula para asignar una marcha a un valor de velocidad
        }
    }
}

let someAutomaticCar = AutomaticCar()

someAutomaticCar.currentSpeed = 35
print(someAutomaticCar.description)
// al sobreescribir la currentSpeed y asignar un valor de marcha, nos da autmaticamente ese valor
//dependiendo de la velocidad a la que vaya el vehiculo


//creamos la clase tranvia, que hereda de tren, para comprobar las variables que no se pueden modificar

class Railway: Train
{
    
}
