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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //get single serving size by myltiplying denominator by recipe servings
            denominator *= recipeServings
            
            //get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            //reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //get whole portion if numerator > denominator
            if numerator >= denominator {
                
                //calculater whole portions
                wholePortions = numerator / denominator
                
                //calculate remainder
                numerator = numerator % denominator
                
                //assign to portion string
                portion += String(wholePortions)
            }
            
            //express remainder as fraction
            if numerator > 0 {
                
                //assign remainder as fraction to portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            //calculate appropriate suffix
            
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return String(targetServings)
    }
}
