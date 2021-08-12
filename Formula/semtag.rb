class Semtag < Formula
  desc "Tag your repository according to Semantic Versioning"
  homepage "https://github.com/leb4r/semtag"
  url "https://github.com/leb4r/semtag/archive/v0.0.0.tar.gz"
  sha256 "a7e5e8bae5287e8b64e9da5356c4f2a289ab75645b14108c70291f72d0a9c138"
  license "MIT"
  head "https://github.com/leb4r/semtag.git"

  livecheck do
    url "https://github.com/leb4r/semtag/releases"
    regex(%r{href=.*?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w"

    (bash_completion/"semtag").write `#{bin}/semtag completion bash`
    (zsh_completion/"_semtag").write `#{bin}/semtag completion zsh`
    (fish_completion/"semtag.fish").write `#{bin}/semtag completion fish`
  end

  test do
    system "#{bin}/semtag"
  end
end
