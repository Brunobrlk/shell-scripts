#!/usr/bin/env bash

# ----------------------------------------------------------------------------------------------------
# AUTHOR   : KARTHICK S
# PURPOSE  : THIS SCRIPT WILL EXPORT/IMPORT THE CONFIG AND VM DISK. 
#
# usage: 
# export function will take care of exporting the necessary for all VM. Run as "<scriptname.sh> export"
# import function will take care of importing the necessary for all VM. Run as "<scriptname.sh> import"
#
# NOTE: Do not add trailing / for the directory when giving export and import path.
#------------------------------------------------------------------------------------------------------

# Trigger the script with root user or exit.
if [[ ${UID} -ne 0 ]]; then
  echo -e "[EXIT] - Run the script as root user or with sudo privilege..."
  exit
fi

function export_vm(){
  
  # Get the export location.
  read -p "Provide the directory path where disk and config files to be exported: " EXPORT_LOCATION

  # Create the destination directory if not exists.
  [[ -d ${EXPORT_LOCATION} ]] || mkdir -p ${EXPORT_LOCATION}

  # Exporting the config using virsh dumpxml command.
  VM_NAMES=($(virsh list --all| awk '(NR>2)' | awk '{ print $2 }'))
  for VM in ${VM_NAMES[@]}; do
    virsh dumpxml ${VM} > ${EXPORT_LOCATION}/${VM}.xml
  done

  # Using rsync copy the entire directory from default location.
  echo -e "\n[ Copying disk images ]\n" && sudo rsync -avxp --progress /home/brunobrlk/.local/share/VirtualMachineStorages/ ${EXPORT_LOCATION}

  echo -e "\n[ Exported Files ] \n" && ls -lR ${EXPORT_LOCATION}

} 

function import_vm(){

  # Get the source location.
  read -p "Provide the directory path where disk and config files are stored: " SOURCE_LOCATION

  # Throws error if directory is not available and exit.
  [[ -d ${SOURCE_LOCATION} ]] || { echo "Directory not available"; exit 1 ; }

  # Copy all the files to default disk location.
  echo -e "[ Copying disk images ]\n" && sudo rsync -avxp --progress /home/brunobrlk/.local/share/VirtualMachineStorages/ /var/lib/libvirt/

  if [[ $? -eq 0 ]]; then
    # Define VM
    echo -e "\n[ Defining VM ]\n"
    for XML_FILE in ${SOURCE_LOCATION}/*.xml; do
      virsh define --file ${XML_FILE} 
    done
    echo -e "\n[ Imported VM List ]\n" && virsh list --all
  fi

}

case $1 in
 export ) export_vm ;;
 import ) import_vm ;;
 *) echo -e "USAGE : 
kvm_export_import.sh export - Export config and disk
kvm_export_import.sh import - Define VM and copy the disk"; exit 
esac
