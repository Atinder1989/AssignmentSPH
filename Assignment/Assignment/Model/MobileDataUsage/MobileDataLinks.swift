//
//  MobileDataLinks.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import Foundation

struct MobileDataLinks: Codable {
    var start: String
    var next: String
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
        self.start = try container.decodeIfPresent(String.self, forKey: .Start) ?? ""
        self.next = try container.decodeIfPresent(String.self, forKey: .Next) ?? ""
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}
