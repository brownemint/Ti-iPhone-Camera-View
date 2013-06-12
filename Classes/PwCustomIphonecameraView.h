/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiUIView.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <ImageIO/ImageIO.h>

@interface PwCustomIphonecameraView : TiUIView <AVCaptureVideoDataOutputSampleBufferDelegate>{
    UIView *holder;
    // AVCaptureVideoPreviewLayer *previewLayer;
}

@property (retain) AVCaptureDeviceInput *captureInput;
@property (retain) AVCaptureSession *captureSession;
@property (retain) AVCaptureVideoPreviewLayer *previewLayer;
// @property (retain) CALayer *customLayer;
// @property (retain) UIImageView *imageView;

@end