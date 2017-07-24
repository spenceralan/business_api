# Business Lookup API

This API will save the world! Or it might help you find the nearest business that sells tacos. Tacos are important. Send requests to this API to get a list local businesses! You can search by any parameter a business has such as name or owner. And, if you are feeling lucky, you can ask for a random business and live on the wild side!

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby 2.4.1
Bundler

### Installing

Installation is quick and easy! You can clone this repository to your machine and host it locally! 

Once it is cloned, navigate to the root of the project and run:

```shell
bundle
```

When that finishes, set up the database with the command:

```shell
bundle exec rake db:setup
```

NOTE: Due to the random seed data this step may fail validations. In the unlinkely event it fails, run the above command again.

When the database is successfully setup it is time to run the app!

```shell
bundle exec rails server
```

The default host path is http://localhost:3000


NOTE: The below token will allow you full access to the databse. Without a token a user will not be able to send requests. For this demonstration enviroment the token was something easy to remember and type but in a live application the token would look something like "c8bf7c01225a43149ea3e8b4186b1603".

#### Authenticated User Token
* token = "test_token"


### API Calls

Once you have the server running you can start sending it API requests! I would recommend the tool Postman to test out the following API requests. Postman can either be downloaded as a Chrome extension or as a standalone application.

NOTE: Because the API is protected with authentication, your unique token will need to be present as a parameter for a sucessful API request.

#### Retrieve all the businesses available in the database:
In Postman, use a GET request.
```
http://localhost:3000/businesses/?token=test_token
```

#### Retrieve a specific business in the databaste:
In Postman, use a GET request.
```
http://localhost:3000/businesses/BUSINESS-ID-HERE?token=test_token
```

#### Retrieve a random business in the databaste:
In Postman, use a GET request.
```
http://localhost:3000/businesses/random?token=test_token
```

#### Search for a business in the databaste:
In Postman, use a GET request and update the parameters for the item you are searching for.
```
http://localhost:3000/businesses/search?token=test_token&name=block
```
If you do not supply any parameters to the search, it will return all results in the database. The list below is all of the parameters you can search by.

* name
* phone
* email
* twitter
* facebook
* website
* owner
* address1
* address2
* city
* state
* zip

The search results will get narrower as you supply more paramters and you can supply as many parameters as you like. If you supply a parameter that is not in the above list the parameter will be ignored.

#### Add a business to the databaste:
In Postman, use a POST request.
```
http://localhost:3000/businesses/?token=test_token&name=Test Business&phone=555.555.5055&address1=12345 Test Lane Street&city=Testville&state=CA&zip=12345
```
The following is a list of required parameters when adding a business to the database. You may supply more parameters but if any of the below are missing you will get a validation error. If you supply parameters that are not attributes of a business they will be discarded. If your addition is sucessful, the returned value will be the business you just created.

* name
* phone
* address1
* city
* state
* zip

#### Update a business in the databaste:
In Postman, use a PUT request.
```
http://localhost:3000/businesses/BUSINESS-ID-HERE?token=test_token&name=New Fancy Business Name
```
You can update any parameter of a business. List the parameter you would like to change and leave the rest blank. Any parameters not included will not be altered.


#### Delete a random business in the databaste:
In Postman, use a DELETE request.
```
http://localhost:3000/businesses/BUSINESS-ID-HERE?token=test_token
```
You can delete any business from the database such as when a business no longer exists. You do not need to supply any parameters for this request but the ID of the business will need to be present in the URL string.

## Built With

* Ruby
* Rails

## Authors

* Spencer Alan

## License

MIT License

Copyright (c) 2017 Spencer Alan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.