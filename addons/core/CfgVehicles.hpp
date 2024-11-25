class CfgVehicles
{

    #include "CfgVehiclesAceActions.hpp"

    class WeaponHolder_Single_limited_item_F;

    class PVAR(matchesItem): WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(matches);
        author = CSTRING(author);
        vehicleClass = "Magazines";

        class TransportMagazines {
            class PVAR(matches) {
                magazine = QPVAR(matches);
                count = 1;
            };
        };
    };

    class PVAR(lighterItem): WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(lighter);
        author = CSTRING(author);
        vehicleClass = "Magazines";

        class TransportMagazines {
            class PVAR(lighter) {
                magazine = QPVAR(lighter);
                count = 1;
            };
        };
    };

    class PVAR(cigpackItem): WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(cigpack);
        author = CSTRING(author);
        vehicleClass = "Magazines";

        class TransportMagazines {
            class PVAR(cigpack) {
                magazine = QPVAR(cigpack);
                count = 1;
            };
        };
    };
};