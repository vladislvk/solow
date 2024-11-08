import SwiftUI

struct cardView: View {
    @State private var offset = CGSize.zero
    @State private var isSwiped = false

    var body: some View {
        ZStack {
            Color.white
                .frame(width: 300, height: 500)
                .cornerRadius(20)
                .shadow(radius: 10)
                .overlay(
                    Text("Swipe Me")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                )
                .offset(x: offset.width, y: offset.height)
                .rotationEffect(.degrees(Double(offset.width / 20)))
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            offset = gesture.translation
                        }
                        .onEnded { _ in
                            if offset.width > 150 {
                                offset = CGSize(width: 500, height: 0)
                                isSwiped = true
                            } else if offset.width < -150 {
                                offset = CGSize(width: -500, height: 0)
                                isSwiped = true
                            } else {
                                offset = .zero
                            }
                        }
                )
                .animation(.spring(), value: offset)
        }
        .onAppear {
            if isSwiped {
                offset = .zero
                isSwiped = false
            }
        }
    }
}

struct SwipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView()
    }
}
