//
//  ArticleListModel.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 30.08.23.
//

import Foundation

struct ArticleListModel {
    let status, copyright: String
    let numResults: Int
    var results: [ArticleModel]
    
    init(status: String, copyright: String, numResults: Int, results: [ArticleModel]) {
        self.status = status
        self.copyright = copyright
        self.numResults = numResults
        self.results = results
    }
    
    init(dto: ArticleListDTO) {
        self.status = dto.status ?? ""
        self.copyright = dto.copyright ?? ""
        self.numResults = dto.num_results ?? 0
        self.results = dto.results.map({$0.map({ArticleModel(dto: $0)})}) ?? []
    }
}

struct ArticleModel {
    let uri: String
    let url: String
    let id, assetID: Int
    let source, publishedDate, updated, section: String
    let subsection, nytdsection, adxKeywords: String
    let byline, type, title, abstract: String
    let desFacet: [String]
    let perFacet, geoFacet: [String]
    let media: [MediaModel]
    let etaID: Int
    
    init(uri: String, url: String, id: Int, assetID: Int, source: String, publishedDate: String, updated: String, section: String, subsection: String, nytdsection: String, adxKeywords: String, byline: String, type: String, title: String, abstract: String, desFacet: [String], perFacet: [String], geoFacet: [String], media: [MediaModel], etaID: Int) {
        self.uri = uri
        self.url = url
        self.id = id
        self.assetID = assetID
        self.source = source
        self.publishedDate = publishedDate
        self.updated = updated
        self.section = section
        self.subsection = subsection
        self.nytdsection = nytdsection
        self.adxKeywords = adxKeywords
        self.byline = byline
        self.type = type
        self.title = title
        self.abstract = abstract
        self.desFacet = desFacet
        self.perFacet = perFacet
        self.geoFacet = geoFacet
        self.media = media
        self.etaID = etaID
    }
    
    init(dto: ArticleDTO) {
        self.uri = dto.uri ?? ""
        self.url = dto.url ?? ""
        self.id = dto.id ?? 0
        self.assetID = dto.asset_id ?? 0
        self.source = dto.source ?? ""
        self.publishedDate = dto.published_date ?? ""
        self.updated = dto.updated ?? ""
        self.section = dto.section ?? ""
        self.subsection = dto.subsection ?? ""
        self.nytdsection = dto.nytdsection ?? ""
        self.adxKeywords = dto.adx_keywords ?? ""
        self.byline = dto.byline ?? ""
        self.type = dto.type ?? ""
        self.title = dto.title ?? ""
        self.abstract = dto.abstract ?? ""
        self.desFacet = dto.des_facet ?? []
        self.perFacet = dto.per_facet ?? []
        self.geoFacet = dto.geo_facet ?? []
        self.media = dto.media.map({$0.map({MediaModel(dto: $0)})}) ?? []
        self.etaID = dto.etaID ?? 0

    }
}

struct MediaModel {
    let type, subtype, caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadataModel]
    
    init(type: String, subtype: String, caption: String, copyright: String, approvedForSyndication: Int, mediaMetadata: [MediaMetadataModel]) {
        self.type = type
        self.subtype = subtype
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }
    
    init(dto: MediaDTO) {
        self.type = dto.type ?? ""
        self.subtype = dto.subtype ?? ""
        self.caption = dto.caption ?? ""
        self.copyright = dto.copyright ?? ""
        self.approvedForSyndication = dto.approved_for_syndication ?? 0
        self.mediaMetadata = dto.mediaMetadata.map({$0.map{MediaMetadataModel(dto: $0)}}) ?? []
    }
    
}

struct MediaMetadataModel: Codable {
    let url: String
    let format: String
    let height, width: Int
    
    init(url: String, format: String, height: Int, width: Int) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
    
    init(dto: MediaMetadata) {
        self.url = dto.url ?? ""
        self.format = dto.format ?? ""
        self.height = dto.height ?? 0
        self.width = dto.width ?? 0
    }
}
