return 
(place_meeting(x, y+1, oHardground)) && !place_meeting(x, y, oHardground) && vsp >= 0
or 
((place_meeting(x, y+1, oSoftground) && !place_meeting(x, y, oSoftground) && vsp >= 0));

//Returns if you're touching a non-jumpthru ground (hardground) or a jumpthru ground (softground)