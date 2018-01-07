//
//  QWKRenderable.swift
//  QWKTableView
//
//  Created by Timothy Dillman on 1/6/18.
//
//  Used to conform Data Models to inform the table what cell should be displayed for this particular data model.  Sits as a layer between the model and the table view
//  Acts as an "adapter" for the model telling / asking the table to display the particular cell for the particular model. 
import Foundation

public protocol QWKRenderable: class {
    /** set property to have the data model render out the cell */
    static var displayTableCell: QWKReusableCell.Type { get }
    var object:AnyObject { get set }
}
