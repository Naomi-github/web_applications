# Peep /peep Route Design Recipe

*Copy this design recipe template to test-drive a Sinatra route.*

## 1. Design the Route Signature

You'll need to include:

- the HTTP method
- the path
- any query parameters (passed in the URL)
- or body parameters (passed in the request body)

return all previous peeps in chronological order
Method: GET
Path: /peep
Query parameters:


Method: POST
Path: /peep
Query parameters:
  message(string)

## 2. Design the Response
GET /peep
<form method="POST" action="/peep">
  <div>
  <label> Write a peep!</label>
  <input type="text" name="peep" />
  </div>

  <div>
  <input type="submit" />
  </div>
</form>

POST /peep

When query param 'message' is 'Hello peep world!'

reponse:
'Hello peep world!'


## 3. Write Examples

*Replace these with your own design.*

`# Request:

GET /peep

# Expected response:

Response for 200 OK`

`# Request:

GET /peep

# Expected response:

'This is my first peep!'


# Request:

POST /peep

# Expected response:

Response for 200 OK`

`# Request:

POST /peep

# Expected response:

'Hello peep world!'

## 4. Encode as Tests Examples

`# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /peep" do
    it 'returns form to write a peep' do
      # Assuming the post with id 1 exists.
      response = get('/peep')

      expect(response.status).to eq(200)
      # expect(response.body).to include(<form method="POST" action="/artists">)
      # expect(response.body).to include(<label> Write a peep!</label>)
      # expect(response.body).to include(<input type="text" name="peep" />)
      # expect(response.body).to include(<input type="submit" />)
      end
      end

  context "POST /peep" do
    it "returns the newly posted peep" do
      response = post('/peep' peep: 'Hello peep world!')

      expect(response.status).to eq(200)
      # expect(response.body).to include('Hello peep world!')
    end
  end


## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

