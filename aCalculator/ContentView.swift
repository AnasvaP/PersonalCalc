//
//  ContentView.swift
//  aCalculator
//
//  Created by Anastasiia Poliukovych on 21.11.2020.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var acVM = ACalcViewModel()

    fileprivate func createNumerics(num :Int) -> some View {
        return Button(String(num), action: {
            self.acVM.actionNumericsBtn(numeric: num)
        }
        ).frame(width: 60, height: 70, alignment: .center).font(.largeTitle).border(Color.black, width: 1).accentColor(.black)
    }
    
    fileprivate func createMathSigns(sign: String) -> some View {
        return Button(sign, action: {
            self.acVM.actionMathSign(sign: sign)
            }
        ).frame(width: 90, height: 70, alignment: .center).font(.largeTitle).border(Color.black, width: 1).accentColor(.black).background(Color.purple.opacity(0.4))
        
    }
    
    var body: some View {
        VStack{
            Divider()
            Text(self.acVM.fullSampleForText).frame(width: 360, height: 50, alignment: .center).background(Color.white).border(Color.purple, width: 0.5).font(.title3).lineLimit(3).padding()
            HStack{
                
                Text(self.acVM.enteredValue).frame(width: 250, height: 40, alignment: .center).background(Color.purple.opacity(0.2))
                
                Button("delete", action: {
                    self.acVM.actionDeleteBtn()
                }
                ).frame(width: 90, height: 40, alignment: .center).font(.title3).border(Color.purple, width: 2).accentColor(.black).background(Color.white).font(.title3).lineLimit(3)
                .onLongPressGesture {
                    self.acVM.actionLongPressDeleteBtn()
                    print("long press")
                }
                
            }.padding()
            HStack{
                createNumerics(num: 0)
                createNumerics(num: 1)
                createNumerics(num: 2)
                createNumerics(num: 3)
                createMathSigns(sign: "+")
                
            }.padding()
            HStack{
                createNumerics(num: 4)
                createNumerics(num: 5)
                createNumerics(num: 6)
                createNumerics(num: 7)
                createMathSigns(sign: "-")
            }.padding()
            HStack{
                createNumerics(num: 8)
                createNumerics(num: 9)
                Button(".", action: {
                    self.acVM.actionDotBtn()
                }).frame(width: 60, height: 70, alignment: .center).font(.largeTitle).border(Color.black, width: 1).accentColor(.black)
                Button("ok", action: {
                    self.acVM.okButtAction()
                }).frame(width: 60, height: 70, alignment: .center).font(.largeTitle).border(Color.black, width: 1).accentColor(.black).background(Color.purple).opacity(0.8)
                createMathSigns(sign: "*")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
        }
    }
}
