require 'rails_helper'

RSpec.describe "external_resources/edit", type: :view do
  before(:each) do
    @external_resource = assign(:external_resource, ExternalResource.create!(
      name: "MyString",
      website_url: "MyString",
      facebook_url: "MyString",
      phone: "MyString",
      description: "MyString",
      display_on_website_start: Date.today,
      display_on_website_end: Date.today + 30.days,
      youtube_identifier: "MyString",
      location: nil,
      reviewed: false
    ))
  end

  it "renders the edit external_resource form" do
    puts render
    render
    assert_select "form[action=?][method=?]", external_resource_path(@external_resource), "post" do
      # binding.pry
      assert_select "input[name=?]", "external_resource[name]"

      assert_select "input[name=?]", "external_resource[website_url]"

      assert_select "input[name=?]", "external_resource[facebook_url]"

      assert_select "input[name=?]", "external_resource[phone]"

      assert_select "textarea[name=?]", "external_resource[description]"

      # binding.pry # TODO - helppppppppp
      # assert_select "select[id=?]", "external_resource[display_on_website_start_1i"
      # assert_select "select[id=?]", "external_resource[display_on_website_start_2i"
      # assert_select "select[id=?]", "external_resource[display_on_website_start_3i"
      #
      # assert_select "select[id=?]", "external_resource[display_on_website_end_1i"
      # assert_select "select[id=?]", "external_resource[display_on_website_end_2i"
      # assert_select "select[id=?]", "external_resource[display_on_website_end_3i"

      assert_select "input[name=?]", "external_resource[youtube_identifier]"

      assert_select "select[name=?]", "external_resource[location_id]"

      assert_select "input[name=?]", "external_resource[reviewed]"
    end
  end
end
