class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.12.1/wayback-darwin-amd64-0.12.1.tar.gz"
    sha256 "f563e3a8d9b4de76df8364cec4bbf61c8e4bffcc98bd2cac3ced168e57d480bd" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.12.1/wayback-darwin-arm64-0.12.1.tar.gz"
    sha256 "92d1b13f326e73f44b2e5297d04235d90e5ceb7803d6fda0123fcd49bc642758" # Apple Silicon
  end
  version "0.12.1"
  license "GPL-3.0"

  def install
    bin.install "wayback-darwin-amd64" => "wayback"
  end

  livecheck do
    url "https://api.github.com/repos/wabarc/wayback/releases/latest"
    regex(/"tag_name": "v?(\d+(?:\.\d+)+)"/m)
  end

  test do
    system "false"
  end
end
