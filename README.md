# olx-api
An attempt to expose OLX.ph ito an API.

```
require 'olx-api'

olx = OlxApi.new("olx-username", "olx-password")

olx.posts.each do |post|
#...
end

olx.create_post({title: "Harry Potter and the Half-blood prince", price: 200})

```
