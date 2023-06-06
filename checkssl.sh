file="sslCert.log"
if [ -f "$file" ] ; then
    rm "$file"
fi
read -a arr
for domain in ${arr[@]}
do
echo $domain
(echo $domain && openssl s_client -connect $domain:443 |grep -o 'NotAfter:.*')|tee -a "sslCert.log"
done
