# ailab

ailab is a local open source AI stack. It features automation, local LLM inference, web UI for chat, workflow orchestration, and interactive coding.

## Containers and Services

- [Ollama](https://github.com/ollama/ollama): runs and manages LLMs
- [Open WebUI](https://github.com/open-webui/open-webui): web interface for Ollama
- [n8n](https://github.com/n8n-io/n8n): visual workflow automation
- Jupyter Lab: interactive Python/LLM notebooks
- Postgres: database for n8n and Open WebUI

### How to connect

```bash
cat /etc/hosts
```

```ini
127.0.1.1   shell.ailab.lan open-webui.ailab.lan ollama.ailab.lan jupiter.ailab.lan n8n.ailab.lan
```

- https://shell.ailab.lan - Ollama shell for download models
- https://open-webui.ailab.lan - Open WebUI (chat interface)
- https://ollama.ailab.lan (http://127.0.0.1:11434) - Ollama API (LLM backend)
- https://jupiter.ailab.lan - Jupyter Lab
- https://n8n.ailab.lan - n8n automation interface

### Main Project Images/Containers

- ghcr.io/devil666face/ollama (cpu/nvidia/amd/intel, custom Ollama with GPU backends)
- ghcr.io/open-webui/open-webui (Open WebUI)
- n8nio/n8n (n8n automation)
- postgres:alpine (PostgreSQL)

## Reference Projects

- [Ollama](https://github.com/ollama/ollama)
- [Open WebUI](https://github.com/open-webui/open-webui)
- [n8n](https://github.com/n8n-io/n8n)
- [Postgres](https://hub.docker.com/_/postgres)

---

## How to run the project

1. Install [Taskfile.dev](https://taskfile.dev/#/installation) (task runner for yaml Taskfile)

```bash
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d
```

2. Choose your hardware profile:
   - Use `task up:nvidia` if you have an NVIDIA GPU and want acceleration.
   - Use `task up:cpu` if you have no GPU or want CPU-only.
   - Use `task up:intel` for Intel iGPU.
   - Use `task up:amd` for AMD GPU.
3. Example:
   ```bash
   task up:nvidia
   # or
   task up:cpu
   ```

All services will be started with Docker Compose using the selected profile.

You can stop all containers and erase data with:

```bash
task prune
```

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
