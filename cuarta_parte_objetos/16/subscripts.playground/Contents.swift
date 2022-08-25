import UIKit
import Darwin

//SUBINDICES
//los subindices en los array es lo que ayuda a moverse entre los elementos
// en swift se pueden hacer subindices en cualquier clase

//utilizamos un metodo especial llamado subscrpit dentro de la clase o estructura

//struct de las tablas de multiplicar
struct TimesTable
{
    let multiplier: Int
    
    //el metodo subscript va a necesitar de entrada un entero, la salida puede ser cualquiera
    subscript(index: Int) -> Int
    { //dentro de subscript tambien puede haber getters y setters
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3) //crea la strucutra de la tabla del 3

print("6x3 = \(threeTimesTable[6])") //llamamos al lugar 6 de la tabla

//imprimiendo todos los valores de la tabla hasta el 10

for idx in 0...15
{
    print("3x\(idx) = \(threeTimesTable[idx])")
}

//ejemplo de subindices en los enum
//ej enums de planetas

enum Planet : Int
{
    // recordando, al darle al primer case = 1, los demas siguen en secuencia, no hay necesidad de escrbir uno x uno
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, inexistente
    
    //entra un numero n y el metodo entrega un planeta, con el numero de caso que coincida
    static subscript(n: Int) -> Planet //lo declaramos static para que no dependa del objeto, si no del enum tal cual
    {
        
       if n > 0 && n <= 8
        {
           return Planet(rawValue: n)!
       }
        else
        {
            return Planet.inexistente
        }
    }
} //reto de clase realizado, modificar el enum por si ingresan un numero de planeta no valido

let marte = Planet[4]

print(Planet[15])


//MATRICES USANDO SUBINDICES

//generando una matriz
struct Matrix
{
    let rows : Int
    let columns : Int //son ctes, para que no se pueda modificar su tamano
    var grid: [Double] //el contenido se va a guardar en un array de Doubles
    
    //usamos un metodo constructor para declarar los tamanos
    init(rows: Int, columns: Int)
    {
        //uso los mismos nombres de las properties, asi que usamos los self,
        //para guardarlos en las properties de la estructura y no del metodo
        
        self.rows = rows //el rows de matrix toma el valor del rows del constructor
        self.columns = columns //mismo caso
        grid = Array(repeating: 0.0, count: rows * columns) //este grid crea la matriz, pero como un solo array, falta distribuir
    }
    
    //usamos un subindice, para redistribuir el array en filas y columnas
    
    //creamos una funcion auxilar, para comprobar si el subindice de la columna o de la fila, esta en un rango valido
    
    func indexIsValid(row: Int, column: Int) -> Bool
    {
        //escribir las condiciones para que la matriz sea valida
        //que las filas y columnas sean mayor a cero, y el tamano sea menor al declarado en el constructor
        return row >= 0 && column >= 0 && row<rows && column < columns
        // row en singular es la variable del metodo, rows en plural es la property de la struc
    }
    
    subscript(row: Int, column: Int) -> Double //la entrada es doble y son los subindices, la salida es el valor del array referido en esa posicion
    {
        //usamos get para obtener el subindice de la matriz y set para configurar el subindice
        
        get
        {
            //assert es para comprobar una precondicion
            assert(indexIsValid(row: row, column: column), "datos fuera del rango")
            return grid[(row * columns) + column] //formula que convierte de 2D al 1D del array
        }
        
        set
        {
           assert(indexIsValid(row: row, column: column), "datos fuera del rango")
            grid[(row * columns) + column] = newValue
        }
        
    }
}

var mat = Matrix.init(rows: 2, columns: 3) // crear una matriz inicializada en cero

//rellenar los datos

mat[0,1] = 1.5
mat[1,0] = 2.5
mat

//hacer un for para acomodarlos

for row in 0..<mat.rows
{
    for col in 0..<mat.columns
    {
        print(mat[row, col], separator: "", terminator: " ")
    }
    print("") //salto de fila
}
