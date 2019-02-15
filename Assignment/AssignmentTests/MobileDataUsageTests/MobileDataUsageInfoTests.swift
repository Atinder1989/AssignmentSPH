//
//  MobileDataUsageInfoTests.swift
//  AssignmentTests
//
//  Created by Atinderpal Singh on 07/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import XCTest
@testable import Assignment

class MobileDataUsageInfoTests: XCTestCase {
    func testIsVolumeDataDecrease() {
        let info  = MobileDataInfo.init(year: "2012", quarters: [5,1,2,3,4])
        XCTAssertTrue(info.isVolumeDataDecrease())
    }
    func testIsVolumeDataNotDecrease() {
        let info  = MobileDataInfo.init(year: "2012", quarters: [1,2,3,4])
        XCTAssertFalse(info.isVolumeDataDecrease())
    }
    func testGetTotalDataConsumption() {
        let info  = MobileDataInfo.init(year: "2012", quarters: [1,2,3,4])
        XCTAssertTrue(info.getTotalDataConsumption() > 0)
    }
}
