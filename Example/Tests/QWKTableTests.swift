//
//  QWKTableTests.swift
//  QWKTableView_Tests
//
//  Created by Timothy Dillman on 1/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//


import XCTest
import QWKTableView
class QWKTableTests: XCTestCase {
    func testSetupQWKTable() {
        let table = UITableView()
        let provider = TestProvider(withTable: table)
        (provider.network as? MockNetworkAdapater)?.mockItems = ["string" as AnyObject]
        provider.refresh()
        XCTAssertNotNil(provider.tableView)
        XCTAssertNotNil(provider.tableView?.cellForRow(at: IndexPath.init(row:0, section:0)))
        XCTAssertEqual(provider.data.first as? String, "string")
    }
}

class TestProvider: NSObject, QWKTable {
    
    var data: [AnyObject] = [AnyObject]()
    
    var network: QWKTableNetworkAdapter?
    
    var delegate: QWKTableEmittable?
    
    open var tableView: UITableView?
    
    required init(withTable table: UITableView) {
        super.init()
        self.tableView = table
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.network = MockNetworkAdapater()
        self.tableView?.registerReusableCell(MockCell.self)
    }
    
    func refresh(withData data: [AnyObject]) {
        self.data = data
        self.tableView?.reloadData()
    }
    
    func didEmit(err: Error) {
        delegate?.didEmit(err: err)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MockCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.set(withModel: data[indexPath.row])
        return cell
    }
}
