alias c_verify 'openssl verify -CApath $SSL_PATH/certs -CAfile "\!:2" "\!:1"'
alias c_dump   'openssl x509 -text -noout -in \!:* | $PAGER'
alias c_fprint 'openssl x509 -fingerprint -noout -in'
alias c_fp     'openssl x509 -fingerprint -noout -in'
alias s_verify_smtp 'openssl s_client -connect \!{:1}:587 -starttls smtp -tls1 -verify 20 -CApath $SSL_PATH/certs/ < /dev/null | sed "/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/d" | $PAGER'
# Verifies the chain but won't actually compare the CN of the returned cert agains the server name
alias s_verify_http 'openssl s_client -connect \!{:1}:443 -servername \!{:1} -tls1 -verify 20 -CApath $SSL_PATH/certs/ < /dev/null | sed "/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/d" | $PAGER'
alias s_verify_imaps 'openssl s_client -connect \!{:1}:993 -tls1 -verify 20 -CApath $SSL_PATH/certs/ < /dev/null | sed "/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/d" | $PAGER'
alias s_verify_imap 'openssl s_client -connect \!{:1}:143 -starttls imap -tls1 -verify 20 -CApath $SSL_PATH/certs/ < /dev/null | sed "/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/d" | $PAGER'
