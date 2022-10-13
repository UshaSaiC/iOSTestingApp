import XCTest
import Foundation
import Cucumberish

class CucumberishInitializer: NSObject {
    @objc class func setupCucumberish(){
        before({ _ in
            XCUIApplication().launch()
        })
        
        Given("App is Ready") { (args, userInfo) -> Void in
            XCTAssertTrue(XCUIApplication().buttons["Button"].exists)
        }
        
        When("I Click on Button") { (args, userInfo) -> Void in
            XCUIApplication().buttons["Button"].tap()
        }
        
        MatchAll("I Enter First Name") { (args, userInfo) -> Void in
            //   if XCUIApplication().textFields["First Name"].waitForExistence(timeout: 10) {
            if XCUIApplication().textFields["First Name"].exists {
                XCUIApplication().textFields["First Name"].tap()
                XCUIApplication().textFields["First Name"].typeText("Usha Sai")
            }
            //            }
        }
        
        MatchAll("I Enter Last Name") { (args, userInfo) -> Void in
            if XCUIApplication().textFields["Last Name"].exists {
                XCUIApplication().textFields["Last Name"].tap()
                XCUIApplication().textFields["Last Name"].typeText("Chintha")
            }
        }
        
        
        MatchAll("I Click on Get Name Button") { (args, userInfo) -> Void in
            //            let result = waiterResultWithExpectation(XCUIApplication().buttons["Get Name"])
            //
            //            if result == .completed {
            XCUIApplication().buttons["Get Name"].tap()
            //            }
        }
        
        MatchAll("Close Keypad") { (args, userInfo) -> Void in
            if XCUIApplication().keyboards.buttons["Return"].exists {
                XCUIApplication().keyboards.buttons["Return"].tap()
            }
        }
        
        Then("I Should See Name being Displayed") { (args, userInfo) -> Void in
            XCTAssertTrue(XCUIApplication().staticTexts["Name : Usha Sai Chintha"].exists)
        }
        
        Then("I Should Not See Name being Displayed") { (args, userInfo) -> Void in
            XCTAssertEqual(XCUIApplication().staticTexts.containing(NSPredicate(format: "label CONTAINS 'Name'")).count, 0)
        }
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: self.getTags(), excludeTags: nil)
        
    }
    
    //    class func waiterResultWithExpectation(_ element: XCUIElement) -> XCTWaiter.Result {
    //        let expectation = XCTestExpectation(description: "Waiting for Get Name Button existance")
    //        if element.exists {
    //            expectation.fulfill()
    //        }
    //        let result = XCTWaiter().wait(for: [expectation], timeout: 5)
    //        return result
    //    }
    
    fileprivate class func getTags() -> [String]? {
        var itemsTags: [String]? = nil
        for i in ProcessInfo.processInfo.arguments {
            if i.hasPrefix("-Tags:") {
                let newItems = i.replacingOccurrences(of: "-Tags:", with: "")
                itemsTags = newItems.components(separatedBy: ",")
            }
        }
        return itemsTags
    }
    
}
