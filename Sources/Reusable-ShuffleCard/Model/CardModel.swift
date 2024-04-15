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
    
    public init(card: Card) {
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
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.isParent = try container.decode(Bool.self, forKey: .isParent)
        self.type = try container.decode(CardType.self, forKey: .type)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.createdDate = try container.decode(String.self, forKey: .createdDate)
        self.expiredDate = try container.decode(String.self, forKey: .expiredDate)
        self.action = try container.decodeIfPresent(CardAction.self, forKey: .action)
        self.cards = try container.decode([Card].self, forKey: .cards)
    }
    
    public init(
        id: String,
        isParent: Bool,
        type: CardType,
        title: String?,
        description: String?,
        imageUrl: String,
        createdDate: String,
        expiredDate: String,
        action: CardAction?,
        cards: [Card]
    ) {
        self.id = id
        self.isParent = isParent
        self.type = type
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.createdDate = createdDate
        self.expiredDate = expiredDate
        self.action = action
        self.cards = cards
    }
}

public struct CardAction: Codable {
    var text: String?
    var deeplink: String
    
    public init(text: String? = nil, deeplink: String) {
        self.text = text
        self.deeplink = deeplink
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.deeplink = try container.decode(String.self, forKey: .deeplink)
    }
}
