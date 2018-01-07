import UIKit
import XCTest
import QWKTableView

class Tests: XCTestCase {
    
    func testReuseIdentifierString() {
        XCTAssertEqual(String(describing: TestReusableCell.self), TestReusableCell.reuseIdentifier)
    }
    
}

class TestReusableCell: QWKReusableCell {
    func set(withModel model: AnyObject) { }
}

