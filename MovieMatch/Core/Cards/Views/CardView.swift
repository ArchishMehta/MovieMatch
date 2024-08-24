//
//  CardView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//
import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0 
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModel = false 
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment:.top) {
                Image(model.user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay{
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset, screenCutoff: SizeConstants.screenCutoff)
            }
            UserInfoView(showProfileModel: $showProfileModel, userInfo: user)
                .padding(.horizontal)
        }
        .fullScreenCover(isPresented:  $showProfileModel) {
            UserProfileView(user: user)
        }
        
        .onReceive(viewModel.$ButtonSwipeAction, perform: { action in onReceiveSwipeAction(action) })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset, y: yOffset) // Apply both xOffset and yOffset
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset) // Apply animation to both xOffset and yOffset
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        yOffset = 0 // Reset yOffset as well
        degrees = 0
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeUp() {
        withAnimation {
            yOffset = -1000
            degrees = 0
        } completion: {
            viewModel.removeCard(model)
        }
    }

    func swipeDown() {
        withAnimation {
            yOffset = 1000
            degrees = 0
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else { return }
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            case .dontWantToWatch:
                swipeDown()
            case .wantToWatch:
                swipeUp()
            }
        }
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}

private extension CardView {
    func onDragChanged(value: DragGesture.Value) {
        xOffset = value.translation.width
        yOffset = value.translation.height // Track vertical translation
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(value: DragGesture.Value) {
        let width = value.translation.width
        let height = value.translation.height

        if abs(width) > abs(height) { // Horizontal swipe
            if abs(width) <= abs(SizeConstants.screenCutoff) {
                returnToCenter()
                return
            }

            if width >= SizeConstants.screenCutoff {
                swipeRight()
            } else {
                swipeLeft()
            }
        } else { // Vertical swipe
            if abs(height) <= abs(SizeConstants.screenCutoff) {
                returnToCenter()
                return
            }

            if height <= -SizeConstants.screenCutoff { // Swipe up
                swipeUp()
            } else if height >= SizeConstants.screenCutoff { // Swipe down
                swipeDown()
            } else {
                returnToCenter()
            }
        }
    }
}

#Preview {
    CardView(
        viewModel: CardsViewModel(service: CardService()),
        model: CardModel(user: MockData.users[1])
    )
}
