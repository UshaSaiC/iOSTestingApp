import XCTest

final class iOSTestingReusableTest: iOSTestingBaseTest {
    
    func testNavigateToButtonsPageAndGetName() {
        givenAppIsReady()
        whenClickedOnButton()
        whenEnteredFirstAndLastName()
        whenClickedOnGetNameButtonAndClosedKeypad()
        thenShouldSeeNameDisplayed()
    }
}

//extension iOSTestingBaseTest {
//
//    func givenAppIsReady() {
//        XCTAssertTrue(app.buttons["Button"].exists)
//    }
//
//    func whenClickedOnButton() {
//        app.buttons["Button"].tap()
//    }
//
//    func whenEnteredFirstAndLastName() {
//        if app.textFields["First Name"].exists {
//            app.textFields["First Name"].tap()
//            app.textFields["First Name"].typeText("Usha Sai")
//        }
//        if app.textFields["Last Name"].exists {
//            app.textFields["Last Name"].tap()
//            app.textFields["Last Name"].typeText("Chintha")
//        }
//    }
//
//    func whenClickedOnGetNameButtonAndClosedKeypad() {
//        app.buttons["Get Name"].tap()
//                   if app.keyboards.buttons["Return"].exists {
//                        app.keyboards.buttons["Return"].tap()
//                    }
//    }
//
//    func thenShouldSeeNameDisplayed() {
//        if app.keyboards.buttons["Return"].exists {
//            app.keyboards.buttons["Return"].tap()
//        }
//        XCTAssertTrue(app.staticTexts["Name : Usha Sai Chintha"].exists)
//    }
//}


extension iOSTestingBaseTest {
    
    func givenAppIsReady() {
        XCTContext.runActivity(named: "Given App is Ready") { _ in
            //            XCTAssertTrue(app.buttons["Button"].exists)
            
            
            //            let buttonExist = app.buttons["Button"].waitForExistence(timeout: 10)
            //            if buttonExist {
            //                XCTAssertTrue(app.buttons["Button"].exists)
            //        }
            
            XCTAsyncAssert(app.buttons["Button"])
        }
    }
    
    func whenClickedOnButton() {
        XCTContext.runActivity(named: "When Clicked on Button") { _ in
            app.buttons["Button"].tap()
        }
    }
    
    func whenEnteredFirstAndLastName() {
        XCTContext.runActivity(named: "When entered First name and Last name") { _ in
            if app.textFields["First Name"].exists {
                app.textFields["First Name"].tap()
                app.textFields["First Name"].typeText("Usha Sai")
            }
            if app.textFields["Last Name"].exists {
                app.textFields["Last Name"].tap()
                app.textFields["Last Name"].typeText("Chintha")
            }
        }
    }
    
    func whenClickedOnGetNameButtonAndClosedKeypad() {
        XCTContext.runActivity(named: "When clicked on Get Name Button and Closing Keypad") { _ in
            app.buttons["Get Name"].tap()
                       if app.keyboards.buttons["Return"].exists {
                            app.keyboards.buttons["Return"].tap()
                        }
        }
    }
    
    func thenShouldSeeNameDisplayed() {
        XCTContext.runActivity(named: "Then name is displayed") { _ in
            XCTAssertTrue(app.staticTexts["Name : Usha Sai Chintha"].exists)
        }
    }
}
