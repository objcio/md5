import XCTest

import md5Tests

var tests = [XCTestCaseEntry]()
tests += md5Tests.allTests()
XCTMain(tests)
