//
//  DateFormatter.swift
//  DAMII_EF_OcampoWilmer
//
//  Created by Wilmer Ocampo on 14/12/24.
//

import Foundation

extension DateFormatter {
    static func formatDate(_ date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date ?? Date())
    }

    static func formatTime(_ date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date ?? Date())
    }
}
