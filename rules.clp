(defrule wyswietl-what-sf-series-should-i-watch
(not (question $?text))
(not (answer $?text))
(not (genre ?))
=>
(assert (question What_SF_series_should_I_watch_on_Netflix? genre SciFi:Horror:Fantasy:Slipstream))
(assert (questions)) ; question history
(assert (answers))   ; answer history
)

(defrule like-anthologies
(or ?f <- (genre ?v&SciFi)
    ?f <- (vampires-or-zombies ?v&Neither))
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Like_anthologies? like-anthologies Yep:Nope))
)

(defrule answer-outer-limits
?f  <- (like-anthologies ?v&Yep) (answers $? SciFi)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_Outer_Limits))
)

(defrule space-opera-or-home
?f  <- (like-anthologies ?v&Nope) (answers $? SciFi)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Space_Opera_or_close_to_home? space-opera-or-home Home:Stars))
)

(defrule friendlies-or-invaders
?f  <- (space-opera-or-home ?v&Home)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Friendlies_or_invaders? friends-or-invaders Friends:Invaders))
)

(defrule answer-alien-nation
?f  <- (friends-or-invaders ?v&Friends)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Alien_Nation))
)

(defrule animated-or-live-action
(or ?f <- (friends-or-invaders ?v&Invaders)
    ?f <- (likes-superheroes ?v&Yep)
    ?f <- (myths-or-legends ?v&Legends))
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Animated_or_Live_Action? animated-or-live-action Live:Toons))
)

(defrule answer-invader-zim
?f  <- (animated-or-live-action ?v&Toons) (answers $? Invaders) (questions $? Friendlies_or_invaders?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Invader_Zim))
)

(defrule answer-v
?f  <- (animated-or-live-action ?v&Live) (answers $? Invaders) (questions $? Friendlies_or_invaders?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer V))
)

(defrule comedy
?f  <- (space-opera-or-home ?v&Stars)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Comedy? comedy Yep:Nope))
)

(defrule british-or-american
(or ?f <- (comedy ?v&Yep) ?f <- (time-gateways ?v&Yep) ?f <- (sfw ?v&NSFW))
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question British_or_American? british-or-american UK:USA))
)

(defrule answer-red-dwarf-1
?f  <- (british-or-american ?v&UK) (answers $? Yep) (questions $? Comedy?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Red_Dwarf_1))
)

(defrule answer-futurama
?f  <- (british-or-american ?v&USA) (answers $? Yep) (questions $? Comedy?)
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
(assert (question Trekkie? trekkie Yep:Nope:Yep._But_seen_em_all_1000X))
)

(defrule answer-earth-final-conflict
?f  <- (trekkie ?v&Yep._But_seen_em_all_1000X)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Earth_Final_Conflict))
)

(defrule like-westerns
?f  <- (trekkie ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Like_westerns? like-westerns Yep:Nope))
)

(defrule answer-firefly
?f  <- (like-westerns ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Firefly))
)

(defrule time-gateways
?f  <- (like-westerns ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Time/Space_gateways? time-gateways Yep:Nope))
)

(defrule classic-or-modern
?f  <- (time-gateways ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Classic_or_Modern? classic-or-modern Classic:Modern))
)

(defrule answer-battlestar-galactica
?f  <- (classic-or-modern ?v&Classic)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Battlestar_Galactica))
)

(defrule answer-battlestar-galactica-modern
?f  <- (classic-or-modern ?v&Modern)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Battlestar_Galactica_Modern))
)

(defrule answer-stargate
?f  <- (british-or-american ?v&USA) (answers $? Yep) (questions $? Time/Space_gateways?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Stargate))
)

(defrule answer-doctor-who
?f  <- (british-or-american ?v&UK) (answers $? Yep) (questions $? Time/Space_gateways?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Doctor_Who))
)

(defrule will-wheaton
?f  <- (trekkie ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Will_Wheaton? will-wheaton Woot:NOOOO!))
)

(defrule answer-the-next-generation
?f  <- (will-wheaton ?v&Woot)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_Next_Generation))
)

(defrule what-do-you-study
?f  <- (will-wheaton ?v&NOOOO!)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question What_do_you_study? what-study Poli-sci:Womens_Lib:Sociology:History))
)

(defrule answer-star-trek-deep-space
?f  <- (what-study ?v&Poli-sci)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Star_Trek_Deep_Space_Prime))
)

(defrule answer-star-trek-voyager
?f  <- (what-study ?v&Womens_Lib)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Star_Trek_Voyager))
)

(defrule answer-star-trek-original
?f  <- (what-study ?v&Sociology)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Star_Trek_Original))
)

(defrule answer-star-trek-enterprise
?f  <- (what-study ?v&History)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Star_Trek_Enterprise))
)

(defrule action-or-drama
?f <- (genre ?v&Slipstream)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Action_or_Drama? action-or-drama Action:Drama))
)

(defrule have-seen-x-files
?f <- (action-or-drama ?v&Drama)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Have_you_seen_X-files? have-seen-x-files Yep:Nope:Hated_it))
)

(defrule answer-fringe
?f <- (have-seen-x-files ?v&Yep)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Fringe))
)

(defrule answer-x-files
?f <- (have-seen-x-files ?v&Nope)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_X_Files))
)

(defrule ok-let-down
?f <- (have-seen-x-files ?v&Hated_it)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Are_you_OK_with_being_let_down? ok-let-down Yep:Nope))
)

(defrule answer-lost_1
?f <- (ok-let-down ?v&Yep)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Lost_1))
)

(defrule feel-scott-bakula
?f <- (ok-let-down ?v&Nope)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question How_do_you_feel_about_Scott_Bakula? feel-scott-bakula Who?:I'm_a_fan))
)

(defrule answer-warehouse_13
?f <- (feel-scott-bakula ?v&Who?)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Warehouse_13))
)

(defrule answer-quantum-leap
?f <- (feel-scott-bakula ?v&I'm_a_fan)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Quantum_Leap))
)

(defrule biopunk-or-steampunk
?f <- (action-or-drama ?v&Action)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Biopunk_or_Steampunk? biopunk-or-steampunk Steampunk:Biopunk))
)

(defrule answer-sanctuary
?f <- (biopunk-or-steampunk ?v&Steampunk)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Sanctuary))
)

(defrule whedon-or-cameron
?f <- (biopunk-or-steampunk ?v&Biopunk)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Whedon_or_Cameron? whedon-or-cameron Cameron:Whedon))
)

(defrule answer-dark-angel
?f <- (whedon-or-cameron ?v&Cameron)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Dark_Angel))
)

(defrule answer-dollhouse
?f <- (whedon-or-cameron ?v&Whedon)
?q <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Dollhouse))
)

(defrule urban-or-period
?f  <- (genre ?v&Fantasy)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Urban_or_Period? urban-or-period Urban:Period))
)

(defrule likes-superheroes
?f  <- (urban-or-period ?v&Urban)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Like_Superheroes? likes-superheroes Yep:Nope))
)

(defrule answer-Smallville
?f  <- (animated-or-live-action ?v&Live) (answers $? Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Smallville))
)

(defrule answer-The-Tick
?f  <- (animated-or-live-action ?v&Toons) (answers $? Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_Tick))
)

(defrule mythology-perchange
?f  <- (likes-superheroes ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question How_about_Mythology? mythology-perchance Yep:Nope))
)

(defrule answer-Highlander
?f  <- (mythology-perchance ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Highlander_S01))
)

(defrule answer-Dresden-Files
?f  <- (mythology-perchance ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Dresden_Files))
)

(defrule myths-or-legends
?f  <- (urban-or-period ?v&Period)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Myths_or_Legends? myths-or-legends Myths:Legends))
)

(defrule dudes-or-girls
?f  <- (myths-or-legends ?v&Myths)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Buff_Dudes_or_Hot_Girls? dudes-or-girls Dudes:Ladies))
)

(defrule answer-Hercules
?f  <- (dudes-or-girls ?v&Dudes)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Hercules:_The_Legendary_Journeys_S01))
)

(defrule answer-Xena
?f  <- (dudes-or-girls ?v&Ladies)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Xena))
)

(defrule lots-of-nudity
?f  <- (animated-or-live-action ?v&Live) (answers $? Legends) (questions $? Myths_or_Legends?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Like_lots_of_nudity? lots-of-nudity Yep:Nope))
)

(defrule answer-Spartacus
?f  <- (lots-of-nudity ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Spartacus))
)

(defrule answer-Legend-of-the-Seeker
?f  <- (lots-of-nudity ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Legend_of_the_Seeker))
)

(defrule has-gameboy
?f  <- (animated-or-live-action ?v&Toons) (answers $? Legends) (questions $? Myths_or_Legends?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Do_you_have_a_gameboy? has-gameboy Yep:Nope))
)

(defrule answer-Pokemon
?f  <- (has-gameboy ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Pokemon))
)

(defrule answer-Avatar
?f  <- (has-gameboy ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Avatar:_The_Last_Airbender))
)

(defrule vampires-or-zombies
?f  <- (genre ?v&Horror)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Vampires_or_Zombies? vampires-or-zombies Vampires:Zombies:Neither))
)

(defrule over-16
?f  <- (vampires-or-zombies ?v&Vampires)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question How_old_are_you? over-16 over_16:below_16))
)

(defrule answer-The-Vampire-Dianes
?f  <- (over-16 ?v&below_16)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_Vampire_Dianes))
)

(defrule sfw
?f  <- (over-16 ?v&over_16)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question SFW_or_NSFW? sfw SFW:NSFW))
)

(defrule seen-buffy
?f  <- (sfw ?v&SFW)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Seen_Buffy? seen-buffy Yep:Nope))
)

(defrule answer-Angel
?f  <- (seen-buffy ?v&Yep)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Angel))
)

(defrule answer-Buffy
?f  <- (seen-buffy ?v&Nope)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Buffy_the_Vampire_Slayer))
)

(defrule answer-being-human
?f  <- (british-or-american ?v&UK) (answers $? NSFW) (questions $? SFW_or_NSFW?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer being_human))
)

(defrule answer-True-Blood
?f  <- (british-or-american ?v&USA) (answers $? NSFW) (questions $? SFW_or_NSFW?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer True_Blood))
)

(defrule answer-The-Walking-Dead
?f  <- (vampires-or-zombies ?v&Zombies)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_Walking_Dead))
)

(defrule psy-or-gory
?f  <- (like-anthologies ?v&Yep) (answers $? Neither) (questions $? Vampires_or_Zombies?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (question Pychological_or_Gory? psy-or-gory Psycho:Gory))
)

(defrule answer-The-Twilight-Zone
?f  <- (psy-or-gory ?v&Psycho)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer The_Twilight_Zone))
)

(defrule answer-Tales-from-the-Crypt
?f  <- (psy-or-gory ?v&Gory)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Tales_from_the_Crypt))
)

(defrule answer-Charmed
?f  <- (like-anthologies ?v&Nope) (answers $? Neither) (questions $? Vampires_or_Zombies?)
?q  <- (question ?qn $?)
?qh <- (questions $?qs) ?ah <- (answers $?a)
=>
(retract ?f ?q ?qh ?ah) (assert (questions $?qs ?qn) (answers $?a ?v))
(assert (answer Charmed))
)

