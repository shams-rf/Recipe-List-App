//
//  RecipeHighlights.swift
//  Recipe-List-App
//
//  Created by Shamsuddin Refaei on 21/07/2022.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        
        //loop through highlights & build string
        for index in 0..<highlights.count {
            
            //if last item, don't add comma
            if index == highlights.count - 1 {
                
                allHighlights += highlights[index]
            }
            else {
                
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2", "test3", "test4"])
    }
}
