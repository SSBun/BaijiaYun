Pod::Spec.new do |s|

  s.name         = "BaijiaYun"
  s.version      = "3.6.3-xdf"
  s.summary      = "BaijiaYun SDK."
  s.description  = "All iOS framework for BaijiaYun."

  s.homepage     = "https://www.baijiayun.com/"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "MingLQ" => "minglq.9@gmail.com" }

  s.platform     = :ios, "10.0"
  s.ios.deployment_target = "10.0"
  s.xcconfig     = {"ENABLE_BITCODE" => "NO"}


  s.source       = { :http => "https://downsdk.baijiayun.com/ios/BaijiaYun/BaijiaYun-3.6.3-xdf.zip",
                     :sha256 => "532480b7fa162331d7246cff9035d7fcb556df4782350b4d0e5b2e80831e9d12" }

  s.pod_target_xcconfig = {
    "GCC_PREPROCESSOR_DEFINITIONS" => "$(inherited) BJLIVECORE_VERSION=#{s.version} 
                                                    BJLIVEUI_BASE_VERSION=#{s.version}
                                                    BJLIVEUI_SMALL_CLASS_VERSION=#{s.version}
                                                    BJLIVEUI_BIG_CLASS_VERSION=#{s.version}
                                                    BJLSellUI=#{s.version}
                                                    BJVIDEOPLAYERCORE_VERSION=#{s.version}
                                                    BJPLAYBACKUI_VERSION=#{s.version}
                                                    BJVIDEOPLAYERUI_VERSION=#{s.version}",
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
  }
  s.user_target_xcconfig = {
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES" # requies both `user_target_xcconfig` and `pod_target_xcconfig`
  }

  s.default_subspecs = ["BJLiveCore"]

  s.subspec "BJLiveCore" do |ss|
    ss.dependency "BaijiaYun/BJLiveBase"
    ss.dependency "BaijiaYun/_BJLiveCore"
    ss.dependency "BaijiaYun/BJYRTCEngine"
    ss.dependency "BaijiaYun/TXAdapter"
  end

  s.subspec "BJLiveUI" do |ss|
    ss.dependency "BaijiaYun/BJLiveCore"
    ss.dependency "BaijiaYun/_BJLiveUIBigClass"
    ss.dependency "BaijiaYun/_BJLiveUISmallClass"
    ss.dependency "QBImagePickerController", "~> 3.0"
  end

  s.subspec "BJLiveUISmallClass" do |ss|
    ss.dependency "BaijiaYun/BJLiveCore"
    ss.dependency "BaijiaYun/_BJLiveUISmallClass"
    ss.dependency "QBImagePickerController", "~> 3.0"
  end

  s.subspec "BJLiveUIBigClass" do |ss|
    ss.dependency "BaijiaYun/BJLiveCore"
    ss.dependency "BaijiaYun/_BJLiveUIBigClass"
    ss.dependency "QBImagePickerController", "~> 3.0"
  end

  s.subspec "BJLSellUI" do |ss|
    ss.dependency "BaijiaYun/_BJLSellUI"
    ss.dependency "BaijiaYun/BJLiveCore"
  end

  s.subspec "BJVideoPlayerCore" do |ss|
    ss.dependency "BaijiaYun/_BJVideoPlayerCore"
    ss.dependency "BaijiaYun/BJLiveBase"
    ss.dependency "BaijiaYun/BJYIJKMediaPlayer"
  end

  s.subspec "BJVideoPlayerUI" do |ss|
    ss.dependency "BaijiaYun/_BJVideoPlayerUI"
    ss.dependency "BaijiaYun/BJVideoPlayerCore"
  end

  s.subspec "BJPlaybackUI" do |ss|
    ss.dependency "BaijiaYun/_BJPlaybackUI"
    ss.dependency "BaijiaYun/BJVideoPlayerCore"
  end

  ################ internal subspecs ################

  s.subspec "BJLiveBase" do |ss|
    ss.source_files         = [
      "frameworks/BJLiveBase.framework/Versions/A/Headers/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJLiveBase.framework/Versions/A/Headers/**/*.h"
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJLiveBase.framework"
    ]
    ss.resources            = [
      "frameworks/BJLiveBase.framework/Versions/A/Resources/BJLLocalize.bundle",
      "frameworks/BJLiveBase.framework/Versions/A/Resources/BJLMetal.bundle"
    ]
    ss.frameworks           = [
      "CoreGraphics",
      "CoreTelephony",
      "Foundation",
      "UIKit",
      "WebKit",
      "AVFoundation",
      "Photos",
      "CoreServices",
      "Security",
      "SystemConfiguration",
      "CFNetwork",
      "CoreFoundation",
      "Metal", 
      "MetalKit"
    ]
    ss.libraries            = [
      "z",
      "system"
    ]
    ss.dependency "SDWebImage"
  end

  s.subspec "BJYRTCEngine" do |ss|
    ss.vendored_frameworks  = [
      "frameworks/BJYRTCEngine.framework"
    ]
    ss.frameworks            = [
      "CFNetwork",
      "AVFoundation",
      "Security",
      "AudioToolbox",
      "VideoToolbox",
      "CoreVideo",
      "CoreMedia",
      "MediaPlayer",
      "CoreServices",
      "OpenGLES",
      "CoreMotion"
    ]
    ss.libraries             = [
      "icucore",
      "bz2",
      "z",
      "c++"
    ]
    ss.dependency "BaijiaYun/BJYIJKMediaPlayer"
    ss.dependency "BaijiaYun/BJRTCSDK"
    ss.dependency "BRTC",              '~> 1.0.6'
  end

  s.subspec "BJRTCSDK" do |ss|
    ss.vendored_frameworks  = [
      "frameworks/BJRTCSDK.framework"
    ]
  end

  s.subspec "BJYIJKMediaPlayer" do |ss|
    ss.source_files         = [
      "frameworks/BJYIJKMediaFramework.framework/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJYIJKMediaFramework.framework/**/*.h"
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJYIJKMediaFramework.framework"
    ]
    ss.frameworks           = [
      "AVFoundation",
      "GLKit",
      "VideoToolbox"
    ]
    ss.libraries            = [
      "c++",
      "z",
      "bz2"
    ]
  end

  s.subspec "TXAdapter" do |ss|
    ss.dependency "BRTC/tx-8.8", '~> 1.0.7'
    ss.dependency "TXLiteAVSDK_TRTC",  '~> 8.8.10265'
  end

  s.subspec "_BJLiveCore" do |ss|
    ss.preserve_paths       = [
      "LICENSE",
      "frameworks/BJHLMediaPlayer.framework",
      "frameworks/EmbedFrameworks.sh",
      "frameworks/ClearArchsFromFrameworks.sh",
    ]
    ss.source_files         = [
      "frameworks/BJLiveCore.framework/Versions/A/Headers/**/*.h",
    ]
    ss.public_header_files  = [
      "frameworks/BJLiveCore.framework/Versions/A/Headers/**/*.h"
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJLiveCore.framework"
    ]
    ss.frameworks           = [
      "CoreGraphics",
      "CoreTelephony",
      "Foundation",
      "UIKit",
      "WebKit",
      "AVFoundation",
      "GLKit",
      "VideoToolbox",
      "CoreBluetooth"
    ]
    ss.libraries            = [
      "icucore",
      "c++",
      "z",
      "resolv"
    ]
    ss.dependency "BaijiaYun/_BJHLMediaPlayer"
    ss.dependency "BaijiaYun/_ZXYB"
  end

  s.subspec "_ZXYB" do |ss|
    ss.vendored_libraries = "library/libZXYBSDK.a"
    ss.private_header_files = ["library/*.h"]
    ss.source_files = ["library/*.h"]
  end

  s.subspec "_BJHLMediaPlayer" do |ss|
    ss.source_files         = [
      "frameworks/BJHLMediaPlayer.framework/**/gsx_rtc_types.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJHLMediaPlayer.framework/**/gsx_rtc_types.h",
    ]
  end

  s.subspec "_BJLiveUIBase" do |ss|
    ss.source_files         = [
      "frameworks/BJLiveUIBase.framework/Versions/A/Headers/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJLiveUIBase.framework/Versions/A/Headers/**/*.h"
    ]
    ss.resources            = [
      "frameworks/BJLiveUIBase.framework/Versions/A/Resources/BJLiveUI.bundle",
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJLiveUIBase.framework"
    ]
    ss.frameworks = [
      "CoreGraphics",
      "Foundation",
      "CoreServices",
      "Photos",
      "PhotosUI",
      "SafariServices",
      "UIKit",
      "WebKit",
      "SpriteKit"
    ]
    ss.dependency "BaijiaYun/_BJLiveCore"
    ss.dependency "YYText"
  end

  s.subspec "_BJLiveUIBigClass" do |ss|
    ss.source_files         = [
      "frameworks/BJLiveUIBigClass.framework/Versions/A/Headers/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJLiveUIBigClass.framework/Versions/A/Headers/**/*.h"
    ]
    ss.resources            = [
      "frameworks/BJLiveUIBigClass.framework/Versions/A/Resources/BJLSurfaceClass.bundle"
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJLiveUIBigClass.framework"
    ]
    ss.frameworks = [
    ]
    ss.dependency "BaijiaYun/_BJLiveUIBase"

  end

  s.subspec "_BJLiveUISmallClass" do |ss|
    ss.source_files         = [
      "frameworks/BJLiveUISmallClass.framework/Versions/A/Headers/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJLiveUISmallClass.framework/Versions/A/Headers/**/*.h"
    ]
    ss.resources            = [
      "frameworks/BJLiveUISmallClass.framework/Versions/A/Resources/BJLInteractiveClass.bundle"
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJLiveUISmallClass.framework"
    ]
    ss.frameworks = [
    ]
    ss.dependency "BaijiaYun/_BJLiveUIBase"
    ss.dependency "BaijiaYun/_BJHLMediaPlayer"
  end

  s.subspec "_BJLSellUI" do |ss|
    ss.source_files         = [
      "frameworks/BJLSellUI.framework/Versions/A/Headers/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJLSellUI.framework/Versions/A/Headers/**/*.h"
    ]
    ss.resources            = [
      "frameworks/BJLSellUI.framework/Versions/A/Resources/BJLSellUI.bundle",
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJLSellUI.framework"
    ]
    ss.frameworks = [
      "CoreGraphics",
      "Foundation",
      "CoreServices",
      "Photos",
      "PhotosUI",
      "SafariServices",
      "UIKit",
      "WebKit",
      "SpriteKit"
    ]
  end

  s.subspec "_BJVideoPlayerCore" do |ss|
    ss.source_files         = [
      "frameworks/BJVideoPlayerCore.framework/Versions/A/Headers/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJVideoPlayerCore.framework/Versions/A/Headers/**/*.h"
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJVideoPlayerCore.framework"
    ]
    ss.frameworks           = [
      "Foundation",
      "UIKit",
      "CoreTelephony",
      "CoreMedia",
      "AVFoundation",
      "AVKit",
      "WebKit"
    ]
  end

  s.subspec "_BJVideoPlayerUI" do |ss|
    ss.source_files         = [
      "frameworks/BJVideoPlayerUI.framework/Versions/A/Headers/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJVideoPlayerUI.framework/Versions/A/Headers/**/*.h"
    ]
    ss.resource             = [
      "frameworks/BJVideoPlayerUI.framework/Versions/A/Resources/BJVideoPlayerUI.bundle"
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJVideoPlayerUI.framework"
    ]
    ss.frameworks           = [
      "CoreGraphics",
      "Foundation",
      "CoreServices",
      "Photos",
      "UIKit",
      "CoreTelephony",
      "CoreMedia",
      "AVFoundation",
      "AVKit",
      "MediaPlayer"
    ]
  end

  s.subspec "_BJPlaybackUI" do |ss|
    ss.source_files         = [
      "frameworks/BJPlaybackUI.framework/Versions/A/Headers/**/*.h"
    ]
    ss.public_header_files  = [
      "frameworks/BJPlaybackUI.framework/Versions/A/Headers/**/*.h"
    ]
    ss.resource             = [
      "frameworks/BJPlaybackUI.framework/Versions/A/Resources/BJPlaybackUI.bundle"
    ]
    ss.vendored_frameworks  = [
      "frameworks/BJPlaybackUI.framework"
    ]
    ss.frameworks           = [
      "CoreGraphics",
      "Foundation",
      "CoreServices",
      "Photos",
      "UIKit",
      "CoreTelephony",
      "CoreMedia",
      "AVFoundation",
      "AVKit",
      "MediaPlayer"
    ]
  end

end
