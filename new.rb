# Mostly taken from http://qiita.com/masuidrive/items/1042d93740a7a72242a3 
# Modified by http://jellyware.jp/kurage/linebotapi 
 
require 'sinatra/base'
require 'json'
require 'rest-client'
 
class App < Sinatra::Base
    #追加 
    get '/linebot/callback/level1' do
      request_content = { 
        #to: [msg['content']['from']], 
        to:[ENV["U22927034d0fecb3684486fc9a042765a"]],
        toChannel: 1383378250, # Fixed  value 
        eventType: "138311608800106203", # Fixed value 
        #content: msg['content'] 
        content:{ 
          contentType:1,
          toType:1,
          text:"すごいプレッシャー！"
        }
      }
 
      endpoint_uri = 'https://trialbot-api.line.me/v1/events'
      content_json = request_content.to_json
 
      RestClient.proxy = ENV['http://fixie:ZZ4nTjwPCevMpr8@velodrome.usefixie.com:80'] if ENV['http://fixie:ZZ4nTjwPCevMpr8@velodrome.usefixie.com:80']
      RestClient.post(endpoint_uri, content_json, { 
        'Content-Type' => 'application/json; charset=UTF-8',
        'X-Line-ChannelID' => ENV["1489340478"],
        'X-Line-ChannelSecret' => ENV["485c3c6490bd5068e6ac2dc015c868be"],
        'X-Line-Trusted-User-With-ACL' => ENV["U22927034d0fecb3684486fc9a042765a"],
      })
    end
 
    get '/linebot/callback/level2' do
      request_content = { 
        #to: [msg['content']['from']], 
        to:[ENV["U22927034d0fecb3684486fc9a042765a"]],
        toChannel: 1383378250, # Fixed  value 
        eventType: "138311608800106203", # Fixed value 
        #content: msg['content'] 
        content:{ 
          contentType:1,
          toType:1,
          text:"結構な圧力受けてます！！"
        }
      }
 
      endpoint_uri = 'https://trialbot-api.line.me/v1/events'
      content_json = request_content.to_json
 
      RestClient.proxy = ENV['http://fixie:ZZ4nTjwPCevMpr8@velodrome.usefixie.com:80'] if ENV['http://fixie:ZZ4nTjwPCevMpr8@velodrome.usefixie.com:80']
      RestClient.post(endpoint_uri, content_json, { 
        'Content-Type' => 'application/json; charset=UTF-8',
        'X-Line-ChannelID' => ENV["1489340478"],
        'X-Line-ChannelSecret' => ENV["485c3c6490bd5068e6ac2dc015c868be"],
        'X-Line-Trusted-User-With-ACL' => ENV["U22927034d0fecb3684486fc9a042765a"],
      })
    end
 
    get '/linebot/callback/level3' do
      request_content = { 
        #to: [msg['content']['from']], 
        to:[ENV["U22927034d0fecb3684486fc9a042765a"]],
        toChannel: 1383378250, # Fixed  value 
        eventType: "138311608800106203", # Fixed value 
        #content: msg['content'] 
        content:{ 
          contentType:1,
          toType:1,
          text:"つ、潰される・・・"
        }
      }
 
      endpoint_uri = 'https://trialbot-api.line.me/v1/events'
      content_json = request_content.to_json
 
      RestClient.proxy = ENV['http://fixie:ZZ4nTjwPCevMpr8@velodrome.usefixie.com:80'] if ENV['http://fixie:ZZ4nTjwPCevMpr8@velodrome.usefixie.com:80']
      RestClient.post(endpoint_uri, content_json, { 
        'Content-Type' => 'application/json; charset=UTF-8',
        'X-Line-ChannelID' => ENV["1489340478"],
        'X-Line-ChannelSecret' => ENV["485c3c6490bd5068e6ac2dc015c868be"],
        'X-Line-Trusted-User-With-ACL' => ENV["U22927034d0fecb3684486fc9a042765a"],
      })
    end
 
 
  post '/linebot/callback' do
    params = JSON.parse(request.body.read)
 
    params['result'].each do |msg|
      request_content = { 
        to: [msg['content']['from']],
        toChannel: 1383378250, # Fixed  value 
        eventType: "138311608800106203", # Fixed value 
        #content: msg['content'] 
        content:{ 
          contentType:1,
          toType:1,
          text:msg['content']['text']+"でござる"#+msg['content']['from'] 
        }
      }
 
      endpoint_uri = 'https://trialbot-api.line.me/v1/events'
      content_json = request_content.to_json
 
      RestClient.proxy = ENV['http://fixie:ZZ4nTjwPCevMpr8@velodrome.usefixie.com:80'] if ENV['http://fixie:ZZ4nTjwPCevMpr8@velodrome.usefixie.com:80']
      RestClient.post(endpoint_uri, content_json, { 
        'Content-Type' => 'application/json; charset=UTF-8',
        'X-Line-ChannelID' => ENV["1489340478"],
        'X-Line-ChannelSecret' => ENV["485c3c6490bd5068e6ac2dc015c868be"],
        'X-Line-Trusted-User-With-ACL' => ENV["U22927034d0fecb3684486fc9a042765a"],
      })
    end
 
    "OK"
  end
end