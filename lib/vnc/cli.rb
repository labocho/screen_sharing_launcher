require "uri"
require "erb"

module VNC
  class CLI
    def self.run(argv)
      new.run(argv)
    end

    def run(argv)
      uri = argv.first

      unless uri
        STDERR.puts "Usage: #{$0} [vnc://][user[:pass]@]hostname"
        exit 1
      end

      uri = parse_uri(uri)
      uri = Config.load.update_uri(uri)

      pid = spawn "open", uri.to_s
      Process.detach pid
    end

    def parse_uri(uri_string)
      uri_string = uri_string.strip
      uri_string = "vnc://#{uri_string}" unless uri_string =~ %r{^vnc://}
      URI.parse(uri_string)
    end
  end
end
