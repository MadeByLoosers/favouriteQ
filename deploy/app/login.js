var connect = require('connect');
var urlparser = require('url');

var authCheck = function (req, res, next) {
    url = req.urlp = urlparser.parse(req.url, true);

    // ####
    // Logout
    if ( url.pathname == "/logout" ) {
      req.session.destroy();
    }

    // ####
    // Is User already validated?
    if (req.session && req.session.auth == true) {
      next(); // stop here and pass to the next onion ring of connect
      return;
    }

    // ########
    // Auth - Replace this example with your Database, Auth-File or other things
    // If Database, you need a Async callback...
    // TODO: can we get post here?
    if ( url.pathname == "/login" && 
         url.query.name == "max" && 
         url.query.pwd == "herewego"  ) {
      req.session.auth = true;
      next();
      return;
    }

    // ####
    // This user is not authorized. Stop talking to him.
    res.writeHead(403, { 'Content-Type': 'text/html' });
    //res.end('Sorry you are not authorized.\n\nFor a login use: /login?name=max&pwd=herewego');
    res.end(viewLoginForm());
    return;
}

var helloWorldContent = function (req, res, next) {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    // TODO: use templating enginge here
    res.end('authorized. Walk around :) or use /logout to leave\n\nYou are currently at '+req.urlp.pathname);
}

var server = connect.createServer(
      connect.logger({ format: ':method :url' }),
      connect.cookieParser('secret'),
      connect.session({ secret: 'foobar' }),
      connect.bodyParser(),
      authCheck,
      helloWorldContent
);

///// View functions ////////////////////////////////////
var viewLoginForm = function () {
  return "<h1>Please Login</h1>
    <form action=\"/login\">
      <label for=\"username\">Username</label>
      <input type=\"text\" name=\"username\" />
      <input type=\"text\" name=\"password\" />
    </form>";
}

server.listen(3000);