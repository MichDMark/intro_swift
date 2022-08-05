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
        count += 1
    }
    else
    {
        count += 1
    }
}
primeNum
