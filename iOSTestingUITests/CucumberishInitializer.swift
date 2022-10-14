//
//  CucumberishInitializer.swift
//  iOSTestingUITests
//
//  Created by Rajeshkumar Ayyadurai on 26/09/22.
//

import Foundation
import XCTest
import Cucumberish

class CucumberishInitializer: NSObject {
    
    @objc class func setupCucumberish(){
        before({ _ in
           XCUIApplication().launch()
        })
        
        Given("I am on home screen of an app") { (args, userInfo) -> Void in      XCTAssertTrue(XCUIApplication().staticTexts["Features"].exists)
        }
        
        When("I click on Button") { (args, userInfo) -> Void in
            XCUIApplication().buttons["Button"].tap()
        }
        
        Then("I should see a heading named Button") { (args, userInfo) -> Void in
            XCTAssert(XCUIApplication().staticTexts["Button"].exists)
        }
        
        Then("I should see first name text field") { (args, userInfo) -> Void in
            XCTAssert(XCUIApplication().textFields["First Name"].exists)
        }
        
        Then("I should see last name text field") { (args, userInfo) -> Void in
            XCTAssert(XCUIApplication().textFields["Last Name"].exists)
        }
        
        Then("I should see get name button") { (args, userInfo) -> Void in
            XCTAssertTrue(XCUIApplication().buttons["Get name"].exists)
        }

        Given("I am on button screen of the app") { (args, userInfo) -> Void in
            XCUIApplication().buttons["Button"].tap()
        }
        
        When("I enter first name in text field") { (args, userInfo) -> Void in
            XCUIApplication().textFields["First Name"].tap()
            XCUIApplication().textFields["First Name"].typeText("foo")
        }
        
        When("I enter last name in text field") { (args, userInfo) -> Void in
            XCUIApplication().textFields["Last Name"].tap()
            XCUIApplication().textFields["Last Name"].typeText("bar")
        }
        
        When("I click on get name button") { (args, userInfo) -> Void in
            XCUIApplication().buttons["Get name"].tap()
        }
        
        Then("I should see first name and last name displayed splitted with whitespace") { (args, userInfo) -> Void in
//            if (XCUIApplication().staticTexts.element(boundBy: 1).exists){
            XCTAssertTrue(XCUIApplication().staticTexts["Name : foo bar"].exists)
//            }
        }
        
        let bundle = Bundle(for: CucumberishInitializer.self)
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }
    
//    class func waitForElementToAppear(_ element: XCUIElement){
//        let result = element.waitForExistence(timeout: 5)
//        guard result else {
//            XCTFail("Element does not appear")
//            return
//        }
//    }
//
//    fileprivate class func getTags() -> [String]? {
//        var itemsTags: [String]? = nil
//        for i in ProcessInfo.processInfo.arguments {
//            if i.hasPrefix("-Tags:") {
//                let newItems = i.replacingOccurrences(of: "-Tags:", with: "")
//                itemsTags = newItems.components(separatedBy: ",")
//            }
//        }
//        return itemsTags
//    }
    
}

