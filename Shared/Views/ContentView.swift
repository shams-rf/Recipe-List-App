//
//  ContentView.swift
//  Shared
//
//  Created by Shamsuddin Refaei on 21/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    //reference view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        List(model.recipes) { r in
            
            HStack(spacing: 20.0) {
                
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(5)
                
                Text(r.name)
                    .font(.title3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
