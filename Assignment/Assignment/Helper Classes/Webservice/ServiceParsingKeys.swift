//
//  ServiceParsingKeys.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import Foundation

enum ServiceParsingKeys : String, CodingKey {
    case Help                =   "help"
    case Success             =   "success"
    case Result              =   "result"
    case Fields              =   "fields"
    case FieldType           =   "type"
    case FieldId             =   "id"
    case Records             =   "records"
    case VolumeMobileData    =   "volume_of_mobile_data"
    case Quarter             =   "quarter"
    case RecordFieldId       =   "_id"
    case Links               =   "_links"
    case Start               =   "start"
    case Next                =   "next"
    case Total               =   "total"
    
}
