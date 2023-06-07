//
//  TransformationsTests.swift
//  Proyecto_FundamentosTests
//
//  Created by Rubén Pulido Marchal on 7/6/23.
//

import XCTest


final class TransformationTests: XCTestCase {
    
    var trans: Transformations!

    override func setUp() {
        super.setUp()
        
        trans = Transformations(id: "22",
                                        name: "Super saiyan",
                                        photo: "https://www.keepcoding.io",
                                        description: "This is the real one!")
    }

    override func tearDown() {
        trans = nil
        super.tearDown()
    }

    func testTransformationId() {
        XCTAssertNotNil(trans.id)
        XCTAssertEqual(trans.id, "22")
        XCTAssertNotEqual(trans.id, "7")
    }
    
    func testTransformationName() {
        XCTAssertNotNil(trans.name)
        XCTAssertEqual(trans.name, "Super saiyan")
        XCTAssertNotEqual(trans.name, "Super saiyan Blue")
    }
    
    func testTransformationPhoto() {
        let url = URL(string: trans.photo)
        
        XCTAssertNotNil(trans.photo)
        XCTAssertEqual(trans.photo, "https://www.keepcoding.io")
        XCTAssertNotEqual(trans.photo, "https://www.keepcoding.com")
        
        // TODO: - Check this one!
        XCTAssertNotNil(url?.absoluteURL)
    }
    
    func testTransformationDescription() {
        XCTAssertNotNil(trans.description)
        XCTAssertEqual(trans.description, "This is the real one!")
        XCTAssertNotEqual(trans.description, "This is the real one!!!!")
    }

}
