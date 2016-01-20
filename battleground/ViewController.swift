//
//  ViewController.swift
//  battleground
//
//  Created by Dushyant Dahiya on 1/19/16.
//  Copyright © 2016 DUSHYANT DAHIYA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var print: UIImageView!
    
    @IBOutlet weak var printlbl:UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    
    
    @IBOutlet weak var chestBtn: UIButton!
    
    @IBAction func onChestTapped(sender: UIButton){
        
        chestBtn.hidden = true
        printlbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
        
        
    }
    
    func resetPower(power: String){
        enemyHpLbl.text = "110HP"
    }
    
    @IBAction func attackTapped(sender: UIButton){
        
        if enemy.attemptAttack(player.attackPwr){
            printlbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        }else {
            printlbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printlbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
        
    }
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
        
        chestBtn.hidden = true
        
        
        
    }
    
    func generateRandomEnemy(){
        let rand = Int(arc4random_uniform(2))
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        }else {
            enemy = DevilWizaed(startingHp: 60, attackPwr: 15)
        }
        
        enemyImg.hidden = false
        resetPower("110HP")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

