//
//  ZZHArticleThemeResult.swift
//  zhihuDemo
//
//  Created by tom.zhang on 17/1/19.
//  Copyright © 2017年 tom.zhang. All rights reserved.
//

import Foundation

struct ZZHArticleThemeResult {
    var limit: Int?
    var subscribed: Array<String>?
    var themes: Array<ZZHArticleTheme>?
    
    init?(){}
}
