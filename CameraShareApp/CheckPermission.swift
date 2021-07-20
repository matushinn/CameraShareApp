//
//  CheckPermission.swift
//  CameraShareApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import Foundation
import Photos


//カメラを使っていいのかの許可を作るクラス
/*
 チームで開発する際には必要になる。
 他のクラスでも参照することを考慮する。
 */
class CheckPermission {
    func checkCamera(){
        
        //ユーザーに許可を促す
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status){
            case .authorized:
                print("authorized")
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            case .denied:
                print("denied")
            case .limited:
                print("limited")
            @unknown default:
                break
            }
        }
    }
}


