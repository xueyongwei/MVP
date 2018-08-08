//
//  MVVMViewController.swift
//  MVP
//
//  Created by 薛永伟 on 2018/8/8.
//  Copyright © 2018年 薛永伟. All rights reserved.
//


/**
 MVVM中，View拥有ViewModel，ViewModel拥有Model
 View处理与视图相关的东西
 ViewModel处理逻辑相关内容
 Model仅作处理数据内容相关
 
 MVVM最大的特点，是ViewModel与View绑定，通过KVO或者函数式编程。
 **/
import UIKit
struct MPerson {
    let firstName: String
    let lastName: String
}

protocol GreetingViewModelProtocol: class {
    var gretting: String? {get}
    var greetingDidChange:((GreetingViewModelProtocol)->())? {get set}
    init(person:MPerson)
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    var gretting: String?{
        didSet{
            self.greetingDidChange?(self)
        }
    }
    
    let person:MPerson
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    
    required init(person: MPerson) {
        self.person = person
    }
    
    func showGreeting() {
        self.gretting = "(MVVM)Hello," + self.person.firstName + " " + self.person.lastName
    }
    
    
}

class MVVMViewController: UIViewController {

    let showGreetingButton = UIButton.init(type: .custom)
    let greetingLabel = UILabel()
    
    var viewModel:GreetingViewModelProtocol!{
        didSet{
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.gretting
            }
        }
    }
    
    @objc func onButtonClick(_ sender:UIButton){
        self.viewModel.showGreeting()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        showGreetingButton.setTitle("Show", for: .normal)
        showGreetingButton.setTitleColor(.white, for: .normal)
        showGreetingButton.backgroundColor = .red
        showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showGreetingButton)
        showGreetingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        showGreetingButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        showGreetingButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        showGreetingButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.showGreetingButton.addTarget(self, action: #selector(onButtonClick(_:)), for: .touchUpInside)
        
        greetingLabel.textColor = .red
        greetingLabel.font = UIFont.systemFont(ofSize: 18)
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingLabel)
        greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
