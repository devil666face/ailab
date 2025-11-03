# ailab

ailab is a local open source AI stack. It features automation, local LLM inference, web UI for chat, workflow orchestration, and interactive coding.

## Containers and Services

- [Ollama](https://github.com/ollama/ollama): runs and manages LLMs (API: http://127.0.0.1:11434, UI proxy: http://127.0.0.1:8888)
- [Open WebUI](https://github.com/open-webui/open-webui): web interface for Ollama, available at http://127.0.0.1:3000/
- [n8n](https://github.com/n8n-io/n8n): visual workflow automation (http://127.0.0.1:5678)
- Jupyter Lab: interactive Python/LLM notebooks (spawned with Ollama, http://127.0.0.1:8888)
- Postgres: database for n8n and Open WebUI

### Exposed Ports and Resources

- http://127.0.0.1:3000: Open WebUI (chat interface)
- http://127.0.0.1:11434: Ollama API (LLM backend)
- http://127.0.0.1:8888: Ollama Jupyter Lab & built-in UI
- http://127.0.0.1:5678: n8n automation interface

### Main Project Images/Containers

- ghcr.io/devil666face/ollama (cpu/nvidia/amd/intel, custom Ollama w/GPU backends)
- ghcr.io/open-webui/open-webui (Open WebUI)
- n8nio/n8n (n8n automation)
- postgres:alpine (PostgreSQL)

## Reference Projects

- [Ollama](https://github.com/ollama/ollama)
- [Open WebUI](https://github.com/open-webui/open-webui)
- [n8n](https://github.com/n8n-io/n8n)
- [Postgres](https://hub.docker.com/_/postgres)

---

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
