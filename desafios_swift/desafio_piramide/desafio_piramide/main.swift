//
//  main.swift
//  desafio_piramide
//
//  Created by user211178 on 1/13/22.
//

import Foundation

print("Insira o valor da altura")
var input = readLine()

//desembrulhar
if let alturaTexto = input{
    if let altura: Int = Int(alturaTexto){
        var espacoCentral : Int = 1
        
        //execução
        //criação da linha
        for linha in 1...altura{
            var result : String = ""
            
            //espaço do tamanho de altura-linha, ex: linha 1 = altura(5) - linha(1) = espaço(4)
            for _ in 0...(altura - linha){
                result += " "
            }
            //result(4espaços) + linha(1)
            result += String(linha)
            
            //espaço central, 1 nao tem espaço central
            if linha != 1{
                
                //for para inserir o espaço central iniciando em 1, aumentando de 2 em 2
                //o count para retirar o erro de mais de uma casa decimal, ex: 10 e 100
                for _ in 1...(espacoCentral - (String(linha).count - 1)){
                    result += " "
                }
                espacoCentral += 2
                //coloca o espaço + o número da linha
                result += String(linha)
            }
            
            print(result)
        }
        //fim da execução
        
    }
}
