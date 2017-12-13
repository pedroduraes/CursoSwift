//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var inteiro = 10
let `let` = 5
inteiro = 2; print(inteiro)

let nome:String
nome="Pedro"
nome + " Henrique"

let sobrenome:String? = "Martins"
sobrenome!.description + "Duraes"

let numero: Int? = 1
let numero2: Int = numero!

let str2 = """
pedro
henrique
martins
duraes
"""

let soma = "2+2=\(str2)"

let array:[Float] = [1.1,2.5,9]
let array2 = [Int]()
let array3 = [1,2,3]
array3[0]
array3[1]
array3[2]

let idade: Int = Int.max

let array4 = [4,5,6]
array3 + array4

var myTuple = (0, var1: 0, "2")
let (a, d, _) = myTuple
a == myTuple.0
d == myTuple.var1

//var nameofEmail = [String:String]() //exemplo de dicionario
var nameofEmail :[String:String] = [:]
nameofEmail ["Pedro H."] = "phmd@hotmail.com"
nameofEmail ["Pedro H."]

let emailofName = [
    "Pedro H." : "phmd@hotmail.com"
]
emailofName ["Pedro H."]

let m1, m2, m3 : Int //cria varias variaveis
let i🤙Swift = true //variavel com emoji

/**
 comentario
 /*
    outro comentario
 */
 */

typealias int = Int //define um alias para um tipo
let teste = 1.25e-2

let tenmillion = 10_000_000_000_000
1000
0o0017

var myoptionalValue : Any? //para suportar nil colocar a ?
myoptionalValue = nil

if myoptionalValue != nil {
    print("variavel nao eh nil")
}else{
    print("variavel eh nil")
}

if let unwaraped = myoptionalValue {
    print("variavel nao eh nil: \(unwaraped)")
}

let qualquerCoisa = String(2)
let qualquerCoisa2 = Int("a")
let qualquerCoisa3 = Int("99")

if let firstnumber = Int("4") , let secondnumber = Int("42"),
    firstnumber < secondnumber && secondnumber < 100 {
    "\(firstnumber) < \(secondnumber) < 100"
}

//cast
//(myoptionalValue as? Int)! + 1 //da erro
var myoptionalValuex : Any? //para suportar nil colocar a ?
myoptionalValuex = 4
(myoptionalValuex as? Int ?? 2) + 1












