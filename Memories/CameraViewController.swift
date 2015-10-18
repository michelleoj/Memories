//
//  CameraViewController.swift
//  Memories
//
//  Created by Michelle Johnson on 10/18/15.
//  Copyright © 2015 Andrew Wilkes. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var shutterButton: UIButton!
    @IBOutlet weak var cameraView: UIView!
    
    @IBOutlet weak var switchButton: UIButton!
    
    @IBOutlet weak var flashOnButton: UIButton!
    
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shutterButton.frame = CGRectMake(0,0,65,65)
        shutterButton.layer.cornerRadius = 32
        shutterButton.layer.borderColor =  UIColor.whiteColor().CGColor
        shutterButton.layer.borderWidth = 4
        
        let switchImage = UIImage(named: "Switch");
        let tintedImage = switchImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        switchButton.setImage(tintedImage, forState: .Normal)
        switchButton.tintColor = UIColor.whiteColor()
        switchButton.frame = CGRectMake(0,0,35,35)
        
        let flashOnImage = UIImage(named: "FlashOn");
        let tintedFlashOnImage = flashOnImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        flashOnButton.setImage(tintedFlashOnImage, forState: .Normal)
        flashOnButton.tintColor = UIColor.whiteColor()
        flashOnButton.frame = CGRectMake(0,0,35,35)

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        
        do {
            let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
            let input = try AVCaptureDeviceInput(device: backCamera)
            // Do the rest of your work...
            if captureSession!.canAddInput(input) {
                
                captureSession!.addInput(input)
                
                stillImageOutput = AVCaptureStillImageOutput()
                stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
                
                if captureSession!.canAddOutput(stillImageOutput) {
                    captureSession!.addOutput(stillImageOutput)
                    
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                    previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                    
                    previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                    
                    cameraView.layer.addSublayer(previewLayer!)
                    
                    captureSession?.startRunning()
                    
                }
                
            }
        } catch let error as NSError {
            // Handle any errors
            print(error)
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
