//
//  PlayerDataModel.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/26.
//

import UIKit

struct PlayerDataModel {
    
    let playerName: String
    let backNumber: String
    let position: String
    let comment: String
}

extension PlayerDataModel {
    
    static func mockup() -> [PlayerDataModel] {
        [
            .init(playerName: "鈴木暁斗", backNumber: "10", position: "MF", comment: "よろしく〜"),
            .init(playerName: "田中悠斗", backNumber: "3", position: "DF", comment: "よろしくお願いします"),
            .init(playerName: "吉田飛翼", backNumber: "11", position: "FW", comment: "よろしくお願いします"),
            .init(playerName: "木津賀博", backNumber: "5", position: "MF", comment: "よろしくお願いします"),
            .init(playerName: "小澤誉", backNumber: "4", position: "DF", comment: "よろしくお願いします"),
            .init(playerName: "吉田椋也", backNumber: "1", position: "GK", comment: "よろしくお願いします"),
            .init(playerName: "喜多村海人", backNumber: "3", position: "DF", comment: "よろしくお願いします"),
            .init(playerName: "西山竜生", backNumber: "7", position: "MF&DF", comment: "よろしくお願いします"),
            .init(playerName: "上條栞汰", backNumber: "8", position: "MF", comment: "よろしくお願いします")
        ]
    }
}
