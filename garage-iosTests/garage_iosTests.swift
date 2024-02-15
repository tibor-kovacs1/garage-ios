//
//  garage_iosTests.swift
//  garage-iosTests
//
//  Created by Tibor Kovacs on 14/02/2024.
//

import XCTest
import SwiftUI
@testable import garage_ios

final class garage_iosTests: XCTestCase {
    
    var parkingSpot: ParkingSpot!

    override func setUpWithError() throws {
        parkingSpot = ParkingSpot("2", "szeder bokor")
    }

    override func tearDownWithError() throws {
        parkingSpot = nil
    }
    
    func testInitParkingSpot() throws {
        XCTAssertEqual(parkingSpot.parkId, "2")
        XCTAssertEqual(parkingSpot.parkSpot, "2")
        XCTAssertEqual(parkingSpot.fullName, "szeder bokor")
        XCTAssertEqual(parkingSpot.color, Color.green)
    }

    func testChangeColor() throws {
        XCTAssertEqual(parkingSpot.color, Color.green)
        let changedColor = parkingSpot.changeColor()
        XCTAssertEqual(changedColor, Color.red)
    }

    func testReserveSpot() throws {
        let reservingSpot = parkingSpot.reserveSpot()
        XCTAssertEqual(reservingSpot, "2 szeder bokor")
    }

}
