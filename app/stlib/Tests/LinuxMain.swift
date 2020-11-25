import XCTest

import stlibTests

var tests = [XCTestCaseEntry]()
tests += stlibTests.allTests()
XCTMain(tests)
