function podman-clear
    command sudo rm -rf /tmp/storage-run-1000/containers
    command sudo rm -rf /tmp/storage-run-1000/libpod/tmp
end

function nvidia
    set mode (echo $argv | awk '{print $1}')

    switch $mode
        case bind
            sudo modprobe nvidia
            sudo modprobe -r vfio-pci
            sudo modprobe nvidia
            echo "Executing bind command..."
            sudo driverctl --nosave set-override 0000:01:00.0 nvidia
            sudo driverctl --nosave set-override 0000:01:00.1 snd_hda_intel
        case unbind
            sudo modprobe vfio-pci
            echo "Executing unbind command..."
            sudo driverctl --nosave set-override 0000:01:00.0 vfio-pci
            sudo driverctl --nosave set-override 0000:01:00.1 vfio-pci
        case '*'
            echo "Invalid mode. Use 'bind' or 'unbind'."
    end
end
 

