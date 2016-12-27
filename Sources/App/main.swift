import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
        "url": "https://johnny:p4ssw0rd@www.example.com:443/script.ext;param=value?query=value#ref"
    ])
}

drop.run()
