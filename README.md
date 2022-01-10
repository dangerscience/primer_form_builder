# Primer Form Builder

Build forms with Primer markup using Rails form builders.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'primer_form_builder'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install primer_form_builder

## Usage

Tell `form_with` to use `PrimerFormBuilder::Builder` when building a form:

```erb
<%= form_with model: @user, builder: PrimerFormBuilder::Builder do |form| %>
  <%= form.group :username do %>
    <%= form.label :username %>
    <div class="form-group-body">
      <%= form.text_field :username %>
    </div>
  <% end %>
<% end %>
```

This will generate the following HTML:

```html
<form action="/users/1" accept-charset="UTF-8" method="post">
  <input type="hidden" name="_method" value="patch" autocomplete="off">
  <input type="hidden" name="authenticity_token" value="[redacted]" autocomplete="off">

  <div class="form-group">
    <div class="form-group-header">
      <label for="user_username">Username</label>
    </div>
    <div class="form-group-body">
      <input class="form-control" type="text" value="my_user" name="user[username]" id="user_username" />
    </div>
  </div>
</form>
```

The current supported methods are:

* `label`
  * `sr_label` (generates a `<label>` tag with a class of `.sr-only`)
* `text_field` 
* `email_field` 
* `url_field` 
* `number_field` 
* `telephone_field` 
* `password_field` 
* `text_area`
* `datetime_select`
* `check_box_single` (generates a check box wrapped in a `div.form-checkbox`)
* `note` (generates `p.note`)
  * `error_note` (as above, but `p.note.error`)
* `button`
* `submit`
* `group` (generates `div.form-group`)

If you use a method not in the above list, it will pass back to the default Action View `FormBuilder`.

### Validation errors

If your form's model responds to `errors`, a `form.group` will have the class `.errored` applied, and an error note (`p.note.error`) containing the error message will be appended to the form group.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dangerscience/primer_form_builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dangerscience/primer_form_builder/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PrimerFormBuilder project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dangerscience/primer_form_builder/blob/main/CODE_OF_CONDUCT.md).
