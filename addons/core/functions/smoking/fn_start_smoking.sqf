#include "../../script_component.hpp"

/*
* Author: Zorn
* [Description]
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
// Check if smoking & set flag
////////////////////////////////////////
if (_unit getVariable [QPVAR(isSmoking), false]) exitWith {};
_unit setVariable [QPVAR(isSmoking), true, true];


////////////////////////////////////////
// Identify current used Cig and Type
////////////////////////////////////////
private _itemType = switch (true) do {
    case (getNumber (configFile >> "CfgGlasses" >> goggles _unit >> QPVAR(isSmokeable)) == 1): { "GOGGLES" };
    case (getNumber (configFile >> "CfgWeapons" >>     hmd _unit >> QPVAR(isSmokeable)) == 1): { "HMD" };
    default { "" };
};
if (_itemType == "") exitWith {};


////////////////////////////////////////
// Identify CigClass
////////////////////////////////////////
private _itemConfig = switch (_itemType) do {
    case ("GOGGLES"):   { (configFile >> "CfgGlasses" >> goggles _unit ); };
    case ("HMD"):       { (configFile >> "CfgWeapons" >>     hmd _unit ); };
};


////////////////////////////////////////
// Play Animation
////////////////////////////////////////
[_unit, QEGVAR(anim,cig_in), 3] call FUNC(anim);


////////////////////////////////////////
// Identify cigarette Time
////////////////////////////////////////
private _currentTime = getNumber (_itemConfig >> QPVAR(initStateTime));
private _maxTime = getNumber (_itemConfig >> QPVAR(maxTime));
if (_maxTime == 0) then { _maxTime = 330; };


////////////////////////////////////////
// Initial Smoke Puffs
////////////////////////////////////////
private _sleep_total = 3.5;
private _puffs = 1 + ceil random 4;

[{ [QGVAR(EH_smoke), _this] call CBA_fnc_globalEvent; }, [_unit, _itemConfig], _sleep_total] call CBA_fnc_waitAndExecute;

for "_i" from 1 to _puffs do {
    private _rnd = 2 + random 3;
    _sleep_total = _sleep_total + _rnd;
    [{ [QGVAR(EH_smoke), _this] call CBA_fnc_globalEvent; }, [_unit, _itemConfig], _sleep_total] call CBA_fnc_waitAndExecute;
};


////////////////////////////////////////
// Start Recursive Loop
////////////////////////////////////////
[ FUNC(smoking), [_unit,_currentTime,_itemType,_maxTime], _sleep_total + 2] call CBA_fnc_waitAndExecute;
