//
//  DetailCell.swift
//  HackingWithSwiftDayOne
//
//  Created by Karina on 16/09/24.
//

import UIKit

class DetailController: UIViewController {
    weak var coordinator: Coordinator?
    
    let stormImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func setTitle(total: Int, current: Int) {
        title = "Picture \(current) of \(total)"
    }
    
    func setupImage(using text: String) {
        stormImage.image = UIImage(named: text)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(stormImage)
        
        stormImage.topAnchor(to: view.topAnchor)
        stormImage.leadingAnchor(to: view.leadingAnchor, constant: 5)
        stormImage.trailingAnchor(to: view.trailingAnchor)
        stormImage.bottomAnchor(to: view.bottomAnchor)
    }
}
