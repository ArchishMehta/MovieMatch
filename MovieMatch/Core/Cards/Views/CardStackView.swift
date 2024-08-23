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
        NavigationStack {
            VStack(spacing: 20) {
                ZStack {
                    ForEach(viewModel.cardModels) { card in
                        CardView(viewModel: viewModel, model: card)
                    }
                    
                }
                if !viewModel.cardModels.isEmpty {
                    SwiftActionButtonsView(viewModel: viewModel)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.movielogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
