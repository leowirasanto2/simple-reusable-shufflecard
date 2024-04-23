//
//  SwiftUIView.swift
//  
//
//  Created by Leo Wirasanto Laia on 23/04/24.
//

import SwiftUI

struct GroupTitleView: View {
    @State var title: String
    @State var actionText: String?
    var style: CardStyle
    var actionTapped: () -> ()?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            
            if let actionText = actionText {
                Spacer()
                Button {
                    actionTapped()
                } label: {
                    Text(actionText)
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
        }
        .foregroundStyle(style.config.groupTitleForegroundColor)
    }
}

#Preview {
    GroupTitleView(title: "Title preview", actionText: "See more", style: .defaultStyle, actionTapped: {})
}
