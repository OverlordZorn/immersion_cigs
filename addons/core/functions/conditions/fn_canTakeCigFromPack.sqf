#include "../../script_component.hpp"

/*
* Author: Zorn
* Checks if the unit can takea a cig from a pack
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


//  moveToCompleted

params ["_unit"];
magazines _unit findIf { getNumber (configFile >> "CfgMagazines" >> _x >> QPVAR(isPack) ) == 1} > -1

