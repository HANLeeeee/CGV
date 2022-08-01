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
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return homeBannerTop.count
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            
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
            return 360
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    func getRatio(_ tableView: UITableView, _ image: UIImage) -> CGFloat {
        let widthRatio = CGFloat(image.size.width/image.size.height)
        return tableView.frame.width / widthRatio
    }
    
}
