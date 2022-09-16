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

(fn broot-toggle-fn [win curr-pane]
  (print "here"))

;; TODO: check if full screen
(fn toggle-maximize-fn [window _]
  (let [window-size (. (window:get_dimensions) :pixel_width)]
    (if (= window-size 1366)
        (window:restore)
        (window:maximize))))

(fn register []
  (do
    (w.on :broot-toggle broot-toggle-fn)
    (w.on :toggle-maximize toggle-maximize-fn)))

{: register}
