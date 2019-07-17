import XCTest
@testable import md5

final class md5Tests: XCTestCase {
    func testExample() {
        let input = "hello\n".data(using: .utf8)!
        let md5 = input.md5()
        let md5String = md5.map { String(format: "%02hhx", $0) }.joined()
        XCTAssertEqual(md5String, "b1946ac92492d2347c6235b4d2611184")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
