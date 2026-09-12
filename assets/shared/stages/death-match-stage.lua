function onCreate()
	makeAnimatedLuaSprite('death-match-stage1', 'stages/death-match-stage/death-match-stage1', -216.571428571428, -114.357142857143);
	setLuaSpriteScrollFactor('death-match-stage1', 1, 1);
	scaleObject('death-match-stage1', 2.7, 2.7);
	setProperty('death-match-stage1.antialiasing', true);
	addAnimationByPrefix('death-match-stage1', '', '', 15, true);
	addLuaSprite('death-match-stage1', false);

	makeLuaSprite('stagefront3', 'stages/death-match-stage/stagefront3', -408.333333333333, 690);
	setLuaSpriteScrollFactor('stagefront3', 1, 1);
	scaleObject('stagefront3', 0.8, 0.8);
	setProperty('stagefront3.antialiasing', true);
	addLuaSprite('stagefront3', false);

	makeLuaSprite('stagecurtains', 'stages/death-match-stage/stagecurtains', -249, -216.5);
	setLuaSpriteScrollFactor('stagecurtains', 1, 1);
	scaleObject('stagecurtains', 0.7, 0.7);
	setProperty('stagecurtains.antialiasing', true);
	addLuaSprite('stagecurtains', false);

	close(true);
end