;;; Custom wezterm events
(local w (require :wezterm))
(local a w.action)


;; Close broot commands
(fn close-broot [{: window : pane}]
  (window:perform_action 
    (a.Multiple 
      [(a.ActivatePaneByIndex 0) 
       (a.CloseCurrentPane {:confirm false})])
    pane))


;; Open broot commands
(fn open-broot [{: window : pane}]
  (window:perform_action 
    (a.Multiple 
      [(a.ActivatePaneByIndex 0) 
       (a.SplitPane {:direction :Left 
                     :size {:Percent 20} 
                     :command {:args [:nu :-c :broot]}})])
    pane))


;; toggle broot like nerd tree
(fn toggle-broot-fn [window pane]
  (let [broot-exist? (= (: (. (: (pane:tab) :panes) 1) :get_title) :broot)]
    (if broot-exist?
        (close-broot {: window : pane}) 

        (open-broot {: window : pane}))))


;; Toggle window maximize
;; TODO: check if full screen
;; broke when there is config error or when rebuilding the config
(fn toggle-maximize-window-fn [window _]
  (let [window-height (. (window:get_dimensions) :pixel_height)
        is-fullscreen? (. (window:get_dimensions) :is_fullscreen)]
    ;; 744: when maximize without fullscreen
    ;; 768: when fullscreen
    (if (< window-height 744)

        (window:maximize)

        (window:restore))))


;; rebuild configuration
;; case when fail to compile
(fn rebuild-config-fn [window pane]
  (let [wez-path w.config_dir
        cmd (.. "cd " wez-path "; just build-all; sleep 2sec")]
    (do
      (window:perform_action 
        (a.Multiple 
          [(a.SpawnCommandInNewTab {:args [:nu :-c cmd]})])
        pane))))


;; Register all events
(fn register []
  (do
    (w.on :rebuild-config rebuild-config-fn)
    (w.on :toggle-broot toggle-broot-fn)
    (w.on :toggle-maximize-window toggle-maximize-window-fn)))


{: register}
