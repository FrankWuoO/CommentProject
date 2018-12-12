//
//  ListTableViewController.swift
//  CommentTestProject
//
//  Created by Frank on 12/12/18.
//

import UIKit

class ListTableViewController: UITableViewController {
    var dataArray: [Comment] = Comment.testData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for c in dataArray {
            print("----")
            print("name:", c.author)
            print("content:", c.content)
            print("reply count:", c.replies.count)
            for r in c.replies{
                print("-\(r.author): \(r.content)")
            }
        }
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CommentListCell", bundle: nil), forCellReuseIdentifier: "CommentListCell")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentListCell", for: indexPath) as! CommentListCell
        cell.comment = dataArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
}
