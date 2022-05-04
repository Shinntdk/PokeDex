//
//  APIEntity.swift
//  PokeDex
//
//  Created by Natthida Kritveeranant on 3/5/2565 BE.
//

import Foundation


struct APIPokemon: Decodable{
    let next: String
    let results: [APIResult]
}

struct APIResult: Decodable{
    let name: String
    let url: String
}

struct APIDetail: Decodable{
    let name: String
}
