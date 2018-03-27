//
//  GitRepo.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/15/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import ObjectMapper

struct GitRepo: Mappable {
    var id: Int?
    var owner: GitOwner?
    var name: String?
    var description: String?
    
    var watchersCount: Int?
    
    var forks: Int?
    var forksUrl: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        owner <- map["owner"]
        name <- map["name"]
        description <- map["description"]
        
        watchersCount <- map["watchers_count"]
        
        forks <- map["forks"]
        forksUrl <- map["forks_url"]
    }
}


/*
"archive_url" = "https://api.github.com/repos/Alamofire/Alamofire/{archive_format}{/ref}";
archived = 0;
"assignees_url" = "https://api.github.com/repos/Alamofire/Alamofire/assignees{/user}";
"blobs_url" = "https://api.github.com/repos/Alamofire/Alamofire/git/blobs{/sha}";
"branches_url" = "https://api.github.com/repos/Alamofire/Alamofire/branches{/branch}";
"clone_url" = "https://github.com/Alamofire/Alamofire.git";
"collaborators_url" = "https://api.github.com/repos/Alamofire/Alamofire/collaborators{/collaborator}";
"comments_url" = "https://api.github.com/repos/Alamofire/Alamofire/comments{/number}";
"commits_url" = "https://api.github.com/repos/Alamofire/Alamofire/commits{/sha}";
"compare_url" = "https://api.github.com/repos/Alamofire/Alamofire/compare/{base}...{head}";
"contents_url" = "https://api.github.com/repos/Alamofire/Alamofire/contents/{+path}";
"contributors_url" = "https://api.github.com/repos/Alamofire/Alamofire/contributors";
"created_at" = "2014-07-31T05:56:19Z";
"default_branch" = master;
"deployments_url" = "https://api.github.com/repos/Alamofire/Alamofire/deployments";
description = "Elegant HTTP Networking in Swift";
"downloads_url" = "https://api.github.com/repos/Alamofire/Alamofire/downloads";
"events_url" = "https://api.github.com/repos/Alamofire/Alamofire/events";
fork = 0;
forks = 4664;
"forks_count" = 4664;
"forks_url" = "https://api.github.com/repos/Alamofire/Alamofire/forks";
"full_name" = "Alamofire/Alamofire";
"git_commits_url" = "https://api.github.com/repos/Alamofire/Alamofire/git/commits{/sha}";
"git_refs_url" = "https://api.github.com/repos/Alamofire/Alamofire/git/refs{/sha}";
"git_tags_url" = "https://api.github.com/repos/Alamofire/Alamofire/git/tags{/sha}";
"git_url" = "git://github.com/Alamofire/Alamofire.git";
"has_downloads" = 1;
"has_issues" = 1;
"has_pages" = 1;
"has_projects" = 1;
"has_wiki" = 0;
homepage = "";
"hooks_url" = "https://api.github.com/repos/Alamofire/Alamofire/hooks";
"html_url" = "https://github.com/Alamofire/Alamofire";
id = 22458259;
"issue_comment_url" = "https://api.github.com/repos/Alamofire/Alamofire/issues/comments{/number}";
"issue_events_url" = "https://api.github.com/repos/Alamofire/Alamofire/issues/events{/number}";
"issues_url" = "https://api.github.com/repos/Alamofire/Alamofire/issues{/number}";
"keys_url" = "https://api.github.com/repos/Alamofire/Alamofire/keys{/key_id}";
"labels_url" = "https://api.github.com/repos/Alamofire/Alamofire/labels{/name}";
language = Swift;
"languages_url" = "https://api.github.com/repos/Alamofire/Alamofire/languages";
license =             {
    key = mit;
    name = "MIT License";
    "spdx_id" = MIT;
    url = "https://api.github.com/licenses/mit";
};
"merges_url" = "https://api.github.com/repos/Alamofire/Alamofire/merges";
"milestones_url" = "https://api.github.com/repos/Alamofire/Alamofire/milestones{/number}";
"mirror_url" = "<null>";
name = Alamofire;
"notifications_url" = "https://api.github.com/repos/Alamofire/Alamofire/notifications{?since,all,participating}";
"open_issues" = 55;
"open_issues_count" = 55;
owner =             {
    "avatar_url" = "https://avatars3.githubusercontent.com/u/7774181?v=4";
    "events_url" = "https://api.github.com/users/Alamofire/events{/privacy}";
    "followers_url" = "https://api.github.com/users/Alamofire/followers";
    "following_url" = "https://api.github.com/users/Alamofire/following{/other_user}";
    "gists_url" = "https://api.github.com/users/Alamofire/gists{/gist_id}";
    "gravatar_id" = "";
    "html_url" = "https://github.com/Alamofire";
    id = 7774181;
    login = Alamofire;
    "organizations_url" = "https://api.github.com/users/Alamofire/orgs";
    "received_events_url" = "https://api.github.com/users/Alamofire/received_events";
    "repos_url" = "https://api.github.com/users/Alamofire/repos";
    "site_admin" = 0;
    "starred_url" = "https://api.github.com/users/Alamofire/starred{/owner}{/repo}";
    "subscriptions_url" = "https://api.github.com/users/Alamofire/subscriptions";
    type = Organization;
    url = "https://api.github.com/users/Alamofire";
};
private = 0;
"pulls_url" = "https://api.github.com/repos/Alamofire/Alamofire/pulls{/number}";
"pushed_at" = "2018-01-09T09:23:30Z";
"releases_url" = "https://api.github.com/repos/Alamofire/Alamofire/releases{/id}";
score = "61.343292";
size = 5119;
"ssh_url" = "git@github.com:Alamofire/Alamofire.git";
"stargazers_count" = 26566;
"stargazers_url" = "https://api.github.com/repos/Alamofire/Alamofire/stargazers";
"statuses_url" = "https://api.github.com/repos/Alamofire/Alamofire/statuses/{sha}";
"subscribers_url" = "https://api.github.com/repos/Alamofire/Alamofire/subscribers";
"subscription_url" = "https://api.github.com/repos/Alamofire/Alamofire/subscription";
"svn_url" = "https://github.com/Alamofire/Alamofire";
"tags_url" = "https://api.github.com/repos/Alamofire/Alamofire/tags";
"teams_url" = "https://api.github.com/repos/Alamofire/Alamofire/teams";
"trees_url" = "https://api.github.com/repos/Alamofire/Alamofire/git/trees{/sha}";
"updated_at" = "2018-01-15T12:07:46Z";
url = "https://api.github.com/repos/Alamofire/Alamofire";
watchers = 26566;
"watchers_count" = 26566;
}
*/
