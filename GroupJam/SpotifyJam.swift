//
//  SpotifyJam.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 10/8/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import Foundation

class SpotifyJam : Jam {
    
    var name:String
    var password:String
    var searchable: Bool
    var approve: Bool
    
    var type: String
    
    
    init(name: String, password: String, searchable: Bool, approve: Bool){
        self.name = name
        self.password = password
        self.searchable = searchable
        self.approve = approve
        self.type = "Spotify"
    }
    
    
    
}
