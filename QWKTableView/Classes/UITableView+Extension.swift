//
//  UITableView+Extension.swift
//  QWKTableView
//
//  Created by Timothy Dillman on 1/6/18.
//

import Foundation
import UIKit

extension UITableView {
    open func registerReusableCell<T: QWKReusableCell>(_: T.Type) {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    open func dequeueReusableCell<T: QWKReusableCell>(indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
