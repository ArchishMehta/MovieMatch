//
//  CardStackView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service: CardService())
    var body: some View {
        ZStack {
            ForEach(viewModel.cardModels) { card in
                CardView(model: card)
            }
        }
    }
}

#Preview {
    CardStackView()
}
