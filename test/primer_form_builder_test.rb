# frozen_string_literal: true

require "test_helper"

class PrimerFormBuilderTest < ActionView::TestCase
  def setup
    model = FixtureModel.new

    @builder = ::PrimerFormBuilder::Builder.new(:model, model, self, {})
    @rails_builder = ::ActionView::Helpers::FormBuilder.new(:model, model, self, {})
  end

  def test_that_it_has_a_version_number
    refute_nil ::PrimerFormBuilder::VERSION
  end

  def test_generates_sr_label
    assert_equal @rails_builder.label(:field, class: "sr-only"), @builder.sr_label(:field)
  end

  def test_generates_label
    assert_equal tag.div(@rails_builder.label(:field), class: "form-group-header"), @builder.label(:field)
  end

  def test_generates_standard_fields
    %i[text_field email_field url_field number_field telephone_field password_field text_area].each do |ftype|
      assert_equal @rails_builder.send(ftype, :field, class: "form-control"), @builder.send(ftype, :field)
      assert_equal @rails_builder.send(ftype, :field, class: "myclass form-control"),
                   @builder.send(ftype, :field, class: "myclass")
    end
  end

  def test_generates_datetime_select
    assert_equal @rails_builder.datetime_select(:datetime, {}, { class: "form-select" }),
                 @builder.datetime_select(:datetime)
  end

  def test_generates_single_check_box
    cb = @rails_builder.check_box(:boolean)
    cb << "boolean_human"
    expt = tag.div tag.label(cb), class: "form-checkbox"
    assert_equal expt, @builder.check_box_single(:boolean)
  end

  def test_generates_note
    assert_equal tag.p("test", class: :note), @builder.note("test")
    assert_equal tag.p("test", class: "myclass note"), @builder.note("test", class: "myclass")
  end

  def test_generates_submit
    assert_equal @rails_builder.submit(class: "btn btn-primary"), @builder.submit
    assert_equal @rails_builder.submit(class: "myclass"), @builder.submit(class: "myclass")
  end

  def test_generates_button
    assert_equal @rails_builder.button(class: "btn btn-primary"), @builder.button
  end

  def test_generates_form_group
    assert_equal tag.div("test", class: "form-group"), @builder.group(:field) { "test" }
  end

  def test_generates_error_note
    assert_equal tag.p("error_msg", class: "note error"), @builder.error_note(:err_field)
  end

  def test_check_if_errored
    assert @builder.errored?(:err_field)
  end
end
