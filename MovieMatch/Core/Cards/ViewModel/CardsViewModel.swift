//
//  CardsViewModel.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var ButtonSwipeAction: SwipeAction?
    private let service: CardService
    
    init(service: CardService)  {
        self.service = service
        Task{ await fetchCardModels()}
    }
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("DEBUG: Failed to fetch cards with error: \(error)")
        }
    }
    
    func removeCard(_ card: CardModel) {
        Task {
            try await Task.sleep(nanoseconds: 500_000_000)
            guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
            cardModels.remove(at: index)
        }
    }
}
