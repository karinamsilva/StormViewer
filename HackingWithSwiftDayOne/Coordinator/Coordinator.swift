//
//  Coordinator.swift
//  HackingWithSwiftDayOne
//
//  Created by Karina on 18/09/24.
//

import UIKit

class Coordinator {
    
    let navigationController: UINavigationController
    let mainController = ViewController(viewModel: MainViewModel())
    let imageController = DetailController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        mainController.coordinator = self
        mainController.delegate = self
        navigationController.pushViewController(mainController, animated: true)
    }
    
    func navigateToImages(with image: String) {
        imageController.coordinator = self
        imageController.setupImage(using: image)
        navigationController.pushViewController(imageController, animated: true)
    }
}

extension Coordinator: TitleDelegate {
    func setupTitle(total: Int, current: Int) {
        imageController.setTitle(total: total, current: current)
    }
}
