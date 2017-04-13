#
# Copyright 2017, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'poise/utils'
require 'poise_languages'


module PoiseGit
  # Mixin for resources and providers which run Git commands.
  #
  # @since 1.0.0
  module GitCommandMixin
    include Poise::Utils::ResourceProviderMixin

    # Mixin for resources which run Git commands.
    module Resource
      include PoiseLanguages::Command::Mixin::Resource(:git, runtime: :poise_git_client)
    end

    module Provider
      include PoiseLanguages::Command::Mixin::Provider(:git)
    end
  end
end
