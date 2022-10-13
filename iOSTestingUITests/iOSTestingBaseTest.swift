import Foundation
import XCTest

class iOSTestingBaseTest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func XCTAsyncAssert(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout: 10)
        if isElementExist {
            XCTAssertTrue(element.exists)
        }
    }
}
