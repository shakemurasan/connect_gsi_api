# ConnectGsiApi

緯度・経度を入力値に、国土地理院提供のAPI経由で二点間の距離を算出します。
本gemは、一回のリクエストで、一回だけ国土地理院提供のAPIを叩きます。
APIの使用回数上限については、国土地理院が提示しているAPI利用規約を参照してください。
また、APIの仕様上、日本の緯度・経度にしか対応していません。

## Installation

Gemfile に下記の記述を追加してください。
Add this line to your application's Gemfile:

```ruby
gem 'connect_gsi_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install connect_gsi_api

## Usage

まず、本Gemを使いたいファイルの中で、requireしてください。
その上で、地点1の緯度/経度、地点2の緯度/経度 を引数に `ConnectGsiApi.distance2p` を呼び出してください。

```ruby
require "connect_gsi_api"

ConnectGsiApi.distance2p 35.6581, 139.701742, 36.123456, 138.705749
```

また、動作確認目的として、コマンドでの呼び出しにも対応しています。

    $ bundle exec calcdist 35.6581 139.701742 36.123456 138.705749
    $ => 103682.866

## Development

特に複雑なコードではないかと思いますので、プルリクエストお待ちしております。

## Contributing

何かお気付きの点があれば、下記のGitHubリポジトリまでissueの作成をお願い致します。
Bug reports and pull requests are welcome on GitHub at https://github.com/muramurasan/connect_gsi_api.


## License

本GemはMITライセンスです。
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

