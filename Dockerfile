FROM buildpack-deps:jessie

#Release sources
ENV ARC_GCC 2016.03

#download sources and build
RUN buildDeps='texinfo byacc flex libncurses5-dev zlib1g-dev libexpat1-dev texlive wget libgmp-dev libmpfr-dev libmpc-dev' \
    && set -x \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends \
    && rm -r /var/lib/apt/lists/* \
    && curl -fSL "https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$ARC_GCC-rc2/arc_gnu_${ARC_GCC}_sources.tar.gz" -o arc_gnu.tar.gz \
    && mkdir -p /usr/src/arc \
    && tar -xzf arc_gnu.tar.gz -C /usr/src/arc --strip-components=1 \
    && rm arc_gnu.tar.gz* \
    && cd /usr/src/arc/toolchain \
    && ./build-all.sh --no-uclibc --no-multilib --no-sim --no-auto-checkout --no-auto-pull --no-pdf --cpu quarkse_em --no-external-download --target-cflags "-mno-sdata" \
    && apt-get purge -y --auto-remove $buildDeps

