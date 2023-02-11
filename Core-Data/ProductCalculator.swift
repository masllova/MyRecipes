//
//  Calculator.swift
//  Core-Data
//
//  Created by Александра Маслова on 10.02.2023.
//

import SwiftUI

import SwiftUI

struct ProductCalculator: View {
    
    var MyColorB = #colorLiteral(red: 0.6325441599, green: 0.5007883906, blue: 0.4157394767, alpha: 1)
    var MyColorB75 = #colorLiteral(red: 0.6325441599, green: 0.5007883906, blue: 0.4157394767, alpha: 0.75)
    var MyColorB45 = #colorLiteral(red: 0.6325441599, green: 0.5007883906, blue: 0.4157394767, alpha: 0.45)
    var MyColorW = #colorLiteral(red: 0.8342989087, green: 0.7947213054, blue: 0.7478423119, alpha: 1)
    var MyColorG = #colorLiteral(red: 0.2527066469, green: 0.2428008616, blue: 0.2472865283, alpha: 1)
    
    let myColor = #colorLiteral(red: 0.9707730412, green: 0.9807204604, blue: 0.9762383103, alpha: 1)
    
    @State var product = ""
    let products = ["None", "Milk", "Flour", "Sugar", "Icing sugar", "Oatmeal", "Buckwheat", "Rice", "Soy sauce", "Honey",  "Cocoa", "Butter", "Oil"]
    
    var body: some View {
        VStack {
               
            HStack {
                Text (
"""
Count the quantity
of the product
"""
                )
                .font(.largeTitle)
                .bold()
                .padding(.top)
                .padding(.bottom, 15)
                .foregroundColor(.white)
                Spacer()
            }.padding(.horizontal)
                .background(Color(MyColorB75))
        
            
            Rectangle()
               // .foregroundColor(Color(myColor))
                .frame(width: .infinity, height: 35)
                .foregroundColor(Color(MyColorB45))
            
            HStack {
                Text("Select product")
                Spacer()
                Picker ("", selection: $product) {
                    ForEach (self.products, id: \.self)
                    {Text($0)}
                }.pickerStyle(.automatic)
                    .accentColor(Color(MyColorB))
                    
                    
                  //  .frame(width: 100, height: 90)
            }.padding(.horizontal)
            
            
            ZStack {
                Color(myColor).ignoresSafeArea()
                VStack {
                    
                    HStack {
                        Image("cup")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Spacer()
                        Text(cupAmount()).padding(.horizontal)
                    }
                    
                    HStack{
                        Image("glass")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Spacer()
                        Text(glassAmount()).padding(.horizontal)
                    }
                    
                    HStack {
                        Image("spoon")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Spacer()
                        Text(spoonAmount()).padding(.horizontal)
                    }
                    
                    HStack {
                        Image("teaspoon")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Spacer()
                        Text(teaspoonAmount()).padding(.horizontal)
                    }
                   
                    Spacer()
                    
                }.padding(.top, 65)
                    .padding(.horizontal, 90)
            }
            
        }
    }
    
    func cupAmount () -> String {
        if product == "Milk" {return "250 ml"}
        if product == "Flour" {return "160 gr"}
        if product == "Sugar" {return "200 gr"}
        if product == "Icing sugar" {return "180 gr"}
        if product == "Oatmeal" {return "100 gr"}
        if product == "Buckwheat" {return "210 gr"}
        if product == "Rice" {return "230 gr"}
        if product == "Soy sauce" {return "250 ml"}
        if product == "Honey" {return "325 gr"}
        if product == "Cocoa" {return "160 gr"}
        if product == "Butter" {return "230 gr"}
        if product == "Oil" {return "230 gr"}
        else {return "amount"}
    }
    func glassAmount () -> String {
        if product == "Milk" {return "200 ml"}
        if product == "Flour" {return "130 gr"}
        if product == "Sugar" {return "160 gr"}
        if product == "Icing sugar" {return "140 gr"}
        if product == "Oatmeal" {return "80 gr"}
        if product == "Buckwheat" {return "165 gr"}
        if product == "Rice" {return "185 gr"}
        if product == "Soy sauce" {return "200 ml"}
        if product == "Honey" {return "265 gr"}
        if product == "Cocoa" {return "130 gr"}
        if product == "Butter" {return "180 gr"}
        if product == "Oil" {return "190 gr"}
        else {return "amount"}
    }
    func spoonAmount () -> String {
        if product == "Milk" {return "15 ml"}
        if product == "Flour" {return "25 gr"}
        if product == "Sugar" {return "25 gr"}
        if product == "Icing sugar" {return "20 gr"}
        if product == "Oatmeal" {return "16 gr"}
        if product == "Buckwheat" {return "25 gr"}
        if product == "Rice" {return "25 gr"}
        if product == "Soy sauce" {return "15 ml"}
        if product == "Honey" {return "35 gr"}
        if product == "Cocoa" {return "25 gr"}
        if product == "Butter" {return "25 gr"}
        if product == "Oil" {return "15 gr"}
        else {return "amount"}
    }
    func teaspoonAmount () -> String {
        if product == "Milk" {return "5 ml"}
        if product == "Flour" {return "10 gr"}
        if product == "Sugar" {return "10 gr"}
        if product == "Icing sugar" {return "7 gr"}
        if product == "Oatmeal" {return "5 gr"}
        if product == "Buckwheat" {return "8 gr"}
        if product == "Rice" {return "8 gr"}
        if product == "Soy sauce" {return "5 ml"}
        if product == "Honey" {return "12 gr"}
        if product == "Cocoa" {return "10 gr"}
        if product == "Butter" {return "10 gr"}
        if product == "Oil" {return "8 gr"}
        else {return "amount"}
    }
}



struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        ProductCalculator()
            .preferredColorScheme(ColorScheme.light)
    }
}

