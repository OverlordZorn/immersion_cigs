#include "../script_component.hpp"

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


params ["_unit", "_player"];

if !([_unit, _player] call FUNC(useLighter)) exitWith {};
_player playActionNow "PutDown";

if !([_player] call FUNC(hasLighter)) exitWith {};
[_player] call FUNC(useLighter);
[QGVAR(EH_start_cig), [_unit],_unit] call CBA_fnc_targetEvent; // raises event local