class Elnora < Formula
  desc "AI-powered bioprotocol optimization CLI for researchers"
  homepage "https://elnora.ai"
  version "v2.0.1"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/Elnora-AI/elnora-cli/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-arm64.tar.gz"
      sha256 "f2aec42bbcb5abe60c67f3e1da464c2c0a911fc8bbd4afd37c60738b98b69fce"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-x64.tar.gz"
      sha256 "9f54c321ce8a6212263447cf71ea576416e1fc4b8bf7c5149d57d2720e154cfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-arm64.tar.gz"
      sha256 "1c90729681a9db27f0d152c6a1333133470bbc30027e29105da640da30d89c59"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-x64.tar.gz"
      sha256 "12c0d0c8744c578e6259bdc2ad4c6449ca787a7c2d33d681d0206d3a770b8286"
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
