8,-1.470287E-08,-0.003321156,0.9999946
	attRot = 0,0,0,1
	mir = 1,1,1
	istg = 3
	dstg = 3
	sidx = 0
	sqor = 3
	attm = 0
	link = solidBooster_4294688086
	sym = stackDecoupler_4294688194
	sym = stackDecoupler_4294688158
	sym = stackDecoupler_4294688122
	attN = bottom,solidBooster_4294688086
	attN = top,solidBooster_4294688480
	EVENTS
	{
	}
	ACTIONS
	{
	}
	MODULE
	{
		name = ModuleDecouple
		isEnabled = True
		isDecoupled = False
		EVENTS
		{
			Decouple
			{
				active = True
				guiActive = True
				guiIcon = Decouple
				guiName = Decouple
				category = Decouple
				guiActiveUnfocused = False
				unfocusedRange = 2
				externalToEVAOnly = True
			}
		}
		ACTIONS
		{
			DecoupleAction
			{
				actionGroup = None
			}
		}
	}
}
PART
{
	part = stackDecoupler_4294688194
	partName = Part
	pos = -0.1777234,10.49625,-2.218833
	rot = 0.002348423,-0.707103,-0.002348423,0.707103
	attRot = 0,0,0,1
	mir = 1,1,1
	istg = 3
	dstg = 3
	sidx = 1
	sqor = 3
	attm = 0
	link = solidBooster_4294688016
	sym = stackDecoupler_4294688230
	sym = stackDecoupler_4294688158
	sym = stackDecoupler_4294688122
	attN = bottom,solidBooster_4294688016
	attN = top,solidBooster_4294688570
	EVENTS
	{
	}
	ACTIONS
	{
	}
	MODULE
	{
		name = ModuleDecouple
		isEnabled = True
		isDecoupled = False
		EVENTS
		{
			Decouple
			{
				active = True
				guiActive = True
				guiIcon = Decouple
				guiName = Decouple
				category = Decouple
				guiActiveUnfocused = False
				unfocusedRange = 2
				externalToEVAOnly = True
			}
		}
		ACTIONS
		{
			DecoupleAction
			{
				actionGroup = None
			}
		}
	}
}
PART
{
	part = stackDecoupler_4294688158
	partName = Part
	pos = -0.1777228,10.49625,2.219348
	rot = -0.002348424,0.7071029,-0.002348423,0.7071031
	attRot = 0,0,0,1
	mir = 1,1,1
	istg = 3
	dstg = 3
	sidx = 2
	sqor = 3
	attm = 0
	link = solidBooste