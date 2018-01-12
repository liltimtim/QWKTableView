import UIKit
import XCTest
import QWKTableView

class Tests: XCTestCase {
    
    func testReuseIdentifierString() {
        XCTAssertEqual(String(describing: TestReusableCell.self), TestReusableCell.reuseIdentifier)
    }
    
}

class TestReusableCell: UITableViewCell, QWKReusable {
    static var reuseIdentifier: String { return String(describing: TestReusableCell.self) }
}

