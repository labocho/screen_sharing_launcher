module VNC
  class Config
    CONF_FILE = "#{VNC::CONF_DIR}/config"

    class SyntaxError < StandardError; end

    def self.load
      new.parse(file)
    end

    def self.file
      unless File.exists?(CONF_FILE)
        open(CONF_FILE, "w"){ }
      end
      CONF_FILE
    end

    def initialize
      @entries = Hash.new{|hash, key| hash[key] = {} }
    end

    def [](key)
      @entries[key]
    end

    def update_uri(uri)
      config = self[uri.hostname]
      config.hostname = config[:hostname] if config[:hostname]
      uri.user ||= config[:user]
      uri.password ||= config[:password] if uri.user == config[:user]
      uri
    end

    def parse(file)
      s = File.read(file)
      lines =
        s
        .lines
        .map(&:strip)
        .map{|l| l.gsub(/#.*/, "") }
        .reject{|l| l == "" }

      host = nil
      lines.each do |line|
        raise SyntaxError, line unless line =~ /(.+?) (.+)/
        key, value = $~.captures.map(&:strip)

        case key.downcase
        when "host"
          host = value
        when "user"
          @entries[host][:user] = value
        when "password"
          @entries[host][:password] = value
        when "hostname"
          @entries[host][:hostname] = value
        else
          raise SyntaxError, "Undefined key: #{line}"
        end
      end
      self
    end
  end
end
