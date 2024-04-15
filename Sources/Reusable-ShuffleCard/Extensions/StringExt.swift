//
//  StringExt.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import Foundation

extension Optional where Wrapped == String  {
    var orEmpty: String {
        return self ?? ""
    }
}
