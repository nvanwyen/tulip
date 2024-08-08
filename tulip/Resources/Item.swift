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
struct Theology {

    //
    static let acrostic = [
        //
        Acrostic(title: "Total Depravity",
                 image: "total_depravity",
                 type:  AcrosticType.total_depravity,
                 text:  AcrosticText.total_depravity),
        //
        Acrostic(title: "Unconditional Election",
                 image: "unconditional_election",
                 type:  AcrosticType.unconditional_election,
                 text:  AcrosticText.unconditional_election),
        //
        Acrostic(title: "Limited Atonement",
                 image: "limited_atonement",
                 type:  AcrosticType.limited_atonement,
                 text:  AcrosticText.limited_atonement),
        //
        Acrostic(title: "Irresistible Grace",
                 image: "irresistible_grace",
                 type:  AcrosticType.irresistible_grace,
                 text:  AcrosticText.irresistible_grace),
        //
        Acrostic(title: "Perseverance of the Saints",
                 image: "perseverance_of_the_saints",
                 type:  AcrosticType.perseverance_of_the_saints,
                 text:  AcrosticText.perseverance_of_the_saints)
    ]
       
    //
    static let total_depravity = [
        //
        Scripture( book: "Ephesians",     chapter:   2, start:  1, end:  3 ),
        //
        Scripture( book: "Genesis",       chapter:   2, start: 17, end: 17 ),
        Scripture( book: "John",          chapter:   3, start:  6, end:  6 ),
        Scripture( book: "John",          chapter:   8, start: 34, end: 34 ),
        Scripture( book: "Genesis",       chapter:   6, start: 57, end: 57 ),
        Scripture( book: "Romans",        chapter:   1, start: 18, end: 32 ),
        Scripture( book: "Jeremiah",      chapter:  17, start:  9, end:  9 ),
        Scripture( book: "Romans",        chapter:   3, start: 10, end: 18 ),
        Scripture( book: "Isaiah",        chapter:  64, start:  6, end:  7 ),
        Scripture( book: "Romans",        chapter:   3, start: 23, end: 23 ),
        Scripture( book: "Romans",        chapter:   8, start:  7, end:  8 ),
        Scripture( book: "Isaiah",        chapter:  65, start: 12, end: 12 ),
        Scripture( book: "Titus",         chapter:   1, start: 15, end: 15 ),
        Scripture( book: "Jeremiah",      chapter:  13, start: 23, end: 23 ),
        Scripture( book: "Romans",        chapter:   5, start: 12, end: 12 ),
        Scripture( book: "Romans",        chapter:   5, start: 14, end: 19 ),
        Scripture( book: "Ephesians",     chapter:   2, start:  1, end:  5 ),
        Scripture( book: "Mark",          chapter:   7, start: 21, end: 23 ),
        Scripture( book: "Psalm",         chapter:  14, start:  2, end:  3 ),
        Scripture( book: "Matthew",       chapter:   7, start: 17, end: 18 ),
        Scripture( book: "Psalm",         chapter:  58, start:  3, end:  3 ),
        Scripture( book: "John",          chapter:   3, start: 19, end: 19 )
    ]

    //
    static let unconditional_election = [
        //
        Scripture( book: "Ephesians",     chapter:   1, start:  3, end:  6 ),
        //
        Scripture( book: "Romans",        chapter:   9, start: 15, end: 16 ),
        Scripture( book: "Ephesians",     chapter:   1, start:  9, end: 12 ),
        Scripture( book: "Romans",        chapter:   9, start: 11, end: 11 ),
        Scripture( book: "John",          chapter:   1, start: 12, end: 13 ),
        Scripture( book: "Mark",          chapter:  13, start: 20, end: 20 ),
        Scripture( book: "Revelation",    chapter:  13, start:  8, end:  8 ),
        Scripture( book: "Revelation",    chapter:  17, start:  8, end:  8 ),
        Scripture( book: "Romans",        chapter:  10, start: 20, end: 20 ),
        Scripture( book: "1 Corinthians", chapter:   1, start: 27, end: 28 ),
        Scripture( book: "2 Timothy",     chapter:   1, start:  8, end:  8 ),
        Scripture( book: "John",          chapter:  10, start: 28, end: 30 ),
        Scripture( book: "John",          chapter:  10, start: 15, end: 16 ),
        Scripture( book: "John",          chapter:   6, start: 37, end: 37 ),
        Scripture( book: "John",          chapter:   6, start: 44, end: 44 ),
        Scripture( book: "Romans",        chapter:   8, start: 29, end: 30 ),
        Scripture( book: "Isaiah",        chapter:  43, start: 20, end: 21 ),
        Scripture( book: "Titus",         chapter:   1, start:  1, end:  1 ),
        Scripture( book: "Psalm",         chapter:  65, start:  4, end:  4 ),
        Scripture( book: "Matthew",       chapter:  22, start: 14, end: 14 ),
        Scripture( book: "2 Timothy",     chapter:   2, start: 10, end: 10 ),
        Scripture( book: "Exodus",        chapter:  33, start: 19, end: 19 ),
        Scripture( book: "Deuteronomy",   chapter:   7, start:  6, end:  7 )
    ]

    //
    static let limited_atonement = [
        //
        Scripture( book: "Ephesians",     chapter:   1, start:  7, end: 10 ),
        //
        Scripture( book: "John",          chapter:   3, start: 16, end: 18 ),
        Scripture( book: "Romans",        chapter:   8, start: 30, end: 30 ),
        Scripture( book: "John",          chapter:   6, start: 35, end: 40 ),
        Scripture( book: "Matthew",       chapter:   1, start: 21, end: 21 ),
        Scripture( book: "John",          chapter:  10, start: 11, end: 11 ),
        Scripture( book: "John",          chapter:  17, start:  9, end:  9 ),
        Scripture( book: "Acts",          chapter:  20, start: 28, end: 28 ),
        Scripture( book: "Revelation",    chapter:   5, start:  9, end:  9 ),
        Scripture( book: "John",          chapter:  10, start: 14, end: 16 ),
        Scripture( book: "Ephesians",     chapter:   1, start:  4, end:  4 ),
        Scripture( book: "Isaiah",        chapter:  53, start:  8, end:  8 ),
        Scripture( book: "Isaiah",        chapter:  53, start: 11, end: 12 ),
        Scripture( book: "Ephesians",     chapter:   2, start:  1, end:  5 ),
        Scripture( book: "Ephesians",     chapter:   2, start:  8, end:  8 ),
        Scripture( book: "John",          chapter:   5, start: 21, end: 24 ),
        Scripture( book: "John",          chapter:  10, start: 26, end: 27 ),
        Scripture( book: "John",          chapter:  12, start: 37, end: 40 ),
        Scripture( book: "Psalm",         chapter:  85, start:  2, end:  2 ),
        Scripture( book: "John",          chapter:  14, start: 21, end: 24 ),
        Scripture( book: "John",          chapter:  17, start:  2, end:  2 ),
        Scripture( book: "John",          chapter:  17, start:  9, end:  9 ),
        Scripture( book: "John",          chapter:  17, start: 10, end: 10 ),
        Scripture( book: "Acts",          chapter:  10, start: 40, end: 41 ),
        Scripture( book: "Acts",          chapter:  13, start: 48, end: 48 )
    ]
    
    //
    static let irresistible_grace = [
        //
        Scripture( book: "Ephesians",     chapter:   2, start:  4, end:  9 ),
        //
        Scripture( book: "John",          chapter:   3, start:  3, end:  8 ),
        Scripture( book: "Ephesians",     chapter:   2, start:  1, end: 10 ),
        Scripture( book: "John",          chapter:   6, start: 37, end: 37 ),
        Scripture( book: "John",          chapter:   6, start: 44, end: 44 ),
        Scripture( book: "John",          chapter:  10, start: 16, end: 16 ),
        Scripture( book: "Psalm",         chapter:  65, start:  4, end:  4 ),
        Scripture( book: "Ezekiel",       chapter:  36, start: 26, end: 27 ),
        Scripture( book: "John",          chapter:   1, start: 12, end: 13 ),
        Scripture( book: "Romans",        chapter:   9, start: 15, end: 16 ),
        Scripture( book: "John",          chapter:   5, start: 21, end: 21 ),
        Scripture( book: "Romans",        chapter:  11, start:  5, end:  6 ),
        Scripture( book: "Romans",        chapter:   8, start: 30, end: 30 ),
        Scripture( book: "John",          chapter:   6, start: 39, end: 39 ),
        Scripture( book: "John",          chapter:   6, start: 65, end: 65 ),
        Scripture( book: "Hebrews",       chapter:   9, start: 15, end: 15 ),
        Scripture( book: "Philippians",   chapter:   1, start:  6, end:  6 ),
        Scripture( book: "Philippians",   chapter:   1, start: 29, end: 29 ),
        Scripture( book: "Philippians",   chapter:   2, start: 13, end: 13 ),
        Scripture( book: "2 Timothy",     chapter:   1, start:  9, end: 10 ),
        Scripture( book: "Isaiah",        chapter:  55, start: 11, end: 11 ),
        Scripture( book: "Acts",          chapter:  13, start: 48, end: 48 ),
        Scripture( book: "Acts",          chapter:  18, start: 27, end: 27 ),
        Scripture( book: "Titus",         chapter:   3, start:  5, end:  5 )
    ]
    
    //
    static let perseverance_of_the_saints = [
        //
        Scripture( book: "Ephesians",     chapter:   2, start: 10, end: 10 ),
        //
        Scripture( book: "John",          chapter:  17, start: 20, end: 21 ),
        Scripture( book: "2 Peter",       chapter:   3, start:  9, end:  9 ),
        Scripture( book: "Philippians",   chapter:   1, start:  6, end:  6 ),
        Scripture( book: "Philippians",   chapter:   2, start: 11, end: 12 ),
        Scripture( book: "Hebrews",       chapter:  12, start:  2, end:  2 ),
        Scripture( book: "Romans",        chapter:   8, start: 28, end: 30 ),
        Scripture( book: "John",          chapter:  10, start: 27, end: 29 ),
        Scripture( book: "Ephesians",     chapter:   1, start:  3, end: 14 ),
        Scripture( book: "Romans",        chapter:   8, start: 31, end: 39 ),
        Scripture( book: "John",          chapter:   6, start: 37, end: 47 ),
        Scripture( book: "John",          chapter:   5, start: 24, end: 24 ),
        Scripture( book: "Romans",        chapter:   5, start:  9, end:  9 ),
        Scripture( book: "Romans",        chapter:  11, start: 29, end: 29 ),
        Scripture( book: "Psalm",         chapter:  37, start: 28, end: 28 ),
        Scripture( book: "Isaiah",        chapter:  46, start:  3, end:  4 ),
        Scripture( book: "Psalm",         chapter:  20, start:  6, end:  6 ),
        Scripture( book: "Psalm",         chapter: 121, start:  1, end:  8 ),
        Scripture( book: "Jeremiah",      chapter:  32, start:  3, end: 40 ),
        Scripture( book: "Hebrews",       chapter:   6, start: 17, end: 19 ),
        Scripture( book: "Hebrews",       chapter:  13, start: 20, end: 21 ),
        Scripture( book: "1 Peter",       chapter:   1, start:  3, end:  5 ),
    ]
}

//
struct References {
    //
    static let resource = [
        //
        Sermon(title:  "Total Depravity",
               pastor: "Dr. M. Keith Foskey",
               church: "Sovereign Grace Family Church",
               image:  "sovereign_grace_sermon_audio",
               link:   "https://www.sermonaudio.com/playpopup.asp?SID=82512053219"),
        //
        Sermon(title:  "Unconditional Election",
               pastor: "Dr. M. Keith Foskey",
               church: "Sovereign Grace Family Church",
               image:  "sovereign_grace_sermon_audio",
               link:   "https://www.sermonaudio.com/playpopup.asp?SID=718212346498188"),
        //
        Sermon(title:  "Limited Atonement",
               pastor: "Dr. M. Keith Foskey",
               church: "Sovereign Grace Family Church",
               image:  "sovereign_grace_sermon_audio",
               link:   "https://www.sermonaudio.com/playpopup.asp?SID=42201531446"),
        //
        Sermon(title:  "Irresistible Grace",
               pastor: "Dr. M. Keith Foskey",
               church: "Sovereign Grace Family Church",
               image:  "sovereign_grace_sermon_audio",
               link:   "https://www.sermonaudio.com/playpopup.asp?SID=72320142117029"),
        //
        Sermon(title:  "Perseverance of the Saints",
               pastor: "Dr. M. Keith Foskey",
               church: "Sovereign Grace Family Church",
               image:  "sovereign_grace_sermon_audio",
               link:   "https://www.sermonaudio.com/playpopup.asp?SID=89212233183000")
    ]
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
