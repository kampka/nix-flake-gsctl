{ pkgs }:

pkgs.buildGoModule rec {
  pname = "gsctl";
  version = "1.1.4";

  vendorSha256 = "sha256-lZgHrQYqoyoM1Iv6vCqTMcv62zSKyxaAsq56kUXHrIA=";

  doCheck = false;

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = version;
    sha256 = "sha256-uCNWgaLZMm1vPxFduj8mpjKYuYlp1ChF6bK+bmAWy50=";
  };

  meta = with pkgs.lib; {
    description = "The Giant Swarm command line interface";
    homepage = https://github.com/giantswarm/gsctl;
    license = licenses.asl20;
  };
}
