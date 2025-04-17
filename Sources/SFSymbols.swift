//  Created by Ivan Kh on 20.07.2023.

import Foundation

public extension String {
    static let sfSymbols: Set<String> = {
        guard let bundle = Bundle(identifier: "com.apple.CoreGlyphs") else { return [] }
        guard let resourcePath = bundle.path(forResource: "name_availability", ofType: "plist") else { return [] }
        guard let plist = NSDictionary(contentsOfFile: resourcePath)?["symbols"] as? [String : Any] else { return [] }

        return .init(plist.map { $0.key })
    }()
}
