Get /names Route Design Recipe
Copy this design recipe template to test-drive a Sinatra route.

POST /sort-names

# Request:
POST http://localhost:9292/sort-names

# With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

# Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe

1. Design the Route Signature
You'll need to include:

the HTTP method
the path
any query parameters (passed in the URL)
or body parameters (passed in the request body)

Return a hello message
Method: POST
Path: /sort-names
Query parameters:
  names(string)

2. Design the Response
The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return 200 OK if the post exists, but 404 Not Found if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

Replace the below with your own design. Think of all the different possible responses your route will return.

When query param 'names' is 'Joe,Alice,Zoe,Julia,Kieran'

reponse:
'Alice,Joe,Julia,Kieran,Zoe'


3. Write Examples
Replace these with your own design.

# Request:

POST /sort-names?names=Joe,Alice,Zoe,Julia,Kieran

# Expected response:

'Alice,Joe,Julia,Kieran,Zoe'


4. Encode as Tests Examples
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /" do
    it 'returns the names in alphabetical order' do
      response = get('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end
end


5. Implement the Route
Write the route and web server code to implement the route behaviour.
