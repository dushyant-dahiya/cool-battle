//
//  DevilWizard.swift
//  battleground
//
//  Created by Dushyant Dahiya on 1/20/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import Foundation


class DevilWizaed : Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}