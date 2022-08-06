//
//  GamesTableViewCell.swift
//  Cup Champions
//
//  Created by kenjimaeda on 05/08/22.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

	@IBOutlet weak var imgHome: UIImageView!
	@IBOutlet weak var imgAway: UIImageView!
	@IBOutlet weak var labScore: UILabel!
	@IBOutlet weak var labHome: UILabel!
	@IBOutlet weak var labAway: UILabel!
	

   
	func formatCell(_ games: Games) {
		imgAway.image = UIImage(named: games.away)
		imgHome.image = UIImage(named: games.home)
		labAway.text = games.away
		labHome.text = games.home
		labScore.text = games.score
	}

}
