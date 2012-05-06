#!/usr/bin/env coffee

request = require 'request'

suggest = (query, cb) ->

  url = "http://suggestqueries.google.com/complete/search?client=firefox&q=#{encodeURIComponent query}"

  request.get url, (err, response, body) ->

    if err
      cb err
      return

    if response.statusCode is 200 and body
      console.log body
      result = JSON.parse body
      cb null, result[1]


module.exports = suggest

if not module.parent?
  query = process.argv[2...]
  suggest query, (err, result) ->
    console.log r for r in result

  
