//
//  WorldCupViewController.swift
//  Cup Champions
//
//  Created by kenjimaeda on 03/08/22.
//

import UIKit

class WorldCupViewController: UIViewController {
	
	
	@IBOutlet weak var labVice: UILabel!
	@IBOutlet weak var imgVice: UIImageView!
	@IBOutlet weak var imgWinner: UIImageView!
	@IBOutlet weak var labWinner: UILabel!
	@IBOutlet weak var labScore: UILabel!
	@IBOutlet weak var tableTrajectoryChampion: UITableView!
	
	var worldCup:WorldCup?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableTrajectoryChampion.delegate = self
		tableTrajectoryChampion.dataSource = self
		
		labVice.text = worldCup?.vice
		labWinner.text = worldCup?.winner
		
		if let haveImgVice = worldCup?.vice, let haveImgWinner =  worldCup?.winner, let titleYear = worldCup?.year, let scoreWinner = worldCup?.winnerScore,let scoreVice =  worldCup?.viceScore {
			imgVice.image = UIImage(named: haveImgVice)
			imgWinner.image = UIImage(named: haveImgWinner)
			title = "\(titleYear)"
			labScore.text = "\(scoreWinner) x \(scoreVice)"
		}
		
	}
	
}

//MARK: - UITableViewDelegate , UITableViewDataSource
extension WorldCupViewController:UITableViewDataSource {
	
	//numeros de secoes
	func numberOfSections(in tableView: UITableView) -> Int {
		return  worldCup?.matches.count ?? 1
	}
	
	//numberos de linhas dentro da secao
	//section
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let numberRows = worldCup?.matches[section].games
		return numberRows?.count ?? 1
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if let stage = worldCup?.matches[section].stage {
			return stage
		}
		return nil
	}
	
	
	//criando as celulas
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
		//pego os Match
		let match = worldCup?.matches[indexPath.section]
		//pego o game
		let game = match?.games[indexPath.row]
		if let haveGame = game {
			cell.formatCell(haveGame)
		}
		return cell
	}
	
}


extension WorldCupViewController:UITableViewDelegate {
	
}
