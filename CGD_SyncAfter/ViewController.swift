//
//  ViewController.swift
//  CGD_SyncAfter
//
//  Created by admin on 29.04.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        afterBlock(sec: 2, queue: .main) {
            print("Running after block")
            print(Thread.current)
        }
        
        //
    }


    func afterBlock(sec: Int, queue: DispatchQueue = DispatchQueue.global(), complition: @escaping ()->()){
        
        queue.asyncAfter(deadline: .now() + .seconds(sec), execute: complition)
        
    }
}

