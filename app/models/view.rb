# TODO(deps): Review usages of 'pp' in this file for version-specific changes.
class View < ApplicationRecord
  belongs_to :link, counter_cache: true
end
