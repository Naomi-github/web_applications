# Peep Home / Route Design Recipe

*Copy this design recipe template to test-drive a Sinatra route.*

## 1. Design the Route Signature

You'll need to include:

- the HTTP method
- the path
- any query parameters (passed in the URL)
- or body parameters (passed in the request body)

return all previous peeps in chronological order
Method: GET
Path: /
Query parameters:
  message(string)

## 2. Design the Response

When query param 'message' is 'This is my first peep!'

reponse:
'This is my first peep!'


## 3. Write Examples

*Replace these with your own design.*

`# Request:

GET /

# Expected response:

Response for 200 OK`

`# Request:

GET /

# Expected response:

'This is my first peep!'

## 4. Encode as Tests Examples

`# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/')

      expect(response.status).to eq(200)
      # expect(response.body).to include('This is my first peep!')
    end

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
