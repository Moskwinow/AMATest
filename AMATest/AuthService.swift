//
//  AuthService.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 18.05.2021.
//
import FirebaseCore
import FirebaseAuth

public enum AuthMethod {
    case signIn
    case signUp
}

public protocol AuthService {
    func auth(_ method: AuthMethod, with email: String, and password: String, completion: @escaping(Result<String, Error>) -> ())
}

public final class AuthServiceManager: AuthService {
    
    public static func configurate() {
        FirebaseApp.configure()
    }
    
    public init() {}
    
    public func auth(_ method: AuthMethod, with email: String, and password: String, completion: @escaping (Result<String, Error>) -> ()) {
        switch method {
        case .signIn:
            signIn(email: email, password: password, completion: completion)
        case .signUp:
            signUp(email: email, password: password, completion: completion)
        }
    }
    
    public func signUp(email: String, password: String, completion: @escaping (Result<String, Error>) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error == nil {
                completion(.success("User: \(email.uppercased()) successfully created now you can sign in "))
            } else {
                completion(.failure(error!))
            }
        }
    }
    
    public func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error == nil {
                completion(.success(""))
            } else {
                completion(.failure(error!))
            }
        }
        
    }
}
