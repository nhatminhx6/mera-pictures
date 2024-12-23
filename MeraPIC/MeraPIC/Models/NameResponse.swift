//
//  NameResponse.swift
//  MeraPIC
//
//  Created by NhatMinh on 17/12/24.
//

import UIKit

struct NameResponse: Codable {
    
    let name: String
    let gender: GenderType
    let count: Int
    
    enum GenderType: String, Codable {
        case male = "male"
        case female = "female"
        case unknown
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            self = GenderType(rawValue: string) ?? .unknown
        }
    }
    
    func getGenderColor()-> UIColor {
        switch gender {
        case .male:
            return .link
        case .female:
            return .systemPink
        case .unknown:
            return .orange
        }
    }
}
