//
//  CommentListCell.swift
//  CommentTestProject
//
//  Created by Frank on 12/12/18.
//

import UIKit

class CommentListCell: UITableViewCell {
    @IBOutlet weak var listTableView: SelfSizedTableView!
    
    var comment: Comment? = nil {
        didSet{
            if let _ = comment{
                listTableView.reloadData()
                listTableView.invalidateIntrinsicContentSize()
                listTableView.layoutIfNeeded()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listTableView.isScrollEnabled = false

        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.separatorStyle = .none
        listTableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        listTableView.register(UINib(nibName: "ReplyCell", bundle: nil), forCellReuseIdentifier: "ReplyCell")
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension CommentListCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let comment = comment else { return 0 }
        return comment.replies.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
            cell.comment = comment
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyCell", for: indexPath) as! ReplyCell
            cell.reply = comment?.replies[indexPath.row - 1]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
}
class SelfSizedTableView: UITableView {
    override func reloadData() {
        super.reloadData()
        invalidateIntrinsicContentSize()
        layoutIfNeeded()
    }
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
