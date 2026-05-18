import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Início")
            }
            .tag(0)
            
            NavigationStack {
                TryOnView()
            }
            .tabItem {
                Image(systemName: "camera.viewfinder")
                Text("Try-On")
            }
            .tag(1)
            
            NavigationStack {
                FeedView()
            }
            .tabItem {
                Image(systemName: "photo.stack")
                Text("Feed")
            }
            .tag(2)
            
            NavigationStack {
                ReviewsView(tryOnId: "1")
            }
            .tabItem {
                Image(systemName: "star.bubble")
                Text("Reviews")
            }
            .tag(3)
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
            .tag(4)
        }
        .tint(.appAccentCyan)
    }
}

#Preview {
    ContentView()
}
