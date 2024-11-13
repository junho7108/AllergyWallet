//
//  DateFormatterProtocol.swift
//  AllergyWallet
//
//  Created by Junho Yoon on 10/27/24.
//

import Foundation

protocol DateFormatterProtocol { }

extension DateFormatterProtocol {
    func formatDateInput(_ input: String, previousInput: String) -> String {
        guard input.count > previousInput.count else {
            var date = input
            if date.last == "." { date.removeLast() }
            return date
        }
        
        let digits = input.filter { "0123456789".contains($0) }
        
        var formattedText = ""
        for (index, digit) in digits.enumerated() {
            formattedText.append(digit)
            
            if index == 3 || index == 5 {
                formattedText.append(".")
            }
        }

        if formattedText.count > 10 {
            formattedText = String(formattedText.prefix(10))
        }
        
        return formattedText
    }
    
    func validateDate(_ date: String) -> Bool {
        let dateRegex = #"^\d{4}\.\d{2}\.\d{2}$"#
        let datePredicate = NSPredicate(format:"SELF MATCHES %@", dateRegex)
        return datePredicate.evaluate(with: date)
    }
}
