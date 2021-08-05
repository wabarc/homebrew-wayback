class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.15.0/wayback-darwin-amd64-0.15.0.tar.gz"
    sha256 "50a0cc7d11cc0c20bd89bf9a687bc2bd2873ce1b887e33cf5696cb6b461d03bb" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.15.0/wayback-darwin-arm64-0.15.0.tar.gz"
    sha256 "c1bfd5f7ce7723eac74f7cecd4103cec8e629c56d4190818c8104e6ef490ce12" # Apple Silicon
  end
  version "0.15.0"
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
