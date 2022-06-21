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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
