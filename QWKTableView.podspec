Pod::Spec.new do |s|
  s.name             = 'QWKTableView'
  s.version          = '0.1.2'
  s.summary          = 'Easy to use table views'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
QWKTableView includes the components needed to setup and display cells in a table view.  Its designed to rapidly get data displaying into a table view.  More advanced table operations is not recommended for this library however you can extend any aspect.
                       DESC

  s.homepage         = 'https://github.com/liltimtim/QWKTableView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liltimtim' => 'liltimtim@gmail.com' }
  s.source           = { :git => 'https://github.com/liltimtim/QWKTableView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'QWKTableView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'QWKTableView' => ['QWKTableView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
