# H2lab wookey SDK runner system
#
# VERSION               0.1
# DOCKER-VERSION        0.2

from	debian:stable

# make sure the package repository is up to date
run echo "deb http://deb.debian.org/debian/ buster contrib non-free" >> /etc/apt/sources.list
run apt-get update

# debian packages dependencies (latex and sphinx deps)
run apt-get install -yq git make texlive-base texlive-bibtex-extra texlive-binaries texlive-extra-utils texlive-font-utils texlive-fonts-extra texlive-fonts-extra-links texlive-fonts-recommended texlive-formats-extra texlive-lang-french texlive-lang-greek texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-luatex texlive-pictures texlive-plain-generic texlive-pstricks texlive-science texlive-xetex latexmk python-sphinx coreutils

run groupadd build
run useradd -d /build -ms /bin/bash -g build build;
run usermod -a -G sudo build;

user build:build
workdir /build

# overrideable
cmd ["/bin/bash"]
