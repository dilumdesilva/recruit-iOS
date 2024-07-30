//
//  ASBInterviewExerciseTests.swift
//  ASBInterviewExerciseTests
//
//  Created by ASB on 29/07/21.
//

import XCTest
@testable import ASBInterviewExercise

class ASBInterviewExerciseTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetTransactionSuccess() async {
        let mockStore = MockNetworkingStore()
        let mockResult = await mockStore.mockGetTransactionsSuccessful()
        
        let expectedFirstTransactionData = TransactionDTO(
            id: 1,
            transactionDate: "2021-08-31T15:47:10",
            summary: "Dilum mocking data here",
            debit: 9379.55, credit: 0)
        
        switch mockResult {
        case .success(let transactions):
            // Assert
            XCTAssertTrue(!transactions.isEmpty, "Transactions should not be empty")
            XCTAssertEqual(transactions[0].id, expectedFirstTransactionData.id, "First transaction's ID should be 1")
            XCTAssertEqual(transactions[0].debit, expectedFirstTransactionData.debit, "First transaction's debit should be 9379.55")
            XCTAssertEqual(transactions[0].credit, expectedFirstTransactionData.credit, "First transaction's credit should be 0")
            XCTAssertEqual(transactions[0].summary, expectedFirstTransactionData.summary, "First transaction's summary should be: Dilum mocking data here")
            XCTAssertEqual(transactions[0].transactionType, expectedFirstTransactionData.transactionType, "First transaction's summary should be: Dilum mocking data here")

        case .failure(let error):
            XCTAssertNil(error)
            break
        }
    }
    
    //TODO: COMPLETE FAILURE PATH
//    func testGetTransactionFails() async {
//        let mockStore = MockNetworkingStore()
//        let mockResult = await mockStore.mockGetTransactionsFailure()
//        
//        let expectedFirstTransactionData = TransactionDTO(
//            id: 1,
//            transactionDate: "2021-08-31T15:47:10",
//            summary: "Dilum mocking data here",
//            debit: 9379.55, credit: 0)
//        
//        switch mockResult {
//        case .success(let transactions):
//            // Assert
//            XCTAssertTrue(transactions.isEmpty, "Error loading data, transaction should be empty")
//        case .failure(let error):
//            XCTAssertNil(error)
//            break
//        }
//    }
    
}
