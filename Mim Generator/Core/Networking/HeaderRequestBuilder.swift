//
//  HeaderRequestBuilder.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

class HeaderRequestBuilder {
    
    private var header: [String : String] = [:]
    
    //crete singleton
    private static var shared: HeaderRequestBuilder?
    
    class var sharedInstance: HeaderRequestBuilder {
        guard let shared = self.shared else {
            let shared = HeaderRequestBuilder()
            self.shared = shared
            return shared
        }
        return shared
    }
    
    class func destroyHeader(){
        shared = nil
    }
    
    func setJsonContent(_ state: Bool) -> Self {
        if state {
            header["Content-Type"] = "application/json"
        }
        return self
    }
    
    func setFormUrlEncoded() -> Self {
        header["Content-Type"] = "application/x-www-form-urlencoded"
        return self
    }
    
    func withToken(auth: String) -> Self {
        if !auth.isEmpty {
            header["Authorization"] = "Bearer \(auth)"
        }
        return self
    }
    
    func build() -> [String : String] {
        //header["Accept"] = "*/*"
        header["Cache-Control"] = "no-cache"
        return header
    }
    
    func builds() {
        headers = header
    }
    
    var headers: [String: String] {
        get{
            return header
        }
        
        set{}
    }
}
