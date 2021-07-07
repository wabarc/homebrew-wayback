class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.14.0/wayback-darwin-amd64-0.14.0.tar.gz"
    sha256 "d62b76efced49dce2390b0da86898363cf4201b28b9ea86d33b45660732add03" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.14.0/wayback-darwin-arm64-0.14.0.tar.gz"
    sha256 "c67081f5b0393321e3f7177a68e87f69f8eb48e3dc927499eda66fa1a0a7537d" # Apple Silicon
  end
  version "0.14.0"
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
