/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "PwCustomIphonecameraView.h"

@implementation PwCustomIphonecameraView

/*
 *
 * Essentially a stripped down version of the code found at:
 * http://developer.appcelerator.com/question/145399/ios-module-with-custom-camera-view-using-avfoundation
 *
 */

- (void) dealloc
{
    self.previewLayer = nil;
    RELEASE_TO_NIL(holder);
    [super dealloc];
}

-(void)initializeState
{
    [super initializeState];
    self.previewLayer = nil;
}

-(UIView*)holder
{
    if (holder == nil) {
        NSLog(@"Creating holder View");
        
        holder = [[UIView alloc] initWithFrame:[self frame]];
        [self addSubview:holder];
        
        
        AVCaptureDeviceInput *captureInput = [AVCaptureDeviceInput
                                              deviceInputWithDevice:[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo]
                                              error:nil];
        
        /*And we create a capture session*/
        self.captureSession = [[AVCaptureSession alloc] init];
        
        /*We add input and output*/
        [self.captureSession addInput:captureInput];
        // [self.captureSession addOutput:captureOutput];
        
        /*We use medium quality, ont the iPhone 4 this demo would be laging too much, the conversion in UIImage and CGImage demands too much ressources for a 720p resolution.*/
        [self.captureSession setSessionPreset:AVCaptureSessionPresetMedium];
        
        /*We add the preview layer*/
        self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession: self.captureSession];
        self.previewLayer.frame = holder.bounds; // CGRectMake(100, 0, 100, 100);
        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [holder.layer addSublayer: self.previewLayer];
        
        /*We start the capture*/
        [self.captureSession startRunning];
    }
    else
    {
        NSLog(@"Returning existing holder view");
    }
    
    return holder;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    [TiUtils setView:self.holder positionRect:bounds];
}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    /*We create an autorelease pool because as we are not in the main_queue our code is
     not executed in the main thread. So we have to create an autorelease pool for the thread we are in*/
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    [pool drain];
}

@end
