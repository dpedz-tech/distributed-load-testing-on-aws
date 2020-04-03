FROM blazemeter/taurus
# taurus includes python and pip
RUN pip install --no-cache-dir awscli
RUN pip install bzt

# # Install Chrome for Selenium
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb
RUN dpkg -i /chrome.deb || apt-get install -yf
RUN rm /chrome.deb
# Install chromedriver for Selenium
RUN curl https://chromedriver.storage.googleapis.com/80.0.3987.106/chromedriver_linux64.zip -o /usr/local/bin/chromedriver
RUN chmod +x /usr/local/bin/chromedriver
RUN export PATH=$PATH:/usr/local/bin/chromedriver
RUN pip install selenium
# Taurus working directory  = /bzt-configs
ADD ./load-test.sh /bzt-configs/
ADD load_page.yml .
RUN chmod 755 /bzt-configs/load-test.sh
ENTRYPOINT ["sh", "-c","./load-test.sh"]
