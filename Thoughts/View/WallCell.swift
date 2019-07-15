//
//  WallCell.swift
//  Thoughts
//
//  Created by Sean Saoirse on 09/07/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import UIKit

protocol NewWallCell{
    func onTapLoveBtn(Index: Int, sender: UIButton)
}

class WallCell: UITableViewCell {
    @IBOutlet weak var contentLabel: UILabel!
    var cellDelegate: NewWallCell?
    var index: IndexPath?
   
    @IBOutlet weak var loveBtn: UIButton!
    func configCell(title: String){
        contentLabel.text = title
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        print("gaga")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBAction func loveBtnTapped(_ sender: Any) {
        cellDelegate?.onTapLoveBtn(Index: index!.row, sender: loveBtn)
    }
}
