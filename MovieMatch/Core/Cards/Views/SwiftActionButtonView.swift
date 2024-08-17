//
//  SwiftActionButtonView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-17.
//
import SwiftUI

struct SwiftActionButtonsView: View {
    @ObservedObject var viewModel: CardsViewModel
    var body: some View {
        HStack(spacing: 32) {
            Button {
                viewModel.ButtonSwipeAction = .reject
            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .background {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    }
            }
            .frame(width: 48, height: 48)

            Button {
                viewModel.ButtonSwipeAction = .like
            } label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundStyle(.green)
                    .background {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    }
            }
            .frame(width: 48, height: 48)
            
            Button {
                viewModel.ButtonSwipeAction = .wantToWatch
                
            } label: {
                Image(systemName: "tv")
                    .fontWeight(.heavy)
                    .foregroundStyle(.green)
                    .background {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    }
            }
            .frame(width: 48, height: 48)

            Button {
                viewModel.ButtonSwipeAction = .dontWantToWatch
            } label: {
                Image(systemName: "tv.slash")
                    .fontWeight(.heavy)
                    .foregroundStyle(.pink)
                    .background {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 6)
                    }
            }
            .frame(width: 48, height: 48)
        }
    }
}

#Preview {
    SwiftActionButtonsView(viewModel: CardsViewModel(service: CardService()))
}
