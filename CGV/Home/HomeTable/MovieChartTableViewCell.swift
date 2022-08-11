//
//  MovieChartTableViewCell.swift
//  CGV
//
//  Created by 최하늘 on 2022/07/31.
//

import UIKit

class MovieChartTableViewCell: UITableViewCell{
    @IBOutlet weak var collectionView: UICollectionView!
    var moviesArray: [Movie] = []           // API를 통해 받아온 결과를 저장할 array
    var moviesImageArray: [MovieDetail] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
        registerXib()
        setMovieData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
   
    func registerXib() {
        let collectionCell = UINib(nibName: "MovieChartCollectionViewCell", bundle: nil)
        collectionView.register(collectionCell, forCellWithReuseIdentifier: "MovieChartCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    }
    
    func getyesterday() -> String {
        let nowdate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let yesterdayMovieChart = Calendar.current.date(byAdding: .day, value: -1, to: nowdate)
        return formatter.string(from: yesterdayMovieChart!)
    }
    
    func setMovieData() {
        MoviesAPI().getMovieChart(targetDt: getyesterday(), completion: { result in
            switch result {
            case .success(let movies):
                self.moviesArray = movies
                self.collectionView.reloadData()
                self.setMovieImage()
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func setMovieImage() {
        for item in moviesArray {
            NaverAPI().getMovieImage(item.movieNm, item.rank, completion: { result in
                switch result {
                case .success(let movies):
                    self.moviesImageArray = movies
                    self.collectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
}

extension MovieChartTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieChartCollectionViewCell", for: indexPath) as! MovieChartCollectionViewCell

        self.moviesImageArray = self.moviesImageArray.sorted(by: {$0.rank < $1.rank})
        DispatchQueue.global().async {
            if self.moviesImageArray.count == self.moviesArray.count {
                var tempImg : UIImage

                if let ImageData = try? Data(contentsOf: URL(string: self.moviesImageArray[indexPath.row].image)!) {
                    tempImg = UIImage(data: ImageData)!
                } else {
                    tempImg = UIImage(named: "movie")!
                }
                
                DispatchQueue.main.sync {
                    cell.imageviewMovie.image = tempImg
                    cell.labelMovieTitle.text = self.moviesImageArray[indexPath.row].title

                }
            } else {
                return
            }
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 320)
    }
}

