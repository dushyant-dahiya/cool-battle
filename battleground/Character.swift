//
//  Character.swift
//  battleground
//
//  Created by Dushyant Dahiya on 1/19/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation


class Character {
    private var _hp: Int = 100
    private var _attackPwr: Int = 50
    
    var attackPwr: Int {
        get{
            return _attackPwr
        }
    }
    
    var hp: Int {
        get{
            return _hp
        }
    }
    
    var isAlive: Bool{
        get{
            if hp <= 0 {
                return false
            }
            return true
        }
    }
    
    
    init(startingHp: Int, attackPwr: Int){
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool{
        self._hp -= attackPwr
        return true
    }
}