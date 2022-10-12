import XCTest

final class iOSTestingUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testNavigateToButtonsPageGetNameAndCaptureScreenShots() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["Button"].tap()
        app.textFields["First Name"].tap()
        app.textFields["First Name"].typeText("Usha Sai")
        app.textFields["Last Name"].tap()
        app.textFields["Last Name"].typeText("Chintha")
        if app.keyboards.buttons["Return"].exists {
            app.keyboards.buttons["Return"].tap()
        }
        app.buttons["Get Name"].tap()
                XCTAssertTrue(app.staticTexts["Name : Usha Sai Chintha"].exists)

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
