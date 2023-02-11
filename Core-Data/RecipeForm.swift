//
//  RecipeForm.swift
//  Core-Data
//
//  Created by Александра Маслова on 10.02.2023.
//

import SwiftUI
import CoreData

struct NewRecipeForm: View {
    var MyColorB = #colorLiteral(red: 0.6325441599, green: 0.5007883906, blue: 0.4157394767, alpha: 1)
    var MyColorW = #colorLiteral(red: 0.8342989087, green: 0.7947213054, blue: 0.7478423119, alpha: 1)
    var MyColorG = #colorLiteral(red: 0.2527066469, green: 0.2428008616, blue: 0.2472865283, alpha: 1)
    
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
   
    
    @State private var show: Bool = false
    
    @State private var name: String = ""
    @State private var image: Data = .init(count: 0)
    @State private var timer: String = ""
    @State private var category = "None"
    @State private var ingredients = ""
    @State private var amount = ""
    @State private var steps = ""
    
    let categories = ["None", "Breakfast", "Soup", "Main", "Dessert", "Drink", "Salad", "Snack"]
    
    var body: some View {
        VStack {
        NavigationView{
            
            Form {
                Section {
                    if self.image.count != 0 {
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(uiImage: UIImage(data: self.image)!)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 300, height: 150)
                                .cornerRadius(20)
                                .shadow(radius: 8)
                            
                        }
                    } else {
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 300, height: 150)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                        }
                    }
                }.listRowBackground(Color(MyColorW))
                Section {
                    TextField("Name", text: self.$name)
                        .submitLabel(.done)
                    Picker("Select category", selection: $category)
                    {ForEach (self.categories, id: \.self){Text($0)}
                    }
                    .pickerStyle(.menu)
                    TextField ("How many minutes will it take?", text: $timer)
                        .keyboardType(.decimalPad)
                }header: {Text("Title")}.foregroundColor(Color(MyColorB))
                
                Section {
                    HStack {
                        TextEditor(text: $ingredients)
                        
                        Divider()
                        
                        TextEditor(text: $amount)
                            .frame(maxWidth: 80)
                    }.foregroundColor(Color(MyColorB))
                } header: {
                    HStack {
                        Text("ingredients").foregroundColor(Color(MyColorB))
                        Spacer()
                        Text("amount").padding(.horizontal).foregroundColor(Color(MyColorB))
                    }
                }
                
                Section {
                    TextEditor(text: $steps)
                }header: {Text ("Steps")}.foregroundColor(Color(MyColorB))
                Section {
                    Rectangle()
                        .frame(width: 5, height: 500)
                        .foregroundColor(.clear)
                }.listRowBackground(Color(MyColorW))
            }
            .background{ Color(MyColorW)}.scrollContentBackground(.hidden).ignoresSafeArea()
            .navigationBarItems(trailing:
                                    Button(action: {
                let save = Saving(context: self.moc)
                save.imageID = self.image
                save.name = self.name
                save.category = self.category
                save.timer = self.timer
                save.ingridients = self.ingredients
                save.amount = self.amount
                save.steps = self.steps
                
                try! self.moc.save()
                self.name = ""
                self.category = ""
                self.timer = ""
                self.ingredients = ""
                self.amount = ""
                self.steps = ""
                dismiss()
            }) {
                Text("Save")
                    .font(.title3)
            }
            )
            
            
        }.sheet(isPresented: self.$show) {ImagePicker(images: self.$image, show: self.$show)}
            .accentColor(Color(MyColorG))
            
    }
    }
}



struct NewRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeForm()
            .preferredColorScheme(ColorScheme.light)
    }
}
