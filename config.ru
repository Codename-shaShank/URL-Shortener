# TODO(deps): Review usages of 'pp' in this file for version-specific changes.
# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
