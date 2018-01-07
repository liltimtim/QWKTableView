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
        let o = MockModel()
        dump(MockModel.displayTableCell)
        XCTAssertEqual(o.object as? String, "hello")
    }
}

class MockModel: NSObject, QWKRenderable {
    
    static var displayTableCell: QWKReusableCell.Type { return MockCell.self }
    
    var object: AnyObject = String("hello") as AnyObject
    
    
}

class MockCell: UITableViewCell, QWKReusableCell {
    func set(withModel model: AnyObject) {
        
    }
}
