//
//  ServiceHelper.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import Foundation

enum ServiceEnvironment : String {
    case Production   = "https://data.gov.sg/api/action/"
}

class ServiceHelper: NSObject {
    static private var baseURL: ServiceEnvironment {
        get {
            return ServiceEnvironment.Production
        }
    }
}

//MARK: All Apis
extension ServiceHelper {
    static func getDataStoreSearchUrl() -> String {
        return baseURL.rawValue + "datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f"
    }
}
