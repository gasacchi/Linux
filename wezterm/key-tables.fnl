(local w (require :wezterm))
(local a (. w :action))

;; Keytables mode
(local copy-mode
       [{:key :h :mods :NONE :action ((. a :CopyMode) :MoveLeft)}
        {:key :l :mods :NONE :action ((. a :CopyMode) :MoveRight)}
        {:key :j :mods :NONE :action ((. a :CopyMode) :MoveDown)}
        {:key :k :mods :NONE :action ((. a :CopyMode) :MoveUp)}
        {:key :g :mods :NONE :action ((. a :CopyMode) :MoveToScrollbackTop)}
        {:key :e :mods :NONE :action ((. a :CopyMode) :MoveToScrollbackBottom)}
        {:key :u :mods :NONE :action ((. a :CopyMode) :PageUp)}
        {:key :d :mods :NONE :action ((. a :CopyMode) :PageDown)}
        {:key :w :mods :NONE :action ((. a :CopyMode) :MoveForwardWord)}
        {:key :b :mods :NONE :action ((. a :CopyMode) :MoveBackwardWord)}
        {:key :h :mods :CTRL :action ((. a :CopyMode) :MoveToStartOfLine)}
        {:key :s
         :mods :CTRL
         :action ((. a :CopyMode) :MoveToStartOfLineContent)}
        {:key :l :mods :CTRL :action ((. a :CopyMode) :MoveToEndOfLineContent)}
        {:key :o :mods :SHIFT :action ((. a :CopyMode) :MoveToStartOfNextLine)}
        {:key :Tab
         :mods :NONE
         :action ((. a :CopyMode) :MoveToSelectionOtherEnd)}
        {:key :c :mods :CTRL :action ((. a :CopyMode) :Close)}
        {:key :Escape :mods :NONE :action ((. a :CopyMode) :Close)}
        {:key :v
         :mods :NONE
         :action ((. a :CopyMode) {:SetSelectionMode :Cell})}
        {:key :v
         :mods :CTRL
         :action ((. a :CopyMode) {:SetSelectionMode :Block})}
        {:key :x
         :mods :NONE
         :action ((. a :CopyMode) {:SetSelectionMode :Line})}
        {:key :y
         :mods :NONE
         :action ((. a :Multiple) [{:CopyTo :Clipboard} {:CopyMode :Close}])}])

;; Search Mode
(local search-mode
       [{:key :c :mods :CTRL :action ((. a :CopyMode) :Close)}
        {:key :n :mods :CTRL :action ((. a :CopyMode) :NextMatch)}
        {:key :p :mods :CTRL :action ((. a :CopyMode) :PriorMatch)}
        {:key :s :mods :CTRL :action ((. a :CopyMode) :CycleMatchType)}
        {:key :r :mods :CTRL :action ((. a :CopyMode) :ClearPattern)}
        {:key :u :mods :CTRL :action ((. a :CopyMode) :PriorMatchPage)}
        {:key :d :mods :CTRL :action ((. a :CopyMode) :NextMatchPage)}])

;; Resize pane mode
(local resize-pane-mode
       [{:key :h :mods :NONE :action ((. a :AdjustPaneSize) [:Left 2])}
        {:key :l :mods :NONE :action ((. a :AdjustPaneSize) [:Right 2])}
        {:key :j :mods :NONE :action ((. a :AdjustPaneSize) [:Down 2])}
        {:key :k :mods :NONE :action ((. a :AdjustPaneSize) [:Up 2])}
        {:key :c :mods :CTRL :action :PopKeyTable}
        {:key :Enter :mods :NONE :action :PopKeyTable}])

;; Scroll mode
(local scroll-mode
       [{:key :j :mods :NONE :action ((. a :ScrollByPage) 1)}
        {:key :k :mods :NONE :action ((. a :ScrollByPage) -1)}
        {:key :c :mods :CTRL :action :PopKeyTable}
        {:key :Enter :mods :NONE :action :PopKeyTable}])

;; Font size mode
(local font-size-mode
       [{:key :j :mods :NONE :action (. a :DecreaseFontSize)}
        {:key :k :mods :NONE :action (. a :IncreaseFontSize)}
        {:key :r :mods :NONE :action (. a :ResetFontSize)}
        {:key :c :mods :CTRL :action :PopKeyTable}
        {:key :Enter :mods :NONE :action :PopKeyTable}])

{:copy_mode copy-mode
 :search_mode search-mode
 :scroll_mode scroll-mode
 :font_size_mode font-size-mode
 :resize_pane_mode resize-pane-mode}
