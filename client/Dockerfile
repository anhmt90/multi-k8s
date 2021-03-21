FROM node:14.15.0-alpine3.12 as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the stuff to run the app in prod env gets placed here

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html

# this COPY step keeps only the build/ folder, everything else 
# from the nodejs FROM block will be dumped. The final image is
# thus relatively small