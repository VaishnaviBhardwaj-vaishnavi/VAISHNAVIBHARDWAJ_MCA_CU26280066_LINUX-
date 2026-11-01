#!/bin/bash

echo "1. Available block devices:"
lsblk -f

read -p "Enter dedicated test partition: " partition

if [ ! -b "$partition" ]; then
    echo "Invalid partition."
    exit 1
fi

echo
echo "Selected partition:"
lsblk -f "$partition"

read -p "Formatting will erase all data. Type FORMAT to continue: " confirm

if [ "$confirm" != "FORMAT" ]; then
    echo "Operation cancelled."
    exit 1
fi

if findmnt -rn -S "$partition" >/dev/null; then
    echo "Partition is mounted. Unmount it first."
    exit 1
fi

echo
echo "2. Creating ext4 filesystem:"
sudo mkfs.ext4 "$partition" || exit 1

echo
echo "3. Filesystem UUID:"
uuid=$(sudo blkid -s UUID -o value "$partition")
echo "$uuid"

if [ -z "$uuid" ]; then
    echo "Could not read UUID."
    exit 1
fi

echo
echo "4. Creating mount point:"
sudo mkdir -p /mnt/labfs

if mountpoint -q /mnt/labfs; then
    echo "Mount point already in use."
    exit 1
fi

echo
echo "5. Backing up /etc/fstab:"
sudo cp /etc/fstab "/etc/fstab.backup.$(date +%Y%m%d%H%M%S)"

echo
echo "6. Adding UUID entry:"
if grep -q "LABFS_ENTRY" /etc/fstab; then
    echo "A lab entry already exists. Clean it up first."
    exit 1
fi

echo "# LABFS_ENTRY" | sudo tee -a /etc/fstab
echo "UUID=$uuid /mnt/labfs ext4 defaults,nofail 0 2" | sudo tee -a /etc/fstab

echo
echo "7. Verifying fstab:"
sudo findmnt --verify --verbose

echo
echo "8. Mounting filesystem:"
sudo mount /mnt/labfs || exit 1

echo
echo "9. Verifying mounted filesystem:"
findmnt /mnt/labfs
df -h /mnt/labfs
lsblk -f "$partition"

echo
echo "10. Creating test file:"
echo "Linux File System Management Lab" | sudo tee /mnt/labfs/lab_test.txt

echo
echo "11. Verifying test file:"
ls -l /mnt/labfs/lab_test.txt
df -h /mnt/labfs/lab_test.txt

echo
echo "12. Unmounting before filesystem check:"
sudo umount /mnt/labfs || exit 1

echo
echo "13. Checking unmounted filesystem:"
sudo e2fsck -fn "$partition"

echo
echo "14. Removing lab entry from /etc/fstab:"
sudo sed -i '/^# LABFS_ENTRY$/,+1d' /etc/fstab

echo
echo "15. Final mount status:"
if mountpoint -q /mnt/labfs; then
    echo "Filesystem is still mounted."
else
    echo "Filesystem is unmounted."
fi

echo
echo "16. Final storage information:"
lsblk -f
df -h

echo
echo "17. Final fstab verification:"
sudo findmnt --verify --verbose

echo
echo "Lab workflow completed."
echo "The test filesystem and its data remain on the partition."