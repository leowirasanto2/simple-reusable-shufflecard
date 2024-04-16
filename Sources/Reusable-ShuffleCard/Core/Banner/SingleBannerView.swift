//
//  SingleBannerView.swift
//  reusable-shuffle-card
//
//  Created by Leo Wirasanto Laia on 15/04/24.
//

import SwiftUI

struct SingleBannerView: View {
    var data: Card
    var style: CardStyle
    var onActionTapped: (String) -> ()
    
    var body: some View {
        VStack {
            cardView
                .background {
                    AsyncImage(url: URL(string: data.imageUrl)) { image in
                        image.image?.resizable()
                        image.image?.scaledToFill()
                    }
                }
        }
        .frame(width: 350, height: 180)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var cardView: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text(data.title.orEmpty)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(data.description.orEmpty)
                        .font(.subheadline)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundStyle(style.config.cardForegroundColor)
                if let action = data.action {
                    Button {
                        onActionTapped(action.deeplink)
                    } label: {
                        Text(action.text.orEmpty)
                            .font(.subheadline)
                            .foregroundStyle(style.config.cardForegroundColor)
                            .fontWeight(.semibold)
                            .colorInvert()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(style.config.cardForegroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
        }
    }
}

#Preview {
    SingleBannerView(
        data:  Card(
            id: UUID().uuidString,
            isParent: false,
            type: .banner,
            title: "Title",
            description: "Put your description here, as you expected. Do not hesitate to ask for help if any.",
            imageUrl: "https://picsum.photos/400/200",
            createdDate: "2024-04-15T07:20:00.617Z",
            expiredDate: "2024-04-22T07:20:00.617Z",
            action: CardAction(
                text: "Claim",
                deeplink: "deeplink://"),
            cards: []
        ),
        style: .defaultStyle
    ) { deeplink in
        print(deeplink)
    }
}
