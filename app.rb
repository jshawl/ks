require 'sinatra'
require 'sinatra/activerecord'
require './models/user'

db = URI.parse('postgres://keepstreaking:keepstreaking@localhost/keepstreaking')
ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
)

get '/' do
  @users = User.all
  erb :index
end