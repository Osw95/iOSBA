//
//  tvshow.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import Foundation


struct tvshow: Codable {
    let score:Float?
    let show:showInfo
}

struct showInfo:Codable{
    let id: Int
    let url: String
    let name: String
    let type: String
    let language: String?
    let genres: [String]
    let status: String
    let officialSite: String?
    let image:imageShowInfo?
    let externals: external?
    let summary:String?
}

struct imageShowInfo: Codable{
    let medium: String?
    let original: String?
}

///https://www.imdb.com/title/tt2622990/
struct external: Codable {
    let imdb: String?
}
