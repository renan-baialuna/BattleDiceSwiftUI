//
//  DiceSet.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/03/26.
//

struct DiceResult {
    let totalResult: [Int]
    
    init(dices: [Dice]) {
        var total: [Int] = Array(repeating: 0, count: 6)
        for dice in dices {
            let index = dice.value - 1
            total[index] += 1
        }
        self.totalResult = total
    }
    
    func calculateTotalD6() -> Int {
        var ret: Int = 0
        for (index, total) in totalResult.enumerated() {
            let multiplier = index + 1
            ret += total * multiplier
        }
        return ret
    }
    
    func calculateTotalD3() -> Int {
        var ret: Int = 0
        for (index, total) in totalResult.enumerated()  {
            switch index {
            case 0, 1:
                ret += total
            case 2, 3:
                ret += total * 2
            default:
                ret += total * 3
            }
        }
        return ret
    }
    
    func countAbove(limit: Int) -> Int {
        var ret: Int = 0
        for (index, total) in totalResult.enumerated() {
            if index + 1 >= limit {
                ret += total
            }
        }
        return ret
    }
    
}

struct DiceSet {
    let dices: [Dice]
    let totalResult: [Int]
    let diceResult: DiceResult
    
    
//MARK: initsx
    init(totalDices: Int) {
        var total: [Int] = Array(repeating: 0, count: 6)
        var dices: [Dice] = []
        if totalDices > 0 {
            for i in 1...totalDices {
                let dice = Dice()
                let index = dice.value - 1
                total[index] += 1
                dices.append(dice)
            }
        }
        self.diceResult = DiceResult(dices: dices)
        self.totalResult = total
        self.dices =  dices
        print("roll")
        self.printResults()
    }
    
    init(initialSet: DiceSet, limit: Int) {
        var total: [Int] = Array(repeating: 0, count: 6)
        var dices: [Dice] = []
        for i in initialSet.dices {
            if i.value > limit {
                dices.append(i)
                let index = i.value - 1
                total[index] += 1
            } else {
                let dice = Dice(reroll: true)
                let index = dice.value - 1
                total[index] += 1
                dices.append(dice)
            }
        }
        self.totalResult = total
        self.dices =  dices
        
        print("re-roll")
        self.diceResult = DiceResult(dices: dices)
        self.printResults()
    }
    
    init(dices: [Dice]) {
        var total: [Int] = Array(repeating: 0, count: 6)
        var internalDices: [Dice] = []
        for i in dices {
            let index = i.value - 1
            total[index] += 1
            internalDices.append(i)
        }
        self.totalResult = total
        self.dices =  internalDices
        self.diceResult = DiceResult(dices: dices)
    }
    
//MARK: functions
    
    func calculateTotalD6() -> Int {
        var ret: Int = 0
        for i in totalResult {
            let multiplier = i + 1
            ret += i * multiplier
        }
        return ret
    }
    
    func calculateTotalD3() -> Int {
        var ret: Int = 0
        for i in totalResult {
            let multiplier = i + 1
            ret += ((i / 2) + (i % 2)) * multiplier
        }
        return ret
    }
    
    func printResults() {
        var retString: String = ""
        retString += "{ "
        for i in dices {
            retString += " \(i.value)"
            if i.reroll {
                retString += "! "
            } else {
                retString += "? "
            }
            
        }
        retString += " }"
        print(retString)
    }
    
}
