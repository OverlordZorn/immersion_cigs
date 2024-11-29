#include "../../script_component.hpp"

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

params [
    "_player",
    ["_class_cigpack", QEGVAR(morley,cigpack), [""]]
];

[_player, _class_cigpack] call FUNC(removeItemFromMag);

private _sound = getText (configFile >> "CfgMagazines" >> _class_cigpack >> QPVAR(unpackSound));
if (_sound != "") then { [QGVAR(EH_sound), [ _sound, _player ]] call CBA_fnc_globalEvent; }; //params ["sound" , source] 

private _item_glasses = getText (configFile >> "CfgMagazines" >> _class_cigpack >> QPVAR(item_glasses));
private _item_hmd =     getText (configFile >> "CfgMagazines" >> _class_cigpack >> QPVAR(item_hmd));

switch (true) do {
    case (goggles _player == ""): { _player addGoggles _item_glasses };
    case (    hmd _player == ""): { _player addItem _item_hmd; _player assignItem _item_hmd; };
    default { _player addItem _item_glasses; };
};
