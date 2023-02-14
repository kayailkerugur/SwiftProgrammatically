//
//  DiscoverVC.swift
//  ProgrammaticUI
//
//  Created by İlker Kaya on 6.02.2023.
//

import UIKit
import Alamofire

class DiscoverVC: UIViewController {
    
    
    private var photo: [Photo] = []
    var tableView = UITableView()
    
    struct cells {
        static let photoCell = "DiscoverCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchPhoto()
        //tableViewController()
        
        configureTableView()
        
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 100
        // register cell
        tableView.register(DiscoverCell.self, forCellReuseIdentifier: cells.photoCell)
        //set constrainsts
        tableView.pin(to: view)
    }
    
    func setTableViewDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchPhoto(){
        DispatchQueue.main.async(qos: .userInteractive) {
            let url = "https://jsonplaceholder.typicode.com/photos"
            AF.request(url).responseDecodable(of: [Photo].self) { response in
                guard let posts = response.value else { return }
                self.photo = posts
                self.tableView.reloadData()
                        
            }
        }
    }
}

extension DiscoverVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cells.photoCell, for: indexPath) as! DiscoverCell
        let data = photo[indexPath.row]
        cell.set(photo: data)
        return cell
    }
    
    
}
