class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.19.0/wayback-darwin-amd64-0.19.0.tar.gz"
    sha256 "3eff3ea31d34dd79d8c500080f3580ef03deed2a91f29d4633e20d27c7d1b938" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.19.0/wayback-darwin-arm64-0.19.0.tar.gz"
    sha256 "e6f7ef2475d1bef747673e0abab1c41e5ca30af592555238031b9f4e0a48bb36" # Apple Silicon
  end
  version "0.19.0"
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
