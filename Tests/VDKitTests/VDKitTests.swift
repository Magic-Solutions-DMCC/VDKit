import XCTest
@testable import VDKit

final class VDKitTests: XCTestCase {
	
	static var allTests = [
		("testCollection", testCollection),
		("testChain", testChain)
	]
	
	func testCollection() {
		var array = [1, 2, 3]
		XCTAssert(array[safe: 0] == 1)
		XCTAssert(array[safe: 3] == nil)
		array[safe: 0] = 0
		XCTAssert(array == [0, 2, 3])
		array[safe: 1] = nil
		XCTAssert(array == [0, 3])
		array[safe: 2] = 1
		XCTAssert(array == [0, 3, 1])
	}
	
	func testChain() {
		let button = UIButton().chain
			.layer.cornerRadius(43)
			.backgroundColor(.red)
			.tintColor(.black)
			.clipsToBounds(true)
			.isHidden(false)
			.isUserInteractionEnabled(true)
			.titleEdgeInsets(.zero)
			.frame.size(.zero)
			.apply()
		
		XCTAssert(button.layer.cornerRadius == 43)
		XCTAssert(button.backgroundColor == .red)
		XCTAssert(button.tintColor == .black)
		XCTAssert(button.clipsToBounds == true)
		XCTAssert(button.isHidden == false)
		XCTAssert(button.isUserInteractionEnabled == true)
		XCTAssert(button.titleEdgeInsets == .zero)
		XCTAssert(button.frame.size == .zero)
	}
}
