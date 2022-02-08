//
//  BaseApiService.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

class BaseAPIService {
  func request<T: Codable>(
    urlString: String ,
    completion: ((_ result: Result<T, ErrorResult>) -> Void)? = nil
  ) {}
}

final class ApiService: BaseAPIService {
    override func request<T: Codable>(urlString: String ,completion: ((_ result: Result<T, ErrorResult>) -> Void)? = nil) {
        
        let url = URL(string: urlString)!
        
        let headers = HeaderRequestBuilder()
            .setJsonContent(true)
            .build()
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let data = data, error == nil else {
                completion?(.failure(ErrorResult.dataNil))
                return
            }
            
            Logger.inspect(key: "Data", value: self.formatData(data))
            
            do {
                let results = try JSONDecoder().decode(T.self, from: data)
                completion?(.success(results))
            } catch let decodingError {
                completion?(.failure(ErrorResult.generalError(message: decodingError.localizedDescription)))
            }
            
        }.resume()
    }
    
    fileprivate func formatData(_ data: Data?) -> Any {
        guard let dataResponse = data else {
            return String(describing: data)
        }
        return NSString(data: dataResponse, encoding: String.Encoding.utf8.rawValue) as Any
    }
}
