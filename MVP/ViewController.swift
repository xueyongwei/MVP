//
//  ViewController.swift
//  MVP
//
//  Created by 薛永伟 on 2018/8/8.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let showGreetingButton = UIButton.init(type: .custom)
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showGreetingButton.setTitle("click", for: .normal)
        showGreetingButton.setTitleColor(.white, for: .normal)
        showGreetingButton.backgroundColor = .red
        self.view.addSubview(showGreetingButton)
        
        showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        showGreetingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40 ).isActive = true
        showGreetingButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        showGreetingButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        showGreetingButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        self.showGreetingButton.addTarget(self, action: #selector(didClickButton(sender:)), for: .touchUpInside)
        
    }

    @objc func didClickButton(sender:UIButton){
        let person = Person(firstName: "rui", lastName: "xue")
        let view = MVPViewController()
        let presenter = GreetingPresenter.init(view: view, person: person)
        view.persenter = presenter
        self.navigationController?.pushViewController(view, animated: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}












