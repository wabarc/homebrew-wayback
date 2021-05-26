class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.12.2/wayback-darwin-amd64-0.12.2.tar.gz"
    sha256 "7d287d50ea480ec401c610ac249e5c212a7db4fd29371572131af4d02736c9fb" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.12.2/wayback-darwin-arm64-0.12.2.tar.gz"
    sha256 "24b11fe77b2524e2532ec09897e1cec3f91c10310ac3e4f39775e87fc5ebd15b" # Apple Silicon
  end
  version "0.12.2"
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
