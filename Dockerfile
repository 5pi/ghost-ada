FROM fish/ghost
ENV URL "https://textkrieg.de"
ENV THEME_REV 5724500
USER root
RUN apk --no-cache add curl \
    && curl -LsSf https://github.com/textkrieg/ghost_theme/archive/${THEME_REV}.tar.gz \
    | tar -C content/themes -xzf - \
    && mv content/themes/ghost_theme-${THEME_REV}* content/themes/textkrieg

COPY add_5pi_showdown_extension.patch /tmp
COPY fivepi.js node_modules/showdown-ghost/src/extensions/
RUN  patch -p1 < /tmp/add_5pi_showdown_extension.patch
USER user
