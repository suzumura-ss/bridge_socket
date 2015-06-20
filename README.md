# BridgeSocket

シリアルデバイスやメインソケットをブリッジします.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bridge_socket'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bridge_socket


## Usage

ブリッジを開始します.

    # /dev/cu.usbmodem1421     ... シリアルデバイス
    # /tmp/vmware.windows.com1 ... ドメインソケット
    $ bridge_socket start /dev/cu.usbmodem1421 /tmp/vmware.windows.com1

ブリッジを停止します.

    $ bridge_socket stop /dev/cu.usbmodem1421

その他.

    # status表示
    $ bridge_socket status /dev/cu.usbmodem1421

    # リスタート
    $ bridge_socket srestart /dev/cu.usbmodem1421

    # ログ,pidディレクトリを指定.
    #   --logdir のみを指定した場合は --piddir もlogdirになります.
    $ bridge_socket start /dev/cu.usbmodem1421 /tmp/vmware.windows.com1 --logdir=/var/log --piddir=/var/run

    # socketが切れたとき 2sec毎にリトライ (デフォルト 5sec).
    $ bridge_socket start /dev/cu.usbmodem1421 --retry=2



## Contributing

1. Fork it ( https://github.com/suzumura-ss/bridge_socket/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
