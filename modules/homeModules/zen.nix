{ inputs, ... }:{
  flake.homeModules.zen = { pkgs, ... }: {
    imports = [
      inputs.zen-browser.homeModules.twilight
    ];
    
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
      profiles.default = {
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          vimium-c
        ];
        userChrome = ''
          @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");

          :root {
            /* Main Background and Frame (Nord Theme Dark) */
            --zen-browser-background: #2e3440 !important;
            --lwt-accent-color: #2e3440 !important;
            --lwt-frame: #2e3440 !important;
            
            /* Active Toolbar and Panels */
            --toolbar-bgcolor: #3b4252 !important;
            --lwt-toolbar-vertical-separator: #3b4252 !important;
            --chrome-content-separator-color: #3b4252 !important;

            /* Tab Elements */
            --tab-text-color: #eceff4 !important;
            --tab-loading-fill: #81a1c1 !important;
            --lwt-tab-line-color: #81a1c1 !important;
            --lwt-selected-tab-background-color: #434c5e !important;
            --tab-background-text-color: #d8dee9 !important;

            /* Text & Icons */
            --toolbar-text-color: #d8dee9 !important;
            --lwt-toolbar-text-color: #d8dee9 !important;
            --bookmark-text-color: #d8dee9 !important;
            --button-hover-bgcolor: #434c5e !important;
            --button-active-bgcolor: #4c566a !important;

            /* Address Bar (URL Field) */
            --toolbar-field-background-color: #2e3440 !important;
            --toolbar-field-color: #eceff4 !important;
            --toolbar-field-focus-background-color: #434c5e !important;
            --toolbar-field-focus-color: #eceff4 !important;
            --toolbar-field-focus-border-color: #88c0d0 !important;

            /* Text Selection in Fields */
            --toolbar-field-text-highlight-background-color: #5e81ac !important;
            --toolbar-field-text-highlight-color: #eceff4 !important;

            /* Popups, Menus, and Sidebars */
            --arrowpanel-background: #434c5e !important;
            --arrowpanel-color: #eceff4 !important;
            --arrowpanel-border-color: #4c566a !important;
            --sidebar-background-color: #434c5e !important;
            --sidebar-text-color: #eceff4 !important;
            --sidebar-border-color: #4c566a !important;
          }

          /* Specific UI adjustments for Popups & Menus */
          .panel-arrow {
            fill: #434c5e !important;
          }

          /* Specific UI adjustments for the Sidebar */
          #sidebar-box {
            background-color: #434c5e !important;
            color: #eceff4 !important;
          }
        '';
      };
    };
  };
}
