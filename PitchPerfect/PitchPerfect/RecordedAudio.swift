//
//  RecordedAudio.swift
//  PitchPerfect
//
//  Created by Steve Davis on 3/19/15.
//  Copyright (c) 2015 Steve. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    var filePathUrl: NSURL!
    var title: String!
    
    //Task 1 of project: create a constructor
    init (filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
    
}