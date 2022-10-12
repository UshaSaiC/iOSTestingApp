import XCTest

final class iOSTestingWithBaseTest: iOSTestingBaseTest {
    
    func testNavigateToButtonsPageAndGetName() {
        app.buttons["Button"].tap()
        app.textFields["First Name"].tap()
        app.textFields["First Name"].typeText("Usha Sai")
        app.textFields["Last Name"].tap()
        app.textFields["Last Name"].typeText("Chintha")
        if app.keyboards.buttons["Return"].exists {
            app.keyboards.buttons["Return"].tap()
        }
        app.buttons["Get Name"].tap()
                XCTAssertTrue(app.staticTexts["Name : Usha Sai Chintha"].exists)
        
    }
}
