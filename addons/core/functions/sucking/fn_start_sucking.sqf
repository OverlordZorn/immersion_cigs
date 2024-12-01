#include "../../script_component.hpp"

/*
* Author: Zorn
* Function that will initiate the Recursive Sucking
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_unit"];

////////////////////////////////////////
// Initial Check
////////////////////////////////////////
if (!(local _unit)) exitWith {};


////////////////////////////////////////
// Check if sucking & set flag
////////////////////////////////////////
if (_unit getVariable [QPVAR(isSucking), false]) exitWith {};
_unit setVariable [QPVAR(isSucking), true, true];


////////////////////////////////////////
// Ident current Pop and Type
////////////////////////////////////////
private _suckerTypeGear = switch (true) do {
    case (getNumber (configFile >> "CfgGlasses" >> goggles _unit >> QPVAR(isSuckable)) == 1): { "GOGGLES" };
    case (getNumber (configFile >> "CfgWeapons" >>     hmd _unit >> QPVAR(isSuckable)) == 1): { "HMD" };
    default { "" };
};
if (_suckerTypeGear == "") exitWith {};


////////////////////////////////////////
// Identify CigClass
////////////////////////////////////////
private _suckerConfig = switch (_suckerTypeGear) do {
    case ("GOGGLES"):   { (configFile >> "CfgGlasses" >> goggles _unit ); };
    case ("HMD"):       { (configFile >> "CfgWeapons" >>     hmd _unit ); };
};


////////////////////////////////////////
// Play Animation
////////////////////////////////////////
[_unit, QEGVAR(anim,cig_in), 3] call FUNC(anim);


////////////////////////////////////////
// Identify Sucker Time
////////////////////////////////////////
private _popTime = getNumber (_suckerConfig >> QPVAR(initStateTime));
private _maxTime = getNumber (_suckerConfig >> QPVAR(maxTime));
if (_maxTime == 0) then { _maxTime = 330; };


////////////////////////////////////////
// Initial Sucking Sound
////////////////////////////////////////
ZRN_LOG_1(_suckerConfig);
private _sound = [(_suckerConfig >> QPVAR(sounds))] call FUNC(getCfgDataRandom);
ZRN_LOG_2(_sound,_unit);
[ QGVAR(EH_sound), [_sound, _unit] ] call CBA_fnc_globalEvent;


////////////////////////////////////////
// Flavour Notification
////////////////////////////////////////
private _flavour = [(_suckerConfig >> QPVAR(flavour))] call FUNC(getCfgDataRandom);
[ { [QGVAR(EH_notify), format [LLSTRING(taste_flavour), _this]] call CBA_fnc_localEvent; } , _flavour, 2 + random 30] call CBA_fnc_waitAndExecute;


////////////////////////////////////////
// Start Recursive Loop
////////////////////////////////////////
[ FUNC(sucking), [_unit,_popTime,_suckerTypeGear,_maxTime], 2] call CBA_fnc_waitAndExecute;

