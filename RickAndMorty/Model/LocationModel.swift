//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 2/9/22.
//

import Foundation

// MARK: - LocationModel
struct LocationModel: Codable {
    let info: InfoLocation?
    let results: [ResultLocation]?
}

// MARK: - Info
struct InfoLocation: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct ResultLocation: Codable {
    let id: Int?
    let name: String?
    let dimenstion: String?
    let typ: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
