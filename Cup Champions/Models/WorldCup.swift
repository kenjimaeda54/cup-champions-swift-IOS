//
//  WorldCup.swift
//  Cup Champions
//
//  Created by kenjimaeda on 03/08/22.
//

import Foundation

struct WorldCup: Codable {
	var year: Int
	var country: String
	var winner: String
	var winnerScore: String
	var viceScore: String
	var vice: String
	var matches: [Matches]
	
}

struct Matches: Codable {
	var stage: String
	var games: [Games]
	
}

struct Games: Codable {
	var home: String
	var away: String
	var score: String
	var date: String
	
}




