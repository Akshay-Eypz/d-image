FROM node:lts-buster

# Install necessary system packages
RUN apt-get update && \
  apt-get install -y ffmpeg git imagemagick webp && \
  npm i -g pm2 && \
  rm -rf /var/lib/apt/lists/*

# Clone your repo to root/rndr
RUN git clone https://github.com/Akshay-Eypz/izumi-bot /root/rndr

# Set working directo
WORKDIR /root/rndr
RUN npm install --legacy-peer-deps

CMD ["npm", "start"]
