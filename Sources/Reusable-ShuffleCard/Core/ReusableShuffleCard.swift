//
//  File.swift
//  
//
//  Created by Leo Wirasanto Laia on 20/04/24.
//

import Foundation
import SwiftUI

@MainActor
public class ReusableShuffleCard: ObservableObject {
    private var cardModel: CardModel = CardModel()
    @Published public var cardView: any View
    
    public init(_ style: CardStyle) {
        let view = ShuffleCardViewWrapper(style).environmentObject(cardModel)
        self.cardView = view
    }
    
    public func set(_ cardData: Card) {
        DispatchQueue.main.async {
            self.cardModel.set(cardData)
        }
    }
}
