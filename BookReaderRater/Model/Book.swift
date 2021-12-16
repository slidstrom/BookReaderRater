//
//  Book.swift
//  BookReaderRater
//
//  Created by DSIAdmin on 12/15/21.
//

import Foundation

class Book: Identifiable, Decodable {
    
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:Int
    var content:[String]
    
}
