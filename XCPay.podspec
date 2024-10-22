
Pod::Spec.new do |s|

  s.name         = "XCPay"
  s.version      = "1.3.0"
  s.summary      = "集成第三方支付，由于微信的SDK可能会出现在其他第三方SDK中（友盟、ShareSDK），因此如果不需要导入微信SDK，请在 pod install 的前面加如下：
不导入微信SDK：    NO_WXPAY=1 pod install
不导入支付宝SDK：  NO_ALIYPAY=1 pod install"

  s.description  = <<-DESC
XCPay：集成第三方支付，由于微信的SDK可能会出现在其他第三方SDK中（友盟、ShareSDK），因此如果不需要导入微信SDK，请在 pod install 的前面加如下：
不导入微信SDK：    NO_WXPAY=1 pod install
不导入支付宝SDK：  NO_ALIYPAY=1 pod install
                   DESC

  s.homepage     = "https://github.com/fanxiaocong/XCPay"
  s.license      = "MIT"
  s.author       = { "樊小聪" => "1016697223@qq.com" }
  s.source       = { :git => "https://github.com/fanxiaocong/XCPay.git", :tag => "#{s.version}" }

  s.platform         = :ios, "9"
  s.static_framework = true
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


  s.subspec 'XCPay' do |mgr|
    mgr.source_files = 'XCPay/Classes/XCPay/XCPay/*.{h,m}', 'XCPay/Classes/XCPay/XCPay/XCPayProtocol/*.{h,m}'
  end


  # 支付宝支付
  s.subspec 'Alipay' do |ali|
    ali.source_files = 'XCPay/Classes/XCPay/Alipay/*.{h,m}'
    ali.dependency 'XCPay/XCPay'

    if ENV['NO_ALIYPAY']
    else
        # ali.dependency 'XCThirdPlatformSDK/AlipaySDK', '~> 0.0.1'
     ali.dependency 'AlipaySDK-iOS', '~> 15.7.9'
    end
  end


  # 微信支付
  s.subspec 'WXPay' do |wx|
    wx.source_files = 'XCPay/Classes/XCPay/WXPay/*.{h,m}'
    wx.dependency 'XCPay/XCPay'

    if ENV['NO_WXPAY']
    else
        # wx.dependency 'XCThirdPlatformSDK/WeChatSDK', '~> 0.0.1'
    wx.dependency 'WechatOpenSDK', '~> 1.8.7.1'
    end
  end


end

