//: Playground - noun: a place where people can play

import UIKit

var str = "Pedro Henrique,Martins Duraes"
str[str.startIndex..<str.endIndex] //INDICE INICIAL E FINAL DE UMA STRING
str[str.startIndex..<str.index(str.startIndex, offsetBy: str.count / 2)] //metada da string

let range1 = 1...5
let range2 = 1..<5

var array1 = [1,2,3,4,5]
array1[0..<1] = [0, 1]
array1

let buscar : Character = "," //identificou o indice de um caracter
let indiceDaVirgular = str.index(of: buscar) ?? str.startIndex
str[indiceDaVirgular..<str.endIndex]

let encontrados = str.characters.filter { $0=="e" }
//print(encontrados.count)
//print(encontrados)
for x in str.characters.enumerated(){
    //print(x)
}

switch "v5" {
case "v1" , "v2":
    print("v1 ou v2")
    break
case let x where x.hasSuffix("5"):
    print("termina com 5")
    break
default:
    print("default")
}

switch ("curto" , "a") {
case let(v1 , v2) where v1 == v2:
    print("sao iguais")
    break
case ("curto", _):
    print("encontrei o curto")
    break
default:
    break
}


//let switchint: UInt64 = UInt64(UInt32.min)
let switchint: UInt64 = UInt64(2 << 8)
switch switchint {
case 0...UInt64(UInt8.max):
    print("UInt8 interval")
    break
case 0...UInt64(UInt16.max):
    print("UInt16 interval")
    break
case 0...UInt64(UInt32.max):
    print("UInt32 interval")
    break
default:
    print("outra coisa")
    break
}

let switchtuple = (100,"eroooooooouu")
switch switchtuple {
case (200, "OK"):
    print("navegacao ok")
case (200, let message):
    print("mensagem do let \(message)")
case(100...600, let message):
    print("status http   \(message)")
    fallthrough
case(500...600, _):
    print("Ocorreu um erro desconhecido")
default:
    print("erro desconhecido")
}

var total = 0
for i in 0...10{
    total += i
}
total

for s in "pedro" {
    //print(s)
}

let nomes = ["pedro","maria"]
for nome in nomes{
    //print(nome)
}
for (i,c) in nomes.enumerated() {
    //print("indice = \(i) - nome = \(c)")
}
for (i,c) in nomes.enumerated().reversed(){
    //print("indice = \(i) - nome = \(c)")
}


let dicionario = [200:"ok", 403:"desconhecido", 500:"erro do servidor"]
//for d in dicionario{
for (key,value) in dicionario {
    //print("key = \(key) - value = \(value)")
}
var tempo = 0
//print("loop")
repeat {
    //print(tempo)
    tempo += 1
    
} while tempo < 10

func soma(com a:Int,e b: Int)-> Int{
    return a+b
}
soma(com: 1, e: 2)

func somasubrai(_ a:Int, _ b:Int) -> (Int, Int) {
    return(a+b, a-b)
}
somasubrai(4, 1)

func soma(default:Int, valores: Int...) -> Int {
    var result:Int = `default`
    for i in valores{
        result += i
    }
    return result
}
soma(default:0, valores: 1,2,3,4)


var resultadoSoma: Int = 0
func soma(referencia:inout Int, valores: Int...) {
    
    for i in valores{
        referencia += i
    }
}
//variavel por referencia
soma(referencia:&resultadoSoma, valores:4,5,6)
resultadoSoma


func find(inArray values: [Any], withPredicate predicate: (Any) -> Bool) -> Int? {
    for (i,v) in values.enumerated(){
        if predicate(v) { return i }
    }
    
    return nil
}
func predicado(valor:Any) -> Bool {
    return valor as! String == "2"
}

var index = find(inArray: ["0","1","2","3","4","5"], withPredicate: predicado)
var index2 = find(inArray: ["0","1","2","3","4","5"], withPredicate: {(valor ) in
    valor as! String == "4" //uma so linha nao precisa de return
} )
var index3 = find(inArray: ["0","1","2","3","4","5"]) {
    $0 as! String == "3"
}





func binaryOperation(_ op: String) -> ((Double, Double) -> Double)?{
    func sum(_ a: Double, _ b: Double) -> Double {
        return a+b
    }
    func subtract(_ a: Double, _ b: Double) -> Double {
        return a-b
    }
    var dict:[String: (Double, Double) -> Double] = [:]
    dict["+"] = sum
    dict["-"] = subtract
    return dict[op]
}
binaryOperation("+")?(1,1)
binaryOperation("-")?(2,1)

//esta funcao retorna uma expressao lambda
func iterator(_ array: [Int]) -> () -> Int?{
    var i = 0
    return {
        i+=1
        return i <= array.count ? array[i-1] : nil
    }
}

let array = [1,2,3]
let chamaIterator = iterator(array)
chamaIterator()
chamaIterator()
chamaIterator()
chamaIterator()


//guardnet
func processUser(_ name: String) -> (Float, String)? {
    let dict1 = ["pedro":1500, "carlos":1000]
    let dict2 = ["pedro":"duraes","carlos":"beleli"]
    
    guard let money = dict1[name] else { return nil }
    guard let sobrenome = dict2[name] else { return nil }
    
    let fullName = "\(name)  \(sobrenome)"
    return (Float(money),fullName)
}
processUser("abc")
processUser("pedro")


var overFlow : Int = Int.max
overFlow = overFlow &+ 1

var idade = 33
assert(idade >= 0, "idade nao pode ser negativo")

//classes
class Movie {
    static var defaultMovieTitle = "Filme Desconhecido"
    static var defaultMovieDirector = "Diretor Desconhecido"
    var titulo : String
    let diretor : String
    var duracao : Double
    
    static func printDefaultMovieTitle(){
        print(Movie.defaultMovieTitle)
    }
    var descricao: String {
        return "\(self.titulo) - \(self.diretor)"
    }
    
    var duracaoEmHoras : Double {
        get {
            return Double(self.duracao / 60)
        }
        set(novoValor){
            self.duracao = novoValor * 60
        }
    }
    
    convenience init (){
        self.init(titulo: Movie.defaultMovieTitle )
    }
    convenience init (titulo : String){//init = construtor da classe ou designated initializer
        self.init(titulo: titulo, diretor: "", duracao : 0)
    }
    init(titulo : String, diretor : String, duracao : Double) { //init = construtor da classe ou designated initializer
        self.titulo = titulo
        self.diretor = diretor
        self.duracao = duracao
    }
    deinit { //finaliza a classe
        print("estou sendo destruido...Filme \(self.titulo)")
    }
}
var starWars : Movie = Movie(titulo: "star wars", diretor: "jorge lucas",duracao : 0)
starWars.duracaoEmHoras = 2

var demolidor : Movie? = Movie(titulo: "demolidor", diretor: "joao das neves",duracao : 0) //declara classe com nullable
demolidor?.duracaoEmHoras = 1
//demolidor = nil
//starWars == demolidor //== tem que implementar
starWars === demolidor

class FilmeTerror : Movie {
    var bloodLevel : Int
    
    init(titulo : String, diretor : String, duracao : Double, bloodLevel : Int){
        self.bloodLevel = bloodLevel
        super.init(titulo: titulo, diretor: diretor, duracao: duracao)
    }
    init(bloodLevel : Int){
        self.bloodLevel = bloodLevel
    }
    
    override var descricao: String {
        return "\(self.titulo) - \(self.diretor) --> \(self.bloodLevel)"
    }
    
}





















