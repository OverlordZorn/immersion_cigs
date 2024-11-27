class CfgMagazines {
    class CA_Magazine;

    class GVAR(cigpack): CA_Magazine {
        author = CSTRING(author);
        scope = 2;

        displayName = CSTRING(cigpack);
        descriptionShort = CSTRING(cigpack_desc);
        model = PATH_TO_ADDON_3(data,cigpack,cigpack.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigpack_x_ca.paa);

        ammo = "";
        count = 20;
        initSpeed = 0;
        tracersEvery = 0;
        lastRoundsTracer = 0;
        mass = 2;

        ACE_asItem = 1;

        PVAR(isPack) = 1;
        PVAR(unpackSound) = QPVAR(unwrap);
        PVAR(item_glasses) = QGVAR(cig0);
        PVAR(item_hmd) = QGVAR(cig0_nv);
    };
};
