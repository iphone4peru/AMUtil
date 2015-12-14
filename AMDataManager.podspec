Pod::Spec.new do |s|
	s.name 				= 'AMUtil'
  	s.version			= '1.0.0'
  	s.summary 			= "Util"
  	s.homepage 			= 'https://github.com/iphone4peru/AMUtil.git'
  	s.author 			= { "Christian Quicano" => "anthony.qz@ecorenetworks.com" }

  	s.source 			= {:git => 'https://github.com/iphone4peru/AMUtil.git', :tag => s.version.to_s}
  	s.framework 			= 'UIKit', 'Foundation'
	
	s.source_files			= 'project/*.swift'
  	
	s.ios.deployment_target 	= '8.0'
  	s.requires_arc 			= true
	#s.ios.vendored_frameworks	= 'project/AMUtil.framework'

end