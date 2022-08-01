//
//  TopTabCollectionViewCell.swift
//  OpenAPIApp
//
//  Created by 최하늘 on 2022/08/01.
//

import UIKit

class TopTabCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func config(_ index: Int) {
        if index == 0 {
            viewLine.isHidden = false
        }
    }
}
