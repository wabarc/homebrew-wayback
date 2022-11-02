class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.18.1/wayback-darwin-amd64-0.18.1.tar.gz"
    sha256 "6b346ca0fe49b51d637ab89ac3089bb935daa868f9b0c18c2f79fad1f7189644" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.18.1/wayback-darwin-arm64-0.18.1.tar.gz"
    sha256 "e7fabbf7b4465ea2366fa143221ed0551e7e11b845d676b108e77297f75e3ee2" # Apple Silicon
  end
  version "0.18.1"
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
