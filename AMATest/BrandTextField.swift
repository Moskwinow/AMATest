//
//  BrandTextField.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 18.05.2021.
//

import UIKit

public final class BrandTextField: UITextField {
    
    private enum Constants {
        static let insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    // MARK: -  Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .darkGray
        tintColor = .darkGray
        borderStyle = .none
        backgroundColor = .white
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        addBorder()
    }
    
    private func addBorder() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.insets)
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.insets)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.insets)
    }
}
