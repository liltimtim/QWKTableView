//
//  QWKTable.swift
//  QWKTableView
//
//  Created by Timothy Dillman on 1/6/18.
//

import Foundation
import UIKit

public protocol QWKTable: class, UITableViewDelegate, UITableViewDataSource {
    var data: [AnyObject] { get set }
    
}
