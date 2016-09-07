# Ruby on Rails 5 Simple Web Scrapper

This RESTful Simple Web Scrapper looks for titles and links in a given web page 
and stores its contents into a SQLite database. 

All scrapped data is identified depending on the tag that it was extracted.

## Installation

First of all, make sure you have installed:
* Ruby
* Rails 5
* sqlite3
* AMS (https://github.com/rails-api/active_model_serializers)

After that, clone this repo:
```sh
git clone https://github.com/dmarquesdev/rails5-simple-scrapper.git
cd rails5-simple-scrapper
```

Bundle the API:
```sh
bundle install
```

Create and migrate the database using Rake:
```sh
rake db:create db:migrate
```

## Running 

In order to run this API, get into project's directory and execute:
```sh
rails server
```
To start a local Rails Server listening on port 3000 (default port)

## API

This is a RESTful API which will be accessible via 2 endpoints:

* Web Scrapping endpoint: /scrap
* List of scrapped pages endpoint: /pages

## Examples

Assuming a Rails Server running on http://localhost:3000

### Scrapping

http://localhost:3000/scrap

To scrap data from http://www.example.com:

```http
POST /scrap HTTP/1.1
Host: localhost:3000
Cache-Control: no-cache
Content-Type: application/x-www-form-urlencoded

url=http%3A%2F%2Fexample.com
```

### Listing

http://localhost:3000/pages

To list all previously scrapped data:

```http
GET /pages HTTP/1.1
Cache-Control: no-cache
Host: localhost:3000
```