//
//  Date+Extension.swift
//  NewsHack
//
//  Created by Aaron Cabreja on 3/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
extension Date {
    // get an ISO timestamp
    static func getISOTimestamp() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        let timestamp = isoDateFormatter.string(from: Date())
        return timestamp
    }
}
