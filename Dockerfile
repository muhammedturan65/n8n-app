FROM n8nio/n8n

# Paketleri kurabilmek için root kullanıcısına geç
USER root

# n8n'in kurulduğu dizine git
WORKDIR /home/node/.n8n

# Topluluk node'unu zorla ve doğrudan kur
# --unsafe-perm, kurulum sırasındaki izin hatalarını önler
RUN npm install --save --unsafe-perm n8n-nodes-whatsapp-web.js

# İzinleri tekrar 'node' kullanıcısına ver
RUN chown -R node:node /home/node/.n8n

# n8n'i çalıştırmak için güvenli 'node' kullanıcısına geri dön
USER node
