FROM golang:1.24-alpine

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . .

RUN go build -o main .

CMD ["./main"]



docker run -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  --mount type=bind,source=/Users/pedroribeiro/Tools/Keycloak/KeycloakThemes/Content/theme/boots,target=/opt/keycloak/themes/boots \
  quay.io/keycloak/keycloak:latest \
  start-dev


docker run -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -e KC_THEME_CACHE_THEMES=false \
  -e KC_THEME_CACHE_TEMPLATES=false \
  --mount type=bind,source=/Users/pedroribeiro/Tools/Keycloak/KeycloakThemes/Content/theme/boots,target=/opt/keycloak/themes/boots \
  quay.io/keycloak/keycloak:latest \
  start-dev