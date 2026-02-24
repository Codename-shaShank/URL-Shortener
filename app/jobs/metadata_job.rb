# TODO(deps): Review usages of 'pp' in this file for version-specific changes.
# TODO(deps): Review usages of 'date' in this file for version-specific changes.
class MetadataJob < ApplicationJob
  def perform(id)
    link = Link.find(id)
    link.update Metadata.retrieve_from(link.url).attributes
    link.broadcast_replace_to link
  end
end
