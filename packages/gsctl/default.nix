{ pkgs }:

pkgs.buildGoModule rec {
  pname = "gsctl";
  version = "0.29.0";

  vendorSha256 = "sha256-lZgHrQYqoyoM1Iv6vCqTMcv62zSKyxaAsq56kUXHrIA=";

  doCheck = false;

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = version;
    sha256 = "sha256-2dLbJF30CNyGQaSuuW+Im1FX2wczE8GyseEKWU9hvGU=";
  };

  patches = [ ./0001-Enable-config-dir-setting-via-env-variable.patch ];

  meta = with pkgs.lib; {
    description = "The Giant Swarm command line interface";
    homepage = https://github.com/giantswarm/gsctl;
    license = licenses.asl20;
  };
}
