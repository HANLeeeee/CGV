//
//  MovieChartCollectionViewCell.swift
//  OpenAPIApp
//
//  Created by 최하늘 on 2022/07/31.
//

import UIKit

class MovieChartCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageviewMovie: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageviewMovie.layer.cornerRadius = 20
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
            //셀 초기화시켜주는 메서드
        imageviewMovie.image = nil
        labelMovieTitle.text = ""
    }
    
}
