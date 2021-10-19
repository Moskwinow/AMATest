//
//  UIView+Ext.swift
//  TestMovieApp
//
//  Created by Максим Вечирко on 18.05.2021.
//

import UIKit.UIView

public extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
