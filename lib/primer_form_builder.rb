# frozen_string_literal: true

require "active_support"
require "active_support/concern"
require "active_support/core_ext"
require "action_view"
require "action_view/base"
require "action_view/helpers/form_helper"
require_relative "primer_form_builder/version"
require_relative "primer_form_builder/form_builder"

module PrimerFormBuilder
  class Error < StandardError; end
end
