function git-toggle-protocol
    set remote_url (git remote get-url origin)
    if string match -q 'https://*' $remote_url
        set new_url (echo $remote_url | sed 's#https://\([^/]*\)/#git@\1:#')
        git remote set-url origin $new_url
        echo "Switched to SSH"
    else if string match -q 'git@*:*' $remote_url
        set new_url (echo $remote_url | sed 's#git@\([^:]*\):#https://\1/#')
        git remote set-url origin $new_url
        echo "Switched to HTTPS"
    else
        echo "Unrecognized URL format"
    end
end