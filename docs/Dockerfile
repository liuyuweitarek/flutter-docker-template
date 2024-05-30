# Credit to https://github.com/BretFisher/jekyll-serve/blob/main/Dockerfile
FROM ruby:3.1-slim-bullseye as jekyll

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# used in the jekyll-server image, which is FROM this image
COPY ./jekyll-doc-web.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/jekyll-doc-web.sh

RUN gem update --system && gem install jekyll && gem cleanup

EXPOSE 4000

WORKDIR /site

ENTRYPOINT [ "jekyll" ]

CMD [ "--help" ]

# build from the image we just built with different metadata
FROM jekyll as jekyll-serve

# on every container start, check if Gemfile exists and warn if it's missing
ENTRYPOINT [ "jekyll-doc-web.sh" ]

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "--livereload", "-H", "0.0.0.0", "-P", "4000" ]