//
//  ViewController.swift
//  TabberLesson11
//
//  Created by Авазбек Надырбек уулу on 06.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    private var imageOrigin: CGPoint = .zero
    
    private lazy var mainBTN: UIButton = {
        $0.backgroundColor = .systemBlue
        $0.setTitle("Перейти", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tag = 1
        $0.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var mainBTN2: UIButton = {
        $0.backgroundColor = .systemBlue
        $0.setTitle("Перейти2", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tag = 2
        $0.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return $0
    }(UIButton())
    
    //UITapped
    
    
    private lazy var imgOfCard: UIImageView = {
        let tagGest = UITapGestureRecognizer(target: self, action: #selector(tappGest))
        tagGest.numberOfTapsRequired = 2
        
        let panGest = UIPanGestureRecognizer(target: self, action: #selector(panGuest))
        let pinchGest = UIPinchGestureRecognizer(target: self, action: #selector(pinchGuest))
        
        $0.frame = CGRect(x: 30, y: 100, width: 300, height: 300)
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.image = UIImage(named: "img1")
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(tagGest)
        $0.addGestureRecognizer(panGest)
        $0.addGestureRecognizer(pinchGest)
        self.imageOrigin = $0.frame.origin
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainBTN)
        view.addSubview(imgOfCard)
        view.addSubview(mainBTN2)
        NSLayoutConstraint.activate([
            mainBTN.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainBTN.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainBTN2.topAnchor.constraint(equalToSystemSpacingBelow: mainBTN.bottomAnchor, multiplier: 1),
        ])
    }
    
    @objc
    func btnTapped(sender: UIButton) {
        print(sender.tag)
    }
    
    @objc
    func tappGest(sender: UIGestureRecognizer) {
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    @objc
    func panGuest(sender: UIPanGestureRecognizer) {
        guard let senderView = sender.view else { return }
        
        let translation = sender.translation(in: view)
        senderView.frame.origin = CGPoint(x: senderView.frame.origin.x + translation.x, y: senderView.frame.origin.y + translation.y)
        
        print(sender.state.rawValue)
        if sender.state == .ended {
    
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self = self else { return }
                senderView.frame.origin = imageOrigin
            }
        }
        sender.setTranslation(.zero, in: view)
    }
    
    @objc
    func pinchGuest(sender: UIPinchGestureRecognizer) {
        guard let senderView = sender.view else { return }
        
        if sender.state == .began || sender.state == .changed {
            senderView.transform = senderView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.3) {
                senderView.transform = CGAffineTransform.identity
            }
        }
    }
}
