//
//  QWKNetworkAdapaterTests.swift
//  QWKTableView_Tests
//
//  Created by Timothy Dillman on 1/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import QWKTableView
class QWKNetworkAdapaterTests: XCTestCase {
    
    func testSetupNetworkAdapater() {
        let mock = MockNetworkAdapater()
        (mock as MockNetworkAdapater).mockItems = [QWKRenderable]()
        mock.fetch(success: { (objects) in
            XCTAssertEqual(objects.count, 0)
        }) { (err) in
            XCTAssertNotNil(err)
        }
    }
    
}

class MockNetworkAdapater: QWKTableNetworkAdapter {
    var mockItems: [QWKRenderable]!
    func fetch(success: ([QWKRenderable]) -> Void, error: (Error) -> Void) {
        success(mockItems)
        error(NSError.init(domain: "Test", code: 0, userInfo: nil) as Error)
    }
}
