// SwipeActionIndicatorView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//
import SwiftUI
struct SwipeActionIndicatorView: View {
    @Binding var xOffset: CGFloat
    let screenCutoff: CGFloat
    
    var body: some View {
        HStack {
            Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.green, lineWidth: 2.0)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 48)
                    }
                    .rotationEffect(.degrees(-45))
                    .opacity(Double(xOffset / SizeConstants.screenCutoff))
            Spacer()
            
            Text("NOPE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.red, lineWidth: 2.0)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 48)
                    }
                    .rotationEffect(.degrees(-45))
                    .opacity(Double(xOffset / SizeConstants.screenCutoff) * -1)
        }
        .padding(40)
    }
}
#Preview {
    SwipeActionIndicatorView(xOffset: .constant(20), screenCutoff: 1)
}
