
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            homeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
        }
    }
}

#Preview {
    ContentView()
}
