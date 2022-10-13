import XCTest

final class iOSTestingLocatorStrategies: XCTestCase {
    
    func testForDifferentLocatorStarategies() {
        let app = XCUIApplication()
        app.launch()
        
        // Accessibility ID
        app.buttons["Swipe"].tap()
        
        // Label
        XCTAssertTrue(app.staticTexts["Item 4"].exists)
        
        // First Match
        app.buttons.firstMatch.tap()
        
        // Index
        app.buttons.element(boundBy: 2).tap()
        
        app.buttons["Features"].tap()
        
        // Subview
        app.collectionViews.descendants(matching: .button).element(boundBy: 2).tap()
    }
}
