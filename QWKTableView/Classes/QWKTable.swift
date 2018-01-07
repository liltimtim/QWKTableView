//
//  QWKTable.swift
//  QWKTableView
//
//  Created by Timothy Dillman on 1/6/18.
//

import Foundation
import UIKit

public protocol QWKTableEmittableError {
    func didEmit(err: Error)
}

public protocol QWKTableEmittable: class, QWKTableEmittableError {
    func didEmit(selection: AnyObject, indexPath: IndexPath)
}

public protocol QWKTable: class, UITableViewDelegate, UITableViewDataSource, QWKTableEmittableError {
    var data: [AnyObject] { get set }
    var network: QWKTableNetworkAdapter? { get set }
    weak var delegate: QWKTableEmittable? { get set }
    weak var tableView: UITableView? { get set }
    init(withTable table: UITableView)
    /** comes with default implementation, attempts to trigger a refresh from the network. */
    func refresh()
    func refresh(withData data:[AnyObject])
}

public extension QWKTable {
    func refresh() {
        network?.fetch(success: { [weak self] (items) in
            self?.refresh(withData: items)
        }, error: { [weak self] (err) in
            self?.delegate?.didEmit(err: err)
        })
    }
}

