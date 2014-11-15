require 'rubygems'
require 'bundler'

Bundler.require

register Sinatra::PubSub

Sinatra::PubSub.set(
  cors: false,
)

get '/' do
  erb :stream
end

get '/viewer' do
  erb "#{Sinatra::PubSub.publish( 'viewer', viewer: { email: "#{params['email']}", avatar_url: "#{params['avatar_url']}" } ) }"
end

get '/ping' do
  return "pong"
end

__END__

@@ stream
<pre id="log">
</pre>

<script>
  // reading
  var es = new EventSource('/subscribe/greet');
  es.onmessage = function(e) { log.innerHTML += "\n" + e.data };
</script>
