require 'rubygems'
require 'bundler'

Bundler.require

register Sinatra::PubSub

Sinatra::PubSub.set(
  cors: true
)

EventMachine.next_tick do
  EventMachine::PeriodicTimer.new(3) do
    Sinatra::PubSub.publish('time', time: "#{DateTime.now}")
  end
end



get '/' do
  erb :stream
end

get '/publish' do
  erb "#{Sinatra::PubSub.publish('time', greet: "Hello!")}"
end

__END__

@@ stream
<pre id="log">
</pre>

<script>
  // reading
  var es = new EventSource('/subscribe/time');
  es.onmessage = function(e) { log.innerHTML += "\n" + e.data };
</script>