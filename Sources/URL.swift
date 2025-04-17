//  Created by Ivan Kh on 28.08.2023.

import Foundation

public extension URL {
    static let appLibrary = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
    static let appDocuments = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    static let appLogs = appDocuments.appendingPathComponent("logs")
    static let appTemp = appLibrary.appendingPathComponent("temp")
    static let appData = appLibrary.appendingPathComponent("data")
}
