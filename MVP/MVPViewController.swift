//
//  MVPViewController.swift
//  MVP
//
//  Created by 薛永伟 on 2018/8/8.
//  Copyright © 2018年 薛永伟. All rights reserved.
//


import UIKit

struct Person {
    let firstName:String
    let lastName:String
}

/// 遵守这个协议的View或VC都能更新UI
protocol GreetingView:class {
    func setGreeting(greeting:String)
}

/// 遵守这个协议的presenter都能处理数据
protocol GreetingViewPresenter {
    init(view:GreetingView,person:Person)
    func showGreeting()
}

class GreetingPresenter:GreetingViewPresenter{
    
    unowned let view: GreetingView
    let person: Person
    let dataSource = [Person]()
    
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "(MVP)Hello " + self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
    
    func requestData(){
        
    }
}

class MVPViewController: UIViewController, GreetingView {

    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
    
    var persenter:GreetingViewPresenter!
    let showGreetingButton = UIButton.init(type: .custom)
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
        showGreetingButton.setTitle("Greeting", for: .normal)
        showGreetingButton.setTitleColor(.red, for: .normal)
        
        showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showGreetingButton)
        showGreetingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        showGreetingButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -80).isActive = true
        showGreetingButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        showGreetingButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        greetingLabel.textColor = .red
        greetingLabel.font = UIFont.systemFont(ofSize: 16)
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingLabel)
        greetingLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        self.showGreetingButton.addTarget(self, action: #selector(didClickButton(sender:)), for: .touchUpInside)
        
    }
    
    @objc func didClickButton(sender:UIButton){
        self.persenter.showGreeting()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
