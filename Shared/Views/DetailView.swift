//
//  DetailView.swift
//  Recipe-List-App
//
//  Created by Shamsuddin Refaei on 22/06/2022.
//

import SwiftUI

struct DetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            // MARK: recipe image
            Image(recipe.image)
                .resizable()
                .scaledToFill()
            
            // MARK: ingredients
            VStack(alignment: .leading) {
                
                Text("Ingredients")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                ForEach (recipe.ingredients, id:\.self) { item in
                    
                    Text("• " + item)
                }
            }
            
            // MARK: directions
            VStack(alignment: .leading) {
                
                Text("Directions")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                ForEach (recipe.directions, id:\.self) { item in
                    
                    Text(item)
                }
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
