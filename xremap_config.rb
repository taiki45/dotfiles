window class_only: 'chromium-browser' do
  %w[f l w t n y c v r equal minus 0 a x z].each do |key|
    remap "Super-#{key}", to: "C-#{key}"
  end

  remap "Super-Shift-bracketright", to: "Ctrl-Tab"
  remap "Super-Shift-bracketleft", to: "Ctrl-Shift-Tab"

  remap 'C-b', to: 'Left'
  remap 'C-f', to: 'Right'
  remap 'C-p', to: 'Up'
  remap 'C-n', to: 'Down'

  remap 'M-b', to: 'Ctrl-Left'
  remap 'M-f', to: 'Ctrl-Right'

  remap 'C-a', to: 'Home'
  remap 'C-e', to: 'End'

  remap 'C-d', to: 'Delete'
  remap 'M-d', to: 'Ctrl-Delete'
  remap 'C-h', to: 'BackSpace'
end

window class_only: 'google-chrome' do
  %w[f l w t n y c v r equal minus 0 a x z].each do |key|
    remap "Super-#{key}", to: "C-#{key}"
  end

  remap "Super-Shift-bracketright", to: "Ctrl-Tab"
  remap "Super-Shift-bracketleft", to: "Ctrl-Shift-Tab"

  remap 'C-b', to: 'Left'
  remap 'C-f', to: 'Right'
  remap 'C-p', to: 'Up'
  remap 'C-n', to: 'Down'

  remap 'M-b', to: 'Ctrl-Left'
  remap 'M-f', to: 'Ctrl-Right'

  remap 'C-a', to: 'Home'
  remap 'C-e', to: 'End'

  remap 'C-d', to: 'Delete'
  remap 'M-d', to: 'Ctrl-Delete'
  remap 'C-h', to: 'BackSpace'
end
