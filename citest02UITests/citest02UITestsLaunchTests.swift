//
//  citest02UITestsLaunchTests.swift
//  citest02UITests
//
//  Created by 田中 颯志 on 2/26/25.
//

import XCTest

final class citest02UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
    }
}
