;;; Custom wezterm events
(local w (require :wezterm))
(local a w.action)
(local mux w.mux)

(fn send-string-and-enter [window pane cmd]
  (window:perform_action
    (a.Multiple 
      [(a.SendString cmd)
       (a.SendKey {:key :Enter})])
    pane))

(fn split-pane-with-cmd [window pane cmd direction size]
  (window:perform_action
    (a.SplitPane {: direction
                     :command {:args [:fish :-c cmd ]}
                     :size {:Percent size}}) 
    pane))

(fn spawn-tab [window pane]
  (window:perform_action 
    (a.SpawnTab :DefaultDomain)
    pane))
    
(fn back-to-first-pane [window pane]
  (window:perform_action 
    (a.Multiple 
      [(a.ActivateTab 0)
       (a.ActivatePaneByIndex 0)]) 
    pane))

(fn open-workspace-fn [window pane]
  (let [repo-path "~/Dev/github/Yoru/"
        ui-path (.. repo-path "editor-ui/")
        tauri-path (.. repo-path "src-tauri/")
        only-one-tab? (= (length (: (window:mux_window) :tabs)) 1)
        only-one-pane? (= (length (: (pane:tab) :panes)) 1)]
    (if (and only-one-tab? only-one-pane?)
      (do
        (send-string-and-enter window pane (.. "cd " ui-path ";" "e")) 
        (w.sleep_ms 500) 
        (split-pane-with-cmd 
          window 
          pane 
          (.. "cd " ui-path) :Right 30)
        (w.sleep_ms 500)  
        (split-pane-with-cmd 
          window 
          pane 
          (.. :e " " repo-path :TODOS.md) :Up 40)
        (w.sleep_ms 500)  
        (spawn-tab window pane)
        (w.sleep_ms 500)
        (send-string-and-enter 
          window 
          (. (: (. (: (window:mux_window) :tabs) 2) :panes) 1)
          (.. "cd " tauri-path ";" "e")) 
        (w.sleep_ms 500)
        (split-pane-with-cmd 
          window 
          pane 
          (.. "cd " tauri-path) :Right 30)
        (w.sleep_ms 500)
        (spawn-tab window pane)
        (w.sleep_ms 500)
        (send-string-and-enter 
          window 
          (. (: (. (: (window:mux_window) :tabs) 3) :panes) 1)
          (.. "cd " tauri-path ";" "cargo tauri dev"))
        (w.sleep_ms 500)
        (split-pane-with-cmd 
          window 
          pane 
          (.. "cd " ui-path ";" "pnpm re:watch") :Right 50)
        (w.sleep_ms 500)
        (back-to-first-pane window pane))
        
        
      (window:toast_notification 
        :wezterm "Cannot open workspace tab & pane > 1" 
        nil
        100))))

;; Close all pane but current
(fn close-other-pane-fn [window pane]
  ;; get all inactive pane index
  (let [other-pane (icollect [_ p (ipairs (: (pane:tab) :panes_with_info))]
                       (if (not p.is_active) p.index))]
    (each [_ id (ipairs other-pane)]
      ;; perform activation on inactive pane and close it
      (window:perform_action
        (a.Multiple 
          [(a.ActivatePaneByIndex id)
           (a.CloseCurrentPane {:confirm false})])
        pane))))


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
                     :command {:args [:fish :-c :broot]}})])
    pane))


;; toggle broot like nerd tree
(fn toggle-broot-fn [window pane]
  ;; check if broot already exist in current tab
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
        cmd (.. "cd " wez-path "; just; sleep 1sec")]
    (do
      (window:perform_action 
        (a.Multiple 
          [(a.SpawnCommandInNewTab {:args [:fish :-c cmd]})])
        pane))))


;; local tab, pane, window = mux.spawn_window(cmd or {})
;;   window:gui_window():maximize()

(fn startup-fn []
  (let [(_ pane window) (mux.spawn_window {})]
    (do
      (print 1)
      (print 2)
      (pane:split {:direction :Top}))))


;; Register all events
(fn register []
  (do
    (w.on :mux-startup startup-fn)
    (w.on :close-other-pane close-other-pane-fn)
    (w.on :open-workspace open-workspace-fn)
    (w.on :rebuild-config rebuild-config-fn)
    (w.on :toggle-broot toggle-broot-fn)
    (w.on :toggle-maximize-window toggle-maximize-window-fn)))


{: register}
