within AixLib.Airflow.PhysicalAirHandlingUnit.Examples;
model CompletePhysicalAHU
  "Contains a model of a complete physical AHU unit"

  //Medium models
  replaceable package MediumAir = AixLib.Media.Air;
  replaceable package MediumWater = AixLib.Media.Water;

    parameter Modelica.SIunits.MassFlowRate mFlowNomOut=0.5
    "Nominal mass flow rate OutgoingAir";
  parameter Modelica.SIunits.MassFlowRate mFlowNomIn=0.5
    "Nominal mass flow rate IntakeAir";


  AixLib.Fluid.Actuators.Valves.TwoWayLinear outsideAirInletValve(
    redeclare package Medium = MediumAir,
    m_flow_nominal=mFlowNomIn,
    dpValve_nominal=50,
    filteredOpening=false)
    annotation (Placement(transformation(extent={{-500,-70},{-480,-90}})));
  Fluid.Actuators.Valves.TwoWayLinear        outletValve(
    redeclare package Medium = MediumAir,
    m_flow_nominal=mFlowNomOut,
    dpValve_nominal=50,
    filteredOpening=false)
    annotation (Placement(transformation(extent={{-480,30},{-500,50}})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear reciculationValve(
    redeclare package Medium = MediumAir,
    m_flow_nominal=mFlowNomOut,
    dpValve_nominal=50,
    filteredOpening=false)
                        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-450,0})));
  AixLib.Fluid.Sources.Boundary_pT exhaustAirSink(
    redeclare package Medium = MediumAir,
    nPorts=1,
    p(displayUnit="Pa"))
    annotation (Placement(transformation(extent={{-560,30},{-540,50}})));
  Fluid.Sources.Boundary_pT           freshAirSource(
    redeclare package Medium = MediumAir,
    nPorts=1,
    p(displayUnit="Pa"))
    annotation (Placement(transformation(extent={{-560,-90},{-540,-70}})));
  AixLib.Fluid.Sensors.VolumeFlowRate OutgoingAirVolFlow(
    redeclare package Medium = MediumAir,
    m_flow_nominal = mFlowNomOut)
    annotation (Placement(transformation(extent={{-360,30},{-380,50}})));
  AixLib.Fluid.Sensors.VolumeFlowRate IntakeAirVolFlow(
    redeclare package Medium = MediumAir,
    m_flow_nominal = mFlowNomIn)
    annotation (Placement(transformation(extent={{-380,-70},{-360,-90}})));
  Modelica.Blocks.Interfaces.RealOutput outletValveOpening
    "Actual valve position" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-520,170})));
  Modelica.Blocks.Interfaces.RealOutput circValveOpening
    "Actual valve position" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-440,-190})));
  Modelica.Blocks.Interfaces.RealOutput inletValveOpening
    "Actual valve position" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-460,-190})));
  Modelica.Blocks.Interfaces.RealOutput intakeAirVolFlow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-370,-190})));
  Modelica.Blocks.Interfaces.RealOutput outgoingAirVolFlow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-370,170})));
  AixLib.Fluid.Sensors.Pressure OutgoingAirPressure(
    redeclare package Medium = MediumAir)
    annotation (Placement(transformation(extent={{-350,60},{-330,80}})));
  AixLib.Fluid.Sensors.Pressure IntakeAirPressure(
    redeclare package Medium = MediumAir)
    annotation (Placement(transformation(extent={{-350,-100},{-330,-120}})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow exhaustLineHeatRecovery(
    redeclare package Medium2 = MediumAir,
    redeclare package Medium1 = MediumWater,
    show_T=true,
    dp2_nominal=50,
    UA_nominal=1500,
    m1_flow_nominal=0.3,
    m2_flow_nominal=0.3,
    dp1_nominal=20000)
    annotation (Placement(transformation(extent={{-40,44},{-20,24}})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow supplyLineHeatRecovery(
    redeclare package Medium2 = MediumAir,
    redeclare package Medium1 = MediumWater,
    show_T=true,
    dp2_nominal=50,
    UA_nominal=1500,
    m1_flow_nominal=0.3,
    m2_flow_nominal=0.3,
    dp1_nominal=2000)
    annotation (Placement(transformation(extent={{-20,-84},{-40,-64}})));
  Buildings.Fluid.Movers.FlowControlled_dp HrcCircPump(
    redeclare package Medium = MediumWater,
    filteredSpeed=false,
    m_flow_nominal=0.3,
    dp_nominal=60000)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-40})));
  AixLib.Fluid.Actuators.Valves.ThreeWayLinear HrcValve(
    redeclare package Medium = MediumWater,
    filteredOpening=false,
    l={0.01,0.01},
    m_flow_nominal=0.3,
    dpValve_nominal=20000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,-20})));
  AixLib.Fluid.Sensors.TemperatureTwoPort ExhaustTemperature(redeclare package
      Medium =         MediumAir, m_flow_nominal=mFlowNomOut)
    annotation (Placement(transformation(extent={{-110,30},{-130,50}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort IntakeAirOutletTemp(redeclare package
      Medium =         MediumAir, m_flow_nominal=mFlowNomIn)
    annotation (Placement(transformation(extent={{60,-70},{80,-90}})));
  AixLib.Fluid.Sensors.RelativeHumidity ExhaustHumidity(redeclare package
      Medium = MediumAir)
    annotation (Placement(transformation(extent={{-210,60},{-230,80}})));
  AixLib.Fluid.Sensors.RelativeHumidity IntakeAirRelHumid(redeclare package
      Medium =         MediumAir)
    annotation (Placement(transformation(extent={{50,-100},{30,-120}})));
  AixLib.Fluid.Sources.Boundary_pT RecirculationPressure(
    redeclare package Medium = MediumWater,
    use_X_in=false,
    use_p_in=false,
    p(displayUnit="Pa") = 101300,
    use_T_in=false,
    nPorts=1)
    annotation (Placement(transformation(extent={{20,-10},{0,10}})));
  Modelica.Blocks.Interfaces.RealOutput HrcValveOpening
    "Actual valve position"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,-190})));
  Modelica.Blocks.Interfaces.RealOutput HrcPumpPower annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-190})));
  Modelica.Blocks.Interfaces.RealOutput HrcOutgoingOutTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,170})));
  Modelica.Blocks.Interfaces.RealOutput HrcOutgoingOutPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-240,170})));
  Modelica.Blocks.Interfaces.RealOutput HrcIntakeOutPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,-190})));
  Modelica.Blocks.Interfaces.RealOutput HrcIntakeOutTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-190})));
  AixLib.Fluid.Sensors.TemperatureTwoPort IntakeAirInletTemp(redeclare package
      Medium =         MediumAir, m_flow_nominal=mFlowNomIn)
    annotation (Placement(transformation(extent={{-130,-70},{-110,-90}})));
  Modelica.Blocks.Interfaces.RealOutput HrcIntakeInTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-120,-190})));
  AixLib.Fluid.Sensors.TemperatureTwoPort OutgoingAirInletTemp(redeclare
      package Medium = MediumAir, m_flow_nominal=mFlowNomIn)
    annotation (Placement(transformation(extent={{142,30},{122,50}})));
  Modelica.Blocks.Interfaces.RealOutput HrcOutgoingInTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={132,170})));
  AixLib.Fluid.Sensors.RelativeHumidity OutgoingAirRelHumid1(  redeclare
      package Medium = MediumAir)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,90})));
  Fluid.MassExchangers.Humidifier_u liquidWaterHumidifier(
    redeclare package Medium = MediumAir,
    m_flow_nominal=0.5,
    dp_nominal=50,
    mWat_flow_nominal=0.009125,
    T=293.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={270,40})));
  AixLib.Fluid.Sensors.TemperatureTwoPort OutgoingAirInletTemp2(redeclare
      package Medium = MediumAir, m_flow_nominal=mFlowNomIn)
    annotation (Placement(transformation(extent={{340,30},{320,50}})));
  Modelica.Blocks.Interfaces.RealOutput OutHumidifierInletTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={330,170})));
  AixLib.Fluid.Sensors.RelativeHumidity OutgoingAirRelHumid2(  redeclare
      package Medium = MediumAir)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={350,90})));
  Modelica.Blocks.Interfaces.RealOutput OutHumidifierInletPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={370,170})));
  Modelica.Blocks.Interfaces.RealOutput OutHumidifierOutletPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,170})));
  Buildings.Fluid.Movers.FlowControlled_m_flow exhaustFan(
    redeclare package Medium = MediumAir,
    filteredSpeed=false,
    addPowerToMedium=false,
    m_flow_nominal=0.3)
    annotation (Placement(transformation(extent={{480,50},{460,30}})));
  AixLib.Fluid.Sources.Boundary_pT OutgoingAirInlet(
    redeclare package Medium = MediumAir,
    nPorts=1,
    p(displayUnit="Pa"))
    annotation (Placement(transformation(extent={{1720,30},{1700,50}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow supplyFan(
    redeclare package Medium = MediumAir,
    filteredSpeed=false,
    addPowerToMedium=false,
    m_flow_nominal=0.3)
    annotation (Placement(transformation(extent={{460,-90},{480,-70}})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow hex(
    redeclare package Medium2 = MediumAir,
    redeclare package Medium1 = MediumWater,
    UA_nominal=750,
    dp2_nominal=50,
    dp1_nominal=20000,
    m1_flow_nominal=0.3,
    m2_flow_nominal=0.3)
    annotation (Placement(transformation(extent={{690,-76},{670,-96}})));
  AixLib.Fluid.Actuators.Valves.ThreeWayLinear PreHeaterValve(
    redeclare package Medium = MediumWater,
    m_flow_nominal=0.3,
    dpValve_nominal=20000)
                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={670,-200})));
  Buildings.Fluid.Movers.FlowControlled_dp preHeaterCircPump(redeclare package
      Medium =         MediumWater,
    m_flow_nominal=0.3,
    addPowerToMedium=false)                           annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={670,-160})));
  AixLib.Fluid.Sources.Boundary_pT warmWaterSource(
    use_X_in=false,
    redeclare package Medium = MediumWater,
    nPorts=1,
    use_T_in=true,
    p(displayUnit="Pa"),
    T=303.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={670,-240})));
  AixLib.Fluid.Sources.Boundary_pT waterSink(
    use_T_in=false,
    use_X_in=false,
    redeclare package Medium = MediumWater,
    use_p_in=false,
    nPorts=1,
    p(displayUnit="Pa"))
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={692,-240})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow hex1(
    redeclare package Medium2 = MediumAir,
    redeclare package Medium1 = MediumWater,
    UA_nominal=1250,
    dp2_nominal=50,
    m1_flow_nominal=0.3,
    m2_flow_nominal=0.3,
    dp1_nominal=20000)
    annotation (Placement(transformation(extent={{970,-76},{950,-96}})));
  AixLib.Fluid.Sources.Boundary_pT coldWaterSource(
    use_X_in=false,
    redeclare package Medium = MediumWater,
    use_T_in=true,
    nPorts=1,
    p(displayUnit="Pa") = waterSink1.p + coolingCircuitPressure.k)
                                  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={968,-190})));
  AixLib.Fluid.Sources.Boundary_pT waterSink1(
    use_T_in=false,
    use_X_in=false,
    p(displayUnit="Pa") = 101300,
    redeclare package Medium = MediumWater,
    use_p_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=-90,
        origin={950,-190})));
  AixLib.Fluid.Actuators.Valves.TwoWayLinear CoolerValve(
    redeclare package Medium = MediumWater,
    filteredOpening=false,
    m_flow_nominal=0.3,
    dpValve_nominal=20000)
                        annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={950,-130})));
  AixLib.Fluid.Sensors.RelativeHumidity HumidityAfterCooler(redeclare package
      Medium =         MediumAir)
    annotation (Placement(transformation(extent={{1140,-100},{1120,-120}})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow hex2(
    redeclare package Medium2 = MediumAir,
    redeclare package Medium1 = MediumWater,
    UA_nominal=1521,
    dp2_nominal=50,
    m1_flow_nominal=0.3,
    m2_flow_nominal=0.3,
    dp1_nominal=20000)
    annotation (Placement(transformation(extent={{1252,-76},{1232,-96}})));
  AixLib.Fluid.Actuators.Valves.ThreeWayLinear MainHeaterValve(
    redeclare package Medium = MediumWater,
    m_flow_nominal=0.3,
    dpValve_nominal=20000)
                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={1230,-202})));
  Buildings.Fluid.Movers.FlowControlled_dp MainHeaterCircPump(redeclare package
      Medium =         MediumWater, m_flow_nominal=0.3) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={1230,-162})));
  AixLib.Fluid.Sources.Boundary_pT hotWaterSource(
    use_X_in=false,
    redeclare package Medium = MediumWater,
    nPorts=1,
    use_T_in=true,
    p(displayUnit="Pa") = 101300,
    T=303.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={1230,-244})));
  AixLib.Fluid.Sources.Boundary_pT waterSink2(
    use_T_in=false,
    use_X_in=false,
    p(displayUnit="Pa") = 101300,
    redeclare package Medium = MediumWater,
    use_p_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={1248,-244})));
  AixLib.Fluid.Sources.Boundary_pT IntakeAirOutlet(
    redeclare package Medium = MediumAir,
    nPorts=1,
    p(displayUnit="Pa"))
    annotation (Placement(transformation(extent={{1720,-90},{1700,-70}})));
  AixLib.Fluid.Sensors.RelativeHumidity SupplyHumidity(redeclare package Medium
      =        MediumAir)
    annotation (Placement(transformation(extent={{1600,-100},{1580,-120}})));
  Fluid.MixingVolumes.MixingVolume           vol(
    redeclare package Medium = MediumAir,
    V=1,
    nPorts=4,
    m_flow_nominal=0.5)
    annotation (Placement(transformation(extent={{1480,-80},{1500,-60}})));
  AixLib.Fluid.Sources.MassFlowSource_T SteamSource(
    m_flow=0.5,
    redeclare package Medium = MediumAir,
    use_m_flow_in=true,
    use_T_in=false,
    use_X_in=false,
    T=100 + 273.15,
    X={0.999,0.001},
    nPorts=1)
             annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={1490,-130})));
  AixLib.Fluid.Sensors.TemperatureTwoPort OugoingAirOutletTemp(redeclare
      package Medium = MediumAir, m_flow_nominal=mFlowNomIn)
    annotation (Placement(transformation(extent={{1540,-70},{1560,-90}})));
  Modelica.Blocks.Sources.Constant SteamFlowNominal(k=0.2) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={1520,-210})));
  Modelica.Blocks.Math.Product product4
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={1498,-170})));
  AixLib.Fluid.Sensors.TemperatureTwoPort TemperatureAfterRecuperator(
      redeclare package Medium = MediumAir, m_flow_nominal=0.5)
    annotation (Placement(transformation(extent={{540,-70},{560,-90}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort TemperatureAfterPreHeater(
      redeclare package Medium = MediumAir, m_flow_nominal=0.5)
    annotation (Placement(transformation(extent={{780,-70},{800,-90}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort TemperatureAfterCooler(redeclare
      package Medium = MediumAir, m_flow_nominal=0.5)
    annotation (Placement(transformation(extent={{1080,-70},{1100,-90}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort senTem3(
    redeclare package Medium = MediumAir,
    m_flow_nominal = 0.5)
    annotation (Placement(transformation(extent={{1340,-70},{1360,-90}})));
  AixLib.Fluid.Sensors.RelativeHumidity HumidityAfterRecuperator(redeclare
      package Medium = MediumAir)
    annotation (Placement(transformation(extent={{600,-100},{580,-120}})));
  AixLib.Fluid.Sensors.RelativeHumidity HumidityAfterPreHeater(redeclare
      package Medium = MediumAir)
    annotation (Placement(transformation(extent={{840,-100},{820,-120}})));
  Modelica.Blocks.Interfaces.RealOutput PreHeaterInletTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={550,-190})));
  Modelica.Blocks.Interfaces.RealOutput PreHeaterInletPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={570,-190})));
  Modelica.Blocks.Interfaces.RealOutput CoolerInletTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={790,-190})));
  Modelica.Blocks.Interfaces.RealOutput CoolerInletPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={810,-190})));
  Modelica.Blocks.Interfaces.RealOutput MainHeaterInletTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={1090,-190})));
  Modelica.Blocks.Interfaces.RealOutput MainHeaterInletPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={1110,-190})));
  AixLib.Fluid.Sensors.RelativeHumidity HumidityAfterHeater(redeclare package
      Medium =         MediumAir)
    annotation (Placement(transformation(extent={{1400,-100},{1380,-120}})));
  Modelica.Blocks.Interfaces.RealOutput MainHeaterOutletTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={1350,-190})));
  Modelica.Blocks.Interfaces.RealOutput MainHeaterOutletPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={1370,-190})));
  Modelica.Blocks.Interfaces.RealOutput InHumidifierOutletTemp
    "Temperature of the passing fluid" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={1550,-190})));
  Modelica.Blocks.Interfaces.RealOutput InHumidifierOutletPhi
    "Relative humidity in port medium" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={1570,-190})));
  Modelica.Blocks.Sources.Constant
                               coolingCircuit(k=273.15 + 6)
    "Temperature of cooling circuit"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={1010,-310})));
  Modelica.Blocks.Sources.Constant highTemperatureCircuit(k=273.15 + 65)
    "temperature of heating circuit"
    annotation (Placement(transformation(extent={{1140,-320},{1160,-300}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort TemperatureHeaterWaterReturn(
      redeclare package Medium = MediumWater, m_flow_nominal=0.5) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={1270,-110})));
  AixLib.Fluid.Sensors.TemperatureTwoPort heaterOut(redeclare package Medium =
        MediumWater, m_flow_nominal=0.5)
    annotation (Placement(transformation(extent={{1218,-102},{1238,-122}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort TemperaturePreHeaterReturn(
      redeclare package Medium = MediumWater, m_flow_nominal=0.3) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={690,-154})));
  AixLib.Fluid.Sensors.TemperatureTwoPort TemperaturePreHeaterReturn1(
      redeclare package Medium = MediumWater, m_flow_nominal=0.5) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={950,-160})));
  Modelica.Blocks.Sources.Constant coolingCircuitPressure(k=40000)
    "pressure difference in cooling circuit" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={928,-240})));
  Modelica.Blocks.Sources.Constant heaterPumpPressure(k=40000)
    "pressure difference of heater pump" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={630,-160})));
  Modelica.Blocks.Sources.Constant mainHeaterPumpPressure(k=40000)
    "pressure difference of main heater pump" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={1196,-162})));
  Modelica.Blocks.Sources.Constant heaterPumpPressure1(k=60000)
    "pressure difference of heater pump" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,-40})));
  Controls.AHUControllers.Cooler coolerController
    annotation (Placement(transformation(extent={{884,-155},{926,-105}})));
  AixLib.Fluid.Sensors.Pressure supplyPressure(redeclare package Medium =
        MediumAir)
    annotation (Placement(transformation(extent={{1534,-92},{1514,-112}})));
  Modelica.Blocks.Sources.Constant supplyAirTemperatureSetPoint(k=273.15 + 30)
    "Temperature set point of supply air" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={770,-364})));
  AixLib.Fluid.Sensors.Pressure coolerPressure(redeclare package Medium =
        MediumAir)
    annotation (Placement(transformation(extent={{1006,-94},{986,-114}})));
  Modelica.Blocks.Sources.Constant supplyAirHumiditySetPoint(k=0.5)
    "Relative humidity set point of supply air" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={770,-310})));
  Controls.AHUControllers.HeatRecovery heatRecovery
    annotation (Placement(transformation(extent={{-106,-30},{-86,-10}})));
  Controls.AHUControllers.LiquidHumidifier liquidHumidifier
    annotation (Placement(transformation(extent={{260,70},{280,90}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{222,75},{242,95}})));
  Controls.Continuous.LimPID        preHeaterController(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=100)
    annotation (Placement(transformation(extent={{624,-210},{644,-190}})));
  Controls.Continuous.LimPID heaterController(controllerType=Modelica.Blocks.Types.SimpleController.PI,
      Ti=100)
    annotation (Placement(transformation(extent={{1186,-212},{1206,-192}})));
  Controls.AHUControllers.SteamHumidifier steamHumidifier
    annotation (Placement(transformation(extent={{1458,-240},{1488,-210}})));
  Modelica.Blocks.Sources.Constant fanMassFlowRate(k=0.3)
    "Mass flow rate of fan" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={430,-20})));
  Modelica.Blocks.Sources.Constant circDamperOpening(k=0)
    "Opening of circulation damper" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-386,0})));
  Modelica.Blocks.Sources.Constant exhaustDamperOpening(k=1)
    "Opening of exhaust damper" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-454,80})));
  Modelica.Blocks.Sources.Constant freshDamperOpening(k=1)
    "Opening of fresh damper" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-510,-130})));
equation
  connect(outletValve.port_a,reciculationValve. port_a) annotation (Line(
        points={{-480,40},{-450,40},{-450,10}},
                                             color={0,127,255}));
  connect(reciculationValve.port_b,outsideAirInletValve. port_b) annotation (
      Line(points={{-450,-10},{-450,-10},{-450,-80},{-480,-80}},
                                                           color={0,127,255}));
  connect(freshAirSource.ports[1],outsideAirInletValve. port_a) annotation (
      Line(points={{-540,-80},{-520,-80},{-520,-80},{-500,-80}},
                                                       color={0,127,255}));
  connect(OutgoingAirVolFlow.port_b,outletValve. port_a)
    annotation (Line(points={{-380,40},{-380,40},{-480,40}},
                                                           color={0,127,255}));
  connect(outletValve.port_b, exhaustAirSink.ports[1])
    annotation (Line(points={{-500,40},{-540,40}}, color={0,127,255}));
  connect(outsideAirInletValve.port_b,IntakeAirVolFlow. port_a) annotation (
      Line(points={{-480,-80},{-380,-80}},          color={0,127,255}));
  connect(outletValve.y_actual, outletValveOpening) annotation (Line(points={{-495,
          47},{-520,47},{-520,170}}, color={0,0,127}));
  connect(reciculationValve.y_actual, circValveOpening) annotation (Line(points={{-443,-5},
          {-443,-10},{-443,-16},{-440,-16},{-440,-190}},color={0,0,127}));
  connect(circValveOpening, circValveOpening)
    annotation (Line(points={{-440,-190},{-440,-190}}, color={0,0,127}));
  connect(outsideAirInletValve.y_actual, inletValveOpening) annotation (Line(
        points={{-485,-87},{-460,-87},{-460,-190}}, color={0,0,127}));
  connect(IntakeAirVolFlow.V_flow, intakeAirVolFlow)
    annotation (Line(points={{-370,-91},{-370,-156},{-370,-190}},
                                                      color={0,0,127}));
  connect(OutgoingAirVolFlow.V_flow, outgoingAirVolFlow)
    annotation (Line(points={{-370,51},{-370,170}}, color={0,0,127}));
  connect(OutgoingAirPressure.port, OutgoingAirVolFlow.port_a) annotation (Line(
        points={{-340,60},{-340,40},{-360,40}}, color={0,127,255}));
  connect(IntakeAirVolFlow.port_b, IntakeAirPressure.port) annotation (Line(
        points={{-360,-80},{-340,-80},{-340,-100}},color={0,127,255}));
  connect(exhaustLineHeatRecovery.port_b1, HrcCircPump.port_a)
    annotation (Line(points={{-20,28},{-20,28},{-20,-30}}, color={0,127,255}));
  connect(HrcValve.port_3, HrcCircPump.port_a) annotation (Line(points={{-30,
          -20},{-20,-20},{-20,-30}}, color={0,127,255}));
  connect(HrcCircPump.port_b, supplyLineHeatRecovery.port_a1) annotation (Line(
        points={{-20,-50},{-20,-59},{-20,-68}}, color={0,127,255}));
  connect(exhaustLineHeatRecovery.port_b2, ExhaustTemperature.port_a)
    annotation (Line(points={{-40,40},{-76,40},{-110,40}}, color={0,127,255}));
  connect(supplyLineHeatRecovery.port_b2, IntakeAirOutletTemp.port_a)
    annotation (Line(points={{-20,-80},{-20,-80},{60,-80}}, color={0,127,255}));
  connect(ExhaustHumidity.port, ExhaustTemperature.port_b) annotation (Line(
        points={{-220,60},{-220,40},{-170,40},{-130,40}}, color={0,127,255}));
  connect(IntakeAirRelHumid.port,IntakeAirOutletTemp. port_a) annotation (
      Line(points={{40,-100},{40,-80},{60,-80}},color={0,127,255}));
  connect(HrcValve.port_2, supplyLineHeatRecovery.port_b1)
    annotation (Line(points={{-40,-30},{-40,-68}}, color={0,127,255}));
  connect(HrcValve.port_1, exhaustLineHeatRecovery.port_a1)
    annotation (Line(points={{-40,-10},{-40,28}}, color={0,127,255}));
  connect(OutgoingAirVolFlow.port_a, ExhaustTemperature.port_b) annotation (
      Line(points={{-360,40},{-360,40},{-130,40}}, color={0,127,255}));
  connect(HrcValve.y_actual,HrcValveOpening)  annotation (Line(points={{-47,-25},
          {-47,-40},{-70,-40},{-70,-190}}, color={0,0,127}));
  connect(ExhaustTemperature.T, HrcOutgoingOutTemp)
    annotation (Line(points={{-120,51},{-120,170}}, color={0,0,127}));
  connect(ExhaustHumidity.phi, HrcOutgoingOutPhi) annotation (Line(points={{-231,
          70},{-240,70},{-240,170}}, color={0,0,127}));
  connect(IntakeAirRelHumid.phi,HrcIntakeOutPhi)
    annotation (Line(points={{29,-110},{20,-110},{20,-190}},
                                                          color={0,0,127}));
  connect(IntakeAirOutletTemp.T,HrcIntakeOutTemp)
    annotation (Line(points={{70,-91},{70,-140},{70,-190}},
                                                  color={0,0,127}));
  connect(IntakeAirVolFlow.port_b, IntakeAirInletTemp.port_a) annotation (
      Line(points={{-360,-80},{-360,-80},{-170,-80},{-130,-80}}, color={0,127,
          255}));
  connect(IntakeAirInletTemp.port_b, supplyLineHeatRecovery.port_a2)
    annotation (Line(points={{-110,-80},{-75,-80},{-40,-80}}, color={0,127,255}));
  connect(IntakeAirInletTemp.T,HrcIntakeInTemp)
    annotation (Line(points={{-120,-91},{-120,-190}}, color={0,0,127}));
  connect(OutgoingAirInletTemp.port_b, exhaustLineHeatRecovery.port_a2)
    annotation (Line(points={{122,40},{122,40},{-20,40}}, color={0,127,255}));
  connect(OutgoingAirInletTemp.T,HrcOutgoingInTemp)
    annotation (Line(points={{132,51},{132,170}}, color={0,0,127}));
  connect(OutgoingAirInletTemp2.port_b, liquidWaterHumidifier.port_a)
    annotation (Line(points={{320,40},{300,40},{280,40}}, color={0,127,255}));
  connect(OutgoingAirInletTemp2.T, OutHumidifierInletTemp)
    annotation (Line(points={{330,51},{330,170}}, color={0,0,127}));
  connect(OutgoingAirRelHumid2.port, OutgoingAirInletTemp2.port_a)
    annotation (Line(points={{350,80},{350,80},{350,42},{350,40},{340,40}},
        color={0,127,255}));
  connect(OutgoingAirRelHumid2.phi, OutHumidifierInletPhi)
    annotation (Line(points={{361,90},{370,90},{370,170}}, color={0,0,127}));
  connect(OutgoingAirRelHumid1.port, OutgoingAirInletTemp.port_b) annotation (
     Line(points={{90,80},{90,80},{90,48},{90,40},{122,40}}, color={0,127,255}));
  connect(OutgoingAirRelHumid1.phi, OutHumidifierOutletPhi)
    annotation (Line(points={{101,90},{110,90},{110,170}}, color={0,0,127}));
  connect(OutgoingAirInletTemp2.port_a, exhaustFan.port_b)
    annotation (Line(points={{340,40},{400,40},{460,40}}, color={0,127,255}));
  connect(IntakeAirOutletTemp.port_b, supplyFan.port_a) annotation (Line(points=
         {{80,-80},{270,-80},{460,-80}}, color={0,127,255}));
  connect(warmWaterSource.ports[1], PreHeaterValve.port_1) annotation (Line(
        points={{670,-230},{670,-220},{670,-210}}, color={0,127,255}));
  connect(PreHeaterValve.port_2,preHeaterCircPump. port_a) annotation (Line(
        points={{670,-190},{670,-180},{670,-170}}, color={0,127,255}));
  connect(preHeaterCircPump.port_b, hex.port_a1) annotation (Line(points={{
          670,-150},{670,-150},{670,-130},{710,-130},{710,-92},{690,-92}},
        color={0,127,255}));
  connect(coldWaterSource.ports[1], hex1.port_a1) annotation (Line(points={{
          968,-180},{968,-92},{970,-92}}, color={0,127,255}));
  connect(hex1.port_b1, CoolerValve.port_a) annotation (Line(points={{950,-92},
          {950,-92},{950,-120}}, color={0,127,255}));
  connect(hotWaterSource.ports[1], MainHeaterValve.port_1) annotation (Line(
        points={{1230,-234},{1230,-234},{1230,-212}}, color={0,127,255}));
  connect(MainHeaterValve.port_2, MainHeaterCircPump.port_a) annotation (Line(
        points={{1230,-192},{1230,-182},{1230,-172}}, color={0,127,255}));
  connect(vol.ports[1],OugoingAirOutletTemp. port_a) annotation (Line(points={{1487,
          -80},{1487,-80},{1540,-80}},  color={0,127,255}));
  connect(SupplyHumidity.port, OugoingAirOutletTemp.port_b) annotation (Line(
        points={{1590,-100},{1590,-80},{1560,-80}}, color={0,127,255}));
  connect(SteamFlowNominal.y,product4. u1) annotation (Line(
      points={{1520,-199},{1520,-190},{1504,-190},{1504,-182}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product4.y,SteamSource. m_flow_in) annotation (Line(
      points={{1498,-159},{1498,-140}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(supplyFan.port_b, TemperatureAfterRecuperator.port_a)
    annotation (Line(points={{480,-80},{540,-80}}, color={0,127,255}));
  connect(TemperatureAfterRecuperator.port_b, hex.port_a2)
    annotation (Line(points={{560,-80},{670,-80}}, color={0,127,255}));
  connect(hex.port_b2, TemperatureAfterPreHeater.port_a)
    annotation (Line(points={{690,-80},{780,-80}}, color={0,127,255}));
  connect(TemperatureAfterPreHeater.port_b, hex1.port_a2)
    annotation (Line(points={{800,-80},{950,-80}}, color={0,127,255}));
  connect(hex1.port_b2, TemperatureAfterCooler.port_a)
    annotation (Line(points={{970,-80},{1080,-80}}, color={0,127,255}));
  connect(TemperatureAfterCooler.port_b, hex2.port_a2)
    annotation (Line(points={{1100,-80},{1232,-80}}, color={0,127,255}));
  connect(hex2.port_b2, senTem3.port_a)
    annotation (Line(points={{1252,-80},{1340,-80}}, color={0,127,255}));
  connect(senTem3.port_b, vol.ports[2])
    annotation (Line(points={{1360,-80},{1489,-80}}, color={0,127,255}));
  connect(HumidityAfterPreHeater.port, TemperatureAfterPreHeater.port_b)
    annotation (Line(points={{830,-100},{830,-80},{800,-80}}, color={0,127,255}));
  connect(HumidityAfterRecuperator.port, TemperatureAfterRecuperator.port_b)
    annotation (Line(points={{590,-100},{590,-80},{560,-80}}, color={0,127,255}));
  connect(HumidityAfterCooler.port, TemperatureAfterCooler.port_b) annotation (
      Line(points={{1130,-100},{1130,-80},{1100,-80}}, color={0,127,255}));
  connect(TemperatureAfterRecuperator.T, PreHeaterInletTemp)
    annotation (Line(points={{550,-91},{550,-190}}, color={0,0,127}));
  connect(HumidityAfterRecuperator.phi, PreHeaterInletPhi) annotation (Line(
        points={{579,-110},{570,-110},{570,-190}}, color={0,0,127}));
  connect(TemperatureAfterPreHeater.T, CoolerInletTemp)
    annotation (Line(points={{790,-91},{790,-190}}, color={0,0,127}));
  connect(HumidityAfterPreHeater.phi, CoolerInletPhi) annotation (Line(points={{
          819,-110},{810,-110},{810,-190}}, color={0,0,127}));
  connect(TemperatureAfterCooler.T, MainHeaterInletTemp) annotation (Line(
        points={{1090,-91},{1090,-91},{1090,-190}}, color={0,0,127}));
  connect(HumidityAfterCooler.phi, MainHeaterInletPhi) annotation (Line(points={
          {1119,-110},{1110,-110},{1110,-190}}, color={0,0,127}));
  connect(HumidityAfterHeater.port, senTem3.port_b) annotation (Line(points={{1390,
          -100},{1390,-80},{1360,-80}}, color={0,127,255}));
  connect(senTem3.T, MainHeaterOutletTemp)
    annotation (Line(points={{1350,-91},{1350,-190}}, color={0,0,127}));
  connect(HumidityAfterHeater.phi, MainHeaterOutletPhi) annotation (Line(points=
         {{1379,-110},{1370,-110},{1370,-190}}, color={0,0,127}));
  connect(OugoingAirOutletTemp.T, InHumidifierOutletTemp) annotation (Line(
        points={{1550,-91},{1550,-91},{1550,-190}}, color={0,0,127}));
  connect(SupplyHumidity.phi, InHumidifierOutletPhi) annotation (Line(points={{1579,
          -110},{1570,-110},{1570,-190}}, color={0,0,127}));
  connect(SteamSource.ports[1], vol.ports[3]) annotation (Line(points={{1490,-120},
          {1490,-80},{1491,-80}},          color={0,127,255}));
  connect(exhaustFan.port_a, OutgoingAirInlet.ports[1])
    annotation (Line(points={{480,40},{772,40},{1700,40}}, color={0,127,255}));
  connect(OugoingAirOutletTemp.port_b, IntakeAirOutlet.ports[1]) annotation (
      Line(points={{1560,-80},{1630,-80},{1700,-80}}, color={0,127,255}));
  connect(RecirculationPressure.ports[1], HrcCircPump.port_a)
    annotation (Line(points={{0,0},{-20,0},{-20,-30}}, color={0,127,255}));
  connect(HrcCircPump.P,HrcPumpPower)  annotation (Line(points={{-12,-51},{-10,
          -51},{-10,-78},{-10,-162},{-10,-190}}, color={0,0,127}));
  connect(OutgoingAirInletTemp.port_a, liquidWaterHumidifier.port_b)
    annotation (Line(points={{142,40},{260,40}}, color={0,127,255}));
  connect(hex2.port_b1, heaterOut.port_a) annotation (Line(points={{1232,-92},{1222,
          -92},{1210,-92},{1210,-112},{1218,-112}}, color={0,127,255}));
  connect(heaterOut.port_b, waterSink2.ports[1]) annotation (Line(points={{1238,
          -112},{1246,-112},{1252,-112},{1252,-234},{1248,-234}}, color={0,127,255}));
  connect(MainHeaterValve.port_3, heaterOut.port_b) annotation (Line(points={{1240,
          -202},{1252,-202},{1252,-112},{1238,-112}}, color={0,127,255}));
  connect(MainHeaterCircPump.port_b, TemperatureHeaterWaterReturn.port_a)
    annotation (Line(points={{1230,-152},{1230,-132},{1270,-132},{1270,-120}},
        color={0,127,255}));
  connect(TemperatureHeaterWaterReturn.port_b, hex2.port_a1) annotation (Line(
        points={{1270,-100},{1270,-92},{1252,-92}}, color={0,127,255}));
  connect(hex.port_b1, TemperaturePreHeaterReturn.port_a) annotation (Line(
        points={{670,-92},{656,-92},{656,-116},{690,-116},{690,-144}}, color={0,
          127,255}));
  connect(TemperaturePreHeaterReturn.port_b, PreHeaterValve.port_3) annotation (
     Line(points={{690,-164},{690,-200},{680,-200}}, color={0,127,255}));
  connect(TemperaturePreHeaterReturn.port_b, waterSink.ports[1]) annotation (
      Line(points={{690,-164},{690,-164},{690,-230},{692,-230}}, color={0,127,255}));
  connect(CoolerValve.port_b, TemperaturePreHeaterReturn1.port_a) annotation (
      Line(points={{950,-140},{950,-146},{950,-150}}, color={0,127,255}));
  connect(TemperaturePreHeaterReturn1.port_b, waterSink1.ports[1]) annotation (
      Line(points={{950,-170},{950,-176},{950,-180}}, color={0,127,255}));
  connect(highTemperatureCircuit.y, hotWaterSource.T_in) annotation (Line(
        points={{1161,-310},{1226,-310},{1226,-256}}, color={0,0,127}));
  connect(coolingCircuit.y, coldWaterSource.T_in) annotation (Line(points={{999,
          -310},{972,-310},{972,-202}}, color={0,0,127}));
  connect(highTemperatureCircuit.y, warmWaterSource.T_in) annotation (Line(
        points={{1161,-310},{1182,-310},{1182,-344},{666,-344},{666,-252}},
        color={0,0,127}));
  connect(preHeaterCircPump.dp_in, heaterPumpPressure.y) annotation (Line(
        points={{658,-160.2},{650,-160.2},{650,-160},{641,-160}}, color={0,0,127}));
  connect(MainHeaterCircPump.dp_in, mainHeaterPumpPressure.y) annotation (Line(
        points={{1218,-162.2},{1212,-162.2},{1212,-162},{1207,-162}}, color={0,0,
          127}));
  connect(HrcCircPump.dp_in, heaterPumpPressure1.y) annotation (Line(points={{-8,
          -39.8},{6,-39.8},{6,-40},{19,-40}}, color={0,0,127}));
  connect(coolerController.valveOpening, CoolerValve.y) annotation (Line(points=
         {{926,-130},{933,-130},{938,-130}}, color={0,0,127}));
  connect(TemperatureAfterCooler.T, coolerController.TMeas) annotation (Line(
        points={{1090,-91},{1090,-214},{870,-214},{870,-145},{884,-145}}, color=
         {0,0,127}));
  connect(HumidityAfterCooler.phi, coolerController.phiMeas) annotation (Line(
        points={{1119,-110},{1004,-110},{1004,-210},{874,-210},{874,-152.5},{884,
          -152.5}}, color={0,0,127}));
  connect(supplyPressure.port, vol.ports[4]) annotation (Line(points={{1524,-92},
          {1524,-80},{1493,-80}}, color={0,127,255}));
  connect(supplyPressure.p, coolerController.pSupply) annotation (Line(points={{
          1513,-102},{1446,-102},{1446,-258},{866,-258},{866,-107.25},{884.21,-107.25}},
        color={0,0,127}));
  connect(supplyAirTemperatureSetPoint.y, coolerController.TSetSupply)
    annotation (Line(points={{781,-364},{862,-364},{862,-115.25},{884.21,-115.25}},
        color={0,0,127}));
  connect(coolerPressure.port, TemperatureAfterCooler.port_a) annotation (Line(
        points={{996,-94},{996,-80},{1080,-80}}, color={0,127,255}));
  connect(coolerPressure.p, coolerController.pCooler) annotation (Line(points={{
          985,-104},{932,-104},{932,-96},{874,-96},{874,-137.5},{884,-137.5}},
        color={0,0,127}));
  connect(supplyAirTemperatureSetPoint.y, coolerController.TSetCooler)
    annotation (Line(points={{781,-364},{862,-364},{862,-130},{884.21,-130}},
        color={0,0,127}));
  connect(supplyAirHumiditySetPoint.y, coolerController.phiSet) annotation (
      Line(points={{781,-310},{812,-310},{854,-310},{854,-123},{884,-123}},
        color={0,0,127}));
  connect(HrcValve.y, heatRecovery.opening)
    annotation (Line(points={{-52,-20},{-68,-20},{-85,-20}}, color={0,0,127}));
  connect(IntakeAirOutletTemp.T, heatRecovery.T_HRC) annotation (Line(points={{70,
          -91},{70,-102},{100,-102},{100,16},{-91,16},{-91,-10}}, color={0,0,127}));
  connect(supplyAirTemperatureSetPoint.y, heatRecovery.T_set) annotation (Line(
        points={{781,-364},{800,-364},{800,-380},{-18,-380},{-160,-380},{-160,-13},
          {-106,-13}}, color={0,0,127}));
  connect(OutgoingAirInletTemp.T, heatRecovery.T_extract) annotation (Line(
        points={{132,51},{132,64},{-148,64},{-148,-27},{-106,-27}}, color={0,0,127}));
  connect(IntakeAirInletTemp.T, heatRecovery.T_fresh) annotation (Line(points={{
          -120,-91},{-120,-100},{-142,-100},{-142,-20},{-106,-20}}, color={0,0,127}));
  connect(liquidHumidifier.y, liquidWaterHumidifier.u) annotation (Line(points={
          {280.4,76.4},{296,76.4},{296,46},{282,46}}, color={0,0,127}));
  connect(liquidHumidifier.switchingSignal, booleanConstant.y)
    annotation (Line(points={{258,85},{250,85},{243,85}}, color={255,0,255}));
  connect(PreHeaterValve.y, preHeaterController.y)
    annotation (Line(points={{658,-200},{645,-200}}, color={0,0,127}));
  connect(TemperatureAfterPreHeater.T, preHeaterController.u_m) annotation (
      Line(points={{790,-91},{790,-268},{634,-268},{634,-212}}, color={0,0,127}));
  connect(supplyAirTemperatureSetPoint.y, preHeaterController.u_s) annotation (
      Line(points={{781,-364},{800,-364},{800,-380},{608,-380},{608,-200},{622,-200}},
        color={0,0,127}));
  connect(MainHeaterValve.y, heaterController.y) annotation (Line(points={{1218,
          -202},{1212,-202},{1207,-202}}, color={0,0,127}));
  connect(senTem3.T, heaterController.u_m) annotation (Line(points={{1350,-91},{
          1350,-91},{1350,-128},{1166,-128},{1166,-230},{1196,-230},{1196,-214}},
        color={0,0,127}));
  connect(supplyAirTemperatureSetPoint.y, heaterController.u_s) annotation (
      Line(points={{781,-364},{936,-364},{1134,-364},{1134,-202},{1184,-202}},
        color={0,0,127}));
  connect(steamHumidifier.steamProduction, product4.u2) annotation (Line(points=
         {{1488,-225},{1492,-225},{1492,-182}}, color={0,0,127}));
  connect(supplyPressure.p, steamHumidifier.pSupply) annotation (Line(points={{1513,
          -102},{1484,-102},{1446,-102},{1446,-211.35},{1458.15,-211.35}},
        color={0,0,127}));
  connect(supplyAirTemperatureSetPoint.y, steamHumidifier.TSetSupply)
    annotation (Line(points={{781,-364},{984,-364},{1448,-364},{1448,-216.15},{1458.15,
          -216.15}}, color={0,0,127}));
  connect(steamHumidifier.phiSet, supplyAirHumiditySetPoint.y) annotation (Line(
        points={{1458,-220.8},{1450,-220.8},{1450,-366},{822,-366},{822,-310},{781,
          -310}}, color={0,0,127}));
  connect(supplyPressure.p, steamHumidifier.pMeas) annotation (Line(points={{1513,
          -102},{1474,-102},{1446,-102},{1446,-229.5},{1458,-229.5}}, color={0,0,
          127}));
  connect(OugoingAirOutletTemp.T, steamHumidifier.TMeas) annotation (Line(
        points={{1550,-91},{1550,-91},{1550,-118},{1550,-152},{1442,-152},{1442,
          -234},{1458,-234}}, color={0,0,127}));
  connect(SupplyHumidity.phi, steamHumidifier.phiMeas) annotation (Line(points={
          {1579,-110},{1570,-110},{1570,-148},{1440,-148},{1440,-238.5},{1458,-238.5}},
        color={0,0,127}));
  connect(fanMassFlowRate.y, exhaustFan.m_flow_in) annotation (Line(points={{441,
          -20},{470.2,-20},{470.2,28}}, color={0,0,127}));
  connect(fanMassFlowRate.y, supplyFan.m_flow_in) annotation (Line(points={{441,
          -20},{469.8,-20},{469.8,-68}}, color={0,0,127}));
  connect(reciculationValve.y, circDamperOpening.y) annotation (Line(points={{
          -438,-2.33147e-015},{-418,-2.33147e-015},{-418,0},{-397,0}}, color={0,
          0,127}));
  connect(exhaustDamperOpening.y, outletValve.y)
    annotation (Line(points={{-465,80},{-490,80},{-490,52}}, color={0,0,127}));
  connect(freshDamperOpening.y, outsideAirInletValve.y) annotation (Line(points
        ={{-499,-130},{-490,-130},{-490,-92}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-640,-440},
            {1860,340}})),                                       Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-640,-440},{1860,340}})),
    experiment(
      StopTime=86400,
      Interval=10,
      __Dymola_Algorithm="Lsodar"));
end CompletePhysicalAHU;
