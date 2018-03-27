//
//  AppDependencies.swift
//  GetGit
//
//  Created by Oleksandr Buravlyov on 1/14/18.
//  Copyright © 2018 FarelApps. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    
    static func assembleSearchModule() -> UIViewController? {
        let wireframe = SearchWireframe()
        let vc = wireframe.createViewFromStoryboard()
        guard let view = vc else { return nil }
        
        let presenter = SearchPresenter()
        let dataManager = SearchDataManager(gitFetcher: GitFetcher())
        let interactor = SearchInteractor(dataManager: dataManager)
        
        view.eventHandler = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        presenter.imageProvdier = ImageCacher.shared
        interactor.output = presenter
        return view
    }

    static func assembleForksModule(repoDetails: (name: String, forksUrl: String)) -> UIViewController? {
        let wireframe = ForksWireframe()
        let vc = wireframe.createViewFromStoryboard()
        guard let view = vc else { return nil }
        
        let presenter = ForksPresenter()
        let dataManager = ForksDataManager(gitFetcher: GitFetcher())
        let interactor = ForksInteractor(repoName: repoDetails.name, forksUrl: repoDetails.forksUrl, dataManager: dataManager)
        
        view.eventHandler = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        presenter.imageProvdier = ImageCacher.shared
        interactor.output = presenter
        return view
    }
    
    static func assembleMyReposModule() -> UIViewController? {
        let wireframe = MyReposWireframe()
        let vc = wireframe.createViewFromStoryboard()
        guard let view = vc else { return nil }
        
        let presenter = MyReposPresenter()
        let dataManager = MyReposDataManager(gitFetcher: GitFetcher())
        let interactor = MyReposInteractor(dataManager: dataManager)
        
        view.eventHandler = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        presenter.imageProvdier = ImageCacher.shared
        interactor.output = presenter
        return view
    }
    
}


