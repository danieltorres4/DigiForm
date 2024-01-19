//
//  StringExtensions.swift
//  DigiForm
//
//  Created by Daniel ST on 18/01/24.
//

import Foundation

extension String {
    enum RegexType {
        case none
        case email
        case onlyLetters
        case onlyNumbers
        
        fileprivate var pattern: String {
            switch self {
            case .none:
                return ""
            case .email:
                return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            case .onlyLetters:
                return #"^[A-Za-z]+$"#
            case .onlyNumbers:
                return #"^[0-9]"#
            }
        }
    }
    
    
    /// Perform a string regex validation
    /// - Parameter regexType: regex type to use
    /// - Returns True if the test was successful. Otherwise, false
    func isValidWith(regexType: RegexType) -> Bool {
        switch regexType {
        case .none:
            return true
        default:
            break
        }
        
        let pattern = regexType.pattern
        
        guard let gRegex = try? NSRegularExpression(pattern: pattern) else {
            return false
        }
        
        let range = NSRange(location: 0, length: self.utf16.count)
        
        if gRegex.firstMatch(in: self, options: [], range: range) != nil {
            return true
        }
        
        return false
    }
}
