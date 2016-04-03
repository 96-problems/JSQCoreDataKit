//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/JSQCoreDataKit
//
//
//  GitHub
//  https://github.com/jessesquires/JSQCoreDataKit
//
//
//  License
//  Copyright © 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import XCTest
import CoreData

import ExampleModel

@testable
import JSQCoreDataKit


class SaveResultTests: XCTestCase {

    func test_SaveResult_Error() {
        let success = SaveResult.Success
        XCTAssertNil(success.error())

        let failure = SaveResult.Failure(NSError(domain: "err", code: 0, userInfo: nil))
        XCTAssertNotNil(failure.error())
    }

    func test_SaveResult_Equality() {
        let success = SaveResult.Success
        let failure = SaveResult.Failure(NSError(domain: "err", code: 0, userInfo: nil))
        XCTAssertNotEqual(success, failure)
    }

    func test_SaveResult_Equality_Success() {
        let success1 = SaveResult.Success
        let success2 = SaveResult.Success
        XCTAssertEqual(success1, success2)
    }

    func test_SaveResult_Equality_Failure() {
        let err = NSError(domain: "err", code: 0, userInfo: nil)
        let failure1 = SaveResult.Failure(err)
        let failure2 = SaveResult.Failure(err)
        XCTAssertEqual(failure1, failure2)

        let failure3 = SaveResult.Failure(NSError(domain: "err2", code: 2, userInfo: nil))
        XCTAssertNotEqual(failure1, failure3)
    }

    func test_SaveResult_Description() {
        print("\(#function)")

        let success = SaveResult.Success
        print(success)

        let failure = SaveResult.Failure(NSError(domain: "err", code: 0, userInfo: nil))
        print(failure)
    }
}
