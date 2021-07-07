user=tux
pass=tuxmuxB@1

sudo cat /etc/ssh/sshd_config | grep -i PasswordAuthentication
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

sudo cat /etc/ssh/sshd_config | grep -i PubkeyAuthentication
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config

if grep "CentOS Linux 8" /etc/os-release
then
    sudo useradd $user
    echo -e "$pass\n$pass" | sudo /usr/bin/passwd $user
    sudo usermod -aG wheel $user
elif grep "Ubuntu 18.04.5 LTS" /etc/os-release
then
    echo -e "$pass\n$pass" | sudo adduser tux -q
    sudo usermod -aG sudo $user
else
    echo Nope
fi

sudo systemctl restart sshd.service