class Elnora < Formula
  desc "AI-powered bioprotocol optimization CLI for researchers"
  homepage "https://elnora.ai"
  version "v2.1.1"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/Elnora-AI/elnora-cli/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-arm64.tar.gz"
      sha256 "f425c23bae82bf3474e8bbf7740b6b501ca7a622bb24647951f27446bf3a7bcb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-x64.tar.gz"
      sha256 "507658286ae1ae4bcbce46f2754c3eeb509c26f81912a01f74a029dab99c346c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-arm64.tar.gz"
      sha256 "0e1bed86bc4edc1ef6ec56e8e6c9ec55a247b15ed538821eafcbc74da515b3d2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-x64.tar.gz"
      sha256 "5a732b2a24df556afcb21ba7f458b0532945672df034b271c50609379180a760"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "elnora-macos-arm64" => "elnora"
    elsif OS.mac?
      bin.install "elnora-macos-x64" => "elnora"
    elsif Hardware::CPU.arm?
      bin.install "elnora-linux-arm64" => "elnora"
    else
      bin.install "elnora-linux-x64" => "elnora"
    end
  end

  def caveats
    <<~EOS
      To get started:

        elnora auth login
        elnora setup          # Configure Claude Code, Cursor, etc.

      You'll need an API key from https://platform.elnora.ai
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elnora --version")
  end
end
