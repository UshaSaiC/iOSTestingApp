import XCTest

final class iOSTestingWithBaseTest: iOSTestingBaseTest {
    
    func testNavigateToButtonsPageAndGetName() {
        XCTAsyncAssert(app.buttons["Button"])
        app.buttons["Button"].tap()
        if app.textFields["First Name"].exists {
            app.textFields["First Name"].tap()
            app.textFields["First Name"].typeText("Usha Sai")
        }
        if app.textFields["Last Name"].exists {
            app.textFields["Last Name"].tap()
            app.textFields["Last Name"].typeText("Chintha")
        }
        if app.keyboards.buttons["Return"].exists {
            app.keyboards.buttons["Return"].tap()
        }
        app.buttons["Get Name"].tap()
                XCTAssertTrue(app.staticTexts["Name : Usha Sai Chintha"].exists)
    }
}
