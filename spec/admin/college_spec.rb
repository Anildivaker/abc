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
  describe 'new college' do
    it 'Get form' do
    	get :new, params: {"college": {name: "gchgh"}}
    	expect(response).to have_http_status(200)
    end
	end

	describe 'Create college' do
    it 'verify college by creating' do
			pre_count = College.count
    	post :create, params: {"college": {name: "gchgh"}}
    	expect(response).to have_http_status(302)
			expect(College.count).to eq(pre_count+1) 
    end
	end

	describe '#index' do
    it 'show all college' do
    	get :index
    	expect(response).to have_http_status(200)
    end
	end
  
	describe '#show' do
    it 'show only one college' do
    	get :show, params: {id: @college.id}
    	expect(response).to have_http_status(200)
    end
	end

	describe '#delete' do
    it 'delete college' do
    	delete :destroy, params: {id: @college.id}
    	expect(response).to have_http_status(302)
    end
	end

	describe '#edit' do
    it 'edit college form' do
    	get :edit, params: {id: @college.id,"college": {name: "gchgh"}}
    	expect(response).to have_http_status(200)
    end
	end

	describe '#update' do
    it 'update the college' do
    	post :update, params: {id: @college.id, "college": {name: "joker"}}
    	expect(response).to have_http_status(302)
			@college.reload
			expect(@college.name).to eq("joker") 
    end
	end

end