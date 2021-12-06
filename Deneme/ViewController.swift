//
//  ViewController.swift
//  Deneme
//
//  Created by SEVVAL on 6.12.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    var viewModel = MainVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        AF.request("https://apps.furkansandal.com/youtuber_app_v1/show_json.php").validate()
            .responseDecodable(of: YoutuberModel.self) {(respose) in
                guard let yorum = respose.value
                else { return}
                self.viewModel.icerikler = yorum.data
                self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.icerikler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.viewModel.icerikler[indexPath.row].baslik
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = DetailsVC.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        let destinationVM = DetailsVM()
        destinationVM.secilenData = self.viewModel.icerikler[indexPath.row]
        destinationVC.viewModel = destinationVM
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

