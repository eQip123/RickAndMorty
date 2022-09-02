//
//  CharacterPresenter.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 30/8/22.
//

import Foundation


protocol CharacterPresenterDelegate: AnyObject {
    func getCharacterList()
    func refresh()
    init(view: CharacterViewDelegate, api: ProtocolCharacter)
}

class CharacterPresenter: CharacterPresenterDelegate {
    private weak var view: CharacterViewDelegate?
    private let api: ProtocolCharacter?
    required init(view: CharacterViewDelegate, api:ProtocolCharacter) {
        self.view = view
        self.api = api
    }
    
    func getCharacterList() {
        view?.isProgress(isShow: true)
        api?.getCharacterListApi { result in
            switch result {
            case .success(let data):
                self.view?.presentCharacterList(characterList: data.results ?? [])
                self.view?.isProgress(isShow: false)
                break
            case .failure(let error):
                self.view?.showError(message: error.localizedDescription)
                self.view?.isProgress(isShow: false)
                break
            }
        }
        view?.presentCharacterList(characterList: [])
    }
    
    func refresh() {
        view?.presentCharacterList(characterList: [])
    }
    
    
}

