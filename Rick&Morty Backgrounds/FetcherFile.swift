//
//  FetcherFile.swift
//  Rick&Morty Backgrounds
//
//  Created by Anton Huisamen on 2018/06/26.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

struct NamedURL: Codable {
    let name: String
    let url: String
}

struct Actor: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: NamedURL
    let location: NamedURL
    let image: String
    
}

//Mark: Your JSON -> Struct Parser

class ActorFetcher {
    
    let urls: [URL] = []
    

    var url: URL {
        let randomInt = Int(arc4random_uniform(493) + 7)
        return URL(string: "https://rickandmortyapi.com/api/character/\(randomInt)")!
    }
    
    func getActorInfo(completion: @escaping (_ actor: Actor?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {print("has started")
                let decoder = JSONDecoder()
                print("decoder instantiated")
                let actorData = try decoder.decode(Actor.self, from: data)
                print("decoding done")
                completion(actorData, nil)
            } catch {
                completion(nil, error)
            }
            }.resume()
    }
}


