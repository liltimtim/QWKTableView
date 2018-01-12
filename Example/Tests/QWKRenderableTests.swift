//
//  QWKRenderableTests.swift
//  QWKTableView_Tests
//
//  Created by Timothy Dillman on 1/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import QWKTableView
class QWKRenderableTests: XCTestCase {
    func testSetupRenderableObject() {
        
    }
}

class MockDataModel: NSObject {
    var sampleProperty: String = "Sample"
}

class MockAdapterItem: NSObject, QWKRenderable {
    var object: AnyObject!
    
    required init(object: AnyObject) {
        self.object = object
    }
    
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell:MockCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.textLabel?.text = (object as? MockDataModel)?.sampleProperty
        return cell
    }
    
}

class MockCell: UITableViewCell, QWKReusable {
    static var reuseIdentifier: String { return String(describing: MockCell.self) }
}
