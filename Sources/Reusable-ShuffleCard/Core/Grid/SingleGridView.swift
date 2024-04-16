//
//  GroupedShuffleGridView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct SingleGridView: View {
    var cardModel: Card
    var style: CardStyle
    var onTap: (String) -> ()
    
    var body: some View {
        Button {
            onTap((cardModel.action?.deeplink).orEmpty)
        } label: {
            AsyncImage(url: URL(string: cardModel.imageUrl)) { image in
                image.resizable()
                image.scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .clipped()
        }
        .frame(width: 150, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SingleGridView(
        cardModel: Card(
            id: UUID().uuidString,
            isParent: false,
            type: .grid,
            title: "Discount 20%",
            description: "",
            imageUrl: "https://picsum.photos/400/200",
            createdDate: "2024-04-15T07:20:00.617Z",
            expiredDate: "2024-04-22T07:20:00.617Z",
            action: CardAction(
                text: "Claim",
                deeplink: "deeplink://"),
            cards: []),
        style: .defaultStyle
    ) { _ in }
}
