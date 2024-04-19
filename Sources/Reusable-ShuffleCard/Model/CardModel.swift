//
//  CardModel.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import Foundation
import SwiftUI

@MainActor
public class CardModel: ObservableObject {
    @Published var card: Card = Card()
    @Environment(\.openURL) private var openUrl
    
    public init() {}
    
    func isCardGrouped() -> Bool {
        return card.cards.isEmpty == false
    }
    
    func actionTapped(_ deeplink: String?) {
        guard let url = URL(string: deeplink.orEmpty) else { return }
        openUrl(url)
    }
    
    public func set(_ card: Card) {
        self.card = card
    }
}

// MARK: - Contract that client should follows.

public struct CardResponse: Codable {
    var success: Bool
    var cardData: Card
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.cardData = try container.decode(Card.self, forKey: .cardData)
    }
    
    public enum CodingKeys: String, CodingKey {
        case success
        case cardData = "card_data"
    }
    
    public func getCardData() -> Card {
        return self.cardData
    }
}

public struct Card: Codable {
    var id: String
    var type: CardType
    var title: String?
    var description: String?
    var imageUrl: String?
    var cardAction: CardAction?
    var cards: [Card]
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(CardType.self, forKey: .type)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        self.cardAction = try container.decodeIfPresent(CardAction.self, forKey: .cardAction)
        self.cards = try container.decode([Card].self, forKey: .cards)
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case id
        case title
        case description
        case imageUrl = "image_url"
        case cards
        case cardAction = "card_action"
    }
    
    public init(
        id: String,
        type: CardType,
        title: String?,
        description: String?,
        imageUrl: String?,
        cardAction: CardAction?,
        cards: [Card] = []
    ) {
        self.id = id
        self.type = type
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.cardAction = cardAction
        self.cards = cards
    }
}

public struct CardAction: Codable {
    var text: String?
    var deeplink: String?
    
    public init(text: String? = nil, deeplink: String? = nil) {
        self.text = text
        self.deeplink = deeplink
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.deeplink = try container.decodeIfPresent(String.self, forKey: .deeplink)
    }
    
    public enum CodingKeys: String, CodingKey {
        case text
        case deeplink
    }
}

public enum CardType: String, Codable {
    case banner
    case capsule
    case grid
}

// MARK: - Empty Card constructor

public extension Card {
    init() {
        self.init(id: "", type: .banner, title: nil, description: nil, imageUrl: nil, cardAction: nil)
    }
}

/*
 
 Client construct shuffle card.
 
 Client hit api > decode json into model from package.
 
 Client set card value to package from the decoded response.
 
 Package should render the shuffle card.

 */
