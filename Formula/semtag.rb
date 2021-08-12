class Semtag < Formula
  desc "Tag your repository according to Semantic Versioning"
  homepage "https://github.com/leb4r/semtag"
  url "https://github.com/leb4r/semtag/archive/v0.0.1.tar.gz"
  sha256 "9bf9e727f5817f8e905c28ca7df6ca142ada72e4151616bcc3571495f851ba3c"
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
