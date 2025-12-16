(defrule wyswietl_what_sf_series_should_i_watch
(not (question $?text))
(not (answer $?text))
(not (genre ?))
=>
(assert (question What_SF_series_should_I_watch_on_Netflix genre SciFi:Horror:Fantasy:Slipstream))
(assert (questions)) ; question history
(assert (answers))   ; answer history
)

(defrule like_anthologies
?f  <- (genre ?v&SciFi)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Like_anthologies anthologies_like Yep:Nope))
)

(defrule answer_outer_limits
?f  <- (anthologies_like ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_Outer_Limits))
)

(defrule space_opera_or_home
?f  <- (anthologies_like ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Space_Opera_or_close_to_home? space_opera_or_home Home:Stars))
)

(defrule friendlies_or_invaders
?f  <- (space_opera_or_home ?v&Home)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Friendlies_or_invaders? friends_or_invaders Friends:Invaders))
)

(defrule answer_alien_nation
?f  <- (friends_or_invaders ?v&Friends)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Alien_Nation))
)

(defrule animated_or_live_action
?f  <- (friends_or_invaders ?v&Invaders)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Animated_or_Live_Action? animated_or_live_action Live:Toons))
)

(defrule answer_invader_zim
?f  <- (animated_or_live_action ?v&Toons)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Invaer_Zim))
)

(defrule answer_v
?f  <- (animated_or_live_action ?v&Live)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer V))
)

(defrule comedy
?f  <- (space_opera_or_home ?v&Stars)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Comedy? comedy Yep:Nope))
)

(defrule british_or_american
?f  <- (comedy ?v&Yep)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question British_or_American? british_or_american UK:USA))
)

(defrule answer_red_dwarf_1
?f  <- (british_or_american ?v&UK)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Red_Dwarf_1))
)

(defrule answer_futurama
?f  <- (british_or_american ?v&USA)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Futurama))
)

(defrule trekkie
?f  <- (comedy ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Trekkie? trekkie Yep:Nope:yep_but_seen))
)

(defrule answer_earth_final_conflict
?f  <- (trekkie ?v&yep_but_seen)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Earth_Final_Conflict))
)

(defrule like_westerns
?f  <- (trekkie ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Like_westerns? like_westerns Yep:Nope))
)

(defrule answer_firefly
?f  <- (like_westerns ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Firefly))
)

(defrule time_gateways
?f  <- (like_westerns ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Time/Space_gateways? time_gateways Yep:Nope))
)

(defrule classic_or_modern
?f  <- (time_gateways ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Classic_or_Modern? classic_or_modern Classic:Modern))
)

(defrule answer_battlestar_galactica
?f  <- (classic_or_modern ?v&Classic)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Battlestar_Galactica))
)

(defrule answer_battlestar_galactica_modern
?f  <- (classic_or_modern ?v&Modern)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Battlestar_Galactica_Modern))
)

(defrule british_or_american_2
?f  <- (time_gateways ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question British_or_American? british_or_american_2 USA:UK))
)

(defrule answer_stargate
?f  <- (british_or_american_2 ?v&USA)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Stargate))
)

(defrule answer_doctor_who
?f  <- (british_or_american_2 ?v&UK)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Doctor_Who))
)

(defrule will_wheaton
?f  <- (trekkie ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Will_Wheaton? will_wheaton Woot:NOO))
)

(defrule answer_the_next_generation
?f  <- (will_wheaton ?v&Woot)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_Next_Generation))
)

(defrule what_do_you_study
?f  <- (will_wheaton ?v&NOO)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question What_do_you_study? what_study Poli-sci:Womens_Lib:Sociology:History))
)

(defrule answer_star_trek_deep_space
?f  <- (what_study ?v&Poli-sci)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Star_Trek_Deep_Space_Prime))
)

(defrule answer_star_trek_voyager
?f  <- (what_study ?v&Womens_Lib)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Star_Trek_Voyager))
)

(defrule answer_star_trek_original
?f  <- (what_study ?v&Sociology)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Star_Trek_Original))
)

(defrule answer_star_trek_enterprise
?f  <- (what_study ?v&History)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Star_Trek_Enterprise))
)

(defrule action_or_drama
?f <- (genre ?v&Slipstream)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Action_or_Drama? action_or_drama Action:Drama))
)

(defrule have_seen_x-files
?f <- (action_or_drama ?v&Drama)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Have_you_seen_X-files? have_seen_x-files Yep:Nope:Hated_it))
)

(defrule answer_fringe
?f <- (have_seen_x-files ?v&Yep)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Fringe))
)

(defrule answer_x_files
?f <- (have_seen_x-files ?v&Nope)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_X_Files))
)

(defrule ok_let_down
?f <- (have_seen_x-files ?v&Hated_it)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Are_you_OK_with_being_let_down? ok_let_down Yep:Nope))
)

(defrule answer_lost_1
?f <- (ok_let_down ?v&Yep)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Lost_1))
)

(defrule feel_scott_bakula
?f <- (ok_let_down ?v&Nope)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question How_do_you_feel_about_Scott_Bakula? feel_scott_bakula Who?:Fan))
)

(defrule answer_warehouse_13
?f <- (feel_scott_bakula ?v&Who?)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Warehouse_13))
)

(defrule answer_quantum_leap
?f <- (feel_scott_bakula ?v&Fan)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Quantum_Leap))
)