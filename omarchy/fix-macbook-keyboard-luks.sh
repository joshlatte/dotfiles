#!/bin/bash
############################
# Fix MacBook keyboard for LUKS password prompt
# Adds necessary HID and SPI modules to initramfs
############################

set -e

MKINITCPIO_CONF="/etc/mkinitcpio.conf"
BACKUP_FILE="/etc/mkinitcpio.conf.backup-$(date +%Y%m%d-%H%M%S)"
REQUIRED_MODULES="btrfs applespi intel_lpss_pci spi_pxa2xx_platform usbhid hid_generic hid_apple"

echo "MacBook Keyboard LUKS Fix Script"
echo "================================="
echo ""
echo "This script will add HID and SPI modules to your initramfs so the"
echo "built-in MacBook keyboard works at the LUKS password prompt."
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Error: This script must be run with sudo"
    exit 1
fi

# Check if mkinitcpio.conf exists
if [ ! -f "$MKINITCPIO_CONF" ]; then
    echo "Error: $MKINITCPIO_CONF not found"
    exit 1
fi

# Get current MODULES line
current_modules=$(grep "^MODULES=" "$MKINITCPIO_CONF" | sed 's/MODULES=(\(.*\))/\1/')

echo "Current MODULES: ($current_modules)"
echo ""

# Parse existing modules into array
IFS=' ' read -ra existing_array <<< "$current_modules"

# Add required modules if not present
new_modules=("${existing_array[@]}")
for module in $REQUIRED_MODULES; do
    if [[ ! " ${existing_array[@]} " =~ " ${module} " ]]; then
        new_modules+=("$module")
        echo "Will add module: $module"
    else
        echo "Module already present: $module"
    fi
done

# Check if any changes needed
if [ ${#new_modules[@]} -eq ${#existing_array[@]} ]; then
    echo ""
    echo "All required modules are already present. No changes needed."
    exit 0
fi

# Build new MODULES line
new_modules_string="${new_modules[*]}"
echo ""
echo "New MODULES: ($new_modules_string)"
echo ""

# Confirm with user
read -p "Do you want to apply these changes? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
fi

# Backup original file
echo "Creating backup: $BACKUP_FILE"
cp "$MKINITCPIO_CONF" "$BACKUP_FILE"

# Update MODULES line
sed -i "s/^MODULES=.*/MODULES=($new_modules_string)/" "$MKINITCPIO_CONF"

echo "Updated $MKINITCPIO_CONF"
echo ""

# Rebuild initramfs
echo "Rebuilding initramfs..."
mkinitcpio -P

echo ""
echo "Success! The MacBook keyboard should now work at the LUKS prompt after reboot."
echo ""
echo "Modules added:"
echo "  - btrfs: Btrfs filesystem support"
echo "  - applespi: Apple SPI keyboard/trackpad driver"
echo "  - intel_lpss_pci: Intel Low Power Subsystem PCI support"
echo "  - spi_pxa2xx_platform: SPI controller platform support"
echo "  - usbhid: USB HID driver"
echo "  - hid_generic: Generic HID driver"
echo "  - hid_apple: Apple-specific keyboard driver"
echo ""
echo "Backup saved to: $BACKUP_FILE"