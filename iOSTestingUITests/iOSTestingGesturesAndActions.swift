//
//  iOSTestingGesturesAndActions.swift
//  iOSTestingUITests
//
//  Created by Usha Sai Chintha on 13/10/22.
//

import XCTest

final class iOSTestingGesturesAndActions: iOSTestingBaseTest {
    
    func testNavigateToVerticalScrollView() {
        
        // Tap gesture
        app.buttons["Scroll"].tap()
        
        // Swipe Up gesture
        app.staticTexts["Item 3"].swipeUp()
        
        // Swipe Down gesture
        app.staticTexts["Item 3"].swipeDown()
        
        // Press gesture
        app.staticTexts["Item 1"].press(forDuration: 2)
        
    }
}

