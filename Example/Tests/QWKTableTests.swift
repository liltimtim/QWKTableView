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
        let model = MockDataModel()
        model.sampleProperty = "Sample"
        (provider.network as? MockNetworkAdapater)?.mockItems = [MockAdapter.init(object: model)]
        provider.refresh()
        dump(provider.data)
        XCTAssertNotNil(provider.tableView)
        XCTAssertNotNil(provider.tableView?.cellForRow(at: IndexPath.init(row:0, section:0)))
        XCTAssertEqual(((provider.data.first as? MockAdapter)?.object as? MockDataModel)?.sampleProperty, model.sampleProperty)
        let cell = provider.tableView?.cellForRow(at: IndexPath.init(row: 0, section: 0))
        XCTAssertEqual(cell?.textLabel?.text, model.sampleProperty)
    }
}

class MockAdapter: NSObject, QWKRenderable {
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

class TestProvider: NSObject, QWKTable {
    
    var data: [QWKRenderable] = [QWKRenderable]()
    
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
        self.data = data as! [QWKRenderable]
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
        return data[indexPath.row].cellInstance(tableView: tableView, indexPath: indexPath)
    }
}
