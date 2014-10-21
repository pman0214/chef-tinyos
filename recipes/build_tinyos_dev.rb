#
# Cookbook Name:: chef-tinyos
# Recipe:: build_tinyos_dev
#
# Copyright (c) 2014, Shigemi ISHIDA
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. Neither the name of the Institute nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE INSTITUTE AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

execute "build_tinyos_tools" do
  cwd "/home/vagrant/tinyos-main/tools"
  environment ({'TOSROOT' => node["chef-tinyos"]["tinyos-main"],
                 'TOSDIR' => "#{node["chef-tinyos"]["tinyos-main"]}/tos",
                 'MAKERULES' => "#{node["chef-tinyos"]["tinyos-main"]}/support/make/Makerules",
                 'CLASSPATH' => ".:#{node["chef-tinyos"]["tinyos-main"]}/support/sdk/java/tinyos.jar"
               })
  user "vagrant"
  command <<-EOF
./Bootstrap
./configure
make 2>&1 | tee build.log
EOF
  notifies :run, "execute[install_tinyos_tools]"
end

execute "install_tinyos_tools" do
  cwd "/home/vagrant/tinyos-main/tools"
  environment ({'TOSROOT' => node["chef-tinyos"]["tinyos-main"],
                 'TOSDIR' => "#{node["chef-tinyos"]["tinyos-main"]}/tos",
                 'MAKERULES' => "#{node["chef-tinyos"]["tinyos-main"]}/support/make/Makerules",
                 'CLASSPATH' => ".:#{node["chef-tinyos"]["tinyos-main"]}/support/sdk/java/tinyos.jar"
               })
  command "make install 2>&1 | tee install.log"
  action :nothing
end
