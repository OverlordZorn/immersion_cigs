#include "../script_component.hpp"

/*
* Author: Zorn
* Function to Take a Cigarette from a box
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

params ["_player"];

[_player, QPVAR(cigpack)] call FUNC(removeItemFromMag);

[QGVAR(EH_sound), [QGVAR(unwrap),_player]] call CBA_fnc_globalEvent; //params ["sound" , source]

if (goggles _player == "") then {
    _player addGoggles QPVAR(cig0);
} else {
    if (hmd _player == "") then {
        _player addItem QPVAR(cig0_nv);
        _player assignItem QPVAR(cig0_nv);
    } else {
        _player addItem QPVAR(cig0);
    };
};
