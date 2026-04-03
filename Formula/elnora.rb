class Elnora < Formula
  desc "Elnora AI Platform CLI — manage bioprotocols from your terminal"
  homepage "https://github.com/Elnora-AI/elnora-cli"
  version "0.0.1"
  license "Apache-2.0"

  # Placeholder — updated automatically by release workflow
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v0.0.1/elnora-macos-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v0.0.1/elnora-macos-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v0.0.1/elnora-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v0.0.1/elnora-linux-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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

  test do
    assert_match version.to_s, shell_output("#{bin}/elnora --version")
  end
end
