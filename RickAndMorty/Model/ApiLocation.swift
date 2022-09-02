//
//  ApiLocation.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 2/9/22.
//

import Foundation

protocol ProtocolLocation {
    func getLocationListApi(completion: @escaping (Result<LocationModel, Error>) -> Void )
}
class ApiLocation: ProtocolLocation {
func getLocationListApi(completion: @escaping (Result<LocationModel, Error>) -> Void) {
    let request = URLRequest(url: URL(string:"https://rickandmortyapi.com/api/location")!)
    NetworkService.baseRequest(url: request, completion: completion)
}
}
