Tutorial/configs to deploy a private ZNC instance on your server.

# Usage
Note: I'm not sure these steps are actually accurate, I don't remember exactly what I did to get it working :)
- Generate a custom config using `docker run -it -v ./configs:/znc-data/configs znc --makeconf`
You can then retrieve the config at `./configs/znc.conf` and move it to the root of this repository. A sample is provided [here](./znc.conf.sample)
- Add the following lines at the root of the file:
```conf
SSLCertFile = /etc/letsencrypt-fixed/live/<your website>/fullchain.pem
SSLDHParamFile = /etc/letsencrypt-fixed/live/<your website>/fullchain.pem
SSLKeyFile = /etc/letsencrypt-fixed/live/<your website>/privkey.pem
```

Note that we are using `/etc/letsencrypt-fixed` and not `/etc/letsencrypt`. See https://github.com/znc/znc/issues/1769 for more information.
- Add `LoadModule = sasl` to the `<Network libera>` section
- `docker compose up -d`
- connect with your prefered IRC client at `<your server ip>:6697` using the server password (?) you defined in step 1 earlier
- use `/msg *sasl Set <username> [<password>]` to configure your SASL credentials
- Everything should work now, hopefully !
