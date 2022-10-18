import XCTest

final class iOSTestingWithoutBaseTest: XCTestCase {
    
    func testExampleViaRecording() throws {
        
        let app = XCUIApplication()
        app.launch()
        let swipeButton = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Swipe"]/*[[".cells",".buttons[\"Horizontal Swipe\"]",".buttons[\"Swipe\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
                
        swipeButton.tap()
        swipeButton.tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Swipe").element.swipeLeft()
        
        let item1StaticText = scrollViewsQuery.otherElements.staticTexts["Item 1"]
        item1StaticText.tap()
        item1StaticText/*@START_MENU_TOKEN@*/.press(forDuration: 1.0);/*[[".tap()",".press(forDuration: 1.0);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(scrollViewsQuery.otherElements.staticTexts["Item 20"].exists)
        XCTAssertFalse(scrollViewsQuery.otherElements.staticTexts["Item 21"].exists)

        
                
    }
    
    func thisIsNotATest() {
        
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
