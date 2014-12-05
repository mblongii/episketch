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

get '/viewers' do
  @email = params[:email]
  @avatar_url = params[:avatar_url]
  erb "#{Sinatra::PubSub.publish( 'viewers', viewer: { email: @email, avatar_url: @avatar_url } ) }"
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
  var es = new EventSource('/subscribe/viewers');
  es.onmessage = function(e) { log.innerHTML += "\n" + e.data };
</script>
