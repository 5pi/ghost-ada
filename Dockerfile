FROM fish/ghost
ENV URL "https://textkrieg.de"

USER root
RUN apk --no-cache add curl \
    && curl -LsSf https://github.com/textkrieg/ghost_theme/archive/master.tar.gz \
    | tar -C content/themes -xzf - \
    && mv content/themes/ghost_theme-master content/themes/textkrieg

COPY add_5pi_showdown_extension.patch /tmp
COPY fivepi.js node_modules/showdown-ghost/src/extensions/
RUN  patch -p1 < /tmp/add_5pi_showdown_extension.patch
USER user
