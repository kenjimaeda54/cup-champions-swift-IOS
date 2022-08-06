//
//  WinnersTableViewController.swift
//  Cup Champions
//
//  Created by kenjimaeda on 03/08/22.
//

import UIKit

class WinnersTableViewController: UITableViewController {
	
	var worldCupManager = WorldCupManager()
	var worldCups: [WorldCup] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		worldCupManager.worldCupDelegate = self
		worldCupManager.tryGetWinners()
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "worldCupSegue" {
			let destionation = segue.destination as! WorldCupViewController
			if let selectedRow = tableView.indexPathForSelectedRow?.row {
				destionation.worldCup = worldCups[selectedRow]
			}
		}
	}
	
	
	//quando so possui uma sessao posso deletar esse metodo se torna opcional
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	//quantidade de linhas que cada sessao vai ter,
	//no casso nosso tenho apenas uma sessao entao a quantidade de dados
	//sera a quantidade de linhas
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return worldCups.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell
		cell.formatCell(worldCups[indexPath.row])
		return cell
	}
	
}

extension WinnersTableViewController:WorldCupDelegate {
	func getWinners(_ winners: [WorldCup]) {
		worldCups = winners
	}
	
	func failGetWinners(_ error: Error) {
		print(error)
	}
}
