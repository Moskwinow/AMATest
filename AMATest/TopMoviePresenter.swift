//
//  TopMoviePresenter.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 19.05.2021.
//

import Foundation

public protocol TopMoviePresenterInput {
    var output: TopMoviePresenterOutput? {get set}
    var model: [Model] {get set}
    var filteringModel: [TypeModel] {get set}
    var isFiltering: Bool {get set}
    func loadData(with type: MovieType)
    func filterContentForSearchText(_ searchText: String)
}

public protocol TopMoviePresenterOutput: class {
    func refresh()
}

public final class TopMoviePresenter: TopMoviePresenterInput {
    
    weak public var output: TopMoviePresenterOutput?
    
    public var model: [Model] = [] {
        didSet {
            output?.refresh()
        }
    }
    public var filteringModel: [TypeModel] = [] {
        didSet {
            output?.refresh()
        }
    }
    public var isFiltering: Bool = false
    
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func loadData(with type: MovieType) {
        networkService.loadData(type: type) { (result) in
            switch result {
            case .success(let model):
                self.model = model.sorted(by: { (l, r) -> Bool in
                    l.votes > r.votes
                }) as! [Model]
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    public func filterContentForSearchText(_ searchText: String) {
        isFiltering = !searchText.isEmpty
        filteringModel = model.filter({ (model) -> Bool in
            return (model.title?.lowercased().contains(searchText.lowercased()) ?? false)
        })
    }
}
