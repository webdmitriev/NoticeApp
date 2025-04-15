//
//  APINetworkManager.swift
//  NoticeApp
//
//  Created by Олег Дмитриев on 14.04.2025.
//

import Foundation

struct Responce: Codable {
    let status: String
    let articles: [Articles]
}

struct Articles: Codable {
    let title: String?
    let author: String?
    let urlToImage: String?
}

//struct UnsplashResponse: Codable {
//    let items: UnsplashItemsResponse
//}
//
//struct UnsplashItemsResponse: Codable {
//    let id: String
//    let urls: [UnsplashItemsUrls]
//}
//
//struct UnsplashItemsUrls: Codable {
//    let regular: String
//}

// MARK: - WelcomeElement
struct UnsplashPictures: Codable {
    let id: String
    let urls: Urls
}

// MARK: - Urls
struct Urls: Codable {
    let full: String
    let regular: String

    enum CodingKeys: String, CodingKey {
        case full, regular
    }
}

typealias UnsplashPicture = [UnsplashPictures]

class APINetworkManager {
    
    func sendRequest(q: String) {
        
        // 1 create url
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.path = "/photos"
        urlComponents.queryItems = [
//            URLQueryItem(name: "q", value: q),
//            URLQueryItem(name: "from", value: "2025-03-14"),
//            URLQueryItem(name: "sortBy", value: "publishedAt"),
//            URLQueryItem(name: "apiKey", value: "03dbc8f433f44533a30945b2302cb085"),
//            URLQueryItem(name: "pageSize", value: "4"),
            URLQueryItem(name: "client_id", value: "ySkoKK_tOE8UkWKMfbiRp8lOIKLYsfEkHijb1BNqILg"),
            URLQueryItem(name: "page", value: "1"),
        ]
        
        guard let url = urlComponents.url else { return }
        
        // 2 create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // 3 senc request
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            //print(response)
            
            //print(data)
            guard let data else { return }
            
            do {
                let result = try JSONDecoder().decode(UnsplashPicture.self, from: data)

                result.forEach({ item in
                    print("\nItem:")
                    print("ID: " + item.id)
                    print("Link 1: " + item.urls.full)
                    print("Link 2: " + item.urls.regular)
                })

            } catch {
                print(error)
            }
        }
        .resume()
    }
    
}

/// https://newsapi.org/v2/everything
///
/// schem - https
/// host - newsapi.org
/// path - /v2/everything
///
///
/// query items [String: String]
///
/// q=tesla
/// from=2025-03-14
/// sortBy=publishedAt
/// apiKey=03dbc8f433f44533a30945b2302cb085
///
///
///
///
///
///
///
/// https://api.unsplash.com
///
/// schem - https
/// host - api.unsplash.com
/// path - /photos
///
/// client_id=ySkoKK_tOE8UkWKMfbiRp8lOIKLYsfEkHijb1BNqILg
///
/// 36t8pTT7ydOlWQc5hapOfYeYI5VHh_MqPR_z4F2MRRM
///

