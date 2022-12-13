//
//  main.swift
//  Game
//
//  Created by Indira on 13/12/22.
//

import Foundation

print("Hello, World!")

var players = [[String]]()

var warrior = ["Voin", "1000", "200"]
var mag = ["Koldun", "1000", "300"]
var doctor = ["Medik", "1000", "0"]
var protector = ["Zashitnik", "1500", "100"]

players.append(warrior)
players.append(mag)
players.append(doctor)
players.append(protector)

var boss = [5000, 200]

var crushedPlayers = [String]()
var allPlayersCrushed: Bool = false
var isBossCrushed: Bool = false
var round = 1

while boss[0] >= 0 || allPlayersCrushed == false{
    print("\nRound \(round)")
    if round % 2 == 0{
        for (index, item) in players.enumerated(){
            if index != 2{
                players[index][1] = String(Int(item[1])! + 200)
            }
        }
    }


print("Heroes attack")
for (_, item) in players.enumerated(){
    boss[0] -= Int(item[2])!
    print("\(item[0]) nanes \(item[2]) urona Bossu. HP bossa - \(boss[1]) ")
    
    if boss[0] == 0{
        isBossCrushed = true
        break;
    }
}
if isBossCrushed == true{
    print("Players won, Boss died")
    print("\(round) rounds went")
    for i in players{
        print("HP hero \(i[0]) - \(i[1])")
    }
    for i in crushedPlayers{
        print("\(i) died")
    }
    break
}

print("\nBoss attacks")

for (index, item) in players.enumerated(){
    let playerHP = Int(item[1])! - 200
    print("HP hero \(item[0]) - \(playerHP)")

    players[index][1] = String(playerHP)
    if players.count == 0{
        allPlayersCrushed = true
        break
    }
}
    for(index, item) in players.enumerated(){
        if item[1] == "0"{
            crushedPlayers.append(item[0])
            players.remove(at: index)
        }
    }
    if allPlayersCrushed == true{
        
        print("Boss won, players dided")
        print("\(round) rounds went")
        break
    }
    round += 1
    
}
