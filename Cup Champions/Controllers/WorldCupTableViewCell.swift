//
//  WorldCupTableViewCell.swift
//  Cup Champions
//
//  Created by kenjimaeda on 04/08/22.
//

import UIKit

class WorldCupTableViewCell: UITableViewCell {

	@IBOutlet weak var lbYear: UILabel!
	@IBOutlet weak var lbCountry: UILabel!
	@IBOutlet weak var imgWinner: UIImageView!
	@IBOutlet weak var lbWinner: UILabel!
	@IBOutlet weak var lbScoreWinner: UILabel!
	@IBOutlet weak var imgVice: UIImageView!
	@IBOutlet weak var lbVice: UILabel!
	@IBOutlet weak var lbScoreVice: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	

	func formatCell(_ cell: WorldCup)  {
		lbYear.text = "\(cell.year)"
		lbCountry.text = cell.country
		
		imgWinner.image = UIImage(named: cell.winner)
		lbWinner.text = cell.winner
		lbScoreWinner.text = cell.winnerScore
		
		imgVice.image = UIImage(named: cell.vice)
		lbVice.text = cell.vice
		lbScoreVice.text = cell.viceScore
	
	}

}
