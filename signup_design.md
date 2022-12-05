# Peep /signup Route Design Recipe

*Copy this design recipe template to test-drive a Sinatra route.*

## 1. Design the Route Signature

You'll need to include:

- the HTTP method
- the path
- any query parameters (passed in the URL)
- or body parameters (passed in the request body)

return all previous peeps in chronological order
Method: GET
Path: /signup
Query parameters:

Method: POST
Path: /signup
Query parameters:
  first_name(string)
  last_name(string)
  email(email/string)

## 2. Design the Response
GET /signup
<form method="POST" action="/signup">
  <div>
  <label> First name</label>
  <input type="text" name="first_name" />
  </div>
  <div>
  <label> Last name</label>
  <input type="text" name="last_name" />
  </div>
  <div>
  <label> Email address</label>
  <input type="text" email="email" />
  </div>

  <div>
  <input type="submit" />
  </div>
</form>

POST /signup

When query param 'first_name, last_name, email' is 'Naomi, Starr, 123@gmail.com'

reponse:
'Thanks for signing up, Naomi!'


## 3. Write Examples

*Replace these with your own design.*

`# Request:

GET /signup

# Expected response:

Response for 200 OK`

`# Request:

GET /signup

# Expected response:

<form method="POST" action="/signup">
  <div>
  <label> First name</label>
  <input type="text" name="first_name" />
  </div>
  <div>
  <label> Last name</label>
  <input type="text" name="last_name" />
  </div>
  <div>
  <label> Email address</label>
  <input type="text" email="email" />
  </div>

  <div>
  <input type="submit" />
  </div>
</form>


# Request:

POST /signup

# Expected response:

Response for 200 OK`

`# Request:

POST /signup

# Expected response:

'Thanks for signing up, Naomi!'

## 4. Encode as Tests Examples

`# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /signup" do
    it 'returns form to signup to peep' do
      # Assuming the post with id 1 exists.
      response = get('/signup')

      expect(response.status).to eq(200)
      # expect(response.body).to include(<form method="POST" action="/signup">)
      # expect(response.body).to include(<input type="text" name="first_name" />)
      # expect(response.body).to include(<input type="text" name="last_name" />
      # expect(response.body).to include(<input type="text" email="email" />)
      # expect(response.body).to include(<input type="submit" />)
      end
      end

  context "POST /signup" do
    it "returns to confirm " do
      response = post('/signup' first_name: 'Naomi', last_name: 'Starr', email: 123@gmail.com )

      expect(response.status).to eq(200)
      # expect(response.body).to include('Thanks for signing up, Naomi!')
    end
  end


## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
