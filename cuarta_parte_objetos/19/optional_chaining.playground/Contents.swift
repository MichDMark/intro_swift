import UIKit

//OPTIONAL CHAINING
//ayuda cuando vamos a trabajar con optionals

/*
class Person
{
    var residence: Residence? //tener residencia es opcional
}

class Residence
{
   var numberOfRooms = 1 //declaramos por default una residencia de 1 habitacion
}

let mich = Person() //declaramos el objeto con residencia nula

//intentamos crear una cte para ver cuantas habitaciones mich

//let roomCount = mich.residence!.numberOfRooms //no es posible ya que el objeto residencia es nulo

if let roomCount = mich.residence?.numberOfRooms //si es posible contar los cuartos de la residencia, imprime lo siguente
{
    print("La casa de mich, tiene \(roomCount) habitaciones")
}
else //si no era posible contar las habitaciones, entonces
{
    print("Mich no tiene casa")
}

//modificamos el objeto
mich.residence = Residence() //le agregamos al objeto una residencia basica de 1 cuarto


//volvemos a intentar contar los cuartos del objeto Mich
if let roomCount = mich.residence?.numberOfRooms // ?. es para trabajar de forma mas segura usar ? en vez de !
{
    print("La casa de mich, tiene \(roomCount) habitaciones")
}
else //si no era posible contar las habitaciones, entonces
{
    print("Mich no tiene casa")
}

 */ //se comento toda esta parte del codigo, para poder hacer el siguiente ejemplo con los mismos nombres de las clases


//CLASES EJEMPLO PARA OPTIONAL CHAINING

class Person
{
    var residence: Residence?
}

class Residence
{
    var rooms = [Room]()
    
    var numberOfRooms: Int //entrega la longitud del array de la var rooms
    {
        return rooms.count
    }
    
    subscript(i: Int) -> Room //en cada posicion va a devolver un objeto Room
    {
        get //entrega el subindice
        {
            return rooms[i]
        }
        
        set //para asignar un valor al subindice
        {
            rooms[i] = newValue
        }
    }
    
    var address: Address?
    
    func printNumbersOfRooms()
    {
        print("Numero de habitaciones es \(numberOfRooms)")
    }
}

class Room
{
    let name: String
    
    init(name: String)
    {
        self.name = name
    }
}

class Address
{
    var buildingName: String? //no todos los edificios tienen nombre
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? //intentamos crear un ID con algo de la informacion
    {
        if let buildingNumber = buildingNumber, let street = street //si tenemos calle y numero
        {
            return "\(buildingNumber), \(street)"
        }
        else if buildingName != nil //si solo tenemos nombre del edificio
        {
            return buildingName
        }
        else //si no tenemos ninguno de los tres datos
        {
            return nil
        }
    }
} //en esta clase todas las properties son opcionales


//EJEMPLO PRACTICO CON OPTIONAL CHAINING

let mich = Person()

//ya que hay tantos optionals recordar usar metodos para comprobar si algo no es nulo

if let roomCount = mich.residence?.numberOfRooms //si es posible contar los cuartos de la residencia, imprime lo siguente
{
    print("La casa de mich, tiene \(roomCount) habitaciones")
}
else //si no era posible contar las habitaciones, entonces
{
    print("Mich no tiene casa")
}

//crea un objeto de direccion

func createAddress() -> Address
{
    print("La funcion createAddress ha sido llamada")
    let someAddress = Address()
    someAddress.buildingNumber = "13"
    someAddress.street = "Calle de platzi"
    
    return someAddress
}

//como swift lee de izquierda a derecha, al no existir una residencia, no accede a la clase address
// y por lo tanto nunca llama la funcion create
mich.residence?.address = createAddress() //sigue sin asignar una direccion a mich, porque residence es nulo
mich

//igualmente no puedes acceder a una funcion de residencie porque es nulo
mich.residence?.printNumbersOfRooms()

//intentando entrar de forma segura a la funcion, da el mismo resultado

if mich.residence?.printNumbersOfRooms() != nil //if para comprobar si pudimos acceder al metodo dentro de residence
{
    print("He podido conocer el numero de habitacioes")
}
else
{
    print("No es posible conocer el numero de habitaciones ")
}

if (mich.residence?.address = createAddress()) != nil //ya sabemos que esto es nulo, no ha cambiado nada
{
    print("Ha sido posible configurar la direccion")
}
else
{
    print("No a sido posible configurar la direccion")
}


//intentando entrar por los subindices

if let firstRoomName = mich.residence?[0].name //de igual manera no podemos acceder a los room, mientras residence sea nulo
{
    print("La primera habitacion es de \(firstRoomName)")
}
else
{
    print("No sabemos de quien es la primera habitacion")
}

mich.residence?[0] = Room(name: "bathroom") //igualmente da nulo

//hasta que creemos una residencie, no vamos a poder asignar nada de lo anterior

let michHouse = Residence()
michHouse.rooms.append(Room(name: "Bathroom"))
michHouse.rooms.append(Room(name: "Living Room"))
michHouse.rooms.append(Room(name: "Kitchen"))
mich.residence = michHouse //no olvidar asignar la residencia creada al objeto mich

//una vez creada la residencia, volvemos a hacer la pregunta de los nombres de las habitaciones

if let firstRoomName = mich.residence?[0].name //de igual manera no podemos acceder a los room, mientras residence sea nulo
{
    print("La primera habitacion es de \(firstRoomName)")
}
else
{
    print("No sabemos de quien es la primera habitacion")
}


// OPTIONAL CHAINING MULTIPLE

// cuando se encadenan varios elementos optionals

//intentamos consultar la direccion de la residencia de mich


mich.residence?.address = createAddress() //asignamos primero la direccion a la residencia

if let michStreet = mich.residence?.address?.street //aqui se anidan varios optional
{
    print("La casa de mich esta en  \(michStreet)")
}
else
{
    print("no es posible saber donde vive")
}
mich

//comprobamos la informacion de la direccion, que hasta ahora nada a sido asignado

//ya que existe una direccion y la funcion createAddress asigno valores a la var buildingId, se puede crear aqui y ya no hay nada nulo

if let buildingIdentifier = mich.residence?.address?.buildingIdentifier()
{
    print("Mich vive en \(buildingIdentifier)")
}
else
{
    print("No se donde vive")
}


//queremos saber si la direccion o el buildingID empieza con un numero
//para hacer mas preguntas con optionals

if let beginsWith13 = mich.residence?.address?.buildingIdentifier()?.hasPrefix("13")
{
    print("Mich vive en ese numero?? : \(beginsWith13)") //solo lo imprimi asi para usar la variable 
}
else
{
    print("Ese no es el numero de su casa")
}
