import Foundation

/*
 Iteratorパターン
 
 集約オブジェクト内の個々のオブジェクトに統一化された手段でアクセスできるようにするためのパターンです。
 具体的には、対象のオブジェクトのリストを特定の順番で処理したい場合に利用します。
 Iteratorパターンは２つの抽象クラス（Aggregate, Iterator）が存在し、それぞれの具体クラスで用途に応じた実装を行います。
 抽象クラスの役割はswiftにおいてはprotocolを利用するといいでしょう。
 Aggregate（集約）の具体クラスはいわゆるリストクラス（コンテナクラス）であるといえばイメージしやすいでしょう。
 Aggregateの具体クラスはIteratorの具体クラスを返す機能を持ちます。
 クライアント側はAggregateの具体クラスからAggregateを保持するIteratorの具体クラスを取得し、
 Iterator経由で対象オブジェクトの走査して行く事が可能となります。
 */

// Aggregateの抽象クラスの役割のprotocolにはIteraator取得メソッドを定義しておく
public protocol Aggregate {
    func iterator() -> Iterator
}

// Iteratorの抽象クラスの役割のprotocolには次の要素の有無判定と取得メソッドを定義しておく
public protocol Iterator {
    func hasNext() -> Bool
    func next() -> Any
}

// 例としてコメントクラスを対象オブジェクトとする
public class Comment {
    public let text: String
    public let name: String
    
    public init(text: String, name: String) {
        self.text = text
        self.name = name
    }
}

// Aggregateの具体クラスを実装する
public class CommentAggregate: Aggregate {
    private var comments = [Comment]()
    
    public init() {
    }
    
    public func iterator() -> Iterator {
        return CommentIterator(commentAggregate: self)
    }
    
    public func add(comment: Comment) {
        comments.append(comment)
    }
    
    public func count() -> Int {
        return comments.count
    }
    
    public func getComment(at index: Int) -> Comment {
        return comments[index]
    }
}

// Iteratorの具体クラスを実装する
public class CommentIterator: Iterator {
    private let commentAggregate: CommentAggregate
    private var index = 0
    
    public init(commentAggregate: CommentAggregate) {
        self.commentAggregate = commentAggregate
    }
    
    public func hasNext() -> Bool {
        return commentAggregate.count() > index
    }
    
    public func next() -> Any {
        let comment = commentAggregate.getComment(at: index)
        index += 1
        return comment
        
    }
}
