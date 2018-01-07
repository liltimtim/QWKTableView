//
//  QWKNetworkAdapter.swift
//  QWKTableView
//
//  Created by Timothy Dillman on 1/6/18.
//
//  QWKTableNetworkAdapater is designed to handle any network requests, refreshing / fetching data
import Foundation

public protocol QWKTableNetworkAdapter: class {
    func fetch(success: (_ objects:[AnyObject])->Void, error: (_ err: Error)->Void)
}
