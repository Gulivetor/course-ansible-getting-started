user=tux
pass=tuxmuxB@1

servers=("192.168.50.10" "192.168.50.11" "192.168.50.20" "192.168.50.21")

for s in ${servers[@]};
do
    sed -i "/$s/d" /home/$user/.ssh/known_hosts
    sshpass -p $pass ssh-copy-id -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa.pub $user@$s
done