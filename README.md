# Screen Sharing Launcher

Launch `Screen Sharing.app` (OSX built-in VNC client) by CUI.

## Installation

    $ git clone https://github.com/labocho/screen_sharing_launcher.git
    $ cd screen-sharing-launcher.git
    $ rake install

## Usage

    $ vnc
    $ vnc example.com
    $ vnc username@example.com
    $ vnc username:password@example.com

## Configuration

Write `.vnc/config` like `.ssh/config`.
Supported directives are below.

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
