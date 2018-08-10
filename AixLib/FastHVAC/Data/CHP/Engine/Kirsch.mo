within AixLib.FastHVAC.Data.CHP.Engine;
record Kirsch

  extends Engine.BaseDataDefinition(
    a_0=0.117,
    a_1=0.0001,
    a_2=0.0286,
    a_3=0,
    a_4=0,
    a_5=0,
    a_6=0.0002,
    b_0=0.7304,
    b_1=-0.0029,
    b_2=0.0617,
    b_3=6.2774,
    b_4=-1.0263,
    b_5=-1.9368*10^(-6),
    b_6=-0.0035,
    P_elRated=3900,
    tauQ_th_start=588.23,
    tauQ_th_stop = 90,
    tauP_el=275.73,
    dotm_max=0.1236,
    dotm_min=0.0819,
    dotQ_thRated = 9275,
    dotE_fuelRated = 16211,
    P_elStop = -190,
    P_elStart = -190,
    P_elStandby = -90);
    // the last three parameters where only available for the AisinSeiki ICE, so they are just copied!
end Kirsch;