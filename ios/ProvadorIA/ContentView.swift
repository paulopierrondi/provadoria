import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    init() {
        let arguments = ProcessInfo.processInfo.arguments
        let initialTab: Int
        if arguments.contains("--screenshot-tryon") {
            initialTab = 1
        } else if arguments.contains("--screenshot-feed") {
            initialTab = 2
        } else if arguments.contains("--screenshot-profile") {
            initialTab = 3
        } else {
            initialTab = 0
        }
        _selectedTab = State(initialValue: initialTab)
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Capa", systemImage: "book.closed")
            }
            .tag(0)
            
            NavigationStack {
                TryOnView()
            }
            .tabItem {
                Label("Ensaio", systemImage: "camera.viewfinder")
            }
            .tag(1)
            
            NavigationStack {
                FeedView()
            }
            .tabItem {
                Label("Arquivo", systemImage: "archivebox")
            }
            .tag(2)
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Eu", systemImage: "person")
            }
            .tag(3)
        }
        .tint(.cherryAccent)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Color.cherryBone)
            
            appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.cherryMid)
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor(Color.cherryMid),
                .font: UIFont.systemFont(ofSize: 11, weight: .medium)
            ]
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.cherryAccent)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                .foregroundColor: UIColor(Color.cherryAccent),
                .font: UIFont.systemFont(ofSize: 11, weight: .semibold)
            ]
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            
            let navAppearance = UINavigationBarAppearance()
            navAppearance.configureWithOpaqueBackground()
            navAppearance.backgroundColor = UIColor(Color.cherryBone)
            navAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.cherryInk)]
            navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.cherryInk)]
            
            UINavigationBar.appearance().standardAppearance = navAppearance
            UINavigationBar.appearance().compactAppearance = navAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        }
    }
}

#Preview {
    ContentView()
}
