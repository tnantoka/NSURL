import XCTest
import HTTP
@testable import Vapor
import NSURLFramework

class AppTests: XCTestCase {
    static let allTests = [
        ("testParse", testParse),
    ]

    func makeTestDroplet() throws -> Droplet {
        let drop = Droplet(arguments: ["dummy/path/", "prepare"])
        drop.setup()
        try drop.runCommands()
        return drop
    }

    func testParse() {
        let drop = try! makeTestDroplet()
        let req = try! Request(method: .get, uri: "/parse?url=http%3A%2F%2Fexample.com%2F")
        let res = try! drop.respond(to: req)
        let body = res.body.bytes!.string
        XCTAssertTrue(body.contains("<th>.host</th><td><code>example.com</code></td>"))
        XCTAssertTrue(body.contains("<th>.scheme</th><td><code>http</code></td>"))
    }
}
