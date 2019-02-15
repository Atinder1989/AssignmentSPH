//
//  MobileDataRecords.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import Foundation

struct MobileDataRecords: Codable {
    var volume_of_mobile_data: String
    var quarter: String
    var id: Int
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
        self.volume_of_mobile_data = try container.decodeIfPresent(String.self, forKey: .VolumeMobileData) ?? ""
        self.quarter = try container.decodeIfPresent(String.self, forKey: .Quarter) ?? ""
        self.id = try container.decodeIfPresent(Int.self, forKey: .RecordFieldId) ?? 0
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}
