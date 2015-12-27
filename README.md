# QuickbloxApi

A Ruby gem for easy interfacing with the Quickblox API.

## Installation

    $ gem install quickblox_api

## Usage


```ruby
client = QuickbloxApi.client(
  application_id: 1337,
  auth_key: 'aK89LOdzSAk09A',
  auth_secret: 'AZLKV8ZnJ-NkL13',
  user_owner_id: 2410
)
client.query :get, '/users.json'
=> {
    :status=>200, # response status
    :body=>
      # response body
      {:current_page=>1,
      :per_page=>10,
      :total_entries=>1,
      :items=>
          [{:user=>
          {:id=>91919191,
          :owner_id=>1337,
          :full_name=>"abscondite",
          ...
          :user_tags=>nil}}
      ]}
   }
```


## Contributing and license

Bug reports and pull requests are welcome on GitHub at https://github.com/abscondite/quickblox_api.

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

