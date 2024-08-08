//
//  Framework.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/6/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Prayer {
    //
    var date: Date
    var title: String
    var text: String
    var done: Bool
    var praise: Bool

    //
    init(date: Date, title: String, text: String, done: Bool, praise: Bool) {
        self.date = date
        self.title = title
        self.text = text
        self.done = done
        self.praise = praise
    }
}

//
enum AcrosticType {
    //
    case total_depravity,
         unconditional_election,
         limited_atonement,
         irresistible_grace,
         perseverance_of_the_saints
}

//
struct Acrostic: Hashable, Identifiable {
    //
    let id = UUID()
    //
    var title: String
    var image: String
    var type: AcrosticType
    var text: String
}

//
struct Scripture: Hashable, Identifiable {
    //
    let id = UUID()
    //
    var book: String
    var chapter: Int
    var start: Int
    var end: Int
    
    //
    func spanning() -> Bool {
        //
        return ( ( start < end ) && ( end > 0 ) )
    }
    
    func title() -> String {
        //
        if spanning() {
            return book + " \(chapter):\(start)-\(end)"
        }
        else {
            return book + " \(chapter):\(start)"
        }
    }
    
    func esv() -> String {
        //
        if ((book.isEmpty) || (chapter == 0) || (start == 0) || (end == 0)) {
            //
            return "about:blank"
        } else {
            if spanning() {
                //
                return "https://www.esv.org/verses/"
                     + book.replacingOccurrences(of: " ", with: "%20")
                     + "+\(chapter)"
                     + ":\(start)-\(end)"
            } else {
                //
                return "https://www.esv.org/verses/"
                     + book.replacingOccurrences(of: " ", with: "%20")
                     + "+\(chapter)"
                     + ":\(start)"
            }
        }
    }
}

//
struct Sermon: Hashable, Identifiable {
    //
    let id = UUID()
    //
    var title: String
    var pastor: String
    var church: String
    var image: String
    var link: String
}

//
func reference(type: AcrosticType) -> [Scripture] {
    //
    switch type {
        case AcrosticType.total_depravity:            return Theology.total_depravity
        case AcrosticType.unconditional_election:     return Theology.unconditional_election
        case AcrosticType.limited_atonement:          return Theology.limited_atonement
        case AcrosticType.irresistible_grace:         return Theology.irresistible_grace
        case AcrosticType.perseverance_of_the_saints: return Theology.perseverance_of_the_saints
     // default:                                      return [Scripture]()
    }
}
