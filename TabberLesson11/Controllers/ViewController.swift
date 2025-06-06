//
//  ViewController.swift
//  TabberLesson11
//
//  Created by Авазбек Надырбек уулу on 06.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    
    private lazy var mainBTN: UIButton = {
        $0.backgroundColor = .systemBlue
        $0.setTitle("Перейти", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    })))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainBTN)
        NSLayoutConstraint.activate([
            mainBTN.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainBTN.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

