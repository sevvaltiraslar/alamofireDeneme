//
//  Model.swift
//  Deneme
//
//  Created by SEVVAL on 6.12.2021.
//

import Foundation

struct YoutuberModel: Codable {
    let data: [TekliData]

    enum CodingKeys: String, CodingKey {
        case data
        
    }
}

struct TekliData: Codable {
    let id: Int
    let icon: String
    let baslik, icerik: String
}
