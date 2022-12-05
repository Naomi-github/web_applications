require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    xit 'returns 200 OK' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('This is my first peep!')
    end

  context "GET /peep" do
    xit 'returns form to write a peep' do
      response = get('/peep')

      expect(response.status).to eq(200)
      expect(response.body).to include(<form method="POST" action="/artists">)
      expect(response.body).to include(<label> Write a peep!</label>)
      expect(response.body).to include(<input type="text" name="peep" />)
      expect(response.body).to include(<input type="submit" />)
      end
    end

  context "POST /peep" do
    xit "returns the newly posted peep" do
      response = post('/peep' peep: 'Hello peep world!')

      expect(response.status).to eq(200)
      expect(response.body).to include('Hello peep world!')
    end
  end

  context "GET /signup" do
    xit 'returns form to signup to peep' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include(<form method="POST" action="/signup">)
      expect(response.body).to include(<input type="text" name="first_name" />)
      expect(response.body).to include(<input type="text" name="last_name" />
      expect(response.body).to include(<input type="text" email="email" />)
      expect(response.body).to include(<input type="submit" />)
      end
    end

  context "POST /signup" do
    xit "returns to confirm " do
      response = post('/signup' first_name: 'Naomi', last_name: 'Starr', email: 123@gmail.com )

      expect(response.status).to eq(200)
      expect(response.body).to include('Thanks for signing up, Naomi!')
    end
  end
