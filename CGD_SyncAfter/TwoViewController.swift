//
//  TwoViewController.swift
//  CGD_SyncAfter
//
//  Created by admin on 29.04.21.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inQueue = DispatchQueue.init(label: "namequee", attributes: [.concurrent, .initiallyInactive])
        inQueue.async {
            print("Done")
        }
        
        print("Not active yet")
        
        //inQueue.suspend()
        //print("Paused")
        //inQueue.resume()
        
        
        let queue = DispatchQueue.global(qos: .utility)
        
        var index = 0
        queue.async {
            let info1 = ProcessInfo.processInfo
            let begin1 = info1.systemUptime
            // do something
            
            DispatchQueue.concurrentPerform(iterations: 2000000) {
                //print("\($0)")
                index += $0
                
            }
            
            //4.257745445996989

            
            let diff1 = (info1.systemUptime - begin1)
            print("Concurrent time: " + String(diff1))
        }

        
        var index1 = 0
        queue.async {
            
            let info = ProcessInfo.processInfo
            let begin = info.systemUptime
            // do something
            

            for i in 0...2000000 {
                index1 += i
            }
            
            //4.257745445996989

            
            let diff = (info.systemUptime - begin)
            print("For time: " + String(diff))
            
            inQueue.activate()
            print("Activated")
        }
        
    }
    
    func inactiveQuuueee(){
        let inQueue = DispatchQueue.init(label: "namequee", attributes: [.concurrent, .initiallyInactive])
        inQueue.async {
            print("Done")
        }
        
        print("Not active yet")
        inQueue.activate()
        print("Activated")
        inQueue.suspend()
        print("Paused")
        inQueue.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
