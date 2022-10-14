////
////  BDDTest.swift
////  iOSTestingUITests
////
////  Created by Rajeshkumar Ayyadurai on 26/09/22.
////
//
//import Foundation
//import XCTest
//
//class BDDTest : iOSTestingUIBaseClass{
//
//    func testUserDisplaysFullNameOnButtonView(){
//        givenAppIsReady()
//        whenUserNavigatesToButtonView()
//        whenUserDisplaysFullName()
//        thenUserShouldReturnToMainScreen()
//    }
//}
//
//extension iOSTestingUIBaseClass{
//
//    func givenAppIsReady() {
//        XCTContext.runActivity(named: "Given app is ready") { _ in
//            XCTAssertTrue(app.staticTexts["Features"].exists)
//        }
//    }
//
//    func whenUserNavigatesToButtonView() {
//        XCTContext.runActivity(named: "When user navigates to Button view") { _ in
//            app.buttons["Button"].tap()
//            XCTAssertTrue(app.staticTexts["Button"].exists)
//        }
//    }
//
//    func whenUserDisplaysFullName() {
//        XCTContext.runActivity(named: "When user displays his/her full name") { _ in
//            app.textFields["First Name"].tap()
//            app.textFields["First Name"].typeText("hello")
//            app.textFields["Last Name"].tap()
//            app.textFields["Last Name"].typeText("world!")
//            app.buttons["Get name"].tap()
//            XCTAssertTrue(app.staticTexts["Name : hello world!"].exists)
//        }
//    }
//
//    func thenUserShouldReturnToMainScreen() {
//        XCTContext.runActivity(named: "Then user returns to main screen") { _ in
//            app.buttons["Features"].tap()
//            XCTAssertTrue(app.staticTexts["Features"].exists)
//        }
//    }
//}
//
//
