import Vapor
import Foundation

public extension Droplet {
    public func setup() {
        let drop = self

        drop.get { req in
            var context = self.context()
            context["root"] = true
            context["examples"] = .array([
                "http://example.com/",
                "https://johnny:p4ssw0rd@www.example.com:443/script.ext;param=value?query=value#ref",
                "/path/to/foo.txt",
                "file:///path/to/foo.txt",
            ])
            return try drop.view.make("welcome", context)
        }

        drop.get("parse") { req in
            var context = self.context()
            context["parsed"] = []
            // `req.query?["url"]?.string` does not work with complex URL
            if let urlString = req.uri.query?.replacingOccurrences(of: "\\Aurl=", with: "", options: .regularExpression),
                let url = URL(string: urlString) {
                context["url"] = .string(urlString)
                context["parsed"] = url.parsed
            }
            return try drop.view.make("welcome", context)
        }
    }

    private func context() -> [String : Node] {
        return [ "url" : "" ]
    }
}
