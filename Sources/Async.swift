//  Created by Ivan Kh on 15.08.2023.

import Foundation

public extension Sequence {
    func asyncForEach(_ operation: (Element) async throws -> Void) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}
