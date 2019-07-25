within AixLib.Building.Benchmark.Model.BusSystems;
model Logger
      annotation (__Dymola_selections={
   Selection(name="Measure & Control",
   match={MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="AirTemp"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="WaterInAir"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="HotWater_TTop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="HotWater_TBottom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="WarmWater_TTop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="WarmWater_TBottom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="ColdWater_TTop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="ColdWater_TBottom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Heatpump_cold_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Heatpump_cold_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Heatpump_warm_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Heatpump_warm_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Aircooler_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Aircooler"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="GeothermalProbe_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="GeothermalProbe_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="generation_hot_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="generation_hot_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_central_hot_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_central_hot_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_central_cold_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_central_cold_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_openplanoffice_hot_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_openplanoffice_hot_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_openplanoffice_cold_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_openplanoffice_cold_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_conferencerom_hot_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_conferencerom_hot_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_conferencerom_cold_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_conferencerom_cold_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_multipersonoffice_hot_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_multipersonoffice_hot_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_multipersonoffice_cold_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_multipersonoffice_cold_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_canteen_hot_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_canteen_hot_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_canteen_cold_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_canteen_cold_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_workshop_hot_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_workshop_hot_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_workshop_cold_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_workshop_cold_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_openplanoffice_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_openplanoffice_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_conferencerom_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_conferencerom_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_multipersonoffice_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_multipersonoffice_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_canteen_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_canteen_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_workshop_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_workshop_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RoomTemp_Openplanoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RoomTemp_Conferenceroom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RoomTemp_Multipersonoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RoomTemp_Canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RoomTemp_Workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Air_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Air_in"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Air_RLT_Central_out"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="heatpump_cold_massflow"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="heatpump_warm_massflow"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Aircooler_massflow"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="generation_hot_massflow"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_central_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_central_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_openplanoffice_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_openplanoffice_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_conferenceroom_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_conferenceroom_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_multipersonoffice_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_multipersonoffice_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_canteen_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_canteen_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_workshop_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="RLT_workshop_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_openplanoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_conferenceroom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_multipersonoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TBA_workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Warmwater_heatpump_1_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Warmwater_heatpump_2_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Heatpump_1_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Heatpump_2_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_generation_hot_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_generation_hot_power_Boiler"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Coldwater_heatpump_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Coldwater_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Warmwater_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Hotwater_power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Electrical_power_CHP"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_central_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_central_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_openplanoffice_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_openplanoffice_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_conferenceroom_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_conferenceroom_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_multipersonoffice_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_multipersonoffice_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_canteen_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_canteen_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_workshop_warm"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_workshop_cold"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_openplanoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_conferenceroom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_multipersonoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="InternalLoad_Power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="PV_Power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Sum_Power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Fuel_Boiler"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Fuel_CHP"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Heatpump_1_COP"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Heatpump_2_COP"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="X_OpenplanOffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="X_Conferenceroom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="X_Multipersonoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="X_Canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="X_Workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Total_Cost"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Total_Power"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Total_Fuel"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Minute"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Hour"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="WeekDay"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="StrahlungTemp_Openplanoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="StrahlungTemp_Conferenceroom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="StrahlungTemp_Multipersonoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="StrahlungTemp_Canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="StrahlungTemp_Workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="FloorTemp_Openplanoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="FloorTemp_Conferenceroom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="FloorTemp_Multipersonoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="FloorTemp_Canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="FloorTemp_Workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="CeilingTemp_Openplanoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="CeilingTemp_Conferenceroom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="CeilingTemp_Multipersonoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="CeilingTemp_Canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="CeilingTemp_Workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Hotwater_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Warmwater_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Coldwater_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Coldwater_heatpump_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Warmwater_heatpump_1_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Warmwater_heatpump_2_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Aircooler_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Hotwater_CHP_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_Hotwater_Boiler_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_Central_hot_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_OpenPlanOffice_hot_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_ConferenceRoom_hot_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_MultiPersonOffice_hot_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_Canteen_hot_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_Workshop_hot_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_Central_cold_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_OpenPlanOffice_cold_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_ConferenceRoom_cold_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_MultiPersonOffice_cold_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_Canteen_cold_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_RLT_Workshop_cold_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_OpenPlanOffice_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_ConferenceRoom_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_MultiPersonOffice_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_Canteen_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Pump_TBA_Workshop_y"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="OnOff_RLT"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="OnOff_Aircooler_small"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="OnOff_Aircooler_big"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Fan_Aircooler_small"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Fan_Aircooler_big"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Fan_RLT"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve1"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve2"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve3"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve4"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve5"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve6"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve7"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve8"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Hot_Central"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Hot_OpenPlanOffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Hot_ConferenceRoom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Hot_MultiPersonOffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Hot_Canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Hot_Workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Cold_Central"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Cold_OpenPlanOffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Cold_ConferenceRoom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Cold_MultiPersonOffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Cold_Canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_RLT_Cold_Workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_Warm_OpenPlanOffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_Warm_conferenceroom"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_Warm_multipersonoffice"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_Warm_canteen"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_Warm_workshop"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_OpenPlanOffice_Temp"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_ConferenceRoom_Temp"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_MultiPersonOffice_Temp"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_Canteen_Temp"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="Valve_TBA_Workshop_Temp"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="OnOff_heatpump_1"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="OnOff_heatpump_2"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="OnOff_CHP"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="OnOff_boiler"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="ElSet_CHP"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TSet_CHP"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="TSet_boiler"),
  MatchVariable(className="AixLib.Building.Benchmark.BusSystem.Logger*", name="X_Central")})});
end Logger;
