//
//  String.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 10/05/2023.
//
import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
