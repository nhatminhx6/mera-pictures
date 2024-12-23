//
//  PhotosAPI.swift
//  MeraPIC
//
//  Created by NhatMinh on 23/12/24.
//

import Foundation
import Combine

protocol PhotosFetchable {
    func fetchPhotosList() -> AnyPublisher<[PhotoModel], APIError>
    func downloadPhoto(_ url: String) -> AnyPublisher<Data,APIError>
}

class PhotosAPI {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension PhotosAPI {
    struct PhotosAPIComponent {
        static let scheme = "https"
        static let host = "api.unsplash.com"
        static let path = "/photos/"
        static let clientID = "2o_IqJGgMv9W_QCBV8od9u1TfrUz-uacpTM_fBmkvDM"
    }
    
    func urlComponentForPhotosList() -> URLComponents {
        var components = URLComponents()
        components.scheme = PhotosAPIComponent.scheme
        components.host = PhotosAPIComponent.host
        components.path = PhotosAPIComponent.path
        components.queryItems = [
          URLQueryItem(name: "client_id", value: PhotosAPIComponent.clientID ),
        ]
        
        print("MERALOG urlComponentForPhotosList  \(components)  ")
        
        return components
    }
    
    func urlComponentToDownloadPhoto(_ url: String) throws -> URLComponents {
        guard var components = URLComponents(string: url) else {
            throw APIError.request(message: "Invalid URL")
        }
        components.queryItems = [
          URLQueryItem(name: "w", value: "750" ),
          URLQueryItem(name: "dpr", value: "2" ),
        ]
        return components
    }
}


extension PhotosAPI: PhotosFetchable, Fetchable, Downloadable {
    func fetchPhotosList() -> AnyPublisher<[PhotoModel], APIError> {
        return fetch(with: self.urlComponentForPhotosList(), session: self.session)
    }
    
    func downloadPhoto(_ url: String) -> AnyPublisher<Data, APIError> {
        return downloadData(with: try? self.urlComponentToDownloadPhoto(url), session: self.session)
    }
}

