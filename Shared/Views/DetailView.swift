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
            
            VStack(alignment: .leading) {
                
                // MARK: recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: ingredients
                VStack(alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    ForEach (recipe.ingredients, id:\.self) { item in
                        
                        Text("• " + item)
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
        }.navigationBarTitle(recipe.name)
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
