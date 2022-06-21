//
//  DataService.swift
//  Recipe-List-App
//
//  Created by Shamsuddin Refaei on 21/06/2022.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        //parse local json file
        
        //get url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if pathString is not nil, otherwise...
        guard pathString != nil else {
            
            return [Recipe]()
        }
        
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            //create data object
            let data = try Data(contentsOf: url)
            
            //decode data with json decoder
            let decoder = JSONDecoder()
            
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add unique IDs
                for r in recipeData {
                    
                    r.id = UUID()
                }
                
                //return recipes
                return recipeData
            }
            catch {
                
                //error with parsing json
            }
        }
        catch {
            
            //error with getting data
            print(error)
        }
        
        return [Recipe]()
    }
}
