c_verify()
{
  openssl verify -CApath $SSL_PATH/certs -CAfile "$2" "$1"
}

c_dump()
{
  openssl x509 -text -noout -in "$@" | ${PAGER:-less}
}
