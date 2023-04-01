//
//  Model.swift
//  Core-Data
//
//  Created by Александра Маслова on 10.02.2023.
//

import SwiftUI
import CoreData

struct InCard: View {
    
    var MyColorB = #colorLiteral(red: 0.6325441599, green: 0.5007883906, blue: 0.4157394767, alpha: 1)
    var MyColorW = #colorLiteral(red: 0.8342989087, green: 0.7947213054, blue: 0.7478423119, alpha: 1)
    var MyColorG = #colorLiteral(red: 0.2527066469, green: 0.2428008616, blue: 0.2472865283, alpha: 1)
    var MyColorGD = #colorLiteral(red: 0.2374858856, green: 0.228531599, blue: 0.2330639958, alpha: 1)
   
    @State private var image: Data = .init(count: 0)
    
    var inf: Saving
    
    var body: some View {
        ZStack {
            Color(MyColorW).ignoresSafeArea()
        VStack {
            VStack {
                Image(uiImage: (UIImage(data: inf.imageID ?? self.image) ?? UIImage(named: "nil"))!)
                    .resizable()
                    .aspectRatio(6/4, contentMode: .fit)
                    .border(Color(MyColorGD), width: 3)
                
                HStack(alignment: .top) {
                    Text(inf.name ?? "")
                        .foregroundColor(Color(MyColorG))
                        .monospacedDigit()
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal, 3)
                    Spacer()
                    VStack {
                        Image(systemName: "clock")
                            .foregroundColor(Color(MyColorG))
                        Image(systemName: "line.3.horizontal").padding(.top, 1)
                            .foregroundColor(Color(MyColorG))
                    }.font(.headline)
                    
                    VStack(alignment: .trailing){
                        Text ("\(inf.timer ?? "") min")
                            .foregroundColor(Color(MyColorG))
                        Text (inf.category ?? "")
                            .foregroundColor(Color(MyColorG))
                    }
                    .lineLimit(1)
                    .font(.headline)
                    .monospacedDigit()
                }.padding(.horizontal, 3)
                    .padding(.top, 20)
            }.ignoresSafeArea()
                .padding(.bottom, -30)
                .background(Color(MyColorW))
            
            
            ScrollView{
                Divider()
                Text("Ingredients").font(.headline)
                    .foregroundColor(Color(MyColorGD))
                    .opacity(0.4)
                Divider()
                
                VStack (alignment: .leading) {
                    HStack {
                        Spacer()
                        Text(inf.ingridients ?? "")
                            .foregroundColor(Color(MyColorG))
                        Spacer()
                        Text(inf.amount ?? "")
                            .foregroundColor(Color(MyColorG))
                        Spacer()
                    }
                }.padding(.horizontal)
                
                Divider()
                Text("Steps").font(.headline).opacity(0.4)
                    .foregroundColor(Color(MyColorGD))
                Divider()
                
                VStack(alignment: .leading) {
                    Text(inf.steps ?? "")
                        .foregroundColor(Color(MyColorG))
                }.padding(.horizontal)
                
                
            }
        }
    }
    }
}



