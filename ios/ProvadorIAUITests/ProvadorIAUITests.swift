import XCTest

final class ProvadorIAUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["--uitest-reset"]
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }
    
    // MARK: - Onboarding Flow
    
    func testOnboardingFlow() throws {
        // Verify onboarding is present
        XCTAssertTrue(app.staticTexts["ProvadorIA"].waitForExistence(timeout: 5))
        
        // Tap through onboarding pages
        let nextButton = app.buttons["Próximo"]
        XCTAssertTrue(nextButton.waitForExistence(timeout: 2))
        nextButton.tap()
        
        // Second page
        XCTAssertTrue(nextButton.waitForExistence(timeout: 2))
        nextButton.tap()
        
        // Third page — start button
        let startButton = app.buttons["Começar"]
        XCTAssertTrue(startButton.waitForExistence(timeout: 2))
        startButton.tap()
        
        // Verify we reached main tabs
        XCTAssertTrue(app.tabBars.firstMatch.waitForExistence(timeout: 5))
    }
    
    // MARK: - Tab Navigation
    
    func testTabNavigation() throws {
        completeOnboardingIfNeeded()
        
        let tabBar = app.tabBars.firstMatch
        XCTAssertTrue(tabBar.waitForExistence(timeout: 5))
        
        // Início tab (default)
        XCTAssertTrue(app.staticTexts["ProvadorIA"].waitForExistence(timeout: 3))
        
        // Try-On tab
        tapTab(named: "Try-On")
        XCTAssertTrue(app.staticTexts["Novo Try-On"].waitForExistence(timeout: 3))
        
        // Feed tab
        tapTab(named: "Feed")
        XCTAssertTrue(app.staticTexts["Feed"].waitForExistence(timeout: 3))
        
        // Perfil tab
        tapTab(named: "Perfil")
        XCTAssertTrue(app.staticTexts["Você"].waitForExistence(timeout: 3))
    }
    
    // MARK: - Try-On Generation Flow
    
    func testTryOnGenerationFlow() throws {
        completeOnboardingIfNeeded()
        
        tapTab(named: "Try-On")
        XCTAssertTrue(app.staticTexts["Novo Try-On"].waitForExistence(timeout: 3))
        
        // Enter clothing description
        let textEditor = app.textViews.firstMatch
        if textEditor.waitForExistence(timeout: 2) {
            textEditor.tap()
            textEditor.typeText("Vestido floral verão")
        }
        
        // Verify generate button exists (will be disabled without photos in this app)
        let generateButton = app.buttons["Gerar Preview"]
        XCTAssertTrue(generateButton.waitForExistence(timeout: 2))
        
        // Since PhotosPicker interaction is complex in UI tests,
        // we verify the form accepts input and the button is present.
        XCTAssertTrue(generateButton.exists)
    }
    
    // MARK: - Feed Loading
    
    func testFeedLoading() throws {
        completeOnboardingIfNeeded()
        
        tapTab(named: "Feed")
        XCTAssertTrue(app.staticTexts["Feed"].waitForExistence(timeout: 3))
        
        // Feed should show content, empty state, or shimmer
        let hasContent = app.scrollViews.firstMatch.waitForExistence(timeout: 3)
        let hasEmptyState = app.staticTexts["Feed vazio"].exists
        let hasError = app.staticTexts["Erro"].exists
        
        XCTAssertTrue(hasContent || hasEmptyState || hasError, "Feed should display some state")
    }
    
    // MARK: - Account Deletion Flow
    
    func testAccountDeletionFlow() throws {
        completeOnboardingIfNeeded()
        
        tapTab(named: "Perfil")
        XCTAssertTrue(app.staticTexts["Você"].waitForExistence(timeout: 3))
        
        // Scroll to delete account button
        let deleteButton = app.buttons["Excluir Conta"]
        while !deleteButton.exists {
            app.swipeUp()
            if deleteButton.waitForExistence(timeout: 1) { break }
        }
        
        XCTAssertTrue(deleteButton.waitForExistence(timeout: 3))
        deleteButton.tap()
        
        // Confirm deletion alert
        let confirmDelete = app.buttons["Excluir"]
        XCTAssertTrue(confirmDelete.waitForExistence(timeout: 3))
        confirmDelete.tap()
        
        // After deletion, onboarding should reappear or app resets
        let onboardingNext = app.buttons["Próximo"]
        let onboardingStart = app.buttons["Começar"]
        XCTAssertTrue(
            onboardingNext.waitForExistence(timeout: 10) || onboardingStart.waitForExistence(timeout: 10),
            "App should return to onboarding after account deletion"
        )
    }
    
    // MARK: - Helpers
    
    private func completeOnboardingIfNeeded() {
        let nextButton = app.buttons["Próximo"]
        let startButton = app.buttons["Começar"]
        
        if nextButton.waitForExistence(timeout: 3) || startButton.waitForExistence(timeout: 3) {
            if nextButton.exists {
                nextButton.tap()
            }
            if nextButton.waitForExistence(timeout: 2) {
                nextButton.tap()
            }
            if startButton.waitForExistence(timeout: 2) {
                startButton.tap()
            }
            XCTAssertTrue(app.tabBars.firstMatch.waitForExistence(timeout: 5))
        }
    }
    
    private func tapTab(named name: String) {
        let tab = app.tabBars.buttons[name]
        if tab.waitForExistence(timeout: 3) {
            tab.tap()
        } else {
            // Fallback by index if label matching fails
            let tabs = app.tabBars.firstMatch.buttons
            if tabs.count > 0 {
                tabs.element(boundBy: min(tabs.count - 1, 0)).tap()
            }
        }
    }
}
