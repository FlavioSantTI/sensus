# Dockerfile para Sensus (Static Site com Vite)
FROM node:20-alpine as build-stage

ARG VITE_SUPABASE_URL
ARG VITE_SUPABASE_ANON_KEY

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Substituir placeholders pelos valores reais passados via ARG
RUN sed -i "s|VITE_SUPABASE_URL_PLACEHOLDER|$VITE_SUPABASE_URL|g" index.html admin.html && \
    sed -i "s|VITE_SUPABASE_ANON_KEY_PLACEHOLDER|$VITE_SUPABASE_ANON_KEY|g" index.html admin.html

RUN npm run build

# Estágio de produção com Nginx
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
