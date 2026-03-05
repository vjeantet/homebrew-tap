class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.4"
  license "Apache-2.0"
  depends_on :macos

  on_arm do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.4/alpaca_v26.4_darwin-arm64"
    sha256 "1a36dc066b650e9ef7f17580b65e2036fc219de7779d2aba44eb45c360e4efc2"
  end

  on_intel do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.4/alpaca_v26.4_darwin-amd64"
    sha256 "b1e9c9f5ea7a21606c597134ea913afd13a72f57405594912d6ae1c8d199eceb"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "alpaca"
  end

  def post_install
    config_dir = Pathname.new("#{Dir.home}/.config/alpaca")
    config_file = config_dir/"config.yaml"
    return if config_file.exist?

    config_dir.mkpath
    config_file.write <<~YAML
      # Alpaca proxy configuration
      # See https://github.com/vjeantet/alpaca for documentation.
      #
      # CLI flags always override values set here.
      # "password" and "basic-credentials" are not allowed in this file
      # for security reasons.

      # Address(es) to listen on (default: localhost)
      # listen:
      #   - localhost

      # Port to listen on (default: 8079)
      # port: 8079

      # URL of the proxy auto-config (PAC) file
      # pac-url: ""

      # Domain for NTLM proxy authentication
      # domain: ""

      # Username for NTLM proxy authentication (default: current user)
      # username: ""

      # Enable Kerberos/Negotiate proxy authentication (macOS only)
      # kerberos: false

      # Seconds to wait for a Kerberos ticket (macOS only, default: 30)
      # kerberos-wait: 30

      # Suppress all log output
      # quiet: false

      # Emit JSON log lines on stdout
      # json-logs: false
    YAML
  end

  def caveats
    <<~EOS
      A default configuration file has been created at:
        ~/.config/alpaca/config.yaml

      Edit it to set your proxy settings, then start the service with:
        brew services start alpaca-proxy

      To configure your terminal to use Alpaca as proxy, add to your shell profile:
        export http_proxy=http://localhost:8079
        export https_proxy=http://localhost:8079

      The logs are in :
        /opt/homebrew/var/log/alpaca-proxy.log
        
    EOS
  end

  service do
    run [opt_bin/"alpaca"]
    keep_alive true
    log_path var/"log/alpaca-proxy.log"
    error_log_path var/"log/alpaca-proxy.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/alpaca -version")
  end
end
