# alpinist

Alpine Linux image with R, a subset of Tidyverse packages, and domain-specific tools for genomic data manipulation and analysis. Included software:

- [htslib 1.16](https://github.com/samtools/htslib/releases/tag/1.16)
- [bcftools 1.16](https://github.com/samtools/bcftools/releases/tag/1.16)
- [samtools 1.16](https://github.com/samtools/samtools/releases/tag/1.16)
- [akt 0.3.3](https://github.com/Illumina/akt)
- R 4.2.2
- R packages:
  - tibble
  - dplyr
  - readr
  - tidyr
  - purrr
  - stringr
  - ggplot2
  - [kgp](https://github.com/stephenturner/kgp)

Pull from Docker Hub or build locally:

```sh
# Pull from docker hub
docker pull stephenturner/alpinist && docker tag stephenturner/alpinist alpinist
# Build locally
docker build --no-cache --tag alpinist .
```
