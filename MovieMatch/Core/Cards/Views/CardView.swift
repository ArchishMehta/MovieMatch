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
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment:.top) {
                Image(systemName: "photo")  // placeholder image
                    .resizable()
                    .scaledToFill()
                
                SwipeActionIndicatorView(xOffset: $xOffset, screenCutoff: SizeConstants.screenCutoff)
            }
            UserInfoView()
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
    func onDragChanged(value: DragGesture.Value) {  // Corrects the gesture value type
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(value: DragGesture.Value) {  // Corrects the gesture value type
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            xOffset = 0
            degrees = 0
        }
    }
}
#Preview {
    CardView()
}
