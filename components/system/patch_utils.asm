IMPORT SaveClock_ADVICE_LoadDenjuuNickname.indexNicknameArray

SECTION "Patch Utilities", ROM0[$0063]
PatchUtils_ResetVector: jp PatchUtils_ResetGame
	db "Denjuu" ;not sure what this is
	ld [$FF00], a
PatchUtils_LimitBreak:: sla e
	rl d
	sla e
	rl d
	ret
   
PatchUtils_MainScript_ADVICE_LoadItemNameAsArg3::
	ld a, BANK(MainScript_ADVICE_LoadItemNameAsArg3)
	rst $10
	call MainScript_ADVICE_LoadItemNameAsArg3
	rst $18
	ret
	
PatchUtils_AuxCodeJmp::
	push af
	
	ld a, [W_CurrentBank]
	push af
	
	ld a, BANK(Banked_PatchUtils_AdviceTable)
	rst $10
	
	pop af
	ld [W_CurrentBank], a
   
   di
	
	pop af

	ld hl, PatchUtils_AuxCodeJmp_returnVec
	push hl

	ld l, a
	ld h, $40
	jp [hl]

PatchUtils_AuxCodeJmp_returnVec::
	push af
	ld a, [W_CurrentBank]
	rst $10
	pop af
	reti
   
;TODO: FusionLabEvo_LoadSpeciesName uses this.
;Can we make it use PatchUtils_LimitBreak instead?
FusionLabEvo_Multiplier::
    sla c
    rl b
    ret
    
;TODO: Move these patches into the AuxCode area.
;Part of a function that replaces status text drawing with the VWF.
MainScript_ADVICE_DrawStatusText::
	ld bc, $10
	ld a, [W_MainScript_VWFOldTileMode]
	cp 1
	jp z, MainScript_DrawStatusText_secondCompositeTile
	jp MainScript_DrawStatusText_firstCompositeTile
	
MainScript_ADVICE_DrawStatusText_enterSecondHalf::
	jp nz, MainScript_DrawStatusText_loop
	
MainScript_ADVICE_DrawStatusText_resetVWFAndExit::
	ld a, 2
	ld [W_MainScript_VWFOldTileMode], a
	ld a, 0
	ld [W_MainScript_VWFLetterShift], a
	ret
	
MainScript_ADVICE_DrawStatusText_exitFromSecondHalf::
	pop bc
	jr MainScript_ADVICE_DrawStatusText_resetVWFAndExit

Banked_SaveClock_ADVICE_LoadDenjuuNicknameByStatPtr_indexNicknameArrayFixed::
	rst $10
	call SaveClock_ADVICE_LoadDenjuuNicknameByStatPtr_indexNicknameArrayFixed
	rst $10
	ret
	
;C5
Banked_TitleMenu_ADVICE_SplitNickAndSpeciesNames::
	rst $10
	call TitleMenu_ADVICE_SplitNickAndSpeciesNames
	rst $18
	ret
	
;CB
Banked_TitleMenu_ADVICE_LoadDenjuuNicknameIntoBuffer::
	rst $10
	call TitleMenu_ADVICE_LoadDenjuuNicknameIntoBuffer
	rst $18
	ret
	
;D1
Banked_SaveClock_ADVICE_LoadDenjuuNicknameByStatPtr::
	rst $10
	call SaveClock_ADVICE_LoadDenjuuNicknameByStatPtr
	rst $10
	ret

;D7
Banked_StringTable_ADVICE_PadCopyBuffer::
	ld a, [W_CurrentBank]
	push af
	ld a, BANK(StringTable_ADVICE_PadCopyBuffer)
	rst $10
	call StringTable_ADVICE_PadCopyBuffer
	pop af
	rst $10
	ret
	
;E4
Banked_PauseMenu_ADVICE_LoadName75::
	ld a, $34
	rst $10
	call PauseMenu_ADVICE_LoadName75
	rst $18
	ret
	
PatchUtils_ResetGame: nop
	nop
	nop
	nop ;Further execution hits the main vector of the rom header