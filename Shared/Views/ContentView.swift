//
//  ContentView.swift
//  Shared
//
//  Created by Shamsuddin Refaei on 21/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    //reference view model
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                
                ScrollView {
                    
                    LazyVStack (alignment: .leading) {
                        
                        ForEach (model.recipes) { r in
                            
                            NavigationLink(destination: {
                                
                                DetailView(recipe: r)
                            }, label: {
                                
                                HStack(spacing: 20.0) {
                                    
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    VStack (alignment: .leading) {
                                        
                                        Text(r.name)
                                            .font(.title3)
                                        .foregroundColor(.black)
                                        .bold()
                                        
                                        RecipeHighlights(highlights: r.highlights)
                                            .foregroundColor(.black)
                                    }
                                }
                            })
                        }
                    }
                }
                .navigationBarHidden(true)
            }
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeModel())
    }
}
