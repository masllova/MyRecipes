//
//  ContentView.swift
//  Core-Data
//
//  Created by Александра Маслова on 10.02.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var MyColorB = #colorLiteral(red: 0.6325441599, green: 0.5007883906, blue: 0.4157394767, alpha: 1)
    var MyColorB75 = #colorLiteral(red: 0.6325441599, green: 0.5007883906, blue: 0.4157394767, alpha: 0.7498402649)
    var MyColorB50 = #colorLiteral(red: 0.6325441599, green: 0.5007883906, blue: 0.4157394767, alpha: 0.5)
    
    var MyColorW = #colorLiteral(red: 0.8342989087, green: 0.7947213054, blue: 0.7478423119, alpha: 1)
    var MyColorG = #colorLiteral(red: 0.2527066469, green: 0.2428008616, blue: 0.2472865283, alpha: 1)
    var MyColorGD = #colorLiteral(red: 0.2374858856, green: 0.228531599, blue: 0.2330639958, alpha: 1)
    
    @State private var calculatorView = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Saving.name, ascending: true),
            NSSortDescriptor(keyPath: \Saving.timer, ascending: true),
            NSSortDescriptor(keyPath: \Saving.category, ascending: true),
            NSSortDescriptor(keyPath: \Saving.imageID, ascending: true),
            NSSortDescriptor(keyPath: \Saving.ingridients, ascending: true),
            NSSortDescriptor(keyPath: \Saving.amount, ascending: true),
            NSSortDescriptor(keyPath: \Saving.steps, ascending: true),
        ])
    private var saving: FetchedResults<Saving>
    
    @State private var image: Data = .init(count: 0)
    @State private var show: Bool = false
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                VStack {
                    HStack {
                        Text ("My Recipes")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom)
                            .foregroundColor(Color(MyColorW))
                        Spacer ()
                    } .padding(.horizontal)
                    
                    
                    HStack {
                        if saving.count > 0 {
                            Text("There \(isOrAre()) \(saving.count) rerecipe\(suffix()) in library")
                                
                                .foregroundColor(Color(MyColorW))
                            Spacer()
                        }
                    }.padding(.horizontal)
                        .padding(.top, -20)
                        .padding(.bottom)
                        
                } .background(Color(MyColorG))
                   
                
                List {
                    ForEach(saving, id: \.name) {save in
                        NavigationLink {
                            InCard(inf: save)
                        } label: {
                                VStack {
                                    Image(uiImage: UIImage(data: save.imageID ?? self.image)!)
                                        .resizable()
                                        .frame(width: .infinity, height: 150)
                                        .cornerRadius(10)
                                        .padding(.top, 10)
                                        
                                        
                                    
                                    HStack {
                                        Text(save.name ?? "")
                                            .lineLimit(1)
                                            .monospacedDigit()
                                            .bold()
                                            .foregroundColor(Color(MyColorGD))
                                        Spacer()
                                        Divider()
                                        VStack (alignment: .trailing){
                                            Text(save.timer ?? "")
                                                .foregroundColor(Color(MyColorGD))
                                            Text(save.category ?? "")
                                                .foregroundColor(Color(MyColorGD))
                                        }.font(.caption2)
                                        
                                        VStack {
                                            Image(systemName: "clock").padding(.top, -3)
                                                .foregroundColor(Color(MyColorGD))
                                            Image(systemName: "line.3.horizontal").padding(.top, 1)
                                                .foregroundColor(Color(MyColorGD))
                                        }.font(.caption2)
                                    }.padding(.horizontal, 3)
                                }
                            
                        }
                    }.onDelete(perform: deleteRecipe(at:))
                    
                }.background{ Color(MyColorB50)}.scrollContentBackground(.hidden).ignoresSafeArea()
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {self.show.toggle()}) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                    }
                }.navigationBarItems(leading: Button(action: {
                    self.calculatorView.toggle()
                }, label: {Image(systemName: "plus.forwardslash.minus").foregroundColor(.white)})
                    .sheet(isPresented: $calculatorView){ProductCalculator()},
                                     trailing: EditButton().foregroundColor(.white))
               
            
            }
            
        }.sheet(isPresented: self.$show) {NewRecipeForm().environment(\.managedObjectContext, self.viewContext)}
            .accentColor(Color(MyColorG))
    }
    func deleteRecipe(at offsets: IndexSet) {
        for i in offsets {
            let recipe = saving[i]
            viewContext.delete(recipe)
        }
        try? viewContext.save()
    }
    
    
    func isOrAre() -> String {
        if saving.count > 1 {return "are"}
        else {return "is"}
    }
    
    func suffix() -> String {
        if saving.count > 1 {return "s"}
        else {return ""}
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .preferredColorScheme(ColorScheme.light)
    }
}

