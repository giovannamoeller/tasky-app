//
//  TasksViewController.swift
//  Tasky
//
//  Created by Giovanna Moeller on 28/05/24.
//

import UIKit

class TasksViewController: UIViewController {
    
    private var tasks: [String] = ["Fazer café", "Estudar Swift", "Fazer trabalho da faculdade"]
    
    private lazy var tasksTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        addGradientBackground()
        addSubviews()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
    }
    
    private func addSubviews() {
        view.addSubview(tasksTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tasksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
