//
//  ReplyCell.swift
//  CommentTestProject
//
//  Created by Frank on 12/12/18.
//

import UIKit

class ReplyCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    var reply: Reply? = nil{
        didSet{
            if let reply = reply{
                nameLabel.text = reply.author
                contentTextView.text = reply.content
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentTextView.isScrollEnabled = false
        contentTextView.textContainerInset = .zero
        contentTextView.textContainer.lineFragmentPadding = 0
        contentTextView.isSelectable = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }    
}
