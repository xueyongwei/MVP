//
//  ViewController.swift
//  MVP
//
//  Created by 薛永伟 on 2018/8/8.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let mvpButton = UIButton.init(type: .custom)
    let mvvmButton = UIButton.init(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mvpButton.setTitle("MVP", for: .normal)
        mvpButton.setTitleColor(.white, for: .normal)
        mvpButton.backgroundColor = .red
        self.view.addSubview(mvpButton)
        mvpButton.translatesAutoresizingMaskIntoConstraints = false
        mvpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40 ).isActive = true
        mvpButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        mvpButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        mvpButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.mvpButton.addTarget(self, action: #selector(didClickMVPButton(_:)), for: .touchUpInside)
        
        
        mvvmButton.setTitle("MVVM", for: .normal)
        mvvmButton.setTitleColor(.white, for: .normal)
        mvvmButton.backgroundColor = .red
        self.view.addSubview(mvvmButton)
        mvvmButton.translatesAutoresizingMaskIntoConstraints = false
        mvvmButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90 ).isActive = true
        mvvmButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        mvvmButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        mvvmButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        self.mvvmButton.addTarget(self, action: #selector(didClickMVVMButton(_:)), for: .touchUpInside)
        
    }

    @objc func didClickMVPButton(_ sender:UIButton){
        let person = Person(firstName: "rui", lastName: "xue")
        let view = MVPViewController()
        let presenter = GreetingPresenter.init(view: view, person: person)
        view.persenter = presenter
        self.navigationController?.pushViewController(view, animated: true)
        
        
    }
    @objc func didClickMVVMButton(_ sender:UIButton){
        
        let person = MPerson.init(firstName: "Yuri", lastName: "X")
        let view = MVVMViewController()
        let modelView = GreetingViewModel.init(person: person)
        view.viewModel = modelView
        self.navigationController?.pushViewController(view, animated: true)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}












