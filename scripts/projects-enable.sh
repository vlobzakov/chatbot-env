lead='^.*projects: {'
tail='^.*workflow: {'
sed -e "/$lead/,/$tail/{ /$lead/{p; r /root/projects-enable.js
}; /$tail/p; d }" -i /data/settings.js
