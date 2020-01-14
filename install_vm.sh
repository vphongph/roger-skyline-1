#!/bin/bash

LOGIN=`whoami`
SGOINFRE="/sgoinfre/goinfre/Perso/$LOGIN"
DEBIAN_ISO="$SGOINFRE/debian-10.2.0-i386-netinst.iso"
VM_NAME="vm_rs1_mk2"
VDI=$SGOINFRE"/"$VM_NAME"/"$VM_NAME".vdi"
SKIP=0


if [ `VBoxManage list vms | grep "\"$VM_NAME\"" | awk '{print $1}'` = \"$VM_NAME\" ] 2>/dev/null
then
	  echo "$VM_NAME already exists, wanna reinstall it ? [yes|no]"
	  read r_confirm
	  if [ $r_confirm = "yes" ] 2>/dev/null
	  then
			VBoxManage unregistervm $VM_NAME --delete
	  else
			SKIP=1
	  fi
fi

if [ $SKIP = 0 ]
then
	VBoxManage createvm \
		--name $VM_NAME \
		--ostype Debian_64 \
		--basefolder $SGOINFRE \
		--register

	VBoxManage createhd \
		--filename $VDI \
		--sizebyte 8000000000 \
		--format VDI \
		--variant Fixed

	VBoxManage storagectl $VM_NAME \
		--name "SATA Controller" \
		--add sata \
		--controller IntelAHCI \
		--portcount 1

	VBoxManage storageattach $VM_NAME \
		--storagectl "SATA Controller" \
		--port 0 \
		--device 0 \
		--type hdd \
		--medium $VDI

		# --nonrotational on \

	VBoxManage storagectl $VM_NAME \
		--name "IDE Controller" \
		--add ide \
		--controller PIIX4 \

	VBoxManage storageattach $VM_NAME \
		--storagectl "IDE Controller" \
		--port 0 \
		--device 0 \
		--type dvddrive \
		--medium $DEBIAN_ISO

	VBoxManage modifyvm $VM_NAME \
		--boot1 dvd \
		--boot2 disk \
		--boot3 none \
		--boot4 none \
		\
		--memory 2048 \
		\
		--nic1 bridged \
		--bridgeadapter1 en0 \
		\
		--pae off \
		--rtcuseutc on
fi

# VBoxManage list vms --long

VBoxManage showvminfo $VM_NAME