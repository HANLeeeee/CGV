//
//  HomeViewController.swift
//  OpenAPIApp
//
//  Created by 최하늘 on 2022/07/31.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    @IBOutlet weak var tableViewMovieChart: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
    }
    
    func registerTableView() {
        let tableViewCellNib2 = UINib(nibName: "BannerTableViewCell", bundle: nil)
        self.tableViewMovieChart.register(tableViewCellNib2, forCellReuseIdentifier: "BannerTableViewCell")
        
        let tableViewCellNib = UINib(nibName: "MovieChartTableViewCell", bundle: nil)
        self.tableViewMovieChart.register(tableViewCellNib, forCellReuseIdentifier: "MovieChartTableViewCell")
        
        tableViewMovieChart.delegate = self
        tableViewMovieChart.dataSource = self
        
        tableViewMovieChart.separatorStyle = .none
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0, 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            
            if indexPath.section == 0 {
                cell.imageViewBanner.image = homeBannerTop[indexPath.row].bammerImage
            } else {
                cell.imageViewBanner.image = homeBannerMiddle[indexPath.row].bammerImage
            }
            
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieChartTableViewCell", for: indexPath) as! MovieChartTableViewCell

            cell.selectionStyle = .none
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return getRatio(tableView, homeBannerTop[indexPath.row].bammerImage)
            
        case 1:
            return 380
            
        case 2:
            return getRatio(tableView, homeBannerMiddle[indexPath.row].bammerImage)
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    func getRatio(_ tableView: UITableView, _ image: UIImage) -> CGFloat {
        let widthRatio = CGFloat(image.size.width/image.size.height)
        return tableView.frame.width / widthRatio
    }
    
}
