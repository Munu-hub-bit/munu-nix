{ config, lib, pkgs, ... }:

{
  # ────────────────────────────────────────────────────────────────
  #  Lightweight Network Hardening Module
  #  Safe for desktop, gaming, servers, and local LAN
  # ────────────────────────────────────────────────────────────────

  boot.kernel.sysctl = {
    # ── TCP Hardening ─────────────────────────────────────────────
    "net.ipv4.tcp_syncookies" = 1;         # Protect against SYN flood attacks
    "net.ipv4.tcp_timestamps" = 0;         # Disable TCP timestamps (leaks uptime info)
    "net.ipv4.tcp_sack" = 1;               # Keep selective acknowledgements for performance
    "net.ipv4.tcp_rfc1337" = 1;            # Mitigate TIME-WAIT assassination
    "net.ipv4.tcp_fin_timeout" = 15;       # Shorten FIN timeout (default 60s)
    "net.ipv4.tcp_keepalive_time" = 600;   # Send keepalives after 10 minutes idle
    "net.ipv4.tcp_keepalive_probes" = 5;
    "net.ipv4.tcp_keepalive_intvl" = 15;

    # ── ICMP / Network Noise ──────────────────────────────────────
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;  # Ignore broadcast pings
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1; # Ignore malformed ICMPs
    "net.ipv4.icmp_echo_ignore_all" = 0;         # Keep normal ping replies

    # ── IP Spoofing / Source Validation ───────────────────────────
    "net.ipv4.conf.all.rp_filter" = 1;      # Enable reverse path filtering
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.accept_source_route" = 0; # Disable source routing
    "net.ipv4.conf.default.accept_source_route" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;    # Ignore ICMP redirects
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;    # Ignore secure redirects
    "net.ipv4.conf.default.secure_redirects" = 0;

    # ── IPv6 Safety (keep it enabled, just quiet) ─────────────────
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv6.conf.all.accept_ra" = 1;           # Needed for SLAAC/DHCPv6
    "net.ipv6.conf.default.accept_ra" = 1;
    "net.ipv6.conf.all.autoconf" = 1;            # Allow normal IPv6 config

    # ── ARP / Neighbour Table ─────────────────────────────────────
    "net.ipv4.conf.all.arp_ignore" = 2;          # Respond only to ARP requests to local IPs
    "net.ipv4.conf.all.arp_announce" = 2;        # Avoid ARP spoofing leaks

    # ── Netfilter / Misc ──────────────────────────────────────────
    "net.netfilter.nf_conntrack_tcp_loose" = 0;  # Strict conntrack for TCP
    "net.core.netdev_max_backlog" = 16384;       # Boost backlog queue (minor performance gain)
    "net.core.netdev_budget" = 600;              # Increase packet processing per softirq

    # ── Logging & Noise Reduction ─────────────────────────────────
    "net.ipv4.conf.all.log_martians" = 1;        # Log suspicious packets
    "net.ipv4.conf.default.log_martians" = 1;
  };
}
