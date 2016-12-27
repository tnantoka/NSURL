import Vapor
import Foundation

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
        "url": "https://johnny:p4ssw0rd@www.example.com:443/script.ext;param=value?query=value#ref"
    ])
}

drop.get("parse") { req in
    var context = [String : Node]()
    context["url"] = ""
    context["parsed"] = .array([])
    // `req.query?["url"]?.string` does not work with complex URL
    if let urlString = req.uri.query?.replacingOccurrences(of: "\\Aurl=", with: "", options: .regularExpression),
        let url = URL(string: urlString) {
        context["url"] = .string(urlString)
        context["parsed"] = url.parsed
    }
    return try drop.view.make("welcome", context)
}

drop.run()
