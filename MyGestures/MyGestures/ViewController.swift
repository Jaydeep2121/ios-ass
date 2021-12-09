//
//  ViewController.swift
//  MyGestures
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let myview:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myview)
        
        /*Tap Gestures*/
        /*
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
            tapGesture.numberOfTapsRequired = 1
            tapGesture.numberOfTouchesRequired = 1
            myview.addGestureRecognizer(tapGesture)
         */

        /*Pinch Gesture*/
        /*
            let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didpinch))
            view.addGestureRecognizer(pinchGesture)
        */
        
        /*Rotate Gesture*/
        /*
            let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(didrotate))
            view.addGestureRecognizer(rotationGesture)
        */
        
        /*Moving Gestures*/
        /*
        let leftswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        leftswipe.direction = .left
        view.addGestureRecognizer(leftswipe)
        
        let rightswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        rightswipe.direction = .right
        view.addGestureRecognizer(rightswipe)
        
        let upswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        upswipe.direction = .up
        view.addGestureRecognizer(upswipe)
        
        let downswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        downswipe.direction = .down
        view.addGestureRecognizer(downswipe)
        */
        
        let panGestures = UIPanGestureRecognizer(target: self, action: #selector(didpanview))
        view.addGestureRecognizer(panGestures)
    }
}
extension ViewController{
    /*Tap Gestures*/
    /*
        @objc private func didTapView(gesture: UITapGestureRecognizer){
            print("Tapped at location:\(gesture.location(in: myview))")
        }
     */

    /*Pinch Gestures*/
    /*
        @objc private func didpinch(gesture:UIPinchGestureRecognizer){
            myview.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
        }
    */
    
    /*Rotate Gesture*/
    /*
        @objc private func didrotate(gesture:UIRotationGestureRecognizer){
            myview.transform = CGAffineTransform(rotationAngle: gesture.rotation)
        }
    */
    
    /*Moving Gestures*/
    /*
    @objc private func didSwipe(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .left{
            UIView.animate(withDuration: 0.5){
                self.myview.frame = CGRect(x: self.myview.frame.origin.x-40, y: self.myview.frame.origin.y, width: 200, height: 200)
            }
        }else if gesture.direction == .right{
            UIView.animate(withDuration: 0.5){
                self.myview.frame = CGRect(x: self.myview.frame.origin.x+40, y: self.myview.frame.origin.y, width: 200, height: 200)
            }
        }else if gesture.direction == .up{
            UIView.animate(withDuration: 0.5){
                self.myview.frame = CGRect(x: self.myview.frame.origin.x, y: self.myview.frame.origin.y-40, width: 200, height: 200)
            }
        }else if gesture.direction == .down{
            UIView.animate(withDuration: 0.5){
                self.myview.frame = CGRect(x: self.myview.frame.origin.x, y: self.myview.frame.origin.y+40, width: 200, height: 200)
            }
        }
    }
    */
    
    @objc private func didpanview(gesture:UIPanGestureRecognizer){
        let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y
        
        myview.center = CGPoint(x: x, y: y)
    }
}
