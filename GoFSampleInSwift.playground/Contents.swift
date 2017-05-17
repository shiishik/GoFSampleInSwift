//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Iteratorパターン 実行コード
 */
// Aggregateの生成
var commentAggregate = CommentAggregate()
let comment1 = Comment(text: "text1", name: "name1")
let comment2 = Comment(text: "text2", name: "name2")
let comment3 = Comment(text: "text3", name: "name3")
commentAggregate.add(comment: comment1)
commentAggregate.add(comment: comment2)
commentAggregate.add(comment: comment3)
print("Aggregate has", commentAggregate.count(), "comments.")

// Iteratorの実行
let iterator = commentAggregate.iterator()
while iterator.hasNext() {
    let item = iterator.next() as! Comment
    print(item.text)
}

/*
 // 実行結果
 Aggregate has 3 comments.
 text1
 text2
 text3
 */
