
use_frameworks!


def rgb_pods
    pod 'Alamofire', '~> 4.0'
    pod 'CocoaAsyncSocket'
end

#macos

target 'RGB Remote macOS' do
    platform :osx, '10.12'

    rgb_pods
    pod 'OBMenuBarWindow'
    pod 'SnapKit'
end

target 'RGB Remote Widget macOS' do
    platform :osx, '10.12'
    
    rgb_pods
end


#ios

target 'RGB Remote' do
    platform :ios, '9.0'

    rgb_pods
    pod 'SVProgressHUD'
    pod 'SnapKit'
    pod 'ColorMix'
    
    pod 'Fabric'
    pod 'Crashlytics'
end

target 'RGB Remote Widget iOS' do
    platform :ios, '9.0'
    
    rgb_pods
end
