FROM roofbreachtrading/base

# Install Obsidian client
# TODO: Make obsidian.conf configurable via ENV
COPY ./obsidian.conf /home/rbt/.obsidian/obsidian.conf
ADD https://github.com/obsidianproject/Obsidian-Qt/releases/download/1.0.0.6-3/obsidiand-v1.0.0.6.zip /home/rbt/
RUN cd /home/rbt && unzip obsidiand*.zip && rm obsidiand*.zip && chmod +x obsidiand

# temporary, see base image for more info
RUN chown -R rbt: /home/rbt/* /home/rbt/.*
USER rbt
WORKDIR /home/rbt

CMD ~/obsidiand
