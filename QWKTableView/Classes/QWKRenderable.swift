//
//  QWKRenderable.swift
//  QWKTableView
//
//  Created by Timothy Dillman on 1/6/18.
//
//  Used as a data adapter for dispensing cells to the table view and adapting the data appropriately
import Foundation

public protocol QWKRenderable: class {
    var object:AnyObject! { get set }
    
    /** set property to have the data model render out the cell */
    init(object: AnyObject)
    
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
