#
# Cookbook Name:: linux_base
# Recipe:: default
#
# Copyright 2014, gnslngr.us
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Create Users
include_recipe "users"
users_manage "staff" do
  group_id 50
  action [:remove, :create]
end

# Other base recipes to include
include_recipe 'openssh'
include_recipe 'sudo'

Chef::Log.info('End of Linux Base')
