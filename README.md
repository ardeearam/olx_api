# olx-api
An attempt to expose OLX.ph ito an API.

```
require 'olx_api'

olx = OlxApi.new("olx-username", "olx-password")

#If username and password is not set, it will find ~/.olx_api.yml, and retrieve
#the credentials from there.

olx.posts.each do |post|
  puts post.title
  puts post.description
  puts post.price
  puts post.img_src
end

olx.create_post({title: "Harry Potter and the Half-blood prince", price: 200})

```
