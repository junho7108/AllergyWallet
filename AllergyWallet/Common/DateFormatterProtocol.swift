//
//  DateFormatterProtocol.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/27/24.
//

import Foundation

protocol DateFormatterProtocol { }

extension DateFormatterProtocol {
    func formatDateInput(_ input: String) -> String {
        let digits = input.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        var formattedDate = ""
        
        if digits.count > 0 {
            let year = String(digits.prefix(4))
            formattedDate = year
        }
        
        if digits.count > 4 {
            let month = String(digits.prefix(6).suffix(2))
            formattedDate += ".\(month)"
        }
        
        if digits.count > 6 {
            let day = String(digits.prefix(8).suffix(2))
            formattedDate += ".\(day)"
        }
        
        return formattedDate
    }
    
    func validateDate(_ date: String) -> Bool {
        let dateRegex = #"^\d{4}\.\d{2}\.\d{2}$"#
        let datePredicate = NSPredicate(format:"SELF MATCHES %@", dateRegex)
        return datePredicate.evaluate(with: date)
    }
}
