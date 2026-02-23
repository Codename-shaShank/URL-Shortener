# TODO(deps): Review usages of 'pp' in this file for version-specific changes.
class ApplicationController < ActionController::Base
  def set_link
    @link = Link.find(params[:id])
  end
end
