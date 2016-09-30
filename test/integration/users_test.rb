require 'test_helper'
require 'models/user'
require 'app'


describe 'User' do
  include Rack::Test::Methods

  def app
    API::App
  end

  describe 'signin up' do
    before do
      post '/users', user: {
          handler: 'josemota',
          name: 'Jose Mota',
          password: 'tutsplusPW'
      }
    end

    it 'creates a user' do
      last_response.status.must_equal 201
    end

    it 'shows a handler' do
      last_response.body.must_include 'josemota'
    end

    it 'shows the name' do
      # require 'pry'; binding.pry
      last_response.body.must_include 'Jose Mota'
    end
  end
end