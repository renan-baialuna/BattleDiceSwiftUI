//
//  MechanicSingleton.swift
//  BattleDice
//
//  Created by Renan Baialuna on 16/03/26.
//


public class MechanicSingleton {
    static let shared = MechanicSingleton()
    private init() {
    }
    
    func OrganizeOrders(orders: [[OrderProtocol]]) -> [OrderProtocol] {
        var hitOrders: [OrderProtocol] = []
        var wondOrders: [OrderProtocol] = []
        var saveOrders: [OrderProtocol] = []
        
        for i in orders.flatMap{ $0 } {
            switch i.phase {
            case .hit:
                hitOrders.append(i)
            case .wond:
                wondOrders.append(i)
            case .save:
                saveOrders.append(i)
            default:
                break
            }
        }

        var ret: [OrderProtocol] = []
        ret.append(contentsOf: hitOrders.sorted(by: { $0.priority < $1.priority }))
        ret.append(contentsOf: wondOrders.sorted(by: { $0.priority < $1.priority }))
        ret.append(contentsOf: saveOrders.sorted(by: { $0.priority < $1.priority }))
        
        return ret
    }
    
    func setInitialHitOrders(total: Int, limit: Int) -> [OrderProtocol] {
        var orderArray: [OrderProtocol] = []
        var safeLimit = Calculations.shared.checkLimits(entry: total)
        
        let rollOrder = RollHitOrder(totalDices: total)
        let preliminar = GetHitInitialResultsOrder(limit: safeLimit)
        let finalHitOrder = GetHitFinalResultsOrder()
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
        
        return orderArray
    }
    
    func setInitialWondOrders(limit: Int) -> [OrderProtocol] {
        var orderArray: [OrderProtocol] = []
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollWondOrder()
        let preliminar = GetWondInitialResultsOrder(limit: safeLimit)
        let finalHitOrder = GetWondsFinalResultsOrder()
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
        
        return orderArray
    }
    
    func setInitialSaveOrders( limit: Int) -> [OrderProtocol] {
        var orderArray: [OrderProtocol] = []
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollSaveOrder()
        let preliminar = GetSaveInitialResultsOrder(limit: safeLimit)
        let finalHitOrder = GetSaveFinalResultsOrder()
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
        
        return orderArray
    }
        
    func removeDuplicatedCrits(orders: [OrderProtocol]) -> [OrderProtocol] {
        var ret: [OrderProtocol] = []
        
        let filtered: [GetHitCritsOrder] = orders.filter {$0 is GetHitCritsOrder}  as! [GetHitCritsOrder]
        if filtered.isEmpty {
            return orders
        }
        
        var maxValue: GetHitCritsOrder
        if filtered.count > 1 {
            maxValue = filtered.max(by: {$0.limit > $1.limit})!
        } else {
            maxValue = filtered[0]
        }
        ret = orders.filter { !($0 is GetHitCritsOrder) }
        ret.append(maxValue)
        return ret
    }
    
    func getCritValue(orders: [OrderProtocol]) -> Int {
        let filtered: [GetHitCritsOrder] = orders.filter {$0 is GetHitCritsOrder}  as! [GetHitCritsOrder]
        let maxValue: GetHitCritsOrder = filtered.max(by: {$0.limit > $1.limit})!
        return maxValue.limit
    }
    
    func generateOrderFromKeywords(keywords: [KeyValue]) -> [OrderProtocol] {
        var ret: [OrderProtocol] = []
        
        for keyword in keywords {
            if keyword.key == KeywordControlerSingleton.shared.rerollHits {
                ret.append(RerollHitOrder(limit: keyword.value!))
            }
            if keyword.key == KeywordControlerSingleton.shared.criticalHits {
                ret.append(GetHitCritsOrder(limit: keyword.value!))
            }
            if keyword.key == KeywordControlerSingleton.shared.lethalHits {
                ret.append(GetHitCritsOrder(limit: 6))
                ret.append(CutLethalsOrder())
                ret.append(AddLethalsBack())
            }
            if keyword.key == KeywordControlerSingleton.shared.sustainHits {
                ret.append(GetHitCritsOrder(limit: 6))
                ret.append(AddSustainOrder())
            }
            
            if keyword.key == KeywordControlerSingleton.shared.rerollWonds {
                ret.append(RerollWondOrder(limit: keyword.value!))
            }
            if keyword.key == KeywordControlerSingleton.shared.criticalWonds {
                ret.append(GetWondCritsOrder(limit: keyword.value!))
            }
            if keyword.key == KeywordControlerSingleton.shared.devastatingWonds {
                ret.append(GetWondCritsOrder(limit: 6))
                ret.append(CutDevWondsOrder())
                ret.append(AddDevwondsBack())
            }
        }
        
        return ret
    }
    
    func generateMechanics(
        _ keywords: [KeyValue],
        diceNumber: Int,
        hitLimit: Int,
        wondLimit: Int,
        saveLimit: Int
    ) -> [OrderProtocol] {
        var ret: [OrderProtocol] = []
        ret.append(contentsOf: setInitialHitOrders(total: diceNumber, limit: hitLimit))
        ret.append(contentsOf: setInitialWondOrders(limit: wondLimit))
        ret.append(contentsOf: setInitialSaveOrders(limit: saveLimit))
        ret.append(contentsOf:generateOrderFromKeywords(keywords: keywords))
        ret = self.removeDuplicatedCrits(orders: ret)
        return ret
    }
    
    
}
