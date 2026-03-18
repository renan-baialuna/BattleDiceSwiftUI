//
//  MechanicSingletonTests.swift
//  BattleDice
//
//  Created by Renan Baialuna on 16/03/26.
//

import Testing
import XCTest

struct MechanicSingletonTests {

    let singleton: MechanicSingleton = MechanicSingleton.shared
    
    @Test func initialHitTest() async throws {
        let pitry = singleton.setInitialHitOrders(total: 10, limit: 4)
        #expect(pitry.count == 3)
    }
    
    @Test func initialWondTest() async throws {
        let pitry = singleton.setInitialWondOrders(limit: 3)
        #expect(pitry.count == 3)
    }
    
    @Test func initialSaveTest() async throws {
        let pitry = singleton.setInitialSaveOrders(limit: 3)
        #expect(pitry.count == 3)
    }
    
    @Test func removeDuplicateGetSmaller() async throws {
        let base: [OrderProtocol] = [
            GetHitCritsOrder(limit: 4),
            GetHitCritsOrder(limit: 5),
            GetHitCritsOrder(limit: 6)
        ]
        let pitry = singleton.removeDuplicatedCrits(orders: base)
        #expect(pitry.count == 1)
        #expect(singleton.getCritValue(orders: pitry) == 4)
    }
    
    @Test func removeDuplicateGetList() async throws {
        let rollOrder = RollHitOrder(totalDices: 10)
        let preliminar = GetHitInitialResultsOrder(limit: 5)
        let finalHitOrder = GetHitFinalResultsOrder()
        let base: [OrderProtocol] = [
            rollOrder,
            GetHitCritsOrder(limit: 5),
            preliminar,
            GetHitCritsOrder(limit: 6)
        ]
        let pitry = singleton.removeDuplicatedCrits(orders: base)
        #expect(pitry.count == 3)
        #expect(singleton.getCritValue(orders: pitry) == 5)
    }
    
//MARK: keywords mechanic
    @Test func keywordConversorRerollHit() async throws {
        let rerollKey = KeyValue(key: KeywordControlerSingleton.shared.rerollHits, value: 3)
        let pitry = singleton.generateOrderFromKeywords(keywords: [rerollKey])
        #expect(pitry.contains(where: { order in
            order is RerollHitOrder
        }))
        #expect(pitry.count == 10)
    }
    
    @Test func keywordConversorRerollWond() async throws {
        let rerollKey = KeyValue(key: KeywordControlerSingleton.shared.rerollWonds, value: 3)
        let pitry = singleton.generateOrderFromKeywords(keywords: [rerollKey])
        #expect(pitry.contains(where: { order in
            order is RerollWondOrder
        }))
        #expect(pitry.count == 10)
    }
    
    @Test func keywordConversorLethalHits() async throws {
        let rerollKey = KeyValue(key: KeywordControlerSingleton.shared.lethalHits, value: 6)
        let pitry = singleton.generateOrderFromKeywords(keywords: [rerollKey])
        #expect(pitry.contains(where: { order in
            order is AddLethalsBack
        }))
        #expect(pitry.contains(where: { order in
            order is CutLethalsOrder
        }))
        #expect(pitry.count == 12)
    }
    
    @Test func keywordConversorSustain() async throws {
        let rerollKey = KeyValue(key: KeywordControlerSingleton.shared.lethalHits, value: 6)
        let pitry = singleton.generateOrderFromKeywords(keywords: [rerollKey])
        #expect(pitry.contains(where: { order in
            order is AddSustainOrder
        }))
        #expect(pitry.contains(where: { order in
            order is GetHitCritsOrder
        }))
        #expect(pitry.count == 12)
    }
    
    @Test func keywordConversorSustainWithCrits() async throws {
        let crits = KeyValue(key: KeywordControlerSingleton.shared.criticalHits, value: 4)
        let rerollKey = KeyValue(key: KeywordControlerSingleton.shared.lethalHits, value: 6)
        let pitry = singleton.generateOrderFromKeywords(keywords: [rerollKey, crits])
        #expect(hasOrder(tipo: AddLethalsBack.self, array: pitry))
        #expect(hasOrder(tipo: GetHitCritsOrder.self, array: pitry))
        #expect(pitry.count == 4)
        let pitryMinus = singleton.removeDuplicatedCrits(orders: pitry)
        #expect(pitryMinus.count == 3)
    }
    
    @Test func keywordConversorDevwonds() async throws {
        let devKeys = KeyValue(key: KeywordControlerSingleton.shared.devastatingWonds, value: 6)
        let pitry = singleton.generateOrderFromKeywords(keywords: [devKeys])
        #expect(hasOrder(tipo: AddDevwondsBack.self, array: pitry))
        #expect(!hasOrder(tipo: GetHitCritsOrder.self, array: pitry))
        #expect(pitry.count == 3)
    }
    
    @Test func mechanicConstructorTest() async throws {
        let mechs = singleton.generateMechanics([], diceNumber: 10, hitLimit: 3, wondLimit: 4, saveLimit: 5)
        
        #expect(mechs.count == 9)
    }
    
    @Test func mechanicConstructorCritHitsTest() async throws {
        let keyValue = KeyValue(key: KeywordControlerSingleton.shared.criticalHits, value: 5)
        let mechs = singleton.generateMechanics([keyValue], diceNumber: 10, hitLimit: 3, wondLimit: 4, saveLimit: 5)
        
        #expect(mechs.count == 10)
    }
    
    @Test func mechanicConstructor2CritHitsTest() async throws {
        let keyValue1 = KeyValue(key: KeywordControlerSingleton.shared.criticalHits, value: 5)
        let keyValue2 = KeyValue(key: KeywordControlerSingleton.shared.criticalHits, value: 4)
        let mechs = singleton.generateMechanics([keyValue1, keyValue2], diceNumber: 10, hitLimit: 3, wondLimit: 4, saveLimit: 5)
        
        #expect(mechs.count == 10)
    }
    
    func containsExactType<T>(in array: [Any], type: T.Type) -> Bool {
        return array.contains { Swift.type(of: $0) == type }
    }
    
    func hasOrder<T>(tipo: T.Type, array: [OrderProtocol]) -> Bool {
        for order in array {
            if order is T {
                return true
            }
        }
        print("false")
        return false
    }
    
}
