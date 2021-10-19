//
//  TopShowPresenter.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 19.05.2021.
//

public protocol TopShowPresenterInput {
    var output: TopShowPresenterOutput? {get set}
    var model: [TypeModel] {get set}
    var filteringModel: [TypeModel] {get set}
    var isFiltering: Bool {get set}
    func loadData(with type: MovieType)
    func filterContentForSearchText(_ searchText: String)
}

public protocol TopShowPresenterOutput: class {
    func refresh()
}

public final class TopShowPresenter: TopShowPresenterInput {
    
    weak public var output: TopShowPresenterOutput?
    
    public var model: [TypeModel] = [] {
        didSet {
            output?.refresh()
        }
    }
    public var filteringModel: [TypeModel] = [] {
        didSet {
            output?.refresh()
        }
    }
    
    private var networkService: NetworkService
    
    public var isFiltering: Bool = false
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    public func loadData(with type: MovieType) {
        networkService.loadData(type: type) { (result) in
            switch result {
            case .success(let model):
                self.model = model.sorted(by: { (l, r) -> Bool in
                    l.votes > r.votes
                })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    public func filterContentForSearchText(_ searchText: String) {
        isFiltering = !searchText.isEmpty
        filteringModel = model.filter({ (model) -> Bool in
            return (model.name?.lowercased().contains(searchText.lowercased()) ?? false)
        })
    }

}
