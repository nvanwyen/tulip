//
//  Sample.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/6/24.
//

import Foundation

//
struct Sample {
    //
    static let acrostic = Acrostic(title: "Total Depravity",
                                   image: "total_depravity",
                                   type:  AcrosticType.total_depravity,
                                   text:  AcrosticText.total_depravity)
    
    //
    static var scripture = Scripture( book: "Ephesians",
                                      chapter: 2,
                                      start: 1,
                                      end:  3 )
    
    //
    static let sermon = Sermon(title:  "Total Depravity",
                               pastor: "Dr. M. Keith Foskey",
                               church: "Sovereign Grace Family Church",
                               image:  "sovereign_grace_sermon_audio",
                               link:   "https://www.sermonaudio.com/playpopup.asp?SID=82512053219")
    
    //
    static var prayer = Prayer(date: Date.now,
                               title: "Unspoken",
                               text: "A personal supplication",
                               done: false,
                               praise: true)
}
