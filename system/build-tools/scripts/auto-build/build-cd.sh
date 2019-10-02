#!/bin/bash

declare -a FILES

# source, dest
FILES=(	"/etc/profile, /etc/profile" 															\
		"/etc/passwd, /etc/passwd"															\
#		"/etc/termcap, /etc/termcap"															\
																											\
		"/home/root/.profile, /home/root/.profile"											\
																											\
		"/system/drivers/appserver/input/*, /system/drivers/appserver/input/."						\
		"/system/drivers/appserver/video/*, /system/drivers/appserver/video/."						\
		"/system/drivers/appserver/decorators/Photon, /system/drivers/appserver/decorators/Photon"	\
																											\
		"/system/drivers/dev/ps2, /system/drivers/dev/ps2"											\
		"/system/drivers/dev/disk/bios, /system/drivers/dev/disk/bios"								\
		"/system/drivers/dev/misc/serial, /system/drivers/dev/misc/serial"							\
		"/system/drivers/dev/graphics/*, /system/drivers/dev/graphics/."							\
																											\
		"/system/drivers/dev/bus/acpi, /boot/drivers/dev/bus/acpi"								\
		"/system/drivers/dev/bus/pci, /boot/drivers/dev/bus/pci"									\
		"/system/drivers/dev/bus/ata, /boot/drivers/dev/bus/ata"									\
		"/system/drivers/dev/bus/usb, /boot/drivers/dev/bus/usb"									\
		"/system/drivers/dev/bus/scsi, /boot/drivers/dev/bus/scsi"								\
																											\
		"/system/drivers/dev/hcd/ata_pci, /boot/drivers/dev/hcd/ata_pci"							\
#		Reported to be buggy; better to fall back on USB 1, on EeePC for example:
		"/system/drivers/dev/hcd/usb_ehci, /boot/drivers/dev/hcd/usb_ehci"						\
		"/system/drivers/dev/hcd/usb_uhci, /boot/drivers/dev/hcd/usb_uhci"						\
		"/system/drivers/dev/hcd/usb_ohci, /boot/drivers/dev/hcd/usb_ohci"						\

		"/system/drivers/dev/disk/usb, /boot/drivers/dev/disk/usb"								\
																											\
		"/system/drivers/dev/input/usb_hid, /system/drivers/dev/input/usb_hid"						\
																											\
		"/system/drivers/fs/iso9660, /system/drivers/fs/iso9660"									\
		"/system/drivers/fs/afs, /system/drivers/fs/afs"											\
		"/system/drivers/fs/fatfs, /system/drivers/fs/fatfs"										\
		"/system/drivers/fs/ext2, /system/drivers/fs/ext2"											\
		"/system/drivers/fs/ntfs, /system/drivers/fs/ntfs"											\
																											\
		"/system/kernel.so, /system/kernel.so"														\
																											\
		"/system/libraries/libkernel.so, /system/libraries/."										\
		"/system/libraries/libsyllable.so*, /system/libraries/."									\
		"/system/libraries/libdl.so*, /system/libraries/."											\
		"/system/libraries/libpthread.so*, /system/libraries/."										\
																									\
		"/system/resources/gcc/4.1.2/lib/*.so*, /system/libraries/."								\
		"/system/resources/glibc/2.7/lib/*.so*, /system/libraries/."								\
		"/system/resources/zlib/1.2.3/lib/*.so*, /system/libraries/."								\
																											\
		"/system/appserver, /system/appserver"														\
																											\
		"/system/config/appserver, /system/config/appserver"										\
																											\
		"/system/extensions/translators/pngtrans.so, /system/extensions/translators/pngtrans.so"	\
																											\
		"/system/fonts/DejaVuSans.ttf, /system/fonts/DejaVuSans.ttf"								\
		"/system/fonts/DejaVuSansMono.ttf, /system/fonts/DejaVuSansMono.ttf"						\
		"/system/fonts/DejaVuSansCondensed.ttf, /system/fonts/DejaVuSansCondensed.ttf"				\
																											\
		"/system/keymaps/American, /system/keymaps/American"										\
																											\
		"/system/bin/dbterm, /system/bin/dbterm"													\
		"/system/bin/devstat, /system/bin/devstat"													\
		"/system/bin/format, /system/bin/format"													\
		"/system/bin/fsprobe, /system/bin/fsprobe"													\
		"/system/bin/init, /system/bin/init"														\
		"/system/bin/mount, /system/bin/mount"														\
		"/system/bin/shutdown, /system/bin/shutdown"												\
		"/system/bin/reboot, /system/bin/reboot"													\
		"/system/bin/unmount, /system/bin/unmount"													\
		"/system/bin/df, /system/bin/df"													\
		"/system/bin/sysinfo, /system/bin/sysinfo"													\
																											\
		"/Applications/AEdit/AEdit, /system/bin/aedit"											\
																											\
		"/system/resources/coreutils/6.4/bin/cat, /bin/cat"											\
		"/system/resources/coreutils/6.4/bin/cp, /bin/cp"											\
		"/system/resources/coreutils/6.4/bin/cut, /bin/cut"											\
		"/system/resources/coreutils/6.4/bin/dd, /bin/dd"											\
		"/system/resources/coreutils/6.4/bin/echo, /bin/echo"										\
		"/system/resources/coreutils/6.4/bin/expr, /bin/expr"										\
		"/system/resources/coreutils/6.4/bin/hostname, /bin/hostname"								\
		"/system/resources/coreutils/6.4/bin/ln, /bin/ln"											\
		"/system/resources/coreutils/6.4/bin/ls, /bin/ls"											\
		"/system/resources/coreutils/6.4/bin/md5sum, /bin/md5sum"									\
		"/system/resources/coreutils/6.4/bin/mkdir, /bin/mkdir"										\
		"/system/resources/coreutils/6.4/bin/mv, /bin/mv"											\
		"/system/resources/coreutils/6.4/bin/printf, /bin/printf"									\
		"/system/resources/coreutils/6.4/bin/pwd, /bin/pwd"											\
		"/system/resources/coreutils/6.4/bin/rm, /bin/rm"											\
		"/system/resources/coreutils/6.4/bin/rmdir, /bin/rmdir"										\
		"/system/resources/coreutils/6.4/bin/sleep, /bin/sleep"										\
		"/system/resources/coreutils/6.4/bin/sort, /bin/sort"										\
		"/system/resources/coreutils/6.4/bin/sync, /bin/sync"										\
		"/system/resources/coreutils/6.4/bin/whoami, /bin/whoami"									\
		"/system/resources/coreutils/6.4/bin/uname, /bin/uname"										\
		"/system/resources/coreutils/6.4/bin/uniq, /bin/uniq"										\
		"/system/resources/coreutils/6.4/bin/stty, /bin/stty"										\
		"/system/resources/coreutils/6.4/bin/chmod, /bin/chmod"										\
																											\
		"/resources/findutils/bin/find, /bin/find"										\
		"/resources/gzip/bin/gzip, /bin/gzip"												\
		"/resources/sed/bin/sed, /bin/sed"												\
		"/resources/tar/bin/tar, /bin/tar"												\
		"/resources/ncurses/bin/clear, /bin/clear"										\
		"/resources/less/bin/less, /bin/less"												\
		"/resources/diffutils/bin/cmp, /bin/cmp"												\
		"/resources/grep/bin/grep, /bin/grep"												\
																											\
		"/system/resources/unzip/5.52/bin/unzip, /bin/unzip"											\
		"/system/resources/bash/3.2/bin/bash, /bin/bash"												\
																											\
		"/usr/share/terminfo/r/rxvt-16color, /usr/share/terminfo/r/rxvt-16color"				\
		"/usr/share/terminfo/x/xterm, /usr/share/terminfo/x/xterm"							\
																											\
		"/resources/grub, /usr/grub"																\
																											\
		"/resources/grub/lib/grub/i386-pc/stage2_eltorito, /boot/grub/stage2_eltorito"											\
		"/resources/grub/lib/grub/i386-pc/stage1, /boot/grub/stage1"																\
		"/resources/grub/lib/grub/i386-pc/afs_stage1_5, /boot/grub/afs_stage1_5"													\
		"/resources/grub/lib/grub/i386-pc/stage2, /boot/grub/stage2"																\
)

declare -a LINKS

# target, link
LINKS=(	"/bin/gzip, /bin/gunzip"	\
		"/bin/bash, /bin/sh"			\
		"/usr/ruby/bin/ruby, /bin/ruby"	\
)

declare -a ENV

ENV=(	"PATH=/usr/grub/bin:/usr/grub/sbin:/bin:/boot/system/bin"		\
		"DLL_PATH=@bindir@/lib:./:/boot/system/libraries:/boot/system"			\
		"TEMP=/tmp"																	\
		"SYSTEM=Syllable"															\
		"COLORTERM=rxvt-16color"													\
		"TERMINFO=/usr/share/terminfo"												\
		"PAGER=less"																\
		"LESSCHARSET=latin1"														\
		"EDITOR=aedit"																\
		"SHELL=bash"																\
		"HOME=/home/root"															\
)

declare -a GRUB

GRUB=(	"color	cyan/blue white/blue"																	\
		"timeout	10"																					\
		""																								\
		"title	Install Syllable"																		\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true"						\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable from a USB CD-ROM drive"												\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true"						\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/bus/usb path=/system/drivers/dev/bus/usb"								\
		"module /boot/drivers/dev/bus/scsi path=/system/drivers/dev/bus/scsi"							\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /boot/drivers/dev/hcd/usb_ohci path=/system/drivers/dev/hcd/usb_ohci"					\
		"module /boot/drivers/dev/hcd/usb_uhci path=/system/drivers/dev/hcd/usb_uhci"					\
		"module /boot/drivers/dev/hcd/usb_ehci path=/system/drivers/dev/hcd/usb_ehci"					\
		"module /boot/drivers/dev/disk/usb path=/system/drivers/dev/disk/usb"							\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable from AFS-formatted USB memory"											\
		"kernel /system/kernel.so root=@boot disable_config=true"										\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/bus/usb path=/system/drivers/dev/bus/usb"								\
		"module /boot/drivers/dev/bus/scsi path=/system/drivers/dev/bus/scsi"							\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /boot/drivers/dev/hcd/usb_ohci path=/system/drivers/dev/hcd/usb_ohci"					\
		"module /boot/drivers/dev/hcd/usb_uhci path=/system/drivers/dev/hcd/usb_uhci"					\
		"module /boot/drivers/dev/hcd/usb_ehci path=/system/drivers/dev/hcd/usb_ehci"					\
		"module /boot/drivers/dev/disk/usb path=/system/drivers/dev/disk/usb"							\
		"module /system/drivers/fs/afs"																	\
		""																								\
		"title	Install Syllable from a USB CD-ROM drive (USB 1 only / EeePC)"							\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true"						\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/bus/usb path=/system/drivers/dev/bus/usb"								\
		"module /boot/drivers/dev/bus/scsi path=/system/drivers/dev/bus/scsi"							\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /boot/drivers/dev/hcd/usb_ohci path=/system/drivers/dev/hcd/usb_ohci"					\
		"module /boot/drivers/dev/hcd/usb_uhci path=/system/drivers/dev/hcd/usb_uhci"					\
		"module /boot/drivers/dev/disk/usb path=/system/drivers/dev/disk/usb"							\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable in VMware"																\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true uspace_end=0xf7ffffff"	\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable in Virtual PC"															\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_smp=true disable_pci_irq_routing=true"	\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable in VirtualBox"															\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_acpi=true disable_smp=true"	\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (no SMP and HyperThreading)"											\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_smp=true"		\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (no ACPI)"																\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_acpi=true"		\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (VESA video)"															\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_gfx_drivers=true"	\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (no disk DMA)"															\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true enable_ata_dma=false"	\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (failsafe)"															\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_acpi=true disable_smp=true enable_ata_dma=false disable_gfx_drivers=true"	\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (no PCI IRQ routing)"													\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_pci_irq_routing=true"	\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (no USB)"																\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_usb=true"		\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (generic PCI ATA)"														\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true ata_pci_force_generic=true"	\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Install Syllable (no PCI)"																\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true disable_pci=true"		\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /system/drivers/fs/iso9660"																\
		""																								\
		"title	Debug Syllable"																			\
		"kernel /system/kernel.so rootfs=iso9660 root=@boot disable_config=true debug_port=1 debug_baudrate=19200 debug_plaintext=true"	\
		"module /boot/drivers/dev/bus/acpi path=/system/drivers/dev/bus/acpi"							\
		"module /boot/drivers/dev/bus/pci path=/system/drivers/dev/bus/pci"								\
		"module /boot/drivers/dev/bus/ata path=/system/drivers/dev/bus/ata"								\
		"module /boot/drivers/dev/hcd/ata_pci path=/system/drivers/dev/hcd/ata_pci"						\
		"module /system/drivers/fs/iso9660"																\
)

WORKING_DIR=files
BASE_DIR=$WORKING_DIR/base
CD_DIR=$WORKING_DIR/cdrom

# Default for the Ruby package if one is not specified
RUBY_PACKAGE=ruby-1.8.6-1.i586.resource

# Default for the Installer scripts if a directory is not specified
INSTALLER_DIR=installer
DOCUMENTATION_DIR=documentation
PPDS=ppds

# The source packages need to be on the Premium CD
BUILDER_SOURCE_DIR=/usr/Builder/sources

# function print_usage
#
# Prints usage information.  This function will cause the script
# to exit with a return code of 1
#
# No arguments

function print_usage()
{
  echo "USAGE : build-cd [BASE FILE] [NET DIRECTORY] [VERSION] ([PREMIUM FILES]) ([RUBY PACKAGE]) ([INSTALLER DIR])"
  exit 1
}

# function exit_with_usage
#
# Called by other functions when an abnormal exit is required.  Prints
# an error and calls print_usage
#
# $1 error code
# $2..$n extra information.  Error code specific

function exit_with_usage()
{
  echo -n "Error: "

  case $1 in

    "1" )
      # File does not exist
      echo "The file \"$2\" does not exist."
      ;;

    "2" )
      # Directory does not exist
      echo "The directory \"$2\" does not exist."
      ;;

  esac

  echo
  print_usage
}

# function initialiase
#
# Perform basic checks, create a working directory if it doesn't
# exist and sanity check the arguments.
#
# $1 - path to base-syllable file
# $2 - path to the Syllable-net directory
# $3 - version number
# $4 - (Optional) path to the premium package directory
# $5 - (Optional) path to the Ruby binary package
# $6 - (Optional) path to the installer script directory
# $7 - (Optional) path to the CUPS PPDs

function initialise()
{
  if [[ -z $1 || -z $2 || -z $3 ]]
  then
    print_usage
  fi

  # Check that the base-syllable file & Syllable-net directory exist
  if [ ! -e $1 ]
  then
    exit_with_usage 1 $1
  fi
  if [ ! -e $2 ]
  then
    exit_with_usage 2 $2
  fi

  # If the user wants to build a premium CD, confirm it
  if [ ! -z $4 ]
  then
    printf "Creating a premium CD with packages in %s\n" $4
  fi

  # If the user specified a Ruby binary package, use it
  if [ ! -z $5 ]
  then
    RUBY_PACKAGE=$5
  fi
  printf "Using Ruby package %s\n" $RUBY_PACKAGE
  if [ ! -e $RUBY_PACKAGE ]
  then
    exit_with_usage 1 $RUBY_PACKAGE
  fi

  # If the user specified a path to the installer scripts, use it
  if [ ! -z $6 ]
  then
    INSTALLER_DIR=$6
  fi
  printf "Using Installer scripts from %s\n" $INSTALLER_DIR
  if [ ! -e $INSTALLER_DIR ]
  then
    exit_with_usage 2 $INSTALLER_DIR
  fi

  # If the user specified a path to the CUPS PPDs, use it
  if [ ! -z $7 ]
  then
    PPDS=$6
  fi
  printf "Using CUPS PPDs from %s\n" $PPDS
  if [ ! -e $PPDS ]
  then
    exit_with_usage 2 $PPDS
  fi

  # We'll need space to work in
  if [ ! -e $WORKING_DIR ]
  then
    mkdir $WORKING_DIR
    mkdir $BASE_DIR
    mkdir $CD_DIR

    # Unzip the base-syllable file into $BASE_DIR
    unzip $1 -d $BASE_DIR
  elif [ -e $CD_DIR ]
  then
    printf "Removing %s\n" "$CD_DIR"
    rm -rf $CD_DIR
    mkdir -p $CD_DIR
  fi
  printf "\n"

  sync
}

# function generate_init_script
#
# Emit the init.sh script suitable for booting from the CD
#
# No arguments

function generate_init_script()
{
  printf "#!/bin/sh\n\n" >> $CD_DIR/system/init.sh

  # Set environment variables
  COUNT=${#ENV[*]}
  INDEX=0

  while [ "$INDEX" -lt "$COUNT" ]
  do
    printf "export %s\n" "${ENV[$INDEX]}" >> $CD_DIR/system/init.sh
    let "INDEX = $INDEX + 1"
  done

  # Start the installer
  printf "\naterm /usr/ruby/bin/ruby /boot/Install/install.rb &\n" >> $CD_DIR/system/init.sh

  # Enable this to get an extra shell when testing
  # printf "aterm &\n" >> $CD_DIR/system/init.sh

  chmod +x $CD_DIR/system/init.sh
}

# function generate_grub_script
#
# Emit the GRUB menu.lst suitable for booting from the CD
#
# No arguments

function generate_grub_script()
{
  COUNT=${#GRUB[*]}
  INDEX=0

  while [ "$INDEX" -lt "$COUNT" ]
  do
    printf "%s\n" "${GRUB[$INDEX]}" >> $CD_DIR/boot/grub/menu.lst
    let "INDEX = $INDEX + 1"
  done
}

# function copy_files
#
# Copy the files listed in FILES from $BASE_DIR to their
# destination in $CD_DIR
#
# No arguments

function copy_files()
{
  # Copy files from base
  COUNT=${#FILES[*]}
  INDEX=0

  while [ "$INDEX" -lt "$COUNT" ]
  do
    SOURCE=$BASE_DIR/`echo ${FILES[$INDEX]} | cut -d ',' -f 1 | tr -d ' '`
    DEST=$CD_DIR/`echo ${FILES[$INDEX]} | cut -d ',' -f 2 | tr -d ' '`

    printf "Copy \"%s\" to \"%s\"\n" "$SOURCE" "$DEST"

    # Ensure the destination directory exists
    DEST_DIR=`dirname "$DEST"`
    if [ ! -e "$DEST_DIR" ]
    then
      mkdir -p "$DEST_DIR"
    fi

    # Do not quote $SOURCE; we want globing to work here
    cp -af $SOURCE $DEST

    let "INDEX = $INDEX + 1"
  done
  sync

  # XXXKV: This has to be hacked in right now because the script can't handle paths with spaces!
  printf "Copying System Tools\n"
  cp -f "$BASE_DIR/Applications/System Tools/Disk Manager" "$CD_DIR/system/bin/DiskManager"
  cp -f "$BASE_DIR/Applications/System Tools/Terminal" "$CD_DIR/system/bin/aterm"

  # Install Ruby (Must be done before links)
  unzip $RUBY_PACKAGE -d $CD_DIR/usr/

  # Create links
  COUNT=${#LINKS[*]}
  INDEX=0

  while [ "$INDEX" -lt "$COUNT" ]
  do
    TARGET=`echo ${LINKS[$INDEX]} | cut -d ',' -f 1 | tr -d ' '`
    LINK_NAME=$CD_DIR/`echo ${LINKS[$INDEX]} | cut -d ',' -f 2 | tr -d ' '`

    printf "Link \"%s\" to \"%s\"\n" "$LINK_NAME" "$TARGET"

    # Ensure the destination directory exists
    DEST_DIR=`dirname "$LINK_NAME"`
    if [ ! -e "$DEST_DIR" ]
    then
      mkdir -p "$DEST_DIR"
    fi

    ln -s $TARGET $LINK_NAME

    let "INDEX = $INDEX + 1"
  done
  sync

  # Init script
  generate_init_script

  # GRUB
  generate_grub_script
}

# function copy_packages
#
# Copy the installation package files to the CD
#
# $1 - path to base-syllable file
# $2 - path to Sylable-net directory
# $3 - path to CUPS PPDs

function copy_packages()
{
  mkdir -p $CD_DIR/Packages/base
  printf "Copying base file: %s\n" "$1"
  cp $1 $CD_DIR/Packages/base/base-syllable.zip

  mkdir -p $CD_DIR/Packages/net
  printf "Copying Syllable-net files: %s\n" "$2"
  cp -a $2/* $CD_DIR/Packages/net/

  # Copy printer PPDs
  mkdir -p $CD_DIR/Packages/CUPS/PPD/
  printf "Copying CUPS PPDs: %s\n" "$3"
  cp -a $3/* $CD_DIR/Packages/CUPS/PPD/
}

# function copy_extra_packages
#
# Copy the additional "Premium" packages to the CD
#
# $1 - path to Packages directory

function copy_extra_packages()
{
  if [ ! -e $1 ]
  then
    printf "Package directory %s does not exist!\n" "$1"
    exit 1
  fi

  mkdir -p $CD_DIR/Packages/optional
  printf "Copying optional files: %s\n" "$1/Binaries"
  cp -a $1/Binaries/* $CD_DIR/Packages/optional/

  printf "Copying upgrade files: %s\n" "$1/Upgrade"
  cp -a $1/Install/* $CD_DIR/Packages/base/

  mkdir -p $CD_DIR/Documentation
  printf "Copying documentation files: %s\n" "$1/Documentation"
  cp -a $1/Documentation/* $CD_DIR/Documentation/

  mkdir -p $CD_DIR/Source
  printf "Copying source files: %s\n" "$BUILDER_SOURCE_DIR"
  cp $BUILDER_SOURCE_DIR/*.* $CD_DIR/Source/
}

# function copy_installer
#
# Copy the installation scripts to the CD
#
# $1 - version number

function copy_installer()
{
  mkdir -p $CD_DIR/Install
  printf "Copying installation scripts: %s\n" "$INSTALLER_DIR"
  cp -a $INSTALLER_DIR/* $CD_DIR/Install/

  chmod +x $CD_DIR/Install/*.rb

  # Process the welcome.txt file
  sed -e "s/VER/$1/g" $CD_DIR/Install/doc/welcome-template.txt > $CD_DIR/Install/doc/welcome.txt
  rm $CD_DIR/Install/doc/welcome-template.txt

  # Put the install.txt files where the user can find them
  cp -f $BASE_DIR/Documentation/Install*.txt $CD_DIR/

  sync
}

# Entry point
# $1 - path to base-syllable file
# $2 - path to the Syllable-net directory
# $3 - version number
# $4 - (Optional) path to the premium package directory
# $5 - (Optional) path to the Ruby binary package
# $6 - (Optional) path to the installer script directory
# $7 - (Optional) path to the CUPS PPDs

_BASE=$1
_NET=$2
_VER=$3
_PACKAGES=$4
_RUBY=$5
_INSTALLER=$6
_PPDS=$7

initialise $_BASE $_NET $_VER $_PACKAGES $_RUBY $_INSTALLER $_PPDS

# Create the basic bootable system
copy_files

# Copy the installation files
copy_packages $_BASE $_NET $PPDS

# If this is a premium CD, copy the extra files
if [ ! -z $_PACKAGES ]
then
  copy_extra_packages $_PACKAGES
fi

# Add the installer files
copy_installer $_VER

# Create the ISO
#construct iso SyllableDesktop-$_VER-$(date +%Y%m%d).i586 "Syllable $_VER" "$CD_DIR"
mkisofs -iso-level 3 --allow-leading-dots -R -V "Syllable $_VER" -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -o SyllableDesktop-$_VER-$(date +%Y%m%d).i586.iso "$CD_DIR"

exit 0
