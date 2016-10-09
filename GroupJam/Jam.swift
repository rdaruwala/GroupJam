//
//  Jam.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 10/8/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import Foundation

protocol Jam{
    
    var name:String {get set}
    var password:String {get set}
    var searchable:Bool {get set}
    var approve:Bool {get set}
    
    var type:String {get}
    
    
}
