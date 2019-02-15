//
//  MobileDataField.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import Foundation

struct MobileDataField: Codable {
    var type: String
    var id: String
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .FieldType) ?? ""
        self.id = try container.decodeIfPresent(String.self, forKey: .FieldId) ?? ""
        
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}
