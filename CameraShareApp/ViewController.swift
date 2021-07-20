//
//  ViewController.swift
//  CameraShareApp
//
//  Created by 大江祥太郎 on 2021/07/20.
//

import UIKit
import Photos

//アルバムが立ち上げられた時にNavigationが必要になる。ImagePickerはカメラで必要になる。
class ViewController: UIViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    var checkPermission = CheckPermission()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        checkPermission.checkCamera()
    }

    @IBAction func camera(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .camera
        createImagePicker(sourceType: sourceType)
        
        
    }
    
    @IBAction func album(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
        
        //画像選択時の処理とキャンセル時の処理を書かないといけない。
        
    }
    
    @IBAction func share(_ sender: Any) {
        let text = "#サービス名"
        let image = backImageView.image?.jpegData(compressionQuality: 0.5)
        let item = [text,image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
        //インスタンスを作成
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        
        self.present(cameraPicker, animated: true, completion: nil)
        
        
    }
    //撮影(アルバム)のキャンセルボタンがタップされた時
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    //処理が行われた後に呼ばれる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //空でないかの確認の処理
        if let pickerImage = info[.editedImage] as? UIImage {
            backImageView.image = pickerImage
            
            //閉じる処理
            picker.dismiss(animated: true, completion: nil)
            
        }
    }
}

