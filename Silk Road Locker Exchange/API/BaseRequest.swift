//
//  BaseRequest.swift
//  Silk Road Locker Exchange
//
//  Created by Oleksii Aharkov on 06.10.2022.
//

import Foundation

public enum HTTPMethod: String {
    case GET, POST, PUT, PATCH, DELETE
}

public enum ContentType: String {
    case application_json = "application/json",
         multipart_form_data = "multipart/form-data"
}

public protocol BaseRequest {

    var url: URL { get }
    var queryItems: [String: String]? { get }
    var headers: [String: String]? { get }
    var httpMethod: HTTPMethod { get }
    var httpBody: [String: Any]? { get }
    var contentType: ContentType { get }
    var path: String? { get }
    associatedtype ReturnType: Decodable
}

extension BaseRequest {
    
    func request() -> URLRequest {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return URLRequest(url: (url))
        }
        
        var qItems: [URLQueryItem] = []
        if let tQueryItems = queryItems  {
            for item in tQueryItems {
                qItems.append(URLQueryItem(name: item.key, value: item.value))
            }
        }
        urlComponents.queryItems = qItems
        if let qPath = path {
            urlComponents.path = urlComponents.path + qPath
        }
        
        var request = URLRequest(url: (urlComponents.url)!)
        
        if let tHeaders = headers {
            for header in tHeaders {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }

        request.httpMethod = httpMethod.rawValue
        
        let boundary = "Boundary-\(UUID().uuidString)"
        
        switch contentType {
            case .application_json:
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                if let httpBody = httpBody {
                    let jsonData = try! JSONSerialization.data(withJSONObject: httpBody, options: [])
                    request.httpBody = jsonData
                }
            case .multipart_form_data:
                request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
                if let httpBody = httpBody {
                    var body = ""
                    
                    body += "--\(boundary)\r\n"
                    body += "Content-Disposition:form-data; name=\"offer[name]\""
                    body += "\r\n\r\n\(httpBody["name"] ?? "")\r\n"
                        
                    body += "--\(boundary)\r\n"
                    body += "Content-Disposition:form-data; name=\"offer[price]\""
                    body += "\r\n\r\n\(httpBody["price"] ?? "")\r\n"
                    
                    body += "--\(boundary)\r\n"
                    body += "Content-Disposition:form-data; name=\"offer[buyer_id]\""
                    body += "\r\n\r\n\(httpBody["buyer_id"] ?? "")\r\n"
                    
                    body += "--\(boundary)\r\n"
                    body += "Content-Disposition:form-data; name=\"offer[image]\""
                    if let imageData = httpBody["image"] as? Data {
                        body += "; filename=\"image.jpg\"\r\n"
                          + "Content-Type: \"content-type header\"\r\n\r\n\(imageData)\r\n"
                    }
                    
                    body += "--\(boundary)--\r\n";
                    let postData = body.data(using: .utf8)
                    request.httpBody = postData
                }
        }
        return request
    }
    
}

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}

extension String {
    func Bearer() -> [String:String] {
        return ["Authorization":"Bearer \(self)"]
    }
}
