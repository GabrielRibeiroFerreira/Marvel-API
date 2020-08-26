//
//  ListTableViewController.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 21/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    let presenter: ListPresenter
    let type: DataType
    var list: [Codable] = []
    
    let cellIdenfier =  "cellIdenfier"
    
    init(presenter: ListPresenter) {
        self.presenter = presenter
        self.type = self.presenter.type
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(ListItemTableViewCell.self, forCellReuseIdentifier: self.cellIdenfier)
        
        self.tableView.separatorStyle = .none
        
        self.setupNavBar()
        self.getData()
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.backgroundColor = .systemRed
        self.navigationController?.navigationBar.barTintColor = .systemRed
    }
    
    func getData() {
        self.presenter.getData { (list, status, message) in
            if status {
                self.list = list ?? []
                self.tableView.reloadData()
            } else {
                print(message, self.description)
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.list.count
        return self.list.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdenfier, for: indexPath) as! ListItemTableViewCell
        
        let item = self.list[indexPath.row]
        
        cell.type = self.type
        cell.item = item
        
        var url: String? = nil
        switch self.type {
        case .characters:
            let character = item as? Character
            if let path = character?.thumbnail?.path,
                let ext = character?.thumbnail?.extension {
                url = path + "." + ext
            }
        case .comics:
            let comic = item as? Comic
            if let path = comic?.thumbnail?.path,
                let ext = comic?.thumbnail?.extension {
                url = path + "." + ext
            }
        case .stories:
            let story = item as? Story
            if let path = story?.thumbnail?.path,
                let ext = story?.thumbnail?.extension {
                url = path + "." + ext
            }
        }
        
        if let imageURL = url {
            self.presenter.getImage(from: imageURL) { (data, status, message) in
                if status {
                    if let imageData = data {
                        cell.img = UIImage(data: imageData)
                    }
                } else {
                    print(message)
                }
            }
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
