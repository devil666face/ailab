### Fix nvidia error for Ubuntu 22.04

```bash
Error response from daemon: failed to create task for container: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: error during container init: error running prestart hook #0: exit status 1, stdout: , stderr: Auto-detected mode as 'legacy'ble Watch
nvidia-container-cli: container error: failed to get device cgroup mount path: no cgroup filesystem mounted for the devices subsytem in mountinfo file: unknown
```

```bash
/boot/efi/loader/entries/Pop_OS-current.conf
```

`systemd.unified_cgroup_hierarchy=0`

```ini
title Pop!_OS
linux /EFI/Pop_OS-c6cdb631-715a-4ae0-86a1-df26e2e6f25f/vmlinuz.efi
initrd /EFI/Pop_OS-c6cdb631-715a-4ae0-86a1-df26e2e6f25f/initrd.img
options root=UUID=c6cdb631-715a-4ae0-86a1-df26e2e6f25f ro quiet loglevel=0 systemd.show_status=false splash nvidia-drm.modeset=1 systemd.unified_cgroup_hierarchy=0
```
