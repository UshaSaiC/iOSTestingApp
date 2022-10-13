import XCTest

final class iOSTestingReusableTest: iOSTestingBaseTest {
    
    func testNavigateToButtonsPageFillInDetailsAndGetName() {
        givenAppIsReady()
        whenIClickOnButton()
        andIEnterFirstName()
        andIEnterLastName()
        andIClickOnGetNameButton()
        andClosKeypad()
        thenIShouldSeeNameDisplayed()
    }
    
    func testNavigateToButtonsPageAndClickOnGetName() {
        givenAppIsReady()
        whenIClickOnButton()
        andIClickOnGetNameButton()
        thenIShouldNotSeeNameDisplayed()
    }
}

//extension iOSTestingBaseTest {
//
//    func givenAppIsReady() {
//        XCTAssertTrue(app.buttons["Button"].exists)
//    }
//
//    func whenIClickOnButton() {
//        app.buttons["Button"].tap()
//    }
//
//    func andIEnterFirstName() {
//        if app.textFields["First Name"].exists {
//            app.textFields["First Name"].tap()
//            app.textFields["First Name"].typeText("Usha Sai")
//        }
//    }

//    func andIEnterLastName() {
//        if app.textFields["Last Name"].exists {
//            app.textFields["Last Name"].tap()
//            app.textFields["Last Name"].typeText("Chintha")
//        }
//    }
//
//    func andIClickOnGetNameButton() {
//        app.buttons["Get Name"].tap()
//    }
//
//    func andClosKeypad() {
//        if app.keyboards.buttons["Return"].exists {
//            app.keyboards.buttons["Return"].tap()
//        }
//    }
//
//    func thenIShouldSeeNameDisplayed() {
//        if app.keyboards.buttons["Return"].exists {
//            app.keyboards.buttons["Return"].tap()
//        }
//        XCTAssertTrue(app.staticTexts["Name : Usha Sai Chintha"].exists)
//    }
//}


extension iOSTestingBaseTest {
    
    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given App is Ready") { _ in
            XCTAssertTrue(app.buttons["Button"].exists)
        }
    }
    
    func whenIClickOnButton() {
        XCTContext.runActivity(named: "When Clicked on Button") { _ in
            app.buttons["Button"].tap()
        }
    }
    
    func andIEnterFirstName() {
        XCTContext.runActivity(named: "When entered First name") { _ in
            if app.textFields["First Name"].exists {
                app.textFields["First Name"].tap()
                app.textFields["First Name"].typeText("Usha Sai")
            }
        }
    }
    
    func andIEnterLastName() {
        XCTContext.runActivity(named: "When entered Last name") { _ in
            if app.textFields["Last Name"].exists {
                app.textFields["Last Name"].tap()
                app.textFields["Last Name"].typeText("Chintha")
            }
        }
    }
    
    func andIClickOnGetNameButton() {
        XCTContext.runActivity(named: "When clicked on Get Name Button") { _ in
            app.buttons["Get Name"].tap()
        }
    }
    
    func andClosKeypad() {
        XCTContext.runActivity(named: "When Closing Keypad") { _ in
            if app.keyboards.buttons["Return"].exists {
                app.keyboards.buttons["Return"].tap()
            }
        }
    }
    
    func thenIShouldSeeNameDisplayed() {
        XCTContext.runActivity(named: "Then name is displayed") { _ in
            XCTAssertTrue(app.staticTexts["Name : Usha Sai Chintha"].exists)
        }
    }
    
    func thenIShouldNotSeeNameDisplayed() {
        XCTContext.runActivity(named: "Then name is not displayed") { _ in
            XCTAssertEqual(app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'Name'")).count, 0)
        }
    }
}
