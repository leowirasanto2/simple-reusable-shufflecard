//
//  CardModel.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import Foundation

@MainActor
public class CardModel: ObservableObject {
    @Published var card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    func isCardGrouped() -> Bool {
        return card.isParent && !card.cards.isEmpty
    }
    
    func actionTapped(_ deeplink: String) {
        print("open deeplink \(deeplink)")
    }
}

public enum CardType: String, Codable {
    case banner
    case capsule
    case grid
}

public struct GroupCard: Codable {
    var groupId: String
    var groupTitle: String?
    var groupAction: CardAction?
    var cards: [Card]
}

public struct Card: Codable {
    var id: String
    var isParent: Bool
    var type: CardType
    var title: String?
    var description: String?
    var imageUrl: String
    var createdDate: String
    var expiredDate: String
    var action: CardAction?
    var cards: [Card]
}

public struct CardAction: Codable {
    var text: String?
    var deeplink: String
}
