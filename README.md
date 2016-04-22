# Utils

`Utils` is an iOS library that contains useful categories and subclassses for using in your projects.

## Requirements

`Utils` works on iOS 7+ and requires ARC to build.

## Adding MBProgressHUD to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add Utils to your project.

1. Add a pod entry for Utils to your Podfile.
  * You can include all classes: `pod 'Utils', :git=> 'https://github.com/alberortega/Utils.git'`
  * You can include a group of classes: `pod 'Utils/Image', :git=> 'https://github.com/alberortega/Utils.git'`
  * The groups of classes that you can include are: 
  * `pod 'Utils/Image'`
  * `pod 'Utils/Color'`
  * `pod 'Utils/String'`
  * `pod 'Utils/Screen'`
  * `pod 'Utils/Data'`
  * `pod 'Utils/URLConnection'`
  * `pod 'Utils/AlertView'`
  * `pod 'Utils/ViewController'`

2. Install the pod(s) by running `pod install`.
3. Include Utils classes wherever you need`.

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
