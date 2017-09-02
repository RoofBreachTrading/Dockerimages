FROM roofbreachtrading/base

# Install Obsidian client
# TODO: Make obsidian.conf configurable via ENV
ADD ./obsidian.conf ./.obsidian/obsidian.conf
RUN wget https://github.com/obsidianproject/Obsidian-Qt/releases/download/1.0.0.5-1/obsidiand-1005.zip && unzip obsidiand-1005.zip && chmod +x obsidiand

CMD ./obsidiand
