user=tux
pass=tuxmuxB@1

#sudo cat /etc/ssh/sshd_config | grep -i PasswordAuthentication
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

#sudo cat /etc/ssh/sshd_config | grep -i PubkeyAuthentication
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config

sudo useradd $user

echo -e "$pass\n$pass" | sudo /usr/bin/passwd $user

#sudo usermod -aG sudo $user
sudo usermod -aG wheel $user

sudo systemctl restart sshd.service