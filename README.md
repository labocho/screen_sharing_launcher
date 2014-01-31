# VNC

OSX の 画面共有 (Screen Sharing.app) を CLI から呼び出すラッパー。

## Installation

リポジトリをクローンして、

    $ rake install

## Usage

    $ vnc
    $ vnc example.com
    $ vnc john@example.com
    $ vnc john:password@example.com

## Configuration

.vnc/config に .ssh/config の要領で記述する。
サポートするディレクティブは下記の通り。

- Host
- HostName
- User
- Password

## Contributing

1. Fork it ( http://github.com/<my-github-username>/vnc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
