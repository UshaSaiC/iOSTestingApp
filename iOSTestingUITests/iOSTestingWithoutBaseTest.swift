import XCTest

final class iOSTestingWithoutBaseTest: XCTestCase {
    
    func testExampleViaRecording() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Swipe"]/*[[".cells",".buttons[\"Horizontal Swipe\"]",".buttons[\"Swipe\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.staticTexts["Item 1"].swipeRight()
        elementsQuery.staticTexts["Item 2"].swipeLeft()
        elementsQuery.staticTexts["Item 14"].tap()
        XCTAssertTrue(elementsQuery.staticTexts["Item 20"].exists)
    }
    
    func testNavigateToButtonsPageAndGetName() {
        let app = XCUIApplication()
        app.launch()
        
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
