#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <new-ip-or-hostname>"
  exit 1
fi

NEW_IP=$1
CERTUTIL="/usr/share/elasticsearch/bin/elasticsearch-certutil"

echo "🛠  Generating new certificate for IP/host: $NEW_IP"

# Generate cert with new IP
sudo $CERTUTIL http <<EOF
y
$NEW_IP



EOF

echo "✅ Certificate zip generated: elasticsearch-ssl-http.zip"

echo "📂 Extracting zip to ./certs/"
unzip -o elasticsearch-ssl-http.zip -d certs/

echo "📁 Backup old certs and replacing..."
sudo mv /etc/elasticsearch/certs /etc/elasticsearch/certs.bak.$(date +%s)
sudo cp -r certs /etc/elasticsearch/certs

echo "🔁 Restarting Elasticsearch..."
sudo systemctl restart elasticsearch

echo "✅ Done! Your new certificate is active."
