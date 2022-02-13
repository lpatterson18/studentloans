//
//  ViewController.swift
//  testProject
//
//  Created by Neena Ekanathan on 2/12/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Welcome", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    
    @objc func didTapButton() {
        
        let tabBarVC = UITabBarController()


        let vc1 = UINavigationController(rootViewController: HomeView())
        let vc2 = UINavigationController(rootViewController: InfoView())
        let vc3 = UINavigationController(rootViewController: CalcView())
        let vc4 = UINavigationController(rootViewController: RecView())

        vc1.title = "Home"
        vc2.title = "Info"
        vc3.title = "Calculator"
        vc4.title = "Tips"

        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)

        guard let items = tabBarVC.tabBar.items else {
            return
        }

        let images = ["house", "bell", "gear", "bookmark.circle.fill"]

        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }

        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    

}

/*class HomeView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
        
    }
}


class CalcView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Calculator"
        
    }
}

class RecView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Tips"
        
    }
}

class InfoView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Info"
        
    }
}*/








