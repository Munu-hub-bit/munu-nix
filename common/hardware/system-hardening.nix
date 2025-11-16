{ config, lib, pkgs, ... }:

{
  # ────────────────────────────────────────────────────────────────
  #  Balanced Security & Stability Module
  #  Safe for any GPUs and AMD CPUs
  # ────────────────────────────────────────────────────────────────

  boot = {
    kernelParams = [
      # ── CPU & Performance ───────────────────────────────────────
      "amd_pstate=active"          # Enable AMD P-State driver for better power scaling
      "amd_iommu=force"            # Force IOMMU for device isolation / DMA protection
      "nvme_core.default_ps_max_latency_us=0" # Keep NVMe drives in performance mode
      "rootflags=noatime"          # Disable access-time writes (faster reads, less SSD wear)

      # ── Memory & Kernel Hardening ───────────────────────────────
      "randomize_kstack_offset=on" # Randomize kernel stack per syscall (basic exploit hardening)
      "slab_nomerge"               # Prevent merging of similar kernel slabs (thwarts heap attacks)
      "page_poison=1"              # Fill freed pages with poison pattern (detects UAF bugs)
      "page_alloc.shuffle=1"       # Randomize page allocator order (extra entropy)
      "init_on_alloc=1"            # Zero-initialize newly allocated memory
      "init_on_free=1"             # Zero-initialize freed memory to prevent data leaks

      # ── Security Modules & Isolation ────────────────────────────
      "vsyscall=none"              # Disable legacy vsyscall interface (closes minor attack surface)
      "lsm=landlock,lockdown,yama,integrity,apparmor,bpf"
                                   # Enable multiple Linux Security Modules together
    ];

    kernel.sysctl = {
      # ── Memory & ASLR ───────────────────────────────────────────
      "kernel.randomize_va_space" = 2; # Full Address Space Layout Randomization
      "vm.mmap_rnd_bits" = 32;         # High entropy for mmap base address
      "vm.mmap_rnd_compat_bits" = 16;  # Same for 32-bit programs

      # ── Core Dump & Debug Restrictions ─────────────────────────
      "kernel.kptr_restrict" = 2;      # Hide kernel pointers from userspace
      "kernel.dmesg_restrict" = 1;     # Restrict dmesg to root only
      "fs.suid_dumpable" = 0;          # Disable core dumps from setuid binaries
      "fs.protected_regular" = 2;      # Prevent writing to files not owned by the writer
      "fs.protected_fifos" = 2;        # Prevent writing to FIFOs not owned by the writer

      # ── BPF & Misc Protections ─────────────────────────────────
      "net.core.bpf_jit_harden" = 2;   # Always harden the BPF JIT compiler
      "dev.tty.ldisc_autoload" = 0;    # Block automatic line-discipline module loading
      "vm.unprivileged_userfaultfd" = 0; # Disallow unprivileged userfaultfd (blocks certain DoS)
    };
  };

  # ── Security Frameworks ─────────────────────────────────────────
  security = {
    protectKernelImage = true;       # Prevent userspace from reading kernel image
    apparmor.enable = true;          # Enable AppArmor LSM
    # killUnconfinedConfinables left disabled for compatibility
  };

  # ── Hardware Protections ─────────────────────────────────────────
  hardware = {
    cpu.amd.updateMicrocode = true;      # Keep AMD CPU microcode updated
    enableRedistributableFirmware = true; # Required for GPU / Wi-Fi firmware
  };

  # ── Services ─────────────────────────────────────────────────────
  services.fstrim.enable = true;        # Weekly SSD trim
}
