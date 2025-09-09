# MacBook Keyboard Fix for LUKS on Arch Linux

## Problem
MacBook built-in keyboard doesn't work at LUKS password prompt during boot, requiring external USB keyboard.

## Solution
Add HID kernel modules to initramfs so the keyboard drivers load early in boot process.

### Steps:

1. **Edit mkinitcpio configuration:**
   ```bash
   sudo nano /etc/mkinitcpio.conf
   ```

2. **Update MODULES line to include HID drivers:**
   
   Change from:
   ```
   MODULES=(btrfs)
   ```
   
   To:
   ```
   MODULES=(btrfs usbhid hid_generic hid_apple)
   MODULES=(btrfs applespi intel_lpss_pci spi_pxa2xx_platform usbhid hid_generic hid_apple)


   ```

   The key additions are:
   - `usbhid` - USB HID driver
   - `hid_generic` - Generic HID driver fallback
   - `hid_apple` - Apple-specific keyboard driver

3. **Rebuild initramfs:**
   ```bash
   sudo mkinitcpio -P
   ```

4. **Reboot**

After reboot, the built-in MacBook keyboard will work at the LUKS password prompt.

## Note
The minimal set of modules needed is just the HID drivers. The SPI modules (applespi, intel_lpss_pci, spi_pxa2xx_platform) may be needed for some MacBook models but weren't required in this case.
