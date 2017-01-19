//
//  BaseServiceAPI.swift
//  zhihuDemo
//
//  Created by tom.zhang on 17/1/19.
//  Copyright © 2017年 tom.zhang. All rights reserved.
//

import Foundation

struct BaseServiceAPI {
    static let APIBase = "http://news-at.zhihu.com/api/4"
    
    static let APIArticleList = APIBase + "/news/latest"
    static let APIArticleDetail = APIBase + "/news/"
    
    static let APIArticleThemes = APIBase + "/themes"
    static let APIArticleThemeDetails = APIBase + "/theme/"
}
