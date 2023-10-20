lead='^.*\/\/adminAuth: {'
tail='^.*\/\*\* The following property can be used to enable HTTPS'
sed -e "/$lead/,/$tail/{ /$lead/{p; r /root/creds-replace.js
}; /$tail/p; d }" -i /data/settings.js
