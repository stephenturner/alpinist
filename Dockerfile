ARG VERSION_ALPINE=3.17
FROM alpine:${VERSION_ALPINE}

RUN apk update && apk add --no-cache wget gcc g++ make R R-dev R-doc libc-dev ncurses-dev zlib-dev xz-dev bzip2-dev libxml2-dev tzdata bash

RUN Rscript -e 'install.packages(c("tibble", "dplyr", "readr", "tidyr", "purrr", "stringr", "ggplot2", "kgp"), repos="https://cloud.r-project.org")'

ARG VERSION_HTSLIB=1.16
RUN wget -q https://github.com/samtools/htslib/releases/download/${VERSION_HTSLIB}/htslib-${VERSION_HTSLIB}.tar.bz2 && \
    tar -xjf htslib-${VERSION_HTSLIB}.tar.bz2 && \
    cd htslib-${VERSION_HTSLIB} && \
    make -j4 && \
    make install && \
    cd .. && rm -rf htslib-${VERSION_HTSLIB}.tar.bz2 htslib-${VERSION_HTSLIB}
RUN wget -q https://github.com/samtools/bcftools/releases/download/${VERSION_HTSLIB}/bcftools-${VERSION_HTSLIB}.tar.bz2 && \
    tar -xjf bcftools-${VERSION_HTSLIB}.tar.bz2 && \
    cd bcftools-${VERSION_HTSLIB} && \
    make -j4 && \
    make install && \
    cd .. && rm -rf bcftools-${VERSION_HTSLIB}.tar.bz2 bcftools-${VERSION_HTSLIB}
RUN wget -q https://github.com/samtools/samtools/releases/download/${VERSION_HTSLIB}/samtools-${VERSION_HTSLIB}.tar.bz2 && \
    tar -xjf samtools-${VERSION_HTSLIB}.tar.bz2 && \
    cd samtools-${VERSION_HTSLIB} && \
    ./configure --without-curses && \
    make -j4 && \
    make install && \
    cd .. && rm -rf samtools-${VERSION_HTSLIB}.tar.bz2 samtools-${VERSION_HTSLIB}

ARG VERSION_AKT=0.3.3
RUN wget -q https://github.com/Illumina/akt/archive/refs/tags/v${VERSION_AKT}.tar.gz && \
    tar -xzf v${VERSION_AKT}.tar.gz && \
    cd akt-${VERSION_AKT} && \
    make -j4 && \
    mv akt /usr/local/bin && \
    cd .. && rm -rf v${VERSION_AKT}.tar.gz akt-${VERSION_AKT}
    
ENV TZ=US/Eastern

WORKDIR /data