//
//  CardView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//
import SwiftUI
struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment:.top) {
                Image(model.user.profileImageURLs[currentImageIndex])  // placeholder image
                    .resizable()
                    .scaledToFill()
                    .overlay{
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset, screenCutoff: SizeConstants.screenCutoff)
            }
            UserInfoView(userInfo: model.user)
                .padding(.horizontal)
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)  // Correctly places animation with the appropriate value
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}
private extension CardView {
    func returnToCenter () {
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight(){
        xOffset = 500
        degrees = 12
        
    }
    func swipleLeft() {
        xOffset = -500
        degrees = -12
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
    func onDragChanged(value: DragGesture.Value) {  // Corrects the gesture value type
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(value: DragGesture.Value) {  // Corrects the gesture value type
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipleLeft()
        }
    }
}
#Preview {
    CardView(model: CardModel(user: MockData.users[1]))
}
