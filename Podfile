
use_frameworks!


def rgb_pods
    #internal
    pod 'Alamofire', '~> 4.0'
end


target 'RGB Remote OSX' do
    
    platform :osx, '10.12'

    rgb_pods

    #UI
    pod 'OBMenuBarWindow'
    
end


target 'RGB Remote' do
    
    platform :ios, '9.0'

    rgb_pods

    #UI
    pod 'SVProgressHUD'
    pod 'ChameleonFramework'

end



#post_install do | installer |
#require 'fileutils'
#FileUtils.cp_r('Pods/Target Support Files/Pods-Dockwa/Pods-Dockwa-acknowledgements.plist', 'Dockwa/Supporting Files/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
#end
