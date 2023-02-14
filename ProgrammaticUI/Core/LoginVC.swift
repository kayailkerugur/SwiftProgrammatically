//
//  LoginVC.swift
//  ProgrammaticUI
//
//  Created by İlker Kaya on 9.02.2023.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrainsts()
        view.backgroundColor = .white
    }
    
    let bg_image : UIImageView = {
        var iv = UIImageView()
        let img = UIImage(named: "swift")?.withRenderingMode(.alwaysOriginal)
        iv.image = img
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Programmatic UI"
        lb.textColor = .black.withAlphaComponent(0.9)
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let getStartedButton: UIButton = {
        var btn = UIButton()
        btn.layer.cornerRadius = 62/2
        btn.setTitle("Get Started", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 16)
        btn.backgroundColor = .white
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(didPressGetStarted), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let loginLabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    func setupViews(){
        view.addSubview(bg_image)
        [titleLabel,getStartedButton,loginLabel].forEach{
            bg_image.addSubview($0)
        }
    }
    
    func setupConstrainsts() {
        bg_image.pin(to: view)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: bg_image.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: bg_image.centerXAnchor),
            
            loginLabel.bottomAnchor.constraint(equalTo: bg_image.bottomAnchor, constant: -70),
            loginLabel.centerXAnchor.constraint(equalTo: bg_image.centerXAnchor),
            
            getStartedButton.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -20),
            getStartedButton.leadingAnchor.constraint(equalTo: bg_image.leadingAnchor, constant: 50),
            getStartedButton.trailingAnchor.constraint(equalTo: bg_image.trailingAnchor, constant: -50),
            getStartedButton.heightAnchor.constraint(equalToConstant: 62)
        ])
    }
    
    func setAttributedTitle(_ title: String,_ subTitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [.font: UIFont(name: Font.medium.rawValue, size: 16)!,.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: subTitle, attributes: [.font:UIFont(name: Font.medium.rawValue, size: 16)!, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,.foregroundColor: UIColor.white]))
        return attributedText
    }
    
    @objc func didPressGetStarted(){
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = TabBarVC()
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
