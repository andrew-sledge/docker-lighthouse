FROM node:latest

# Install google chrome
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add && \
	echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install -y curl unzip openjdk-8-jre-headless xvfb libxi6 libgconf-2-4 google-chrome-stable

# Install lighthouse
RUN npm install -g lighthouse

# Install chromedriver
RUN wget -N http://chromedriver.storage.googleapis.com/2.34/chromedriver_linux64.zip -P ~/ && \
	unzip ~/chromedriver_linux64.zip -d ~/ && \
	rm ~/chromedriver_linux64.zip && \
	mv -f ~/chromedriver /usr/local/bin/chromedriver && \ 
	chown root:root /usr/local/bin/chromedriver && \ 
	chmod 0755 /usr/local/bin/chromedriver

CMD ["/bin/bash"]
