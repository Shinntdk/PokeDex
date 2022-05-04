//
//  PokeAPI.swift
//  PokeDex
//
//  Created by Natthida Kritveeranant on 3/5/2565 BE.
//

import UIKit

final class PokeAPI {
    static let shared = PokeAPI()
    var nextURL: String = ""
    var offset = 20

    func fetchPokemonList(onCompletion: @escaping ([APIResult]) -> ()) {
    let urlString = "https://pokeapi.co/api/v2/pokemon/?offset=\(offset)&limit=20"
        let url = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
            guard let data = data else {
                print("data was nil")
                return
            }

            guard let pokeList = try? JSONDecoder().decode(APIPokemon.self, from: data) else {
                print("couldn't decode json")
                return
            }

            print("pokeList == \(pokeList)")
            self.nextURL = pokeList.next
            print(self.nextURL)
            onCompletion(pokeList.results)
        }

        task.resume()
    }
}
