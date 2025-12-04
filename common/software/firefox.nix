{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
     /* ---- PREFERENCES ---- */
    # Check about:config for options.
    preferences = {
    # BETTERFOX USERJS:
    # FASTFOX
    # SPECULATIVE LOADING 
    "network.http.speculative-parallel-limit" = 0;
    "network.dns.disablePrefetch" = true;
    "network.dns.disablePrefetchFromHTTPS" = true;
    "browser.urlbar.speculativeConnect.enabled" = false;
    "browser.places.speculativeConnect.enabled" = false;
    "network.prefetch-next" = false;
    "network.predictor.enabled" = false;

    # SECUREFOX
    # Tracking Protection
    "browser.contentblocking.category" = "strict";
    "privacy.trackingprotection.allow_list.baseline.enabled" = true;
    "privacy.trackingprotection.allow_list.convenience.enabled" = true;
    "browser.download.start_downloads_in_tmp_dir" = true;
    "browser.helperApps.deleteTempFileOnExit" = true;
    "browser.uitour.enabled" = false;
    "privacy.globalprivacycontrol.enabled" = true;

    # OCSP & Certs / HPKP
    "security.OCSP.enabled" = 0;
    "security.pki.crlite_mode" = 2;
    "security.csp.reporting.enabled" = false;

    # SSL / TLS
    "security.ssl.treat_unsafe_negotiation_as_broken" = true;
    "browser.xul.error_pages.expert_bad_cert" = true;
    "security.tls.enable_0rtt_data" = false;

    # Disk Avoidance
    "browser.privatebrowsing.forceMediaMemoryCache" = true;
    "browser.sessionstore.interval" = 60000;

    # Shutdown & Sanitizing
    "browser.privatebrowsing.resetPBM.enabled" = true;
    "privacy.history.custom" = true;

    # Search / URL Bar
    "browser.urlbar.trimHttps" = true;
    "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
    "browser.search.separatePrivateDefault.ui.enabled" = true;
    "browser.search.suggest.enabled" = false;
    "browser.urlbar.quicksuggest.enabled" = false;
    "browser.urlbar.groupLabels.enabled" = false;
    "browser.formfill.enable" = false;
    "network.IDN_show_punycode" = true;

    # Passwords
    "signon.formlessCapture.enabled" = false;
    "signon.privateBrowsingCapture.enabled" = false;
    "network.auth.subresource-http-auth-allow" = 1;
    "editor.truncate_user_pastes" = false;

    # Mixed Content + Cross-Site
    "security.mixed_content.block_display_content" = true;
    "pdfjs.enableScripting" = false;

    # Extensions
    "extensions.enabledScopes" = 5;

    # Headers / Referers
    "network.http.referer.XOriginTrimmingPolicy" = 2;

    # Containers
    "privacy.userContext.ui.enabled" = true;

    # Safe Browsing
    "browser.safebrowsing.downloads.remote.enabled" = false;

    # Mozilla
    "permissions.default.desktop-notification" = 2;
    "permissions.default.geo" = 2;
    "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
    "browser.search.update" = false;
    "permissions.manager.defaultsUrl" = "";
    "extensions.getAddons.cache.enabled" = false;

    # Telemetry
    "datareporting.policy.dataSubmissionEnabled" = false;
    "datareporting.healthreport.uploadEnabled" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.server" = "data:,";
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.updatePing.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;
    "toolkit.telemetry.coverage.opt-out" = true;
    "toolkit.coverage.opt-out" = true;
    "toolkit.coverage.endpoint.base" = "";
    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    "browser.newtabpage.activity-stream.telemetry" = false;
    "datareporting.usage.uploadEnabled" = false;

    # Experiments
    "app.shield.optoutstudies.enabled" = false;
    "app.normandy.enabled" = false;
    "app.normandy.api_url" = "";

    # Crash Reports
    "breakpad.reportURL" = "";
    "browser.tabs.crashReporting.sendReport" = false;

    # PESKYFOX
    # Mozilla UI
    "browser.privatebrowsing.vpnpromourl" = "";
    "extensions.getAddons.showPane" = false;
    "extensions.htmlaboutaddons.recommendations.enabled" = false;
    "browser.discovery.enabled" = false;
    "browser.shell.checkDefaultBrowser" = false;
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
    "browser.preferences.moreFromMozilla" = false;
    "browser.aboutConfig.showWarning" = false;
    "browser.aboutwelcome.enabled" = false;
    "browser.profiles.enabled" = true;

    # Theme Adjustments
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "browser.compactmode.show" = true;
    "browser.privateWindowSeparation.enabled" = false;

    # AI
    "browser.ml.enable" = false;
    "browser.ml.chat.enabled" = false;

    # Fullscreen Notice
    "full-screen-api.transition-duration.enter" = "0 0";
    "full-screen-api.transition-duration.leave" = "0 0";
    "full-screen-api.warning.timeout" = 0;

    # URL Bar
    "browser.urlbar.trending.featureGate" = false;

    # New Tab Page
    "browser.newtabpage.activity-stream.default.sites" = "";
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;

    # Pocket
    "extensions.pocket.enabled" = false;

    # Downloads
    "browser.download.manager.addToRecentDocs" = false;

    # PDF
    "browser.download.open_pdf_attachments_inline" = true;

    # Tab Behavior
    "browser.bookmarks.openInTabClosesMenu" = false;
    "browser.menu.showViewImageInfo" = true;
    "findbar.highlightAll" = true;
    "layout.word_select.eat_space_to_next_word" = false;

    # Custom settings:
    "sidebar.revamp" = true;
    "sidebar.verticalTabs" = true;
    "full-screen-api.ignore-widgets" = true;
     #Webrtc auto audio processing:
    "media.getusermedia.audio.processing.aec.enabled" = false;
    "media.getusermedia.audio.processing.agc.enabled" = false;
    "media.getusermedia.audio.processing.noise.enabled" = false;
    "media.getusermedia.audio.processing.hpf.enabled" = false;
    "media.webspeech.synth.enabled" = false;
    "browser.tabs.unloadOnLowMemory" = true;
    "browser.tabs.unloadTabInContextMenu" = true;
    "widget.use-xdg-desktop-portal.file-picker" = 1;
    "gfx.webrender.layer-compositor" = true;
    "media.wmf.zero-copy-nv12-textures-force-enabled" = true;
     };

     # ---- POLICIES ----
     # Check about:policies #documentation for options.
     policies = {
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    DisablePocket = true;
    DisableFirefoxAccounts = true;
    DisableSystemAddonUpdate = true;
    DisableFeedbackCommands = true;
    DisableFirefoxScreenshots = true;
    DisableEncryptedClientHello = false; # keep ECH for privacy
    NetworkPrediction = false;
    EnableTrackingProtection = true;
    HttpsOnlyMode = "force_enabled";

    # ---- SEARCH ENGINES ----
    SearchEngines = {
        Add = [
            {
                Name = "SearXNG";
                URLTemplate = "https://search.ts-pmo.lol/search?q={searchTerms}";
                Method = "GET";
                Description = "SearXNG Search";
            }

            {
                Name = "Brave";
                URLTemplate = "https://search.brave.com/search?q={searchTerms}";
                Method = "GET";
                Description = "Brave";
            }
        ];
        Remove = [
            "Bing"
            "Wikipedia"
        ];
        Default = "Brave";
    };


     /* ---- EXTENSIONS ---- */
     # Check about:support for extension/add-on ID strings.
     # Valid strings for installation_mode are "allowed", "blocked",
     # "force_installed" and "normal_installed"

      ExtensionSettings = {
      # Dark Reader
      "addon@darkreader.org" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/addon@darkreader.org/latest.xpi";
        installation_mode = "force_installed";
      };

      # uBlock Origin
      "uBlock0@raymondhill.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
        installation_mode = "force_installed";
      };

      # Bitwarden
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/{446900e4-71c2-419f-a6a7-df9c091e268b}/latest.xpi";
        installation_mode = "force_installed";
      };

      # SponsorBlock
      "sponsorBlocker@ajay.app" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorBlocker@ajay.app/latest.xpi";
        installation_mode = "force_installed";
      };

      # Return Youtube Dislike
      "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/{762f9885-5a13-4abd-9c77-433dcd38b8fd}/latest.xpi";
        installation_mode = "force_installed";
      };
    };
  };
};
}
