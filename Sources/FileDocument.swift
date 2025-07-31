//  Created by Ivan Khvorostinin on 14.04.2025.

import SwiftUI
import UniformTypeIdentifiers
import Utils9

public struct URLFileDocument: FileDocument {
    var url: URL

    // Specify that this document can handle any binary data.
    public static var readableContentTypes: [UTType] { [.data] }

    public init(configuration: ReadConfiguration) throws {
        throw Error9.unsupported
    }

    // Initialize with data from a file at a given URL.
    public init(_ url: URL) throws {
        self.url = url
    }

    // Save the binary data to a file.
    public func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        try FileWrapper(url: url)
    }
}

