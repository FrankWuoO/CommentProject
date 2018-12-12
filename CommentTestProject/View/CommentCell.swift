//
//  CommentCell.swift
//  CommentTestProject
//
//  Created by Frank on 12/12/18.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
   
    var comment: Comment? = nil{
        didSet{
            if let comment = comment{
                nameLabel.text = comment.author
                contentTextView.text = comment.content
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
