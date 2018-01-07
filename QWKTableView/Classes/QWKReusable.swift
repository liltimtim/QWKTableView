//
//  QWKCell.swift
//  QWKTableView
//
//  Created by Timothy Dillman on 1/6/18.
//

import Foundation

public protocol QWKReusable: class {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

public protocol QWKReusableCell: QWKReusable {
    func set(withModel model: AnyObject)
}

public extension QWKReusable {
    public static var reuseIdentifier: String { return String(describing: Self.self) }
    public static var nib: UINib? { return nil }
}
