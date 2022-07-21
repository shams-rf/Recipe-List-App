//
//  DetailView.swift
//  Recipe-List-App
//
//  Created by Shamsuddin Refaei on 22/06/2022.
//

import SwiftUI

struct DetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: recipe title
                Text("All Recipes")
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                //MARK: serving size picker
                VStack (alignment: .leading) {
                    
                    Text("Select your serving size:")
                        .font(.headline)
                    
                    Picker("", selection: $selectedServingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                // MARK: ingredients
                VStack(alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach (recipe.ingredients) { item in
                        
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                    }
                }
                .padding(.horizontal)
                
                //divider
                Divider()
                
                // MARK: directions
                VStack(alignment: .leading) {
                    
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach (0..<recipe.directions.count, id:\.self) { index in
                        
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create dummy recipe and pass it to detail view
        //so we can see preview
        let model = RecipeModel()
        
        DetailView(recipe: model.recipes[0])
    }
}
