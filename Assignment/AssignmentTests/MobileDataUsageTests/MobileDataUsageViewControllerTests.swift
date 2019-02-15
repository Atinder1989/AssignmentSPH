//
//  MobileDataUsageViewControllerTests.swift
//  AssignmentTests
//
//  Created by Atinderpal Singh on 07/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import XCTest
@testable import Assignment

class MobileDataUsageViewControllerTests: XCTestCase {
    var vc: MobileDataUsageViewController!
    override func setUp() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        vc = storyBoard.instantiateViewController(withIdentifier: "MobileDataUsageViewController") as? MobileDataUsageViewController
        _ = vc.view
    }
    
    func testInitCollectionView() {
        XCTAssertNotNil(vc.mobileDataCollectionView)
    }

    func testLoadViewSetsDataSource() {
        XCTAssertNotNil(vc.mobileDataCollectionView.dataSource is MobileDataUsageViewModel)
    }

    func testLoadViewSetsDelegate() {
        XCTAssertNotNil(vc.mobileDataCollectionView.delegate is MobileDataUsageViewModel)
    }
    
    func testCollectionViewDataSourceAndDelegateSameInstance() {
        XCTAssertEqual(vc.mobileDataCollectionView.dataSource as! MobileDataUsageViewModel, vc.mobileDataCollectionView.delegate as! MobileDataUsageViewModel)
    }
}
