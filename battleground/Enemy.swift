//
//  Enemy.swift
//  battleground
//
//  Created by Dushyant Dahiya on 1/20/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation


class Enemy: Character {
    
    var loot: [String] {
        return ["rusty dagger", "cracked butler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}