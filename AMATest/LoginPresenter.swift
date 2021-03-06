//
//  LoginPresenter.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 18.05.2021.
//

public protocol LoginPresenterInput {
    var output: LoginPresenterOutput? {get set}
    var buttonIsEnable: Bool {get set}
    func auth(_ method: AuthMethod, with email: String, and password: String)
    func validateFields(_ email: String, password: String)
}

public protocol LoginPresenterOutput: class {
    func validateFields()
    func errorMessage(message: String)
    func performToTabBar()
}

public final class LoginPresenter: LoginPresenterInput {
    weak  public var output: LoginPresenterOutput?
    public var buttonIsEnable: Bool = false {
        didSet {
            output?.validateFields()
        }
    }
    
    private var authService: AuthService
    
    public init(authService: AuthService) {
        self.authService = authService
    }
    
    public func validateFields(_ email: String, password: String) {
        buttonIsEnable = email.count >= 3 && password.count >= 6
    }
    
    public func auth(_ method: AuthMethod, with email: String, and password: String) {
        authService.auth(method, with: email, and: password) { [weak self] (result) in
            switch result {
            case .success(let message):
                self?.output?.errorMessage(message: message)
                if method == .signIn {
                    self?.output?.performToTabBar()
                }
            case .failure(let error):
                self?.output?.errorMessage(message: error.localizedDescription)
            }
        }
    }
}
