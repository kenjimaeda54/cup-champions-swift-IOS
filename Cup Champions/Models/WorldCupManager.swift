//
//  WorldCupManager.swift
//  Cup Champions
//
//  Created by kenjimaeda on 03/08/22.
//

import Foundation

protocol WorldCupDelegate {
	func getWinners(_ winners: [WorldCup])
	func failGetWinners(_ error: Error)
}

struct WorldCupManager {
	
	var worldCupDelegate: WorldCupDelegate?
	
	
	func tryGetWinners()  {
		if 	let fileUrl = Bundle.main.url(forResource: "winners", withExtension: ".json") {
			do {
				let data = try Data(contentsOf: fileUrl)
				if let jsonData = jsonParser(data) {
					worldCupDelegate?.getWinners(jsonData)
				}
			}catch {
				print (error)
				worldCupDelegate?.failGetWinners(error)
			}
			
		}
	}
	
	func jsonParser(_ data: Data) -> [WorldCup]? {
		let jsonParser = JSONDecoder()
		do {
			let json = try jsonParser.decode([WorldCup].self, from: data)
			return json
		}catch {
			print(error)
			worldCupDelegate?.failGetWinners(error)
			return nil
		}
	}
	
}


