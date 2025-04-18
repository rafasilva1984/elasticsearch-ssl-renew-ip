# 🔐 Elasticsearch SSL Certificate Regeneration (IP/Hostname Change)

This repo contains a simple guide and script to regenerate Elasticsearch's default SSL certificate (`http_ca.crt`) after a server IP or hostname change.

### 🧩 Problem
If you're using the default Elastic self-signed certificate and your server's IP changes, Elasticsearch will fail TLS validation with errors like:

```
IP address does not match the one in the certificate.
```

---

## ✅ How to Fix It

This guide helps you:
- Regenerate the certificate using `elasticsearch-certutil`
- Replace the old certs safely
- Restart Elasticsearch with the new config

---

## 🔁 Script: `regenerate-cert.sh`

This script automates the certificate regeneration process. Make sure to run it with sudo.

```bash
sudo ./regenerate-cert.sh <your-new-ip>
```

---

## 🧪 Sample elasticsearch.yml changes

See `elasticsearch.yml.example` for a config snippet to enable HTTP SSL with the new certs.

---

## 📚 Related

- Blog post: [[LinkedIn Article](https://www.linkedin.com/posts/rafael-silva-leader-coordenador_github-rafasilva1984elasticsearch-ssl-renew-ip-activity-7318834976781680640-kr58?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAinBaIBmFxhdmM7tBO0qoOGyZFvjgivJMg)]([https://www.linkedin.com/in/rafael-silva-observabilidade](https://www.linkedin.com/in/rafael-silva-leader-coordenador/)/)
- Discuss.elastic.co forum: [https://discuss.elastic.co/t/regenerate-the-ssl-certificate-that-was-auto-generated-on-setup-of-elasticsearch/377216/5]
