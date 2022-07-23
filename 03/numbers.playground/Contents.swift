import UIKit


// cual es el numero minimo y maximo de 8 bits
// UInt8 es unsigned integer 8
// enteros sin signo de 8 bits
let minValue = UInt8.min
let maxValue = UInt8.max

let maxValue32 = UInt32.max

//si no especificas el tipo de entero crea uno de 64 bits
let value = 29

//declaramos que tipo de entero necesitamos
//para no desperdiciar memoria
let age : UInt8 = 31

//declarar decimales y doubles

//el float solo tiene 6 cifras decimales
let f1: Float = 3.14159265

//float 32 bits, double 64 bits
let d1: Double = 3.14159265

// no es necesario especificar el tipo de datos

let meaningOfLife = 42 //int64 por defecto
let pi = 3.14159 //double por defecto
let anotherPi = 3 + 0.14159

//enteros literales

// numero expresado en base 10
let decimalInteger = 17 // 1*10 + 7

//numero base 2
let binaryInteger = 0b10001 //1*2^4+0*2^3+0*2^2+0*2^1+1*2^0

//numero base 8
let octalInteger = 0o21 //2*8^1+1*8^0

//base hexadecimal
let hexadecimalInteger = 0x11

//decimal y su notacion exponencial y hexadecimal
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

//podemos colocar ceros para tener las cadenas del mismo tamano
let paddedDouble = 000123.456
let someNumber =   000007.540

//puedes colocar separadados de guion bajo para colocar numeros grandes
let oneMillon = 1_000_000
let justMoreThanAMillon = 1_000_000.000_000_1
