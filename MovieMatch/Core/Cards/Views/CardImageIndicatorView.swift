//
//  CardImageIndicatorView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .white : .blue)
                    .frame(width: 100, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}
private extension CardImageIndicatorView {
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview {
    CardImageIndicatorView(currentImageIndex: 1, imageCount: 3)
}
