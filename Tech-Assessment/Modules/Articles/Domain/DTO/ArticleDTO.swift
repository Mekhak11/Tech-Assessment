//
//  ArticleDTO.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import Foundation

struct ArticleListDTO: Codable {
    let status, copyright: String?
    let num_results: Int?
    let results: [ArticleDTO]?
}

struct ArticleDTO: Codable {
    let uri: String?
    let url: String?
    let id, asset_id: Int?
    let source, published_date, updated, section: String?
    let subsection, nytdsection, adx_keywords: String?
    let byline, type, title, abstract: String?
    let des_facet, org_facet: [String]?
    let per_facet, geo_facet: [String]?
    let media: [MediaDTO]?
    let etaID: Int?
}

struct MediaDTO: Codable {
    let type, subtype, caption, copyright: String?
    let approved_for_syndication: Int?
    let mediaMetadata: [MediaMetadata]?
    
    private enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approved_for_syndication
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url: String?
    let format: String?
    let height, width: Int?
}

