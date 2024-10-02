//
//  ViewController.swift
//  HackingWithSwiftDayOne
//
//  Created by Karina on 16/09/24.
//

import UIKit

protocol TitleDelegate: AnyObject {
    func setupTitle(total: Int, current: Int)
}

class ViewController: UIViewController {
    
    let tableView = UITableView()
    weak var coordinator: Coordinator?
    weak var delegate: TitleDelegate?
    let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setConstraints()
        setupTitle()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareApp))
    }

    @objc func shareApp() {
        let text = "You should check this app - Storm Viewer"
        
        let controller = UIActivityViewController(activityItems: [text], applicationActivities: [])
        controller.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(controller, animated: true)
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.register(ImagesCell.self, forCellReuseIdentifier: ImagesCell.identifier)
    }
    
    func setupTitle() {
        title = "Storm Viewer"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setConstraints() {
        tableView.topAnchor(to: view.layoutMarginsGuide.topAnchor)
        tableView.leadingAnchor(to: view.leadingAnchor)
        tableView.trailingAnchor(to: view.trailingAnchor)
        tableView.bottomAnchor(to: view.bottomAnchor)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImagesCell.identifier, for: indexPath)
                as? ImagesCell else { return UITableViewCell() }
        cell.setupLabel(title: viewModel.pictures[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.setupTitle(total: viewModel.pictures.count, current: indexPath.row + 1)
        coordinator?.navigateToImages(with: viewModel.pictures[indexPath.row])
    }
}
