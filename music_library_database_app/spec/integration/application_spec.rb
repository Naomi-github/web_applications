require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # context 'GET /albums' do
  #   it 'should return the list of albums' do
  #     response = get('/albums')

  #     expect(response.status).to eq (200)
  #     expect(response.body).to include('<')

  #   end
  # end

  context 'POST /albums' do
    it 'creates a new album' do
      response = post('/albums', title: 'OK computer', release_year: '1997', artist_id: '1')

      expect(response.status).to eq 200
      expect(response.body).to eq ('')

      response = get('/albums')

      expect(response.body).to include('OK computer')
    end
  end

  context 'GET /albums/:id' do
    it 'returns info about album 1' do
      response = get('/albums/1')

      expect(response.body).to include ('Doolittle')
      expect(response.body).to include ('1989')
      expect(response.body).to include ('Pixies')
    end

    it 'returns info about album 1' do
      response = get('/albums/2')

      expect(response.body).to include ('Surfer Rosa')
      expect(response.body).to include ('1988')
      expect(response.body).to include ('Pixies')
    end
  end

  context 'GET /albums' do
    it 'returns the list of albums' do
      response = get('/albums')

      expect(response.status).to eq 200
      expect(response.body).to include ('<a href="/albums/2">Surfer Rosa</a><br />')
      expect(response.body).to include ('<a href="/albums/3">Waterloo</a><br />')
      expect(response.body).to include ('<a href="/albums/4">Super Trouper</a><br />')
      expect(response.body).to include ('<a href="/albums/5">Bossanova</a><br />')
      expect(response.body).to include ('<a href="/albums/4">Super Trouper</a><br />')
      expect(response.body).to include ('<a href="/albums/6">Lover</a><br />')
      expect(response.body).to include ('<a href="/albums/7">Folklore</a><br />')
      expect(response.body).to include ('<a href="/albums/8">I Put a Spell on You</a><br />')
      expect(response.body).to include ('<a href="/albums/9">Baltimore</a><br />')
      expect(response.body).to include ('<a href="/albums/10">Here Comes the Sun</a><br />')
      expect(response.body).to include ('<a href="/albums/11">Fodder on My Wings</a><br />')
      expect(response.body).to include ('<a href="/albums/12">Ring Ring</a><br />')

    end
  end

  context 'GET /artists' do
    it 'returns a list of artists with a link to the individual artist site' do
      response = get('/artists')

      expect(response.status).to eq 200
      expect(response.body).to include ('<a href="/artists/1">Pixies</a>: Rock<br />')
      expect(response.body).to include ('<a href="/artists/2">ABBA</a>: Pop<br />')
      expect(response.body).to include ('<a href="/artists/3">Taylor Swift</a>: Pop<br />')
      expect(response.body).to include ('<a href="/artists/4">Nina Simone</a>: Pop<br />')
      expect(response.body).to include ('<a href="/artists/5">Kiasmos</a>: Experimental<br />')
    end
  end

  context 'GET /artist/id' do
    it 'returns information about artist 1' do
      response = get('artist/1')

      expect(response.status).to eq 200
      expect(response.body).to include ('Pixies')
      expect(response.body).to include ('Rock')
    end

    it 'returns information about artist 2' do
      response = get('artist/2')

      expect(response.status).to eq 200
      expect(response.body).to include ('ABBA')
      expect(response.body).to include ('Pop')
    end

    it 'returns information about artist 3' do
      response = get('artist/3')

      expect(response.status).to eq 200
      expect(response.body).to include ('Taylor Swift')
      expect(response.body).to include ('Pop')
    end
  end
end
