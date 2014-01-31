require "vnc/version"

module VNC
  CONF_DIR = "#{ENV["HOME"]}/.vnc"

  def self.dir
    unless Dir.exist?(CONF_DIR)
      Dir.mkdir(CONF_DIR)
    end
    CONF_DIR
  end

  require "vnc/cli"
  require "vnc/config"
end
