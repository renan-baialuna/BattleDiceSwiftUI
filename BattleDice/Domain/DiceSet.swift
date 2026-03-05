//
//  DiceSet.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/03/26.
//

struct DiceSet {
    let dices: [Dice]
    let totalResult: [Int]
    
    
//MARK: inits
    init(totalDices: Int) {
        var total: [Int] = Array(repeating: 0, count: 6)
        var dices: [Dice] = []
        for i in 1...totalDices {
            let dice = Dice()
            let index = dice.value - 1
            total[index] += 1
            dices.append(dice)
        }
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
