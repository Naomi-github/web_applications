require 'spec_helper'
require 'rack/test'
require_relative '../../app'
require 'lib'

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /" do
    it 'returns the names in alphabetical order' do
      response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end

  context "GET to /hello" do
    it 'contains a h1 title' do
      response = get('/hello')

      expect(response.body).to include('Hello')
    end
  end
end
