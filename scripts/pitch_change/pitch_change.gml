///pitch_change(semitones,direction)
/// @function pitch_change(soundID, pitch, gain, looping, audioEmitterID)
/// @description Returns the pitch change of a sound where direction = -1 or 1
/// @param {real} semitones How many semitones to shift the pitch by
/// @param {real} direction 1 to go up the scale, -1 to go down


var SEMITONES = argument0;
var DIRECTION = argument1;

var NEWPITCH = 1;


SEMITONES = abs(SEMITONES); // failsafe, in case we're passing a negative number

switch (DIRECTION){
    case 1:
        switch (SEMITONES){
            case 1:
                NEWPITCH = 1.06;
                break;    
            case 2:
                NEWPITCH = 1.13;
                break;
            case 3:
                NEWPITCH = 1.19;
                break;
            case 4:
                NEWPITCH = 1.25;
                break;
            case 5:
                NEWPITCH = 1.31;
                break;
            case 6:
                NEWPITCH = 1.38;
                break;
            case 7:
                NEWPITCH = 1.44;
                break;
            case 8:
                NEWPITCH = 1.50;
                break;
            case 9:
                NEWPITCH = 1.56;
                break;
            case 10:
                NEWPITCH = 1.63;
                break;
            case 11:
                NEWPITCH = 1.69;
                break;
            case 12:
                NEWPITCH = 1.75;
                break;
            default:
                NEWPITCH = 1;
                break;    
        }
        break;
    case -1:
        switch (SEMITONES){
            case 1:
                NEWPITCH = 0.94;
                break;    
            case 2:
                NEWPITCH = 0.91;
                break;
            case 3:
                NEWPITCH = 0.88;
                break;
            case 4:
                NEWPITCH = 0.84;
                break;
            case 5:
                NEWPITCH = 0.81;
                break;
            case 6:
                NEWPITCH = 0.78;
                break;
            case 7:
                NEWPITCH = 0.75;
                break;
            case 8:
                NEWPITCH = 0.72;
                break;
            case 9:
                NEWPITCH = 0.69;
                break;
            case 10:
                NEWPITCH = 0.66;
                break;
            case 11:
                NEWPITCH = 0.63;
                break;
            case 12:
                NEWPITCH = 0.59;
                break;
            default:
                NEWPITCH = 1;
                break;
        }
        break;
    default:
        NEWPITCH = 1;
        break;
}
return NEWPITCH;

