//
//  ApiCharacter.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 1/9/22.
//

import Foundation
protocol ProtocolCharacter {
    func getCharacterListApi(completion: @escaping (Result<CharacterModel, Error>) -> Void )
}

class ApiCharacter: ProtocolCharacter {
    func getCharacterListApi(completion: @escaping (Result<CharacterModel, Error>) -> Void) {
        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character")!)
        NetworkService.baseRequest(url: request, completion: completion)
    }
    
}
