FROM roofbreachtrading/base

# Install Obsidian client
# TODO: Make obsidian.conf configurable via ENV
ADD ./obsidian.conf /root/.obsidian/obsidian.conf
RUN cd ~ && chmod 500 .obsidian/obsidian.conf && wget https://github.com/obsidianproject/Obsidian-Qt/releases/download/1.0.0.5-1/obsidiand-1005.zip && unzip obsidiand-1005.zip && chmod +x obsidiand && rm obsidiand-1005.zip

CMD ~/obsidiand
