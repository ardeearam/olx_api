# olx-api
OlxApi exposes OLX.ph ito a programmable API.

```
require 'olx_api'

olx = OlxApi.new("olx-username", "olx-password")
#If username and password is not set, it will find ~/.olx_api.yml, and retrieve
#the credentials from there.
```

```
olx.active_ads
```
Output
```
[
  {"title":"The Sandman: Book of Dreams - Neil Gaiman, et. al","url":"http://www.olx.ph/index.php/view+classifieds/id/70127217/The+Sandman%3A+Book+of+Dreams+-+Neil+Gaiman%2C+et.+al?event=Search+Ranking,Position,1-1,1","price":"₱ 170.00"},
  {"title":"The Secret Country by Pamela Dean","url":"http://www.olx.ph/index.php/view+classifieds/id/68667773/The+Secret+Country+by+Pamela+Dean?event=Search+Ranking,Position,1-2,2","price":"₱ 150.00"},
  {"title":"The Subtle Knife by Philip Pullman","url":"http://www.olx.ph/index.php/view+classifieds/id/68667634/The+Subtle+Knife+by+Philip+Pullman?event=Search+Ranking,Position,1-3,3","price":"₱ 200.00"},
  {"title":"Jonathan Livingston Seagull - a story by Richard Bach","url":"http://www.olx.ph/index.php/view+classifieds/id/68667556/Jonathan+Livingston+Seagull+-+a+story+by+Richard+Bach?event=Search+Ranking,Position,1-4,4","price":"₱ 60.00"},
  {"title":"The Lost World - Michael Crichton","url":"http://www.olx.ph/index.php/view+classifieds/id/68667322/The+Lost+World+-+Michael+Crichton?event=Search+Ranking,Position,1-5,5","price":"₱ 100.00"},
  {"title":"Mythology: Timeless Tales of Gods and Heroes - Edith Hamilton","url":"http://www.olx.ph/index.php/view+classifieds/id/68667245/Mythology%3A+Timeless+Tales+of+Gods+and+Heroes+-++Edith+Hamilton?event=Search+Ranking,Position,1-6,6","price":"₱ 100.00"},
  {"title":"Steven's Bride (Sweet Valley High #83) by Francine Pascal","url":"http://www.olx.ph/index.php/view+classifieds/id/68665642/Steven%27s+Bride+%28Sweet+Valley+High+%2383%29+by+Francine+Pascal?event=Search+Ranking,Position,1-7,7","price":"₱ 50.00"}
]
```

```
olx.create_post({title: "Harry Potter and the Half-blood prince", price: 200})
```
