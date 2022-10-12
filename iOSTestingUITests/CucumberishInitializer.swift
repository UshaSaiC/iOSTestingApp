import XCTest
import Foundation
import Cucumberish

class CucumberishInitializer: NSObject {
    @objc class func setupCucumberish(){
        before({ _ in
            XCUIApplication().launch()
        })
        
        Given("App is Ready") { (args, userInfo) -> Void in            self.waitForElementToAppear(XCUIApplication().otherElements["WeatherSearchView"])
        }
        
        When("Clicked on Button") { (args, userInfo) -> Void in
            let searchBar = XCUIApplication().otherElements["SearchField"]
            searchBar.tap()
            let text = (args?[0])!
            searchBar.typeText(text)
        }
        
        When("entered First name and Last name") { (args, userInfo) -> Void in
            let text = (args?[0])!
            self.waitForElementToAppear(XCUIApplication().cells.staticTexts[text])
        }

        When("clicked on Get Name Button and Closing Keypad") { (args, userInfo) -> Void in
            let text = (args?[0])!
            XCUIApplication().cells.staticTexts[text].tap()
        }
        
        Then("name is displayed") { (args, userInfo) -> Void in            self.waitForElementToAppear(XCUIApplication().otherElements["WeatherDetailView"])
        }
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: self.getTags(), excludeTags: nil)

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
