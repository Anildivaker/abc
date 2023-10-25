require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
RSpec.describe Admin::FlagsController, type: :controller do
  render_views
  before(:each) do
    @admin = AdminUser.create!(email: FFaker::Internet.email, password: 'password', password_confirmation: 'password')
    @admin.save
    # debugger
    @flag = Flag.create(name: "anil-o-upnished")
    sign_in @admin
  end
  describe 'new flag' do
    it 'Get form' do
    	get :new, params: {"flag": {name: "gchgh"}}
    	expect(response).to have_http_status(200)
    end
	end

	describe 'Create flag' do
    it 'verify flag by creating' do
			pre_count = Flag.count
    	post :create, params: {"flag": {name: "gchgh"}}
    	expect(response).to have_http_status(302)
			expect(Flag.count).to eq(pre_count+1) 
    end
	end

	describe '#index' do
    it 'show all flag' do
    	get :index
    	expect(response).to have_http_status(200)
    end
	end
  
	describe '#show' do
    it 'show only one flag' do
    	get :show, params: {id: @flag.id}
    	expect(response).to have_http_status(200)
    end
	end

	describe '#delete' do
    it 'delete flag' do
    	delete :destroy, params: {id: @flag.id}
    	expect(response).to have_http_status(302)
    end
	end

	describe '#edit' do
    it 'edit flag form' do
    	get :edit, params: {id: @flag.id,"flag": {name: "gchgh"}}
    	expect(response).to have_http_status(200)
    end
	end

	describe '#update' do
    it 'update the flag' do
    	post :update, params: {id: @flag.id, "flag": {name: "joker"}}
    	expect(response).to have_http_status(302)
			@flag.reload
			expect(@flag.name).to eq("joker") 
    end
	end

end