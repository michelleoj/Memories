//
//  S3Api.swift
//  Memories
//
//  Created by Andrew Wilkes on 10/5/15.
//  Copyright © 2015 Andrew Wilkes. All rights reserved.
//

import Foundation

//AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc]
//    initWithRegionType:AWSRegionUSEast1
//    identityPoolId:@"us-east-1:2ef25aeb-aba2-4114-9f52-f4d1ef321b58"];
//
//AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
//
//defaultServiceManager.defaultServiceConfiguration = configuration;

class S3API {
    init() {
        let credentialsProvider = AWSCognitoCredentialsProvider.init(regionType: AWSRegionType.USEast1, identityPoolId: "us-east-1:2ef25aeb-aba2-4114-9f52-f4d1ef321b58")
        let configuration = AWSServiceConfiguration.init(region: AWSRegionType.USEast1, credentialsProvider: credentialsProvider)
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration
    }
    
    class var instance: S3API {
        struct Static {
            static let instance = S3API()
        }
        
        return Static.instance
    }
    
    func get(url: String, completion: (url: NSURL?, error: NSError?) -> ()) {
        let manager = AWSS3TransferManager.defaultS3TransferManager()
        
        let downloadingFilePath = NSTemporaryDirectory()
        let downloadingFileURL = NSURL(fileURLWithPath: downloadingFilePath + "/Archer.png")
        
        let downloadRequest = AWSS3TransferManagerDownloadRequest()
        downloadRequest.bucket = "memories.store"
        downloadRequest.key = url
        downloadRequest.downloadingFileURL = downloadingFileURL
        
        manager.download(downloadRequest).continueWithBlock { (task: AWSTask!) -> AnyObject! in
            if task.result != nil {
                completion(url: downloadingFileURL, error: nil)
            } else if task.error != nil {
                completion(url: nil, error: task.error)
            }
            return task
        }
    }
    
    func put(key: String, data: NSURL, completion: (url: String?, error: NSError?) -> ()) {
        let manager = AWSS3TransferManager.defaultS3TransferManager()
        
        let uploadRequest = AWSS3TransferManagerUploadRequest()
        uploadRequest.bucket = "memories.store"
        uploadRequest.key = key
        uploadRequest.body = data
        
        manager.upload(uploadRequest).continueWithBlock { (task: AWSTask!) -> AnyObject! in
            if task.result != nil {
                completion(url: key, error: nil)
            } else if task.error != nil {
                completion(url: nil, error: task.error)
            }
            return task
        }
    }
}



