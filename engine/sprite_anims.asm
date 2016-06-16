DoAnimFrame: ; 8d463
	ld hl, $2 ; 23:5463
	add hl, bc ; 23:5466
	ld e, [hl] ; 23:5467
	ld d, $0 ; 23:5468
	ld hl, .Jumptable ; 23:546a
	add hl, de ; 23:546d
	add hl, de ; 23:546e
	ld a, [hli] ; 23:546f
	ld h, [hl] ; 23:5470
	ld l, a ; 23:5471
	jp [hl] ; 23:5472

.Jumptable: ; 23:5473
	dw Function8d4c7
	dw Function8d4c8
	dw Function8d4df
	dw Function8d510
	dw Function8d528
	dw Function8d54e
	dw Function8d55d
	dw Function8d5a2
	dw Function8d5bf
	dw Function8d623
	dw Function8d66b
	dw Function8d690
	dw Function8d702
	dw Function8d765
	dw Function8d7b1
	dw Function8d7ef
	dw Function8d82d
	dw Function8d897
	dw Function8d8b8
	dw Function8d8bf
	dw Function8d909
	dw Function8d91a
	dw Function8d928
	dw Function8d92f
	dw Function8d971
	dw Function8d9d0
	dw Function8d9d7
	dw Function8d9ec
	dw Function8d921
	dw Function8da1c
	dw Function8da2a
	dw Function8da23
	dw Function8da31
	dw Function8dad8
	dw Function8daf0
	dw Function8daf7
	dw Function8db25
	dw Function8db2c
	dw Function8db5d
	dw Function8db8f
	dw Function8dbb4
	dw Function8d885

Function8d4c7: ; 8d4c7
	ret ; 23:54c7

Function8d4c8: ; 8d4c8
	ld a, [$cee0] ; 23:54c8
	ld hl, $0 ; 23:54cb
	add hl, bc ; 23:54ce
	cp [hl] ; 23:54cf
	jr z, Function8d4df ; 23:54d0
	ld hl, $4 ; 23:54d2
	add hl, bc ; 23:54d5
	ld [hl], $10 ; 23:54d6
	ld hl, $7 ; 23:54d8
	add hl, bc ; 23:54db
	ld [hl], $0 ; 23:54dc
	ret ; 23:54de

Function8d4df: ; 8d4df
	ld hl, $4 ; 23:54df
	add hl, bc ; 23:54e2
	ld [hl], $18 ; 23:54e3
	ld hl, $c ; 23:54e5
	add hl, bc ; 23:54e8
	ld a, [hl] ; 23:54e9
	ld d, a ; 23:54ea
	inc [hl] ; 23:54eb
	and $f ; 23:54ec
	ret nz ; 23:54ee
	ld hl, $d ; 23:54ef
	add hl, bc ; 23:54f2
	ld e, [hl] ; 23:54f3
	ld hl, $7 ; 23:54f4
	add hl, bc ; 23:54f7
	ld a, d ; 23:54f8
	and $10 ; 23:54f9
	jr z, .asm_8d505 ; 23:54fb
	ld a, e ; 23:54fd
	and a ; 23:54fe
	jr z, Function8d50c ; 23:54ff
	cp $1 ; 23:5501
	jr z, Function8d508 ; 23:5503
.asm_8d505
	xor a ; 23:5505
	ld [hl], a ; 23:5506
	ret ; 23:5507

Function8d508: ; 8d508
	ld a, $ff ; 23:5508
	ld [hl], a ; 23:550a
	ret ; 23:550b

Function8d50c: ; 8d50c
	ld a, $fe ; 23:550c
	ld [hl], a ; 23:550e
	ret ; 23:550f

Function8d510: ; 8d510
	ld a, [$cee0] ; 23:5510
	ld hl, $0 ; 23:5513
	add hl, bc ; 23:5516
	cp [hl] ; 23:5517
	jr z, Function8d521 ; 23:5518
	ld hl, $4 ; 23:551a
	add hl, bc ; 23:551d
	ld [hl], $10 ; 23:551e
	ret ; 23:5520

Function8d521: ; 8d521
	ld hl, $4 ; 23:5521
	add hl, bc ; 23:5524
	ld [hl], $18 ; 23:5525
	ret ; 23:5527

Function8d528: ; 8d528
	ld hl, $d ; 23:5528
	add hl, bc ; 23:552b
	ld a, [hl] ; 23:552c
	inc [hl] ; 23:552d
	cp $40 ; 23:552e
	jr nc, Function8d54a ; 23:5530
	ld hl, $7 ; 23:5532
	add hl, bc ; 23:5535
	dec [hl] ; 23:5536
	ld hl, $c ; 23:5537
	add hl, bc ; 23:553a
	ld a, [hl] ; 23:553b
	add a, $2 ; 23:553c
	ld [hl], a ; 23:553e
	ld d, $8 ; 23:553f
	call Function8dbf6 ; 23:5541
	ld hl, $6 ; 23:5544
	add hl, bc ; 23:5547
	ld [hl], a ; 23:5548
	ret ; 23:5549

Function8d54a: ; 8d54a
	call DeinitializeSprite ; 23:554a
	ret ; 23:554d

Function8d54e: ; 8d54e
	ld a, [$c5c7] ; 23:554e
	ld hl, $5 ; 23:5551
	add hl, bc ; 23:5554
	add [hl] ; 23:5555
	cp $b0 ; 23:5556
	ret c ; 23:5558
	call DeinitializeSprite ; 23:5559
	ret ; 23:555c

Function8d55d: ; 8d55d
	call Function8dbdd ; 23:555d
	jp [hl] ; 23:5560
	
; anonymous jumptable
	dw Function8d565
	dw Function8d576

Function8d565: ; 8d565
	call Function8dbf0 ; 23:5565
	ld hl, $0 ; 23:5568
	add hl, bc ; 23:556b
	ld a, [hl] ; 23:556c
	and $3 ; 23:556d
	swap a ; 23:556f
	ld hl, $c ; 23:5571
	add hl, bc ; 23:5574
	ld [hl], a ; 23:5575
Function8d576: ; 8d576
	ld de, $201 ; 23:5576
	ldh a, [$ffe9] ; 23:5579
	and a ; 23:557b
	jr z, .asm_8d581 ; 23:557c
	ld de, $402 ; 23:557e
.asm_8d581
	ld hl, $6 ; 23:5581
	add hl, bc ; 23:5584
	ld a, [hl] ; 23:5585
	cp $f0 ; 23:5586
	jr nc, Function8d59e ; 23:5588
	add d ; 23:558a
	ld [hl], a ; 23:558b
	ld hl, $c ; 23:558c
	add hl, bc ; 23:558f
	ld a, [hl] ; 23:5590
	add e ; 23:5591
	ld [hl], a ; 23:5592
	ld d, $8 ; 23:5593
	call Function8dbf6 ; 23:5595
	ld hl, $7 ; 23:5598
	add hl, bc ; 23:559b
	ld [hl], a ; 23:559c
	ret ; 23:559d

Function8d59e: ; 8d59e
	call DeinitializeSprite ; 23:559e
	ret ; 23:55a1

Function8d5a2: ; 8d5a2
	ld hl, $4 ; 23:55a2
	add hl, bc ; 23:55a5
	ld a, [hl] ; 23:55a6
	cp $b0 ; 23:55a7
	jr nc, Function8d5bb ; 23:55a9
	inc [hl] ; 23:55ab
	ld hl, $c ; 23:55ac
	add hl, bc ; 23:55af
	ld a, [hl] ; 23:55b0
	inc [hl] ; 23:55b1
	and $1 ; 23:55b2
	ret z ; 23:55b4
	ld hl, $5 ; 23:55b5
	add hl, bc ; 23:55b8
	inc [hl] ; 23:55b9
	ret ; 23:55ba

Function8d5bb: ; 8d5bb
	call DeinitializeSprite ; 23:55bb
	ret ; 23:55be

Function8d5bf: ; 8d5bf
	call Function8dbdd ; 23:55bf
	jp [hl] ; 23:55c2

; anonymous jumptable
	dw Function8d5c9
	dw Function8d5e2
	dw Function8d5f3

Function8d5c9: ; 8d5c9
	call Function8d60b ; 23:55c9
	ret z ; 23:55cc
	ld hl, $4 ; 23:55cd
	add hl, bc ; 23:55d0
	ld a, [hl] ; 23:55d1
	cp $58 ; 23:55d2
	jr c, Function8d5d8 ; 23:55d4
	dec [hl] ; 23:55d6
	ret ; 23:55d7

Function8d5d8: ; 8d5d8
	call Function8dbf0 ; 23:55d8
	ld hl, $d ; 23:55db
	add hl, bc ; 23:55de
	ld [hl], $b0 ; 23:55df
	ret ; 23:55e1

Function8d5e2: ; 8d5e2
	call Function8d60b ; 23:55e2
	ld hl, $d ; 23:55e5
	add hl, bc ; 23:55e8
	ld a, [hl] ; 23:55e9
	and a ; 23:55ea
	jr z, Function8d5ef ; 23:55eb
	dec [hl] ; 23:55ed
	ret ; 23:55ee

Function8d5ef: ; 8d5ef
	call Function8dbf0 ; 23:55ef
	ret ; 23:55f2

Function8d5f3: ; 8d5f3
	call Function8d60b ; 23:55f3
	ret z ; 23:55f6
	ld hl, $4 ; 23:55f7
	add hl, bc ; 23:55fa
	ld a, [hl] ; 23:55fb
	cp $d0 ; 23:55fc
	jr z, Function8d602 ; 23:55fe
	dec [hl] ; 23:5600
	ret ; 23:5601

Function8d602: ; 8d602
	call DeinitializeSprite ; 23:5602
	ld a, $1 ; 23:5605
	ld [$cb19], a ; 23:5607
	ret ; 23:560a

Function8d60b: ; 8d60b
	ld hl, $c ; 23:560b
	add hl, bc ; 23:560e
	ld a, [hl] ; 23:560f
	inc [hl] ; 23:5610
	ld d, $4 ; 23:5611
	call Function8dbf6 ; 23:5613
	ld hl, $7 ; 23:5616
	add hl, bc ; 23:5619
	ld [hl], a ; 23:561a
	ld hl, $c ; 23:561b
	add hl, bc ; 23:561e
	ld a, [hl] ; 23:561f
	and $1 ; 23:5620
	ret ; 23:5622

Function8d623: ; 8d623
	call Function8dbdd ; 23:5623
	jp [hl] ; 23:5626

; anonymous jumptable
	dw Function8d62b
	dw Function8d63e

Function8d62b: ; 8d62b
	call Function8dbf0 ; 23:562b
	ld hl, $0 ; 23:562e
	add hl, bc ; 23:5631
	ld a, [hl] ; 23:5632
	and $1 ; 23:5633
	swap a ; 23:5635
	sla a ; 23:5637
	ld hl, $c ; 23:5639
	add hl, bc ; 23:563c
	ld [hl], a ; 23:563d
Function8d63e: ; 8d63e
	ld hl, $6 ; 23:563e
	add hl, bc ; 23:5641
	ld a, [hl] ; 23:5642
	cp $80 ; 23:5643
	jr nc, Function8d667 ; 23:5645
	inc [hl] ; 23:5647
	ld d, $4 ; 23:5648
	ld hl, $c ; 23:564a
	add hl, bc ; 23:564d
	ld a, [hl] ; 23:564e
	add a, $2 ; 23:564f
	ld [hl], a ; 23:5651
	call Function8dbf6 ; 23:5652
	ld hl, $7 ; 23:5655
	add hl, bc ; 23:5658
	ld [hl], a ; 23:5659
	ld hl, $c ; 23:565a
	add hl, bc ; 23:565d
	and $2 ; 23:565e
	ret z ; 23:5660
	ld hl, $5 ; 23:5661
	add hl, bc ; 23:5664
	dec [hl] ; 23:5665
	ret ; 23:5666

Function8d667: ; 8d667
	call DeinitializeSprite ; 23:5667
	ret ; 23:566a

Function8d66b: ; 8d66b
	call Function8dbdd ; 23:566b
	jp [hl] ; 23:566e

; anonymous jumptable
	dw Function8d673
	dw Function8d680

Function8d673: ; 8d673
	ld a, [$cb19] ; 23:5673
	and a ; 23:5676
	ret z ; 23:5677
	call Function8dbf0 ; 23:5678
	ld a, $c ; 23:567b
	call Function8d332 ; 23:567d
Function8d680: ; 8d680
	ld hl, $4 ; 23:5680
	add hl, bc ; 23:5683
	ld a, [hl] ; 23:5684
	cp $d0 ; 23:5685
	jr z, Function8d68c ; 23:5687
	dec [hl] ; 23:5689
	dec [hl] ; 23:568a
	ret ; 23:568b

Function8d68c: ; 8d68c
	call DeinitializeSprite ; 23:568c
	ret ; 23:568f

Function8d690: ; 8d690
	call Function8dbdd ; 23:5690
	jp [hl] ; 23:5693

; anonymous jumptable
	dw Function8d69c
	dw Function8d6b6
	dw Function8d6c9
	dw Function8d6f2
Function8d69c:
	ld hl, $4 ; 23:569c
	add hl, bc ; 23:569f
	ld a, [hl] ; 23:56a0
	cp $80 ; 23:56a1
	jr z, Function8d6a7 ; 23:56a3
	dec [hl] ; 23:56a5
	ret ; 23:56a6

Function8d6a7: ; 8d6a7
	call Function8dbf0 ; 23:56a7
	ld hl, $d ; 23:56aa
	add hl, bc ; 23:56ad
	ld [hl], $30 ; 23:56ae
	ld a, $e ; 23:56b0
	call Function8d332 ; 23:56b2
	ret ; 23:56b5

Function8d6b6: ; 8d6b6
	ld hl, $d ; 23:56b6
	add hl, bc ; 23:56b9
	ld a, [hl] ; 23:56ba
	and a ; 23:56bb
	jr z, Function8d6c0 ; 23:56bc
	dec [hl] ; 23:56be
	ret ; 23:56bf

Function8d6c0: ; 8d6c0
	call Function8dbf0 ; 23:56c0
	ld a, $f ; 23:56c3
	call Function8d332 ; 23:56c5
	ret ; 23:56c8

Function8d6c9: ; 8d6c9
	ld hl, $c ; 23:56c9
	add hl, bc ; 23:56cc
	ld a, [hl] ; 23:56cd
	add a, $4 ; 23:56ce
	ld [hl], a ; 23:56d0
	ld d, $4 ; 23:56d1
	call Function8dbf6 ; 23:56d3
	ld hl, $7 ; 23:56d6
	add hl, bc ; 23:56d9
	ld [hl], a ; 23:56da
	ld hl, $4 ; 23:56db
	add hl, bc ; 23:56de
	ld a, [hl] ; 23:56df
	cp $50 ; 23:56e0
	jr z, Function8d6e9 ; 23:56e2
	dec [hl] ; 23:56e4
	dec [hl] ; 23:56e5
	dec [hl] ; 23:56e6
	dec [hl] ; 23:56e7
	ret ; 23:56e8

Function8d6e9: ; 8d6e9
	ld a, $1 ; 23:56e9
	ld [$cb19], a ; 23:56eb
	call Function8dbf0 ; 23:56ee
	ret ; 23:56f1

Function8d6f2: ; 8d6f2
	ld hl, $4 ; 23:56f2
	add hl, bc ; 23:56f5
	ld a, [hl] ; 23:56f6
	cp $d0 ; 23:56f7
	jr z, Function8d6fe ; 23:56f9
	dec [hl] ; 23:56fb
	dec [hl] ; 23:56fc
	ret ; 23:56fd

Function8d6fe: ; 8d6fe
	call DeinitializeSprite ; 23:56fe
	ret ; 23:5701

Function8d702: ; 8d702
	call Function8dbdd ; 23:5702
	jp [hl] ; 23:5705

; anonymous jumptable
	dw Function8d70c
	dw Function8d726
	dw Function8d73c

Function8d70c: ; 8d70c
	ld hl, $4 ; 23:570c
	add hl, bc ; 23:570f
	ld a, [hl] ; 23:5710
	cp $80 ; 23:5711
	jr z, Function8d717 ; 23:5713
	dec [hl] ; 23:5715
	ret ; 23:5716

Function8d717: ; 8d717
	call Function8dbf0 ; 23:5717
	ld hl, $d ; 23:571a
	add hl, bc ; 23:571d
	ld [hl], $30 ; 23:571e
	ld a, $11 ; 23:5720
	call Function8d332 ; 23:5722
	ret ; 23:5725

Function8d726: ; 8d726
	ld hl, $d ; 23:5726
	add hl, bc ; 23:5729
	ld a, [hl] ; 23:572a
	and a ; 23:572b
	jr z, Function8d738 ; 23:572c
	dec [hl] ; 23:572e
	cp $20 ; 23:572f
	ret nz ; 23:5731
	ld a, $10 ; 23:5732
	call Function8d332 ; 23:5734
	ret ; 23:5737

Function8d738: ; 8d738
	call Function8dbf0 ; 23:5738
	ret ; 23:573b

Function8d73c: ; 8d73c
	ld hl, $c ; 23:573c
	add hl, bc ; 23:573f
	ld a, [hl] ; 23:5740
	add a, $4 ; 23:5741
	ld [hl], a ; 23:5743
	ld d, $4 ; 23:5744
	call Function8dbf6 ; 23:5746
	ld hl, $7 ; 23:5749
	add hl, bc ; 23:574c
	ld [hl], a ; 23:574d
	ld hl, $4 ; 23:574e
	add hl, bc ; 23:5751
	ld a, [hl] ; 23:5752
	cp $d0 ; 23:5753
	jr z, Function8d761 ; 23:5755
	dec [hl] ; 23:5757
	dec [hl] ; 23:5758
	ld a, [$cb19] ; 23:5759
	and a ; 23:575c
	ret nz ; 23:575d
	dec [hl] ; 23:575e
	dec [hl] ; 23:575f
	ret ; 23:5760

Function8d761: ; 8d761
	call DeinitializeSprite ; 23:5761
	ret ; 23:5764

Function8d765: ; 8d765
	call Function8dbdd ; 23:5765
	jp [hl] ; 23:5768

; anonymous jumptable
	dw Function8d76d
	dw Function8d786

Function8d76d: ; 8d76d
	call Function8dbf0 ; 23:576d
	ld hl, $0 ; 23:5770
	add hl, bc ; 23:5773
	ld a, [hl] ; 23:5774
	and $4 ; 23:5775
	sla a ; 23:5777
	ld e, a ; 23:5779
	ld a, [hl] ; 23:577a
	and $3 ; 23:577b
	swap a ; 23:577d
	add e ; 23:577f
	ld hl, $c ; 23:5780
	add hl, bc ; 23:5783
	ld [hl], a ; 23:5784
	ret ; 23:5785

Function8d786: ; 8d786
	ld hl, $4 ; 23:5786
	add hl, bc ; 23:5789
	dec [hl] ; 23:578a
	dec [hl] ; 23:578b
	dec [hl] ; 23:578c
	dec [hl] ; 23:578d
	ld hl, $d ; 23:578e
	add hl, bc ; 23:5791
	ld a, [hl] ; 23:5792
	ld d, a ; 23:5793
	add a, $8 ; 23:5794
	ld [hl], a ; 23:5796
	ld hl, $c ; 23:5797
	add hl, bc ; 23:579a
	ld a, [hl] ; 23:579b
	push af ; 23:579c
	push de ; 23:579d
	call Function8dbf6 ; 23:579e
	ld hl, $7 ; 23:57a1
	add hl, bc ; 23:57a4
	ld [hl], a ; 23:57a5
	pop de ; 23:57a6
	pop af ; 23:57a7
	call Function8dbfa ; 23:57a8
	ld hl, $6 ; 23:57ab
	add hl, bc ; 23:57ae
	ld [hl], a ; 23:57af
	ret ; 23:57b0

Function8d7b1: ; 8d7b1
	call Function8dbdd ; 23:57b1
	jp [hl] ; 23:57b4

; anonymous jumptable
	dw Function8d7b9
	dw Function8d7c9

Function8d7b9: ; 8d7b9
	call Function8dbf0 ; 23:57b9
	ld hl, $c ; 23:57bc
	add hl, bc ; 23:57bf
	ld [hl], $30 ; 23:57c0
	ld hl, $d ; 23:57c2
	add hl, bc ; 23:57c5
	ld [hl], $30 ; 23:57c6
	ret ; 23:57c8

Function8d7c9: ; 8d7c9
	ld hl, $c ; 23:57c9
	add hl, bc ; 23:57cc
	ld a, [hl] ; 23:57cd
	cp $3c ; 23:57ce
	ret nc ; 23:57d0
	inc [hl] ; 23:57d1
	inc [hl] ; 23:57d2
	ld d, $90 ; 23:57d3
	call Function8dbf6 ; 23:57d5
	ld hl, $7 ; 23:57d8
	add hl, bc ; 23:57db
	ld [hl], a ; 23:57dc
	ld hl, $d ; 23:57dd
	add hl, bc ; 23:57e0
	ld a, [hl] ; 23:57e1
	inc [hl] ; 23:57e2
	inc [hl] ; 23:57e3
	ld d, $90 ; 23:57e4
	call Function8dbfa ; 23:57e6
	ld hl, $6 ; 23:57e9
	add hl, bc ; 23:57ec
	ld [hl], a ; 23:57ed
	ret ; 23:57ee

Function8d7ef: ; 8d7ef
	call Function8dbdd ; 23:57ef
	jp [hl] ; 23:57f2

; anonymous jumptable
	dw Function8d7f7
	dw Function8d807

Function8d7f7: ; 8d7f7
	call Function8dbf0 ; 23:57f7
	ld hl, $c ; 23:57fa
	add hl, bc ; 23:57fd
	ld [hl], $30 ; 23:57fe
	ld hl, $d ; 23:5800
	add hl, bc ; 23:5803
	ld [hl], $10 ; 23:5804
	ret ; 23:5806

Function8d807: ; 8d807
	ld hl, $c ; 23:5807
	add hl, bc ; 23:580a
	ld a, [hl] ; 23:580b
	cp $3c ; 23:580c
	ret nc ; 23:580e
	inc [hl] ; 23:580f
	inc [hl] ; 23:5810
	ld d, $90 ; 23:5811
	call Function8dbf6 ; 23:5813
	ld hl, $7 ; 23:5816
	add hl, bc ; 23:5819
	ld [hl], a ; 23:581a
	ld hl, $d ; 23:581b
	add hl, bc ; 23:581e
	ld a, [hl] ; 23:581f
	inc [hl] ; 23:5820
	inc [hl] ; 23:5821
	ld d, $90 ; 23:5822
	call Function8dbfa ; 23:5824
	ld hl, $6 ; 23:5827
	add hl, bc ; 23:582a
	ld [hl], a ; 23:582b
	ret ; 23:582c

Function8d82d: ; 8d82d
	call Function8dbdd ; 23:582d
	jp [hl] ; 23:5830

; anonymous jumptable
	dw Function8d835
	dw Function8d84c

Function8d835: ; 8d835
	call Function8dbf0 ; 23:5835
	ld hl, $0 ; 23:5838
	add hl, bc ; 23:583b
	ld a, [hl] ; 23:583c
	ld hl, $d ; 23:583d
	add hl, bc ; 23:5840
	and $3 ; 23:5841
	ld [hl], a ; 23:5843
	inc [hl] ; 23:5844
	swap a ; 23:5845
	ld hl, $c ; 23:5847
	add hl, bc ; 23:584a
	ld [hl], a ; 23:584b
Function8d84c: ; 8d84c
	ld hl, $4 ; 23:584c
	add hl, bc ; 23:584f
	ld a, [hl] ; 23:5850
	cp $a4 ; 23:5851
	jr nc, Function8d881 ; 23:5853
	ld hl, $d ; 23:5855
	add hl, bc ; 23:5858
	add a, $4 ; 23:5859
	ld hl, $4 ; 23:585b
	add hl, bc ; 23:585e
	ld [hl], a ; 23:585f
	ld hl, $5 ; 23:5860
	add hl, bc ; 23:5863
	inc [hl] ; 23:5864
	ld hl, $d ; 23:5865
	add hl, bc ; 23:5868
	ld a, [hl] ; 23:5869
	sla a ; 23:586a
	sla a ; 23:586c
	ld d, $2 ; 23:586e
	ld hl, $c ; 23:5870
	add hl, bc ; 23:5873
	ld a, [hl] ; 23:5874
	add a, $3 ; 23:5875
	ld [hl], a ; 23:5877
	call Function8dbf6 ; 23:5878
	ld hl, $7 ; 23:587b
	add hl, bc ; 23:587e
	ld [hl], a ; 23:587f
	ret ; 23:5880

Function8d881: ; 8d881
	call DeinitializeSprite ; 23:5881
	ret ; 23:5884

Function8d885: ; 8d885
	ld hl, $c ; 23:5885
	add hl, bc ; 23:5888
	ld a, [hl] ; 23:5889
	inc a ; 23:588a
	ld [hl], a ; 23:588b
	ld d, $2 ; 23:588c
	call Function8dbf6 ; 23:588e
	ld hl, $7 ; 23:5891
	add hl, bc ; 23:5894
	ld [hl], a ; 23:5895
	ret ; 23:5896

Function8d897: ; 8d897
	push bc ; 23:5897
	callba_hc $38, $4000 ; 23:5898 ; 23:589d
	pop bc ; 23:589e
	ld hl, $c704 ; 23:589f
	ld a, [hl] ; 23:58a2
	and $3 ; 23:58a3
	ret z ; 23:58a5
	ld [hl], $0 ; 23:58a6
	ld e, a ; 23:58a8
	ld d, $0 ; 23:58a9
	ld hl, $58b4 ; 23:58ab
	add hl, de ; 23:58ae
	ld a, [hl] ; 23:58af
	call Function8d332 ; 23:58b0
	ret ; 23:58b3

Function8d8b4: ; 8d8b4
	db $17
	db $18
	db $17
	db $19

Function8d8b8: ; 8d8b8
	callba_hc $38, $4000 ; 23:58b8 ; 23:58bd
	ret ; 23:58be

Function8d8bf: ; 8d8bf
	call Function8dbdd ; 23:58bf
	jp [hl] ; 23:58c2

; anonymous jumptable
	dw Function8d8c7
	dw Function8d8d9

Function8d8c7: ; 8d8c7
	call Function8d8e1 ; 23:58c7
	ld a, [$c717] ; 23:58ca
	ld hl, $4 ; 23:58cd
	add hl, bc ; 23:58d0
	add [hl] ; 23:58d1
	ld [hl], a ; 23:58d2
	cp $c0 ; 23:58d3
	ret nc ; 23:58d5
	cp $a8 ; 23:58d6
	ret c ; 23:58d8
Function8d8d9:
	call DeinitializeSprite ; 23:58d9
	ld hl, $c5bc ; 23:58dc
	dec [hl] ; 23:58df
	ret ; 23:58e0

Function8d8e1: ; 8d8e1
	ld hl, $c ; 23:58e1
	add hl, bc ; 23:58e4
	ld a, [hl] ; 23:58e5
	inc [hl] ; 23:58e6
	and $1f ; 23:58e7
	srl a ; 23:58e9
	ld e, a ; 23:58eb
	ld d, $0 ; 23:58ec
	ld hl, Data_8d8f9 ; 23:58ee
	add hl, de ; 23:58f1
	ld a, [hl] ; 23:58f2
	ld hl, $7 ; 23:58f3
	add hl, bc ; 23:58f6
	ld [hl], a ; 23:58f7
	ret ; 23:58f8

Data_8d8f9: ; 8d8f9
	db $04
	db $07
	db $09
	db $0a
	db $09
	db $07
	db $04
	db $00
	db $fc
	db $f9
	db $f7
	db $f6
	db $f7
	db $f9
	db $fc
	db $00

Function8d909: ; 8d909
	ld a, [$c717]
	ld hl, $4
	add hl, bc
	add [hl]
	ld [hl], a
	cp $30
	ret nz
	xor a
	ld [$c717], a
	ret ; 23:5919

Function8d91a: ; 8d91a
	callab_hc $4, $5dfa ; 23:591a ; 23:591f
	ret ; 23:5920

Function8d921: ; 8d921
	callab_hc $4, $648e ; 23:5921 ; 23:5926
	ret ; 23:5927

Function8d928: ; 8d928
	callab_hc $39, $4b20 ; 23:5928 ; 23:592d
	ret ; 23:592e

Function8d92f: ; 8d92f
	ld hl, $c ; 23:592f
	add hl, bc ; 23:5932
	ld a, [hl] ; 23:5933
	and a ; 23:5934
	jr z, Function8d968 ; 23:5935
	dec [hl] ; 23:5937
	dec [hl] ; 23:5938
	ld d, a ; 23:5939
	and $1f ; 23:593a
	jr nz, .asm_8d943 ; 23:593c
	ld hl, $d ; 23:593e
	add hl, bc ; 23:5941
	dec [hl] ; 23:5942
.asm_8d943
	ld hl, $b ; 23:5943
	add hl, bc ; 23:5946
	ld a, [hl] ; 23:5947
	push af ; 23:5948
	push de ; 23:5949
	call Function8dbf6 ; 23:594a
	ld hl, $7 ; 23:594d
	add hl, bc ; 23:5950
	ld [hl], a ; 23:5951
	pop de ; 23:5952
	pop af ; 23:5953
	call Function8dbfa ; 23:5954
	ld hl, $6 ; 23:5957
	add hl, bc ; 23:595a
	ld [hl], a ; 23:595b
	ld hl, $d ; 23:595c
	add hl, bc ; 23:595f
	ld a, [hl] ; 23:5960
	ld hl, $b ; 23:5961
	add hl, bc ; 23:5964
	add [hl] ; 23:5965
	ld [hl], a ; 23:5966
	ret ; 23:5967

Function8d968: ; 8d968
	ld a, $1 ; 23:5968
	ld [$ce64], a ; 23:596a
	call DeinitializeSprite ; 23:596d
	ret ; 23:5970

Function8d971: ; 8d971
	ld hl, $c ; 23:5971
	add hl, bc ; 23:5974
	ld a, [hli] ; 23:5975
	or [hl] ; 23:5976
	jr z, Function8d9cc ; 23:5977
	ld hl, $f ; 23:5979
	add hl, bc ; 23:597c
	ld d, [hl] ; 23:597d
	ld hl, $b ; 23:597e
	add hl, bc ; 23:5981
	ld a, [hl] ; 23:5982
	push af ; 23:5983
	push de ; 23:5984
	call Function8dbf6 ; 23:5985
	ld hl, $7 ; 23:5988
	add hl, bc ; 23:598b
	ld [hl], a ; 23:598c
	pop de ; 23:598d
	pop af ; 23:598e
	call Function8dbfa ; 23:598f
	ld hl, $6 ; 23:5992
	add hl, bc ; 23:5995
	ld [hl], a ; 23:5996
	ld hl, $c ; 23:5997
	add hl, bc ; 23:599a
	ld e, [hl] ; 23:599b
	inc hl ; 23:599c
	ld d, [hl] ; 23:599d
	ld hl, $e ; 23:599e
	add hl, bc ; 23:59a1
	ld a, [hli] ; 23:59a2
	ld h, [hl] ; 23:59a3
	ld l, a ; 23:59a4
	add hl, de ; 23:59a5
	ld e, l ; 23:59a6
	ld d, h ; 23:59a7
	ld hl, $e ; 23:59a8
	add hl, bc ; 23:59ab
	ld [hl], e ; 23:59ac
	inc hl ; 23:59ad
	ld [hl], d ; 23:59ae
	ld hl, $c ; 23:59af
	add hl, bc ; 23:59b2
	ld a, [hli] ; 23:59b3
	ld h, [hl] ; 23:59b4
	ld l, a ; 23:59b5
	ld de, $fff0 ; 23:59b6
	add hl, de ; 23:59b9
	ld e, l ; 23:59ba
	ld d, h ; 23:59bb
	ld hl, $c ; 23:59bc
	add hl, bc ; 23:59bf
	ld [hl], e ; 23:59c0
	inc hl ; 23:59c1
	ld [hl], d ; 23:59c2
	ld hl, $b ; 23:59c3
	add hl, bc ; 23:59c6
	ld a, [hl] ; 23:59c7
	xor $20 ; 23:59c8
	ld [hl], a ; 23:59ca
	ret ; 23:59cb

Function8d9cc: ; 8d9cc
	call DeinitializeSprite ; 23:59cc
	ret ; 23:59cf

Function8d9d0: ; 8d9d0
	callab_hc $24, $7772 ; 23:59d0 ; 23:59d5
	ret ; 23:59d6

Function8d9d7: ; 8d9d7
	callab_hc $24, $7801 ; 23:59d7 ; 23:59dc
	ld hl, $ce64 ; 23:59dd
	ld a, [hl] ; 23:59e0
	cp $2 ; 23:59e1
	ret nz ; 23:59e3
	ld [hl], $3 ; 23:59e4
	ld a, $21 ; 23:59e6
	call Function8d332 ; 23:59e8
	ret ; 23:59eb

Function8d9ec: ; 8d9ec
	ld hl, $b ; 23:59ec
	add hl, bc ; 23:59ef
	ld a, [hl] ; 23:59f0
	dec [hl] ; 23:59f1
	ld e, a ; 23:59f2
	and $1 ; 23:59f3
	jr z, .asm_8da10 ; 23:59f5
	ld hl, $4 ; 23:59f7
	add hl, bc ; 23:59fa
	ld a, [hl] ; 23:59fb
	cp $78 ; 23:59fc
	jr c, asm_8da0f ; 23:59fe
	call DeinitializeSprite ; 23:5a00
	ld a, $4 ; 23:5a03
	ld [$ce64], a ; 23:5a05
	ld de, $1e ; 23:5a08
	call $3e24 ; 23:5a0b
	ret ; 23:5a0e

.asm_8da0f
	inc [hl] ; 23:5a0f
.asm_8da10
	ld a, e ; 23:5a10
	ld d, $20 ; 23:5a11
	call Function8dbf6 ; 23:5a13
	ld hl, $7 ; 23:5a16
	add hl, bc ; 23:5a19
	ld [hl], a ; 23:5a1a
	ret ; 23:5a1b

Function8da1c: ; 8da1c
	callab_hc $38, $4908 ; 23:5a1c ; 23:5a21
	ret ; 23:5a22

Function8da23: ; 8da23
	callab_hc $24, $4d0b ; 23:5a23 ; 23:5a28
	ret ; 23:5a29

Function8da2a: ; 8da2a
	callab_hc $38, $69ae ; 23:5a2a ; 23:5a2f
	ret ; 23:5a30

Function8da31: ; 8da31
	call Function8dbdd ; 23:5a31
	jp [hl] ; 23:5a34
	ld b, c ; 23:5a35
	ld e, d ; 23:5a36
	add e ; 23:5a37
	ld e, d ; 23:5a38
	ld d, e ; 23:5a39
	ld e, d ; 23:5a3a
	ld h, [hl] ; 23:5a3b
	ld e, d ; 23:5a3c
	sub [hl] ; 23:5a3d
	ld e, d ; 23:5a3e
	call nc, $3e5a ; 23:5a3f
	ld h, $cd ; 23:5a42
	ld [hld], a ; 23:5a44
	ld d, e ; 23:5a45
	ld hl, $b ; 23:5a46
	add hl, bc ; 23:5a49
	ld [hl], $2 ; 23:5a4a
	ld hl, $c ; 23:5a4c
	add hl, bc ; 23:5a4f
	ld [hl], $20 ; 23:5a50
	ret ; 23:5a52

Function8da53: ; 8da53
	ld hl, $c ; 23:5a53
	add hl, bc ; 23:5a56
	ld a, [hl] ; 23:5a57
	and a ; 23:5a58
	jr z, Function8da5d ; 23:5a59
	dec [hl] ; 23:5a5b
	ret ; 23:5a5c

Function8da5d: ; 8da5d
	call Function8dbf0 ; 23:5a5d
	ld hl, $c ; 23:5a60
	add hl, bc ; 23:5a63
	ld [hl], $40 ; 23:5a64
	ld hl, $c ; 23:5a66
	add hl, bc ; 23:5a69
	ld a, [hl] ; 23:5a6a
	cp $30 ; 23:5a6b
	jr c, Function8da7b ; 23:5a6d
	dec [hl] ; 23:5a6f
	ld d, $28 ; 23:5a70
	call Function8dbf6 ; 23:5a72
	ld hl, $7 ; 23:5a75
	add hl, bc ; 23:5a78
	ld [hl], a ; 23:5a79
	ret ; 23:5a7a

Function8da7b: ; 8da7b
	ld de, $c ; 23:5a7b
	call $3e24 ; 23:5a7e
	jr Function8dad4 ; 23:5a81
	ld hl, $b ; 23:5a83
	add hl, bc ; 23:5a86
	ld [hl], $4 ; 23:5a87
	ld hl, $c ; 23:5a89
	add hl, bc ; 23:5a8c
	ld [hl], $30 ; 23:5a8d
	ld hl, $d ; 23:5a8f
	add hl, bc ; 23:5a92
	ld [hl], $24 ; 23:5a93
	ret ; 23:5a95

Function8da96: ; 8da96
	ld hl, $d ; 23:5a96
	add hl, bc ; 23:5a99
	ld a, [hl] ; 23:5a9a
	and a ; 23:5a9b
	jr z, Function8daca ; 23:5a9c
	ld d, a ; 23:5a9e
	ld hl, $c ; 23:5a9f
	add hl, bc ; 23:5aa2
	ld a, [hl] ; 23:5aa3
	call Sprites_Sine ; 23:5aa4
	ld hl, $7 ; 23:5aa7
	add hl, bc ; 23:5aaa
	ld [hl], a ; 23:5aab
	ld hl, $c ; 23:5aac
	add hl, bc ; 23:5aaf
	inc [hl] ; 23:5ab0
	ld a, [hl] ; 23:5ab1
	and $3f ; 23:5ab2
	ret nz ; 23:5ab4
	ld hl, $c ; 23:5ab5
	add hl, bc ; 23:5ab8
	ld [hl], $20 ; 23:5ab9
	ld hl, $d ; 23:5abb
	add hl, bc ; 23:5abe
	ld a, [hl] ; 23:5abf
	sub a, $c ; 23:5ac0
	ld [hl], a ; 23:5ac2
	ld de, $20 ; 23:5ac3
	call $3e24 ; 23:5ac6
	ret ; 23:5ac9

Function8daca: ; 8daca
	xor a ; 23:5aca
	ld hl, $7 ; 23:5acb
	add hl, bc ; 23:5ace
	ld [hl], a ; 23:5acf
	call Function8dbf0 ; 23:5ad0
	ret ; 23:5ad3

Function8dad4: ; 8dad4
	call DeinitializeSprite ; 23:5ad4
	ret ; 23:5ad7

Function8dad8: ; 8dad8
	ld hl, $4 ; 23:5ad8
	add hl, bc ; 23:5adb
	ld a, [hl] ; 23:5adc
	inc [hl] ; 23:5add
	cp $b0 ; 23:5ade
	jr nc, Function8daec ; 23:5ae0
	and $3 ; 23:5ae2
	ret nz ; 23:5ae4
	ld de, $3 ; 23:5ae5
	call $3e24 ; 23:5ae8
	ret ; 23:5aeb

Function8daec: ; 8daec
	call DeinitializeSprite ; 23:5aec
	ret ; 23:5aef

Function8daf0: ; 8daf0
	callab_hc $a, $54cf ; 23:5af0 ; 23:5af5
	ret ; 23:5af6

Function8daf7: ; 8daf7
	ld hl, $c ; 23:5af7
	add hl, bc ; 23:5afa
	ld a, [hl] ; 23:5afb
	cp $80 ; 23:5afc
	jr nc, Function8db21 ; 23:5afe
	ld d, a ; 23:5b00
	add a, $8 ; 23:5b01
	ld [hl], a ; 23:5b03
	ld hl, $b ; 23:5b04
	add hl, bc ; 23:5b07
	ld a, [hl] ; 23:5b08
	xor $20 ; 23:5b09
	ld [hl], a ; 23:5b0b
	push af ; 23:5b0c
	push de ; 23:5b0d
	call Function8dbf6 ; 23:5b0e
	ld hl, $7 ; 23:5b11
	add hl, bc ; 23:5b14
	ld [hl], a ; 23:5b15
	pop de ; 23:5b16
	pop af ; 23:5b17
	call Function8dbfa ; 23:5b18
	ld hl, $6 ; 23:5b1b
	add hl, bc ; 23:5b1e
	ld [hl], a ; 23:5b1f
	ret ; 23:5b20

Function8db21: ; 8db21
	call DeinitializeSprite ; 23:5b21
	ret ; 23:5b24

Function8db25: ; 8db25
	callab_hc $24, $55ff ; 23:5b25 ; 23:5b2a
	ret ; 23:5b2b

Function8db2c: ; 8db2c
	ld hl, $d ; 23:5b2c
	add hl, bc ; 23:5b2f
	ld e, [hl] ; 23:5b30
	inc hl ; 23:5b31
	ld d, [hl] ; 23:5b32
	ld hl, $80 ; 23:5b33
	add hl, de ; 23:5b36
	ld e, l ; 23:5b37
	ld d, h ; 23:5b38
	ld hl, $d ; 23:5b39
	add hl, bc ; 23:5b3c
	ld [hl], e ; 23:5b3d
	inc hl ; 23:5b3e
	ld [hl], d ; 23:5b3f
	ld hl, $c ; 23:5b40
	add hl, bc ; 23:5b43
	ld a, [hl] ; 23:5b44
	inc [hl] ; 23:5b45
	inc [hl] ; 23:5b46
	inc [hl] ; 23:5b47
	push af ; 23:5b48
	push de ; 23:5b49
	call Function8dbf6 ; 23:5b4a
	ld hl, $7 ; 23:5b4d
	add hl, bc ; 23:5b50
	ld [hl], a ; 23:5b51
	pop de ; 23:5b52
	pop af ; 23:5b53
	call Function8dbfa ; 23:5b54
	ld hl, $6 ; 23:5b57
	add hl, bc ; 23:5b5a
	ld [hl], a ; 23:5b5b
	ret ; 23:5b5c

Function8db5d: ; 8db5d
	ld hl, $5 ; 23:5b5d
	add hl, bc ; 23:5b60
	ld a, [hl] ; 23:5b61
	and a ; 23:5b62
	ret z ; 23:5b63
	ld hl, $d ; 23:5b64
	add hl, bc ; 23:5b67
	ld a, [hl] ; 23:5b68
	inc [hl] ; 23:5b69
	cp $40 ; 23:5b6a
	ret c ; 23:5b6c
	ld hl, $5 ; 23:5b6d
	add hl, bc ; 23:5b70
	dec [hl] ; 23:5b71
	dec [hl] ; 23:5b72
	ld hl, $f ; 23:5b73
	add hl, bc ; 23:5b76
	ld a, [hl] ; 23:5b77
	ld d, a ; 23:5b78
	cp $40 ; 23:5b79
	jr nc, .asm_8db80 ; 23:5b7b
	add a, $8 ; 23:5b7d
	ld [hl], a ; 23:5b7f
.asm_8db80
	ld hl, $e ; 23:5b80
	add hl, bc ; 23:5b83
	ld a, [hl] ; 23:5b84
	inc [hl] ; 23:5b85
	call Function8dbfa ; 23:5b86
	ld hl, $6 ; 23:5b89
	add hl, bc ; 23:5b8c
	ld [hl], a ; 23:5b8d
	ret ; 23:5b8e

Function8db8f: ; 8db8f
	ld hl, $4 ; 23:5b8f
	add hl, bc ; 23:5b92
	ld a, [hl] ; 23:5b93
	cp $b8 ; 23:5b94
	jr nc, Function8dbb0 ; 23:5b96
	inc [hl] ; 23:5b98
	inc [hl] ; 23:5b99
	ld hl, $5 ; 23:5b9a
	add hl, bc ; 23:5b9d
	dec [hl] ; 23:5b9e
	ld d, $40 ; 23:5b9f
	ld hl, $c ; 23:5ba1
	add hl, bc ; 23:5ba4
	ld a, [hl] ; 23:5ba5
	inc [hl] ; 23:5ba6
	call Function8dbfa ; 23:5ba7
	ld hl, $6 ; 23:5baa
	add hl, bc ; 23:5bad
	ld [hl], a ; 23:5bae
	ret ; 23:5baf

Function8dbb0: ; 8dbb0
	call DeinitializeSprite ; 23:5bb0
	ret ; 23:5bb3

Function8dbb4: ; 8dbb4
	ld hl, $5 ; 23:5bb4
	add hl, bc ; 23:5bb7
	ld a, [hl] ; 23:5bb8
	cp $54 ; 23:5bb9
	ret z ; 23:5bbb
	ld hl, $5 ; 23:5bbc
	add hl, bc ; 23:5bbf
	inc [hl] ; 23:5bc0
	inc [hl] ; 23:5bc1
	ld hl, $f ; 23:5bc2
	add hl, bc ; 23:5bc5
	ld a, [hl] ; 23:5bc6
	ld d, a ; 23:5bc7
	and a ; 23:5bc8
	jr z, .asm_8dbce ; 23:5bc9
	sub a, $2 ; 23:5bcb
	ld [hl], a ; 23:5bcd
.asm_8dbce
	ld hl, $e ; 23:5bce
	add hl, bc ; 23:5bd1
	ld a, [hl] ; 23:5bd2
	inc [hl] ; 23:5bd3
	call Function8dbfa ; 23:5bd4
	ld hl, $6 ; 23:5bd7
	add hl, bc ; 23:5bda
	ld [hl], a ; 23:5bdb
	ret ; 23:5bdc

Function8dbdd: ; 8dbdd
	ld hl, [sp+$0] ; 23:5bdd
	ld e, [hl] ; 23:5bdf
	inc hl ; 23:5be0
	ld d, [hl] ; 23:5be1
	inc de ; 23:5be2
	ld hl, $b ; 23:5be3
	add hl, bc ; 23:5be6
	ld l, [hl] ; 23:5be7
	ld h, $0 ; 23:5be8
	add hl, hl ; 23:5bea
	add hl, de ; 23:5beb
	ld a, [hli] ; 23:5bec
	ld h, [hl] ; 23:5bed
	ld l, a ; 23:5bee
	ret ; 23:5bef

Function8dbf0: ; 8dbf0
	ld hl, $b ; 23:5bf0
	add hl, bc ; 23:5bf3
	inc [hl] ; 23:5bf4
	ret ; 23:5bf5

Function8dbf6: ; 8dbf6
	call Sprites_Sine ; 23:5bf6
	ret ; 23:5bf9

Function8dbfa: ; 8dbfa
	call Sprites_Cosine ; 23:5bfa
	ret ; 23:5bfd
