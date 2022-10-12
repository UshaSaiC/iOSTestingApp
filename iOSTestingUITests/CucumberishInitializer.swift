import XCTest
import Foundation
import Cucumberish

class CucumberishInitializer: NSObject {
    @objc class func setupCucumberish(){
        before({ _ in
            XCUIApplication().launch()
        })
        
        Given("App is Ready") { (args, userInfo) -> Void in
            self.waitForElementToAppear(XCUIApplication().buttons["Button"])
            XCTAssertTrue(XCUIApplication().buttons["Button"].exists)
        }
        
        When("Clicked on Button") { (args, userInfo) -> Void in
            XCUIApplication().buttons["Button"].tap()
        }
        
        When("entered First name and Last name") { (args, userInfo) -> Void in
            if XCUIApplication().textFields["First Name"].exists {
                XCUIApplication().textFields["First Name"].tap()
                XCUIApplication().textFields["First Name"].typeText("Usha Sai")
            }
            if XCUIApplication().textFields["Last Name"].exists {
                XCUIApplication().textFields["Last Name"].tap()
                XCUIApplication().textFields["Last Name"].typeText("Chintha")
            }
        }
        
        When("clicked on Get Name Button and Closing Keypad") { (args, userInfo) -> Void in
            XCUIApplication().buttons["Get Name"].tap()
            if XCUIApplication().keyboards.buttons["Return"].exists {
                XCUIApplication().keyboards.buttons["Return"].tap()
            }
        }
        
        Then("name is displayed") { (args, userInfo) -> Void in
            XCTAssertTrue(XCUIApplication().staticTexts["Name : Usha Sai Chintha"].exists)
        }
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Feature", from: bundle, includeTags: self.getTags(), excludeTags: nil)
        
    }
    
    class func waitForElementToAppear(_ element: XCUIElement){
        let result = element.waitForExistence(timeout: 5)
        guard result else {
            XCTFail("Element does not appear")
            return
        }
    }
    
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
