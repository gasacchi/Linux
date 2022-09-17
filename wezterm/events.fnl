;;; Custom wezterm events
(local w (require :wezterm))
(local a w.action)

;; (var broot-count 0)

;; (fn broot-toggle-fn [win curr-pane]
;;   (each [itab tab (ipairs (: (win:mux_window) :tabs))]
;;     (each [ipane pane (ipairs (tab:panes))]
;;       (if (= (pane:get_title) :broot)
;;           (do
;;             (when (= broot-count 1)
;;             (win:perform_action ((. a :Multiple) [((. a :ActivatePaneByIndex) (- ipane
;;                                                                                1))
;;                                                   ((. a :CloseCurrentPane) {:confirm false})])
;;                                 pane))
;;           (= broot-count 0)
;;           (do
;;             (set broot-count (+ broot-count 1))
;;             (win:perform_action ((. a :Multiple) [((. a :ActivatePaneByIndex) 0)
;;                                                   ((. a :SplitPane) {:direction :Left
;;                                                                      :command {:args [:nu
;;                                                                                       :-c
;;                                                                                       :broot]}
;;                                                                      :size {:Percent 20}})])
;;                                 pane)))))))

;; Toggle broot like file tree
(fn broot-toggle-fn [win curr-pane]
  (print "here"))

;; Toggle window maximize
;; TODO: check if full screen
(fn toggle-maximize-window-fn [window _]
  (let [window-height (. (window:get_dimensions) :pixel_height)
        is-fullscreen? (. (window:get_dimensions) :is_fullscreen)]
    ;; 744: when maximize without fullscreen
    ;; 768: when fullscreen
    (if (< window-height 744)

        (window:maximize)

        (window:restore))))

;; (fn toggle-maximize-window-fn [window _]
;;   (let [window-size (. (window:get_dimensions) :pixel_width)
;;         is-fullscreen? (. (window:get_dimensions) :is_fullscreen)]
;;         (do
;;           (print window-size) 
;;           (print is-fullscreen?)
;;           (print (. (window:get_dimensions) :pixel_height)))))

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
    (w.on :broot-toggle broot-toggle-fn)
    (w.on :toggle-maximize-window toggle-maximize-window-fn)))

{: register}
