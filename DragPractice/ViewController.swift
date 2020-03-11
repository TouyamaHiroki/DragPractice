//
//  ViewController.swift
//  DragPractice
//
//  Created by 藤山裕輝 on 2020/03/11.
//  Copyright © 2020 藤山裕輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        
    }
    
    // タッチで呼ばれる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("タッチしたよ！")
    }
    
    // ドラッグで呼ばれる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチイベント取得
        let touchEvent = touches.first!
        
        // ドラッグ前の座標
        let preDx = touchEvent.previousLocation(in: self.view).x
        let preDy = touchEvent.previousLocation(in: self.view).y
        
        // ドラッグ後の座標
        let newDx = touchEvent.location(in: self.view).x
        let newDy = touchEvent.location(in: self.view).y
        
        // ドラッグしたx,y座標の移動距離
        let dx = newDx - preDx
        let dy = newDy - preDy
        
        var viewFrame: CGRect = imageView.frame
        
        // 移動分を半衛させる
        viewFrame.origin.x += dx
        viewFrame.origin.y += dy
        
        imageView.frame = viewFrame
        
        self.view.addSubview(imageView)
    }

}

