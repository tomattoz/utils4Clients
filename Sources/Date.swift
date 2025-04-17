//  Created by Ivan Kh on 03.07.2023.

import Foundation

public extension Date {
    static let firstReleaseDate = createFirstReleaseDate()

    func days(since date: Date) -> Int {
        Calendar.current.dateComponents([.day], from: self, to: date).day ?? 0
    }

    private static func createFirstReleaseDate() -> Date {
        var dateComponents = DateComponents()

        dateComponents.year = 2023
        dateComponents.month = 6
        dateComponents.day = 1

        return Calendar(identifier: .gregorian).date(from: dateComponents)!
    }
}
