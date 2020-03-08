//
//  UrlConnectionServer.swift
//  Lastfm-Hari
//
//  Created by Hari Prasath on 07/03/2020.
//  Copyright © 2020 Hari Prasath. All rights reserved.
//

import Foundation
import Alamofire

class UrlConnection: NSObject {
    
    static func fetchData(url: URL, completionHandler : @escaping (_ responseData:Data)->())
    {
        AF.request(url).responseData(completionHandler: {response in
            completionHandler(response.data ?? Data())
        })
    }
}
