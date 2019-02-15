//
//  MobileDataUsageResponse.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import Foundation

struct MobileDataUsageResponse: Codable {
    var help: String
    var success: Bool
    var fields: [MobileDataField]
    var records: [MobileDataRecords]
    var links: MobileDataLinks?
    var total: Int
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: ServiceParsingKeys.self)
        self.help = try container.decodeIfPresent(String.self, forKey: .Help) ?? ""
        self.success = try container.decodeIfPresent(Bool.self, forKey: .Success) ?? false
        let resultContainer = try container.nestedContainer(keyedBy: ServiceParsingKeys.self, forKey: .Result)
        self.fields    = try resultContainer.decodeIfPresent([MobileDataField].self, forKey: .Fields) ?? []
        self.records    = try resultContainer.decodeIfPresent([MobileDataRecords].self, forKey: .Records) ?? []
        self.links    = try resultContainer.decodeIfPresent(MobileDataLinks.self, forKey: .Links) ?? nil
        self.total    = try resultContainer.decodeIfPresent(Int.self, forKey: .Total) ?? 0
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
}
