a='password: "$2b$08$C8I.EZCHxPsJlaoOcZjKzupjNoN5cRSavs9H.T1by8iQVScu7f/cO",'
b=`echo $1 | node-red admin hash-pw | awk -F\  '{print $2}'`
c="password: \"$b\","

sed -i "s|$a|$c|g" /root/creds-replace.js

lead='^.*\/\/adminAuth: {'
tail='^.*\/\*\* The following property can be used to enable HTTPS'
sed -e "/$lead/,/$tail/{ /$lead/{p; r /root/creds-replace.js
}; /$tail/p; d }" -i /data/settings.js
