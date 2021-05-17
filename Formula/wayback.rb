class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.11.1/wayback-darwin-amd64-0.11.1.tar.gz"
    sha256 "23ddded1f1be414b5c04c7a6e1268f7f75e957f2d79ead5633b9b22d6b57a608" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.11.1/wayback-darwin-arm64-0.11.1.tar.gz"
    sha256 "af139f03015f7da2b8c92e2e97f79387699d683678e55eb3e044fe1f48e3d2de" # Apple Silicon
  end
  version "0.11.1"
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
