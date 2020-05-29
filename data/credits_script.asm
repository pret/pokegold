CreditsScript:

; Clear the banner.
	db CREDITS_CLEAR

; Pokemon Gold/Silver Version Staff
	db                STAFF, 0

	db CREDITS_WAIT, 8

; Play the credits music.
	db CREDITS_MUSIC

	db CREDITS_WAIT2, 10

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 0 ; Bellossom

	db             DIRECTOR, 1
	db       SATOSHI_TAJIRI, 2

	db CREDITS_WAIT, 12

	db          SUBDIRECTOR, 1
	db       JUNICHI_MASUDA, 2

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 0
	db     TETSUYA_WATANABE, 1
	db     SHIGEKI_MORIMOTO, 2

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 0
	db       SOUSUKE_TAMADA, 1
	db        TAKENORI_OOTA, 2

	db CREDITS_WAIT, 12

	db    GRAPHICS_DIRECTOR, 1
	db         KEN_SUGIMORI, 2

	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 0
	db         KEN_SUGIMORI, 1
	db    MOTOFUMI_FUJIWARA, 2

	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 0
	db     SHIGEKI_MORIMOTO, 1
	db       ATSUKO_NISHIDA, 2

	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 0
	db     HIRONOBU_YOSHIDA, 1
	db          MUNEO_SAITO, 2

	db CREDITS_WAIT, 12
	db CREDITS_WAIT, 0

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 1 ; Togepi

	db       MONSTER_DESIGN, 0
	db         SATOSHI_OOTA, 1
	db       RENA_YOSHIKAWA, 2

	db CREDITS_WAIT, 12

	db      GRAPHICS_DESIGN, 0
	db          JUN_OKUTANI, 1
	db       ASUKA_IWASHITA, 2
	db     TETSUYA_WATANABE, 3

	db CREDITS_WAIT, 12

	db         CREDIT_MUSIC, 0
	db       JUNICHI_MASUDA, 1
	db          GO_ICHINOSE, 2

	db CREDITS_WAIT, 12

	db CREDIT_SOUND_EFFECTS, 0
	db        MORIKAZU_AOKI, 1
	db       JUNICHI_MASUDA, 2
	db     TETSUYA_WATANABE, 3

	db CREDITS_WAIT, 12

	db          GAME_DESIGN, 0
	db       SATOSHI_TAJIRI, 1
	db        KOHJI_NISHINO, 2
	db     SHIGEKI_MORIMOTO, 3

	db CREDITS_WAIT, 12

	db          GAME_DESIGN, 0
	db       JUNICHI_MASUDA, 1
	db     KENJI_MATSUSHIMA, 2

	db CREDITS_WAIT, 12

	db        GAME_SCENARIO, 0
	db  TOSHINOBU_MATSUMIYA, 1
	db     KENJI_MATSUSHIMA, 2

	db CREDITS_WAIT, 12

	db     TOOL_PROGRAMMING, 1
	db        TAKENORI_OOTA, 2

	db CREDITS_WAIT, 12
	db CREDITS_WAIT, 0

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 2 ; Elekid

	db    PARAMETRIC_DESIGN, 1
	db        KOHJI_NISHINO, 2

	db CREDITS_WAIT, 12

	db        SCRIPT_DESIGN, 1
	db        NOBUHIRO_SEYA, 2

	db CREDITS_WAIT, 12

	db      MAP_DATA_DESIGN, 1
	db      KAZUHITO_SEKINE, 2

	db CREDITS_WAIT, 12

	db           MAP_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db        KOHJI_NISHINO, 2
	db        NOBUHIRO_SEYA, 3

	db CREDITS_WAIT, 12

	db            PRODUCERS, 1
	db      TAKEHIRO_IZUSHI, 2

	db CREDITS_WAIT, 12

	db            PRODUCERS, 1
	db    TAKASHI_KAWAGUCHI, 2

	db CREDITS_WAIT, 12

	db            PRODUCERS, 1
	db   TSUNEKAZU_ISHIHARA, 2

	db CREDITS_WAIT, 12
	db CREDITS_WAIT, 0

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 3 ; Sentret

	db     US_VERSION_STAFF, 1

	db CREDITS_WAIT, 12

	db      US_COORDINATION, 0
	db          GAIL_TILDEN, 1
	db        HIRO_NAKAMURA, 2

	db CREDITS_WAIT, 12

	db      US_COORDINATION, 0
	db       JUNICHI_MASUDA, 1
	db       NAOKO_KAWAKAMI, 2

	db CREDITS_WAIT, 12

	db      US_COORDINATION, 0
	db          JEFF_KALLES, 1
	db        WILLIAM_GIESE, 2

	db CREDITS_WAIT, 12

	db     TEXT_TRANSLATION, 1
	db        NOB_OGASAWARA, 2

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 0
	db      TERUKI_MURAKAWA, 1
	db      KAZUYOSHI_OSAWA, 2

	db CREDITS_WAIT, 12

	db         PAAD_TESTING, 0
	db       RANDY_SHOEMAKE, 1
	db      KATHY_HUGUENARD, 2
	db           JOEL_SIMON, 3

	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 0
	db NCL_SUPER_MARIO_CLUB, 1
	db          KENJI_SAIKI, 2
	db         ATSUSHI_TADA, 3

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db           AKITO_MORI, 1
	db      TAKAHIRO_HARADA, 2
	db         SATORU_IWATA, 3

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db      HIROYUKI_ZINNAI, 1
	db      KUNIMI_KAWAMURA, 2
	db     KIMIKO_NAKAMICHI, 3

	db CREDITS_WAIT, 12

	db   EXECUTIVE_PRODUCER, 1
	db     HIROSHI_YAMAUCHI, 2

	db CREDITS_WAIT, 12

	db            COPYRIGHT, 0

	db CREDITS_WAIT, 20

	db CREDITS_WAIT, 19

; Display "The End" graphic.
	db CREDITS_THEEND

	db CREDITS_WAIT, 20

	db CREDITS_END
