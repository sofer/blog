fs = require('fs');

function pad(n) {
  return n < 9 ? '0' + n : n;
}

var jsonfile = 'posts.json';
fs.readFile(jsonfile, function (err, data) {
  if (err) throw err;
  var posts = JSON.parse(data);
  for (indx in posts) {
    var post = posts[indx]
    var timestr = post.date_modified;
    var tim = new Date(timestr);
    var datestamp = tim.getFullYear() + "-" + pad(tim.getMonth()) + "-" + pad(tim.getDate()) + "-";
    var filename = datestamp + post.slug + ".textile"; 
    var title = post.title;
    var body = post.body_full;
    var content = "---\nlayout: post\ntitle: "+title+"\ncategory: \nstandfirst: \n---\n"+body
    fs.writeFileSync(filename, content);
    console.log("<br>Saved "+filename+" ("+indx+")");
  }
});

