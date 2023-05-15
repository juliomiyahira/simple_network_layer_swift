import Foundation
import XCTest

@testable import NetworkCore

internal final class NetworkCoreTests: XCTestCase {

    internal var sut: NetworkService!

    override internal func setUp() {
        super.setUp()
        sut = NetworkService()
    }
    
    override internal func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    internal func testAPiSuccess() {
        let expectation = expectation(description: "wait_api_callback")
        var expectError: Error? = nil
        var expectModel: [Model]? = nil
        sut.request(router: SampleRouter.allPhotos) { (result: Result<[Model], Error>) in
            switch result {
            case let .failure(error):
                expectError = error
                expectation.fulfill()
            case let .success(model):
                expectModel = model
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10)
        XCTAssertNotNil(expectModel)
        XCTAssertNil(expectError)
    }

    internal func testApiError() {
        let expectation = expectation(description: "wait_api_callback")
        var expectError: Error? = nil
        var expectModel: [Model]? = nil
        sut.request(router: SampleRouter.allPhotosTwo) { (result: Result<[Model], Error>) in
            switch result {
            case let .failure(error):
                expectError = error
                expectation.fulfill()
            case let .success(model):
                expectModel = model
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10)
        XCTAssertNil(expectModel)
        XCTAssertEqual(expectError?.localizedDescription, NetworkError.decoding.localizedDescription)
    }

}
