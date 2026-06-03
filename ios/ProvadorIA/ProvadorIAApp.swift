import SwiftUI

@main
struct ProvadorIAApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    init() {
        let arguments = ProcessInfo.processInfo.arguments
        if arguments.contains("--uitest-reset") {
            UserDefaults.standard.removeObject(forKey: "hasSeenOnboarding")
        }
        if arguments.contains("--skip-onboarding") || arguments.contains("--screenshot-mode") {
            UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
        }
        if arguments.contains("--screenshot-mode") {
            UserDefaults.standard.set(true, forKey: "hasAcceptedAIPhotoProcessing")
        }
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.cherryBone)
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.cherryMid)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.cherryMid)]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.cherryAccent)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.cherryAccent)]
        
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
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
            } else {
                OnboardingView()
            }
        }
    }
}
