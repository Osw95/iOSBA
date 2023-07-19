//
//  TableViewCell.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit

final class ShowsTableViewCell: UITableViewCell {
    
    // MARK: - IDENTIFIER
    
    static let identifier = String(describing: ShowsTableViewCell.self)
    
    // MARK: - IBOUTLETS
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
