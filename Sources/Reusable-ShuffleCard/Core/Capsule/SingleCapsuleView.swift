//
//  ShuffleCapsuleView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct SingleCapsuleView: View {
    var cardModel: Card
    var onTap: (String) -> ()
    var body: some View {
        VStack {
            Button {
                onTap((cardModel.action?.deeplink).orEmpty)
            } label: {
                Text(cardModel.title.orEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .background {
                AsyncImage(url: URL(string: cardModel.imageUrl)) { image in
                    image.image?.resizable()
                    image.image?.scaledToFill()
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: .infinity))
    }
}

#Preview {
    SingleCapsuleView(cardModel: Card(
        id: UUID().uuidString,
        isParent: false,
        type: .capsule,
        title: "Discount 20%",
        description: "",
        imageUrl: "https://picsum.photos/400/200",
        createdDate: "2024-04-15T07:20:00.617Z",
        expiredDate: "2024-04-22T07:20:00.617Z",
        action: CardAction(
            text: "Claim",
            deeplink: "deeplink://"),
        cards: []
    ), onTap: { _ in })
}
