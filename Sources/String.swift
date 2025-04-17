//  Created by Ivan Kh on 31.10.2024.

import Foundation

public extension NSMutableString {
    func trimSuffixNewlines() {
        var range = rangeOfCharacter(from: .newlines, options: .backwards)

        while range.length != 0 && NSMaxRange(range) == length {
            replaceCharacters(in: range, with: "")
            range = rangeOfCharacter(from: .newlines, options: .backwards)
        }
    }
}
