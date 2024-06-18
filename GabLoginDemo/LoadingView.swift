//
//  LoadingView.swift
//  GabLoginDemo
//
//  Created by Eldar Iusupov on 2024-06-18.
//

import SwiftUI

struct LoadingView: View {
    @State var isAnimated = false
    let recSize:CGFloat = 180
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .fill(.brandPink)
                    .frame(width:recSize, height: recSize)
                    .scaleEffect(isAnimated ? 1 : 1)
                    .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.4), value: isAnimated)
                Rectangle()
                    .fill(.brandBlue)
                    .frame(width:recSize, height: recSize)
                    .scaleEffect(isAnimated ? 1 : 0.8)
                    .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.3), value: isAnimated)
                Rectangle()
                    .fill(.brandYellow)
                    .frame(width:recSize, height: recSize)
                    .scaleEffect(isAnimated ? 0.8 : 0.6)
                    .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.2), value: isAnimated)
                Rectangle()
                    .fill(.brandDarkBlue)
                    .frame(width:recSize, height: recSize)
                    .scaleEffect(isAnimated ? 0.6 : 0.4)
                    .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.1), value: isAnimated)
                Rectangle()
                    .fill(.brandGreen)
                    .frame(width:recSize, height: recSize)
                    .scaleEffect(isAnimated ? 0.4 : 0.2)
                    .animation(.easeInOut(duration: 0.5).repeatForever(), value: isAnimated)
            }
            .onAppear {
                self.isAnimated.toggle()
            }
            .offset(x: recSize / 2, y: recSize / 2)
            .clipped()
            .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        .offset(x: -recSize / 4, y: -recSize / 4)
        .scaleEffect(isAnimated ? 1.04 : 1)
        .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.2), value: isAnimated)
    }
}

#Preview {
    LoadingView()
}
