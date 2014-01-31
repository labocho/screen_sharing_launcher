require "uri"
require "erb"
require "tempfile"

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

      xml  = <<-XML
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
          <key>URL</key>
          <string>#{ERB::Util.h uri}</string>
        </dict>
        </plist>
      XML
      .strip

      open(tempfile_name, "w"){|f| f.write xml}
      system "open", tempfile_name
    end

    def parse_uri(uri_string)
      uri_string = uri_string.strip
      uri_string = "vnc://#{uri_string}" unless uri_string =~ %r{^vnc://}
      URI.parse(uri_string)
    end

    def tempfile_name
      "#{VNC.dir}/.tmp.vncloc"
    end
  end
end
