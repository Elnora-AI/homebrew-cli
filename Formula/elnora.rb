class Elnora < Formula
  desc "AI-powered bioprotocol optimization CLI for researchers"
  homepage "https://elnora.ai"
  version "1.1.3"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/Elnora-AI/elnora-cli/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-arm64.tar.gz"
      sha256 "831718ee8c5f56d535e77a981ca1c55358a4c1bc13cfe2d70bb8938b1ab4876b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-x64.tar.gz"
      sha256 "f178e9941da9035bfc26cec87f1d990b8cc2aad0396a75abd923584714e69b2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-arm64.tar.gz"
      sha256 "42bf0fd905deac2486d00ca5ef31816f3cfc3b1fa2b19dd2edf2239a17c4fbf3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-x64.tar.gz"
      sha256 "aab33dd94a859ccd7173aa941f3628c254433c5472d437c0580888af255c1c08"
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
      To get started, run:

        elnora auth login

      You'll need an API key from https://platform.elnora.ai

      Documentation: https://github.com/Elnora-AI/elnora-cli
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elnora --version")
  end
end
