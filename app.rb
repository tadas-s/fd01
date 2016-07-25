require 'sinatra'
require 'json'

get %r{^/([a-z\-]+)(/([0-9]+))?$} do
  # log an event with some dummy extra argument
  log_event(params[:captures][0], number: params[:captures][2])

  'Cheers, got it!'
end

def log_event(event, data = {})
  logger.info({event: {name: event}.merge(data)}.to_json)
end
