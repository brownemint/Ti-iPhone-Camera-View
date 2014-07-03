# iPhone Camera View Module

## Description

Titanium View with the background image sourced directly from the iPhones camera.

## Accessing the Module

To access this module from JavaScript, you would do the following:

	var cameraview = require("pw.custom.iphonecamera");

The customiphonecamera variable is a reference to the Module object.	

## Reference

The cameraview takes the same properties and methods as the standard titanium view.

## Usage

	var win = Ti.UI.createWindow({
		backgroundColor:'white'
	});
	
	if( Ti.Media.isCameraSupported ) {
		var cameraview = require("pw.custom.iphonecamera");
		win.add( cameraview.createView() );
	}
	
	win.open();

## Author

Michael Browne

[@brownemint](http://www.twitter.com/brownemint)

## Notes
Don't forget to check out Jonathon Carter's [CameraView](https://github.com/jonathanrcarter/CameraView) if you'd like the added ability to take pictures! (Who wouldn't!!)