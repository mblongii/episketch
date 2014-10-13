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

get '/greet' do
  erb "#{Sinatra::PubSub.publish('greet', greet: "Hello!")}"
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
