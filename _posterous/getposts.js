http = require('http');

var host = 'posterous.com';
var path = '/api/2/sites/sofer/posts/public';

var options = {
  host: host,
  port: 80,
  path: path
};

http.get(options, function(res) {
  console.log("Got response: " + res.statusCode);
  console.log("Headers: " + JSON.stringify(response.headers));
}).on('error', function(e) {
  console.log("Got error: " + e.message);
});

/*

var http = require('http');
var posterous = http.createClient(80, domain);
var request = posterous.request('GET', path,
  {'host': domain});
request.end();

request.on('response', function (response) {
  console.log('STATUS: ' + response.statusCode);
  console.log('HEADERS: ' + JSON.stringify(response.headers));
  response.setEncoding('utf8');
  response.on('data', function (chunk) {
    console.log('BODY: ' + chunk);
  });
});




req.finish(function (res) {
  puts("STATUS: " + res.statusCode);
  puts("HEADERS: " + JSON.stringify(res.headers));
  res.setBodyEncoding("utf8");
  res.onBody = function (chunk) {
    puts("BODY: " + chunk);
  };
});

var request = posterous.request('GET', '/',
  {'host': 'www.google.com'});
request.end();
request.on('response', function (response) {
  console.log('STATUS: ' + response.statusCode);
  console.log('HEADERS: ' + JSON.stringify(response.headers));
  response.setEncoding('utf8');
  response.on('data', function (chunk) {
    console.log('BODY: ' + chunk);
  });
});

require 'net/http'
$domain = 'posterous.com'
$path = '/api/2/sites/sofer/posts/public'
$response = Net::HTTP.start($domain) do |http|
  http.get $path
end
$posts = $response.body

$target = 'posts.json'
$f = File.new($target, 'w')
$f.puts $posts
$f.close

$posts.each do |p|
  puts p
end


puts "written to #{$target}, apparently"

*/