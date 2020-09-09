//
//  AssertYourselfTests.swift
//  AssertYourselfTests
//
//  Created by Quinne Farenwald on 8/13/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

import XCTest
@testable import AssertYourself

class AssertYourselfTests: XCTestCase {
    
    func test_fail() {
        let theAnswer: Int = 42
        XCTFail("The answer is \(42)!")
    }
    
    func test_useConditional() {
        let success = false
        if !success {
            XCTFail("Success is \(success)")
        }
    }
    
    func test_avoidConditional() {
        let success = true
        XCTAssertTrue(success)
    }
    
    func test_assertNil() {
        let optionalValue: Int? = 123
        XCTAssertNil(optionalValue)
    }
    
    struct SimpleStruct {
        let x: Int
        let y: Int
    }
    
    func test_assertNil_SimpleStruct() {
        let testThing: SimpleStruct = SimpleStruct(x: 1, y: 2)
        XCTAssertNil(testThing)
    }
    
    struct DescriptStruct: CustomStringConvertible {
        let x: Int
        let y: Int
        
        var description: String { "YIKES \(x), \(y)" }
    }
    
    func test_assertNil_DescriptStruct() {
        let testThing: DescriptStruct = DescriptStruct(x: 3, y: 4)
        XCTAssertNil(testThing)
    }
    
    func test_assertEqual() {
        let testThing = "testThing"
        XCTAssertEqual(testThing, "checkingTestThingAgainst")
    }
    
    func test_assertEqualWithOptional() {
        let testThing: String? = "testThing"
        XCTAssertEqual(testThing, "checkingTestThingAgainst")
    }
    
    func test_floatingPointDanger() {
        let result = 0.1 + 0.2
        XCTAssertEqual(result, 0.3)
    }
    
    func test_floatingPointAccuracyCheck() {
        let testThing = 0.1 + 0.2
        XCTAssertEqual(testThing, 0.3, accuracy: 0.0001)
    }
}
