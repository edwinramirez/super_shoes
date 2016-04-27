require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  before(:each) do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("my_user:my_password")
  end

  describe 'GET #service_index' do
    it 'expects response to be successful' do     
      get 'service_index'
      expect(response).to be_success
    end
    it 'expects response not be successful' do     
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("my_user:wrong_password")
      get 'service_index'
      expect(response).not_to be_success
    end
  end
end
