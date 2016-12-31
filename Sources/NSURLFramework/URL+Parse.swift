import Vapor
import Foundation

extension URL {
    var parsed: Node {
        guard let url = NSURL(string: absoluteString) else { return .array([]) }
        return .array([
            parse(key: "isFileReferenceURL()", value: url.isFileReferenceURL()),
            parse(key: "isFileURL", value: url.isFileURL),
            parse(key: "absoluteString", value: url.absoluteString),
            parse(key: "absoluteURL", value: url.absoluteURL),
            parse(key: "fragment", value: url.fragment),
            parse(key: "host", value: url.host),
            parse(key: "lastPathComponent", value: url.lastPathComponent),
            parse(key: "parameterString", value: url.parameterString),
            parse(key: "password", value: url.password),
            parse(key: "path", value: url.path),
            parse(key: "pathComponents", value: url.pathComponents),
            parse(key: "pathExtension", value: url.pathExtension),
            parse(key: "port", value: url.port),
            parse(key: "query", value: url.query),
            parse(key: "relativePath", value: url.relativePath),
            parse(key: "relativeString", value: url.relativeString),
            parse(key: "resourceSpecifier", value: url.resourceSpecifier),
            parse(key: "scheme", value: url.scheme),
            parse(key: "standardized", value: url.standardized),
            parse(key: "user", value: url.user),
            parse(key: "filePathURL", value: url.filePathURL),
            parse(key: "fileReferenceURL()", value: url.fileReferenceURL()),
            parse(key: "deletingLastPathComponent", value: url.deletingLastPathComponent),
            parse(key: "deletingPathExtension", value: url.deletingPathExtension),
            // parse(key: "resolvingSymlinksInPath", value: url.resolvingSymlinksInPath),
            parse(key: "standardizingPath", value: url.standardizingPath),
            // parse(key: "hasDirectoryPath", value: url.hasDirectoryPath),
        ])
    }

    private func parse(key: String, value: String?) -> Node {
        return .object(["key" : .string(key), "value" : .string(value ?? "nil")])
    }

    private func parse(key: String, value: Bool) -> Node {
        return parse(key: key, value: String(value))
    }

    private func parse(key: String, value: URL?) -> Node {
        return parse(key: key, value: value?.absoluteString)
    }

    private func parse(key: String, value: [String]?) -> Node {
        return parse(key: key, value: value?.joined(separator: ", "))
    }

    private func parse(key: String, value: NSNumber?) -> Node {
        return parse(key: key, value: value?.stringValue)
    }
}
