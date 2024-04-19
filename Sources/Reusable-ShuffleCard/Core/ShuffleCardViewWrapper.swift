//
//  ShuffleCard.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 16/04/24.
//

import SwiftUI

public enum CardStyle {
    case defaultStyle
    case custom(style: CardStyleConfig)
    
    var config: CardStyleConfig {
        switch self {
        case .defaultStyle:
            return CardStyleConfig()
        case .custom(let style):
            return style
        }
    }
}

public struct CardStyleConfig {
    var groupTitleForegroundColor: Color
    var cardForegroundColor: Color
    var showGroupTitle: Bool
    
    public init(groupTitleForegroundColor: Color = .black, cardForegroundColor: Color = .white, showGroupTitle: Bool = true) {
        self.groupTitleForegroundColor = groupTitleForegroundColor
        self.cardForegroundColor = cardForegroundColor
        self.showGroupTitle = showGroupTitle
    }
}

public struct ShuffleCardViewWrapper: View {
    @EnvironmentObject var cardModel: CardModel
    private var style: CardStyle
    
    public init(_ style: CardStyle = .defaultStyle) {
        self.style = style
    }
    
    public var body: some View {
        HStack {
            switch cardModel.card.type {
            case .banner:
                ShuffleBannerView(cardModel: cardModel, style: style)
            case .capsule:
                ShuffleCapsuleView(cardModel: cardModel, style: style)
            case .grid:
                ShuffleGridView(cardModel: cardModel, style: style)
            }
        }
    }
    
    public func update(_ card: Card) {
        cardModel.set(card)
    }
}

#Preview {
    ShuffleCardViewWrapper(.defaultStyle)
        .environmentObject(
            CardModel()
        )
}
