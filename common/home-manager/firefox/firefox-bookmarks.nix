{ config, pkgs, ... }:

# THIS IS A HOME MANAGER ONLY MODULE, NEEDS TO BE IMPORTED WITH HOME MANAGER, NOT NORMAL NIX.

{
  programs.firefox = {
    enable = true;

    profiles.mainprofile = {
      id = 0;
      isDefault = true;

      bookmarks = {
        force = true;
        settings = [
          {
            toolbar = true; # this actually makes them show up on the toolbar
            bookmarks = [
              { name = "YouTube"; url = "https://www.youtube.com/"; }
              { name = "Reddit"; url = "https://www.reddit.com/"; }
              { name = "asus - Proxmox Virtual Environment"; url = "https://192.168.50.100:8006/"; }
              { name = "ZM - Console"; url = "http://192.168.50.101:8095/"; }
              { name = "Jellyfin"; url = "https://watch.normiecorner.gay/web/#/home.html"; }
              { name = "WikiJS"; url = "https://wiki.ts-pmo.lol/"; }
              { name = "FileList"; url = "https://filelist.io/"; }
              { name = "ChatGPT"; url = "https://chatgpt.com/"; }
              { name = "WhatsApp"; url = "https://web.whatsapp.com/#"; }
            ];
          }

          {
            name = "Others";
            bookmarks = [
              { name = "Gemini"; url = "https://gemini.google.com/app"; }
              { name = "Perplexity"; url = "https://www.perplexity.ai/"; }
              { name = "Free Download Books"; url = "https://oceanofpdf.com/"; }
              { name = "SquidWTF"; url = "https://eu.qobuz.squid.wtf/"; }
              { name = "Anna’s Archive"; url = "https://annas-archive.org/"; }
              { name = "FMHY Audio"; url = "https://fmhy.net/audiopiracyguide#audio-ripping-sites"; }
              { name = "LMSys Chatbot Arena"; url = "https://huggingface.co/spaces/lmsys/chatbot-arena-leaderboard"; }
              { name = "--GUIDE--"; url = "https://rentry.org/voldy"; }
              { name = "Etcher broke my USB stick"; url = "https://forums.balena.io/t/etcher-broke-my-usb-stick-or-did-it/340169/61"; }
              { name = "Fedora + Nvidia + Secure Boot"; url = "https://www.reddit.com/r/Fedora/comments/18bj1kt/fedora_nvidia_secure_boot/?share_id=OeTmclcTfTHF_xuqGUqx2"; }
              { name = "NTFS with Linux + Windows"; url = "https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows#preventing-ntfs-read-errors"; }
              { name = "Redact"; url = "https://redact.dev/"; }
              { name = "DLSS on Heroic"; url = "https://www.reddit.com/r/linux_gaming/comments/rpzfbn/dlss_ray_tracing_not_working_on_heroic_games/"; }
              { name = "Debian Sid safely"; url = "https://linuxconfig.org/how-to-run-debian-sid-relatively-safely"; }
              { name = "Telemetry.md"; url = "https://gist.github.com/ave9858/a2153957afb053f7d0e7ffdd6c3dcb89"; }
              { name = "lucida"; url = "https://lucida.to/"; }
              { name = "Fluent-kde"; url = "https://github.com/vinceliuice/Fluent-kde"; }
              { name = "Papirus Icons"; url = "https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/?tab=readme-ov-file#papirus-installer"; }
              { name = "Pipewire Guide"; url = "https://forum.endeavouros.com/t/pipewire-guide-audio-crackling-popping-and-latency/69602"; }
              { name = "Drawing Tablets on Wayland"; url = "https://artonwayland.redstrate.com/"; }
              { name = "ktabletconfig GitLab"; url = "https://invent.kde.org/redstrate/ktabletconfig"; }
              { name = "DE Comparison"; url = "https://eylenburg.github.io/de_comparison.htm"; }
            ];
          }
        ];
      };
    };
  };
}
