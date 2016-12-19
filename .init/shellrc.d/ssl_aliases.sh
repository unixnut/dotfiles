c_verify()
{
  openssl verify -CApath $SSL_PATH/certs -CAfile "$2" "$1"
}

c_dump()
{
  openssl x509 -text -noout -in "$@" | ${PAGER:-less}
}

alias c_fprint='openssl x509 -fingerprint -noout -in'
alias c_fp='openssl x509 -fingerprint -noout -in'

s_verify_smtp()
{
  openssl s_client -connect $1:587 -starttls smtp -${2:-tls1} -verify 20 -CApath /etc/ssl/certs/ < /dev/null |
   sed "/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/d" |
   ${PAGER:-less}
}

# Verifies the chain but won't actually compare the CN of the returned cert agains the server name
s_verify_http()
{
  openssl s_client -connect $1:443 -servername $1 -${2:-tls1} -verify 20 -CApath /etc/ssl/certs/ < /dev/null |
   sed "/^-----BEGIN CERTIFICATE-----/,/^-----END CERTIFICATE-----/d" |
   ${PAGER:-less}
}
