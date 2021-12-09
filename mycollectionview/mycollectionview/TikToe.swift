//
//  TikToe.swift
//  mycollectionview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TikToe: UIViewController {
    private var state = [2,2,2,
                        2,2,2,
                        2,2,2]
    private let winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    private var zeroflag=false
    
    private let mycollectionview:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 120, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .white
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mycollectionview)
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mycollectionview.frame = view.bounds
    }
}

extension TikToe:UICollectionViewDataSource,UICollectionViewDelegate{
    
    private func setupCollectionView(){
        mycollectionview.dataSource=self
        mycollectionview.delegate=self
        
        mycollectionview.register(t3cell.self, forCellWithReuseIdentifier: "t3cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "t3cell", for: indexPath) as! t3cell
        
        cell.setupCell(with: state[indexPath.row])
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
            
            zeroflag = !zeroflag
            collectionView.reloadData()
            checkwinner()
        }
    }
    
    private func checkwinner(){
        if !state.contains(2){
            resetstate()
            print("Draw")
        }else{
            for i in winningCombination{
                if state[ i[0] ] == state[ i[1] ] && state[ i[1] ] == state [ i[2] ] && state[ i[0] ] != 2 {
                    resetstate()
                    print("\(state[ i[0] ]) won")
                    break
                }
            }
        }
    }
    private func resetstate(){
        state = [2,2,2,2,2,2,2,2,2]
        zeroflag = false
        mycollectionview.reloadData()
    }
}
