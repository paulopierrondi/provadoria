import SwiftUI

@main
struct ProvadorIAApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.neuralVoid)
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.electricCyan)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.electricCyan)]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = UIColor(Color.neuralVoid)
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().compactAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
                    .preferredColorScheme(.dark)
            } else {
                OnboardingView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
