//
//  TabPresenter.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 21/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation
import UIKit

class TabPresenter {
    func windowConfig(window : UIWindow?) {
        let tabBarController = UITabBarController()
        
        let charactersListPresenter = ListPresenter(type: .characters)
        let charactersListViewController = ListTableViewController(presenter: charactersListPresenter)
        charactersListViewController.tabBarItem = UITabBarItem()
        charactersListViewController.title = "Characters"
        let characterNavigationController = UINavigationController(rootViewController: charactersListViewController)
        
        let comicsListPresenter = ListPresenter(type: .comics)
        let comicsListViewController = ListTableViewController(presenter: comicsListPresenter)
        comicsListViewController.tabBarItem = UITabBarItem()
        comicsListViewController.title = "Comics"
        let comicNavigationController = UINavigationController(rootViewController: comicsListViewController)
        
        let storiesListPresenter = ListPresenter(type: .stories)
        let storiesListViewController = ListTableViewController(presenter: storiesListPresenter)
        storiesListViewController.tabBarItem = UITabBarItem()
        storiesListViewController.title = "Stories"
        let storyNavigationController = UINavigationController(rootViewController: storiesListViewController)
        
        let controllers : [UIViewController] = [characterNavigationController, comicNavigationController, storyNavigationController]
        tabBarController.viewControllers  = controllers
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
