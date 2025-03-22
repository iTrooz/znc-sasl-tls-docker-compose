# Copy out of volume (so chown does not affect host)
cp -r /etc/letsencrypt /etc/letsencrypt-fixed

# Fix permissions
chown -R znc:znc /etc/letsencrypt-fixed
