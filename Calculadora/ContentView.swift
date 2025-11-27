//
//  ContentView.swift
//  Calculadora
//
//  Created by Alexandre Dimas on 25/11/25.
//

import SwiftUI

// Extensão feita com pesquisa na internet para limitar valores
extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

struct ContentView: View {
    
    
    @StateObject var logic = CalcLogical()

    
    
    // Ajuste da fonte para ficar dinâmica
    var dynamicFontSize: CGFloat {
        let count = max(1, logic.display.count)
        let size = CGFloat(80 - (count - 1) * 6)
        return size.clamped(to: 30...80)
    }
    
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            
            Text("\(logic.display.count)")
                .foregroundColor(.red)
            
            Spacer()
            
            // Configuração do Display
            HStack {
                Text(logic.display)
                    .padding()
                    .lineLimit(1)
                    .font(.system(size: dynamicFontSize))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
            }
            
            HStack {
                Button("AC") {
                    logic.clear()
                }.padding() .frame(maxWidth: .infinity)
                
                Button("<-") {
                    logic.deleteLastDigit()
                }.padding() .frame(maxWidth: .infinity)
                    
                Button("%") {
                    logic.percent( )
                }.padding() .frame(maxWidth: .infinity)
                
                CalcButton(label: "/", bgColor: .orange){
                    logic.setOperator("/")
                }
                    
            }.foregroundColor(.white)
            
            HStack {
                CalcButton(label: "7") {
                    logic.inputNumber("7")
                }
                
                CalcButton(label: "8") {
                    logic.inputNumber( "8")
                }
                    
                CalcButton(label: "9") {
                    logic.inputNumber("9")
                }
                
                CalcButton(label: "x", bgColor: .orange) {
                    logic.setOperator("*")
                }
                    
            }.foregroundColor(.white)
            
            HStack {
                CalcButton(label: "4") {
                    logic.inputNumber( "4")
                }
                
                CalcButton(label: "5") {
                    logic.inputNumber("5")
                }
                    
                CalcButton(label: "6") {
                    logic.inputNumber( "6")
                }
                
                CalcButton(label: "-", bgColor: .orange) {
                    logic.setOperator( "-")
                }
                    
            }.foregroundColor(.white)
            
            HStack {
                CalcButton(label: "1") {
                    logic.inputNumber( "1")
                }
                
                CalcButton(label: "2") {
                    logic.inputNumber( "2")
                }
                
                CalcButton(label: "3") {
                    logic.inputNumber("3")
                }
                
                CalcButton(label: "+", bgColor: .orange) {
                    logic.setOperator( "+")
                }
                
            }.foregroundColor(.white)
            
                HStack {
                    CalcButton(label: "+/-") {
                        logic.toggleSign()
                    }
                    
                    CalcButton(label: "0") {
                        logic.inputNumber("0")
                    }
                    
                    CalcButton(label: ",") {
                        logic.addDecimalPoint( )
                    }
                    
                    CalcButton(label: "=", bgColor: .orange) {
                        logic.calculate()
                    }
                }
        
            
            
        } .frame(maxWidth: .infinity) .background(.black) .padding()
        
    }
}

#Preview {
    ContentView()
}

