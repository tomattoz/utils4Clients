//  Created by Ivan Kh on 23.08.2023.

import Foundation
import Combine

public extension Array where Element == AnyCancellable {
    mutating func cancel() {
        forEach { $0.cancel() }
        removeAll()
    }
}
