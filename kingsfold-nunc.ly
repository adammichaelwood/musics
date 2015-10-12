\version "2.18.2"

  #(set! paper-alist (cons '("program" . (cons (* 5.5 in) (* 8.5 in))) paper-alist))
  #(set-default-paper-size "program")
  #(set-global-staff-size 15)

z = {
  \bar "" \break
}

\paper {
  indent = 0\in
  annotate-spacing = ##f
  top-margin = .5\in
  left-margin = .5\in
  bottom-margin = 0\in
  before-title-space = 0\in
  ragged-last = ##f

  %% Between-System Spacing
  system-system-spacing =
    #'((basic-distance . 0)
       (minimum-distance . 0)
       (padding . 4)
       (stretchability . 0))

  line-width = 5\in %% presets can be specified in the web form
                      %% note that this doesn't include the width
                      %% of the system brace.

  myStaffSize = #15   %% Same as #(set-global-staff size)

  %% FONT SPECIFICATIONS FOR LYRICS
  %% - Like in the Gregorio app, a dropdown can be created for the user
  %%   to specify the desired lyric font.
  %% - Users should be allowed to choose only the first font; the second 
  %%   and third fonts are for 'sans' and 'fixed-width' font overrides.
  %% - Alternatively, you can pass the same font into all three fields.

  #(define fonts
    (make-pango-font-tree "Linux Libertine"
                          "Arial"
                          "Courier"
                           (/ myStaffSize 20)))
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem #'neutral-direction = #'()
  }
}

global = {
  \key g \major
  \numericTimeSignature
  \time 4/4
  \partial 4
}

sopranoVoice = \relative c'' {
  \set Staff.autoBeaming = ##f
  \global
  \dynamicUp
  g8[ fis]
  e4 e e d
  g g a g8[ a]
  b4 b a8[ g] e4
  d2. \z
  g8[ fis] 
  e4 e e d
  g g a g8[ a]
  b4 b a8[ g] e4
  e2. \z
  b'8[ c]
  d4 b b8[ a] g4
  a a b g8[ a]
  b4 b8[ a] g4 e
  d2. \z
  g8[fis]
  e4 e e8[d] e[ fis] 
  g4 g a g8[ a] 
  b4 b a8[ g] e4
  e2. \bar "|."
  
}

verseOne = \lyricmode {
  \set stanza = "1."
LORD, let thy Ser -- vant now de -- part
In -- to thy pro -- mised Rest;
Since my ex -- pect -- ing Eyes have been
With thy Sal -- va -- tion bless'd;
Which, till the Time thy fa -- vour'd Saints,
And Pro -- phets, on -- ly knew,
Long since pre -- pared, but now set forth
In all the peo -- ples view.
  
}

verseTwo = \lyricmode {
  \set stanza = "2."

A Light, to show the World en -- tire
The Way to sav -- ing Grace,
Al -- so the Light and Glo -- ry both
Of Is -- rael's cho -- sen Race.
To Fa -- ther, Son and Ho -- ly Ghost,
The God, whom we a -- dore,
Be Glo -- ry, as it was, is now,
And shall be ev -- er more.
  
}

\score {
  \new Staff { \sopranoVoice }
  \addlyrics { \verseOne }
  \addlyrics { \verseTwo }
  \layout { }
}
