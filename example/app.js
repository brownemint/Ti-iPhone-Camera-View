// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel({zIndex: 10});
win.add(label);
win.open();

// TODO: write your module tests here
var customiphonecamera = require('pw.custom.iphonecamera');
Ti.API.info("module is => " + customiphonecamera);

label.text = customiphonecamera.example();

Ti.API.info("module exampleProp is => " + customiphonecamera.exampleProp);
customiphonecamera.exampleProp = "This is a test value";

var cameraview = null;
label.addEventListener("click", function(){
	if( cameraview == null ){
		cameraview = customiphonecamera.createView({zIndex: 0});
		win.add(cameraview);
	} else {
		win.remove(cameraview);
		cameraview = null;
	}
});

