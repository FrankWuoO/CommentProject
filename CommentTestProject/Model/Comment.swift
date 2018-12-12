//
//  Comment.swift
//  CommentTestProject
//
//  Created by Frank on 12/12/18.
//

import Foundation

struct Comment{
    let author: String
    let content: String
    let replies: [Reply]
}

struct Reply {
    let author: String
    let content: String
}

extension Comment{
    static func testData() -> [Comment] {
        let content = "文章內容"
        let replyContent = "回覆內容"
        var commentList = [Comment]()
        for i in 1...5{
            var replyList = [Reply]()
            for j in 1...i{
                let reply = Reply(author: "回覆作者\(j)", content: Array(repeating: replyContent, count: i*3).joined())
                replyList.append(reply)
            }
            let comment = Comment(author: "評論作者\(i)", content: Array(repeating: content, count: i*2).joined(), replies: replyList)
            commentList.append(comment)
        }
        return commentList
    }
}
