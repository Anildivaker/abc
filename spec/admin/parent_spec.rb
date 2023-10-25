require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
RSpec.describe Admin::CollegesController, type: :controller do
  render_views
  before(:each) do
    @admin = AdminUser.create!(email: FFaker::Internet.email, password: 'password', password_confirmation: 'password')
    @admin.save
    @college = College.create(name: "anil-o-upnished")
    sign_in @admin
  end
end