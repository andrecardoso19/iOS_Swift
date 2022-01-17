//
//  main.swift
//  desafioSplit
//
//  Created by user211178 on 1/17/22.
//

import Foundation

print("Digite valores numéricos divididos por , ")
var digitado = readLine()

//dividir a string e contar quantidade
var split = digitado!.components(separatedBy: ", ")
var qtd = split.count - 1

// array int e armazenar
var vetNum: [Int] = []
for i in 0...qtd{
    vetNum.append(Int(split[i])!)
}

// ordenar array
var pivo = 0
for i in 0...qtd{
    for j in 0...qtd{
        if vetNum[i] < vetNum[j]{
            pivo = vetNum[i]
            vetNum[i] = vetNum[j]
            vetNum[j] = pivo
        }
    }
}

print("Maior valor \(vetNum[qtd])")
print("Maior valor \(vetNum[0])")
