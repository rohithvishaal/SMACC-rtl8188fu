# ref:https://github.com/kelebek333/rtl8188fu

sudo apt-get install build-essential git dkms linux-headers-$(uname -r)

git clone https://github.com/kelebek333/rtl8188fu

sudo dkms add ./rtl8188fu

sudo dkms build rtl8188fu/1.0

sudo dkms install rtl8188fu/1.0

sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/


# Disbale Power Managemenet
sudo mkdir -p /etc/modprobe.d/

sudo touch /etc/modprobe.d/rtl8188fu.conf

echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf

# if you are using kernel 5.15 and newer, you must create a configuration file with following commands for preventing to conflict rtl8188fu  module with built-in r8188eu module.

echo 'alias usb:v0BDApF179d*dc*dsc*dp*icFFiscFFipFFin* rtl8188fu' | sudo tee /etc/modprobe.d/r8188eu-blacklist.conf

# ref: https://medium.com/@kaw411gh0st/how-to-fix-rtl8188fu-cant-connect-to-any-network-in-linux-f0bf1a9e5e4c
echo "options rtl8188fu rtw_ips_mode=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf
sudo modprobe -rv rtl8188fu && sudo modprobe -v rtl8188fu