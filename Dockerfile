FROM node
WORKDIR /app
RUN apt update
RUN apt install -y default-jre
RUN npm install -g testcafe allure-commandline
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
COPY . .
RUN chmod +x entrypoint.sh
RUN npm install
EXPOSE 8000
ENTRYPOINT ["./entrypoint.sh"]