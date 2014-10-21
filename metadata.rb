name             'chef-tinyos'
maintainer       'Shigemi ISHIDA'
maintainer_email 'ishida+devel@f.ait.kyushu-u.ac.jp'
license          'BSD 3-Clause License'
description      'Sets up TinyOS development environment.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


%w{ apt git }.each do |cookbook|
  depends cookbook
end

%w{ debian }.each do |os|
  supports os
end
