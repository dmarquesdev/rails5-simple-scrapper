# Ruby on Rails 5 Simple Web Scrapper

This RESTful Simple Web Scrapper looks for titles and links in a given web page 
and stores its contents into a SQLite database. 

All scrapped data is identified depending on the tag that it was extracted.


## API

This is a RESTful API which will be accessible via 2 endpoints:

* Web Scrapping endpoint: /scrap
* List of scrapped pages endpoint: /pages

## Examples

Assuming a Rails Server running on http://localhost:3000

### Scrapping

To scrap data from http://www.example.com:

```http
POST /scrap HTTP/1.1
Host: localhost:3000
Cache-Control: no-cache
Content-Type: application/x-www-form-urlencoded

url=http%3A%2F%2Fexample.com
```

### Listing

To list all previously scrapped data:

```http
GET /pages HTTP/1.1
Host: localhost:3000
```