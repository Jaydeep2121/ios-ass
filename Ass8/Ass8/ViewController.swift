//
//  ViewController.swift
//  Ass8
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var a:Int=0,b:Int=0
    private let player1:UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.text = "X Player :"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private let player2:UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.text = "O Player :"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private var p1:UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.text = ""
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private let p2:UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.text = ""
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private let pturn:UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.text = "player 1's turn"
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 20)
        return label
    }()
    private var state = [2,2,2,2,
                         2,2,2,2,
                         2,2,2,2,
                         2,2,2,2]
    private let winningcombination = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],[0,4,8,12],[1,5,9,13],[2,6,10,14],[3,7,11,15],[0,5,10,15],[3,6,9,12]]
  
    private var zeroflag=false
    
    private let mycollectionview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 120, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 70, height: 70)
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .clear
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mycollectionview)
        view.addSubview(player1)
        view.addSubview(player2)
        view.addSubview(p1)
        view.addSubview(p2)
        view.addSubview(pturn)
        setupCollectionView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mycollectionview.frame = view.bounds
        player1.frame = CGRect(x:5, y: 40, width: view.frame.width, height: 20)
        player2.frame = CGRect(x:5, y: 70, width: view.frame.width, height: 20)
        p1.frame = CGRect(x: 100, y: 40, width: view.frame.width, height: 20)
        p2.frame = CGRect(x: 100, y: 70, width: view.frame.width, height: 20)
        pturn.frame = CGRect(x: 100, y: 450, width: view.frame.width, height: 50)
    }
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    private func setupCollectionView(){
        mycollectionview.dataSource=self
        mycollectionview.delegate=self
        
        mycollectionview.register(t4cell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! t4cell
        
        cell.setupCell(with:state[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if state[indexPath.row] != 0 && state[indexPath.row] != 1 {
            
            state.remove(at: indexPath.row)
            if zeroflag{
                state.insert(0, at: indexPath.row)
            }else{
                state.insert(1, at: indexPath.row)
            }
            
           
            if zeroflag{
                pturn.text = "player 1's turn"
            }else{
                pturn.text = "player 2's turn"
            }
             zeroflag = !zeroflag
            collectionView.reloadData()
            checkwinner()
        }
    }
    private func checkwinner(){
        if !state.contains(2){
            let alert = UIAlertController(title: "Alert", message: "Match is Draw", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            resetstate()
        }else{
            for i in winningcombination{
                if state[ i[0] ] == state[ i[1] ] && state[ i[1] ] == state[ i[2] ] && state[ i[2] ] == state[ i[3] ] && state[ i[0] ]  != 2 {
                    var alert = UIAlertController()
                    if zeroflag {
                            a+=1
                            p1.text="\(a)"
                            alert = UIAlertController(title: "Alert", message: "Player X win", preferredStyle: UIAlertController.Style.alert)
                    }else{
                            b+=1
                            p2.text="\(b)"
                            alert = UIAlertController(title: "Alert", message: "Player O win", preferredStyle: UIAlertController.Style.alert)
                    }
                    resetstate()
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    pturn.text=""
                    break
                }
            }
        }
    }
    
    private func resetstate(){
        state = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
        zeroflag = false
        mycollectionview.reloadData()
    }
}

