//
//  DataService.swift
//  BookReaderRater
//
//  Created by DSIAdmin on 12/15/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Book] {
        // parse local json file
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        // get a url path to the json file
        if let path = pathString {
            
            // create url object
            let url = URL(fileURLWithPath: path)
            
            //error handling
            do {
                // create data object
                let data = try Data(contentsOf: url)
                
                // decode the data with a json decoder
                let decoder = JSONDecoder()
                
                do {
                    let bookData = try decoder.decode([Book].self, from: data)
                    
                    
                    return bookData
                    
                }
                catch {
                    print(error)
                    
                }
                
            }
            catch{
                print(error)
            }
            
        }
        return [Book]()
        
    }
}
