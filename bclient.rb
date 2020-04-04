require "language/node"

class BClient < Formula
  desc "Bcoin node and wallet clients"
  homepage "https://bcoin.io"
  url "https://github.com/bcoin-org/bclient/archive/v0.1.7.tar.gz"
  sha256 "6b147e577c909d8d4434d4677dc27d884100d58886fc3457d96c4a172c105e18"

  depends_on "node@10"

  def install
    system "#{Formula["node@10"].bin}/npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/bcoin-cli", "--version"
  end
end

