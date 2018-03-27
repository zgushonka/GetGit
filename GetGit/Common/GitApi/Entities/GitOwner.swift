//
//  GitOwner.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import ObjectMapper

struct GitOwner: Mappable {
    var id: Int?
    var avatarUrl: String?
    var login: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        avatarUrl <- map["avatar_url"]
        login <- map["login"]
    }
}

//owner =             {
//    "avatar_url" = "https://avatars3.githubusercontent.com/u/7774181?v=4";
//    "events_url" = "https://api.github.com/users/Alamofire/events{/privacy}";
//    "followers_url" = "https://api.github.com/users/Alamofire/followers";
//    "following_url" = "https://api.github.com/users/Alamofire/following{/other_user}";
//    "gists_url" = "https://api.github.com/users/Alamofire/gists{/gist_id}";
//    "gravatar_id" = "";
//    "html_url" = "https://github.com/Alamofire";
//    id = 7774181;
//    login = Alamofire;
//    "organizations_url" = "https://api.github.com/users/Alamofire/orgs";
//    "received_events_url" = "https://api.github.com/users/Alamofire/received_events";
//    "repos_url" = "https://api.github.com/users/Alamofire/repos";
//    "site_admin" = 0;
//    "starred_url" = "https://api.github.com/users/Alamofire/starred{/owner}{/repo}";
//    "subscriptions_url" = "https://api.github.com/users/Alamofire/subscriptions";
//    type = Organization;
//    url = "https://api.github.com/users/Alamofire";
//};

