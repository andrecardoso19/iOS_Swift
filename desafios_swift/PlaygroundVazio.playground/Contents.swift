import UIKit

//tupla
var aluno: (nome: String, idade: Int) = ("josé", 22)

aluno.nome

var cliente: [(user: String, senha: String)] = [("admin", "123"), ("joao", "1234")]

print(cliente[0].user)


cliente.append((user: "teste", senha: "tste"))
print(cliente[2])


var digitado = "teste"
var contador: Int = cliente.count - 1
for i in 0...contador{
    if digitado == cliente[i].user{
        var indice = i
        print("Indice: \(indice)")
    }
}

// closure
var a = 2
var b = 3

func aplicarOperacao(_ a: Int, _ b: Int, operacao: (Int, Int) -> Int) -> Int{
    return operacao(a,b)
}

aplicarOperacao(a, b, operacao: {
    (_ a, _ b) -> Int in
    return a*b
})

//desafio
var digitadoN = "1, 3, 6, 1, 2, 4"

var split = digitadoN.components(separatedBy: ", ")

var array: [Int] = [5,1,3]

var qtd: Int = array.count - 1
var pivo: Int = 0

for i in 0...qtd{
    for j in 0...qtd{
        if array[i] < array [j]{
            pivo = array[i]
            array[i] = array[j]
            array[j] = pivo
        }
    }
}
print(array)

