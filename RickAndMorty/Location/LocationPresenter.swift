//
//  LocationPresenter.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 30/8/22.
//

import Foundation
protocol LocationPresenterDelegate: AnyObject {
    func getLocation()
    init(view: LocationViewDelegate, api: ProtocolLocation)
}
class LocationPresenter: LocationPresenterDelegate {
    private weak var view: LocationViewDelegate?
    private let api: ProtocolLocation?
    required init(view: LocationViewDelegate, api: ProtocolLocation) {
        self.view = view
        self.api = api
    }
    func getLocation() {
        api?.getLocationListApi { result in
            switch result {
            case .success(let data):
                self.view?.presentLocationList(location: data.results ?? [])
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
        view?.presentLocationList(location: [])
    }
}
