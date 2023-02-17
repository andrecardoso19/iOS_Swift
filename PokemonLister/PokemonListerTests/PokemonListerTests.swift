//
//  PokemonListerTests.swift
//  PokemonListerTests
//
//  Created by andre.aragao on 26/01/23.
//

import XCTest
@testable import PokemonLister

private extension PokemonListerTests {
    final class PokemonServicingMock: PokemonServicing {
        var fetchPokemonListsResult: (Result<Pokedex, PokedexError>)?
        
        func fetchPokemonList(completion: @escaping (Result<Pokedex, PokedexError>) -> Void) {
            if let result = fetchPokemonListsResult {
                completion(result)
            }
        }
    }
    
    final class ErrorDelegateSpy: ErrorDelegate {
        private(set) var onErrorCallsCount = 0
        func onError(error: PokedexError) {
            onErrorCallsCount += 1
        }
    }
    
    final class SuccessDelegateSpy: PokemonListViewModelDelegate {
        private(set) var onSuccessCallsCount = 0
        func onSuccess() {
            onSuccessCallsCount += 1
        }
    }
    
    typealias Doubles = (
        serviceMock: PokemonServicingMock,
        errorDelegateSpy: ErrorDelegateSpy,
        successDelegateSpy: SuccessDelegateSpy
    )
    
//    system under test
    func makeSUT() -> (PokemonListViewModel, Doubles) {
        let serviceMock = PokemonServicingMock()
        let errorDelegateSpy = ErrorDelegateSpy()
        let successDelegateSpy = SuccessDelegateSpy()
        
        let sut = PokemonListViewModel(service: serviceMock)
        sut.errorDelegate = errorDelegateSpy
        sut.delegate = successDelegateSpy
        
        let doubles:Doubles = (
            serviceMock,
            errorDelegateSpy,
            successDelegateSpy
        )
        
        return(sut, doubles)
    }
}

final class PokemonListerTests: XCTestCase {
    func testFetchPokemonList_WhenFetchContactsError_ShouldCallDelegateOnError() {
        let (sut, doubles) = makeSUT()
        doubles.serviceMock.fetchPokemonListsResult = .failure(PokedexError.requestError(PokedexError.httpError))
        
        sut.getPokemonList()
        
        XCTAssertEqual(doubles.errorDelegateSpy.onErrorCallsCount, 1)
    }
    
    func testFetchPokemonList_WhenFetchContactsSuccess_ShouldCallDelegateOnSuccess() {
        let (sut, doubles) = makeSUT()
        doubles.serviceMock.fetchPokemonListsResult = .success(sut.pokedex)
        
        sut.getPokemonList()
        
        XCTAssertEqual(doubles.successDelegateSpy.onSuccessCallsCount, 1)
    }
}
