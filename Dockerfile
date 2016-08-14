FROM fish/ghost
ENV URL "https://textkrieg.de"

USER root
RUN apk --no-cache add curl \
    && curl -LsSf https://github.com/textkrieg/ghost_theme/archive/master.tar.gz \
    | tar -C content/themes -xzf - \
    && mv content/themes/ghost_theme-master content/themes/textkrieg
USER user
