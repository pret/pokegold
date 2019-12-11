GiveParkBalls:
	xor a
	ld [wContestMon], a
	ld a, 20
	ld [wParkBalls], a
	farcall StartBugContestTimer
	ret

BugCatchingContestBattleScript::
	writecode VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	reloadmapafterbattle
	copybytetovar wParkBalls
	iffalse BugCatchingContestOutOfBallsScript
	end

BugCatchingContestOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestTimeUpText
	waitbutton
	jump $79CD
	
BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestIsOverText
	waitbutton
	
BugCatchingContestReturnToGateScript:
	closetext
	jumpstd bugcontestresultswarp
	
BugCatchingContestTimeUpText:
	text_far _BugCatchingContestTimeUpText
	db "@"

BugCatchingContestIsOverText:
	text_far _BugCatchingContestIsOverText
	db "@"