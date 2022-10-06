class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.18.0/wayback-darwin-amd64-0.18.0.tar.gz"
    sha256 "9c308e866070723211c47a7ac1c61eef2c822eaad6c84aaa5575e86b0fc14ffc" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.18.0/wayback-darwin-arm64-0.18.0.tar.gz"
    sha256 "50af9a292c84bc2a55d7830264372f7533646130ff3b11892091a84c3e5ae4df" # Apple Silicon
  end
  version "0.18.0"
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
