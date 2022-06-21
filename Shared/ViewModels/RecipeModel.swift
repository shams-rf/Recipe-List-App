//
//  RecipeModel.swift
//  Recipe-List-App
//
//  Created by Shamsuddin Refaei on 21/06/2022.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        //create instance of DataService and get the data
        self.recipes = DataService.getLocalData()
    }
}
