
Pod::Spec.new do |s|
  s.name         = "OMyCarNetworkManager"    #存储库名称
  s.version      = "1.0"      #版本号，与tag值一致
  s.summary      = "omycar项目的网络依赖组件，结合AFNetworking,创建get,post等请求，url特殊字符处理，自动追加域名处理"  #简介
  s.description  = "omycar项目的网络依赖组件，结合AFNetworking,创建get,post等请求，url特殊字符处理，自动追加域名处理"  #描述
  s.homepage     = "https://github.com/baiwulong/OMyCarNetworkManager"      #项目主页，不是git地址
  s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
  s.author             = { "lixunhua" => "1204803180@qq.com" }  #作者
  s.platform     = :ios, "8.0"                  #支持的平台和版本号
  s.source       = { :git => "https://github.com/baiwulong/OMyCarNetworkManager.git", :tag => "1.0" }         #存储库的git地址，以及tag值
  s.source_files  =  "OMyCarNetworkManager/OMyCarNetworkManager/**/*.{h,m}" #需要托管的源代码路径
  s.requires_arc = true #是否支持ARC
  s.dependency "AFNetworking", "~> 3.0 "    #所依赖的第三方库，没有就不用写

end

