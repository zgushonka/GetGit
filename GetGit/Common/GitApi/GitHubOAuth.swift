//
//  GitHubOAuth.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/16/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import OAuthSwift

class GitHubOAuth {

    static let shared = GitHubOAuth()
    
    private var oauthswift: OAuth2Swift
    var oauthToken: String?
    
    // better to store this in a separate file outside of git
    private init() {
        oauthswift = OAuth2Swift(
            consumerKey:    "", // paste your keys
            consumerSecret: "",
            authorizeUrl:   "https://github.com/login/oauth/authorize",
            accessTokenUrl: "https://github.com/login/oauth/access_token",
            responseType:   "code"
        )
        oauthswift.authorizeURLHandler = OAuthSwiftOpenURLExternally.sharedInstance
    }
    
    func doOAuthGithub(completion: (()->())? = nil) {
        let state = generateState(withLength: 20)
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "getgit://oauth-callback/github")!,
            scope: "user,repo",
            state: state,
            success: { credential, response, parameters in
                debugPrint(credential.oauthToken)
                self.oauthToken = credential.oauthToken
                completion?()
        }, failure: { error in
                debugPrint(error.description)
        })
    }
    
    func handeUrlCallback(_ url: URL) {
        if (url.host == "oauth-callback") {
            OAuthSwift.handle(url: url)
        }
    }
    
    var isAuthorized: Bool {
        return oauthToken != nil
    }
    
}


