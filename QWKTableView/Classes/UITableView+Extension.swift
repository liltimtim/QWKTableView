//
//  UITableView+Extension.swift
//  QWKTableView
//
//  Created by Timothy Dillman on 1/6/18.
//

import Foundation
import UIKit

public extension UITableView {
    public func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: QWKReusable {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
}
