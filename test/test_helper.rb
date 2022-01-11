# frozen_string_literal: true

require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "primer_form_builder"
require "fixture_model"
require "select_model"

require "minitest/autorun"
