FROM mcr.microsoft.com/playwright:v1.51.1-noble
RUN npm install -g netlify-cli serve
RUN apt update
RUN apt install jq -y