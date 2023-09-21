//
//  WelcomeViewController.swift
//  Exam
//
//  Created by ANG OUSA on 15/9/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    private var uikitDoc = [["🍏 Table view", "⚙️ Collection view", "🔧 Activity view", "🏙 Image view", "🌅 Pages", "🌠 Popovers", "⛲️ Spit view", "💡 Text view", "🏝 Web view"], ["🧞‍♀️ Date Picker", "🥇 Button", "🏄🏻‍♀️ Color wells", "🏊‍♀️ Context menus", "🏄🏻‍♀️ Edit menus", "🎪 Pickers", "🏵 Pull down menus", "🎲 Segmented Controls", "🫖 Sliders", "🍭 Steppers", "🥂 Switches", "🍥 Text Fields"]] // [[], []]
    
    private lazy var tableView: UITableView = {
        let tb = UITableView(frame: .zero, style: .insetGrouped)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Welcome"
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-close"), style: .done, target: self, action: #selector(close))
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
    }
    
    func loadUsers() {
        //
        tableView.reloadData()
    }
    
    deinit {
        print("Welcome view controller dead!")
    }
    
    // MARK: - Actions
    @objc private func close() {
        dismiss(animated: true)
    }
    
}

extension WelcomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return uikitDoc.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uikitDoc[section].count // uikitDoc[0].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = uikitDoc[indexPath.section][indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}

extension WelcomeViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "UIKit Views"
        }
        return "Controls"
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
}
