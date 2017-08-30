Pod::Spec.new do |s|

  s.name                 = "OMyCarNetworkManager"
  s.version              = "1.0"
  s.description  = <<-DESC 
                          omycar网络依赖
                   DESC
  s.summary              = "test"
  s.homepage             = "https://github.com/baiwulong/OMyCarNetworkManager"  
  s.license              = { :type => "MIT", :file => "LICENSE" }
  s.author               = { "baiwulong" => "1204803180@qq.com" }
  s.platform             = :ios, "8.0"
  s.source               = { :git => "https://github.com/baiwulong/OMyCarNetworkManager.git", :tag => "1.0" }
  s.source_files         = "OMyCarNetworkManager/OMyCarNetworkManager/**/*.{h,m}"
  s.dependency             "AFNetworking", "~>3.1.0"
  s.requires_arc         = true

end
