/*
    @Authors
        Christian 'chris5790' Klemm
    @Arguments
        ?
    @Return Value
        ?
    @Example
        ?
*/
#include "script_component.hpp"

params ["_trench", "_unit"];

private _fnc_onFinish = {
    (_this select 0) params ["_unit", "_trench"];
    [_trench] call FUNC(deleteCamouflage);

    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};

private _fnc_onFailure = {
    (_this select 0) params ["_unit"];
    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};

[CAMOUFLAGE_DURATION, [_unit, _trench], _fnc_onFinish, _fnc_onFailure, localize LSTRING(removeCamouflageProgress)] call ace_common_fnc_progressBar;

[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation;
