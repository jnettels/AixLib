within AixLib.Airflow.PhysicalAirHandlingUnit.Examples;
model SorptionDehumidifier "Example of sorption dehumidifier"
  extends Modelica.Icons.Example;

    replaceable package MediumAir = AixLib.Media.Air;
  replaceable package MediumWater = AixLib.Media.Water;

  BaseClasses.SorptionDehumidifier sorptionDehumidifier(
    T_start=T_air.k,
    redeclare package MediumAir = MediumAir,
    redeclare package MediumWater = MediumWater,
    m_flow_nominal=m_flow_air.k,
    width=30,
    suppliedGainedHeatRatio=9)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Fluid.Sources.MassFlowSource_T      freshAirSource(
    redeclare package Medium = MediumAir,
    nPorts=1,
    m_flow=0.3,
    use_X_in=true,
    use_T_in=true,
    use_m_flow_in=true)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Fluid.Sources.Boundary_pT airSink(redeclare package Medium = MediumAir,
      nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,0})));
  Fluid.Sensors.MassFraction senMasFraOut(redeclare package Medium = MediumAir)
    annotation (Placement(transformation(extent={{4,20},{24,40}})));
  Fluid.Sensors.Temperature senTemAirOut(redeclare package Medium = MediumAir)
    annotation (Placement(transformation(extent={{32,20},{52,40}})));
  Modelica.Blocks.Sources.Constant T_air(k=273.15 + 20)
    annotation (Placement(transformation(extent={{-100,-8},{-76,16}})));
  Modelica.Blocks.Sources.Constant X[2](k={0.01,0.99})
    annotation (Placement(transformation(extent={{-100,-52},{-76,-28}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Fluid.Sources.MassFlowSource_T waterSource(
    redeclare package Medium = MediumWater,
    nPorts=1,
    m_flow=0.3,
    use_m_flow_in=true,
    use_T_in=true,
    T=353.15)       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-60})));
  Fluid.Sources.Boundary_pT waterSink(redeclare package Medium = MediumWater,
      nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={52,-50})));
  Fluid.Sensors.Temperature senTemWaterOut(redeclare package Medium =
        MediumWater)
    annotation (Placement(transformation(extent={{32,-32},{52,-12}})));
  Modelica.Blocks.Sources.Constant m_flow_air(k=12000*1.2/3600)
    annotation (Placement(transformation(extent={{-100,38},{-74,64}})));
  Modelica.Blocks.Sources.Constant m_flow_water(k=1.8)
    annotation (Placement(transformation(extent={{-60,-100},{-36,-76}})));
  Modelica.Blocks.Sources.Constant T_water(k=273.15 + 80) annotation (Placement(
        transformation(
        extent={{-12,12},{12,-12}},
        rotation=180,
        origin={28,-88})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits=4)
    annotation (Placement(transformation(extent={{64,52},{100,72}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits=4)
    annotation (Placement(transformation(extent={{66,-86},{100,-66}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin
    annotation (Placement(transformation(extent={{56,20},{76,40}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin1
    annotation (Placement(transformation(extent={{56,-32},{76,-12}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits=4)
    annotation (Placement(transformation(extent={{64,66},{100,86}})));
equation
  connect(freshAirSource.ports[1], sorptionDehumidifier.port_a)
    annotation (Line(points={{-40,0},{-40,0},{-10,0}}, color={0,127,255}));
  connect(sorptionDehumidifier.port_b, airSink.ports[1])
    annotation (Line(points={{10,0},{46,0},{80,0}}, color={0,127,255}));
  connect(senMasFraOut.port, sorptionDehumidifier.port_b)
    annotation (Line(points={{14,20},{14,0},{10,0}}, color={0,127,255}));
  connect(senTemAirOut.port, sorptionDehumidifier.port_b)
    annotation (Line(points={{42,20},{42,0},{10,0}}, color={0,127,255}));
  connect(X.y, freshAirSource.X_in) annotation (Line(points={{-74.8,-40},{-70,
          -40},{-70,-4},{-62,-4}},
                              color={0,0,127}));
  connect(T_air.y, freshAirSource.T_in)
    annotation (Line(points={{-74.8,4},{-74.8,4},{-62,4}}, color={0,0,127}));
  connect(booleanConstant.y, sorptionDehumidifier.onOff)
    annotation (Line(points={{-19,50},{0,50},{0,10}}, color={255,0,255}));
  connect(waterSource.ports[1], sorptionDehumidifier.port_a1)
    annotation (Line(points={{0,-50},{0,-10}}, color={0,127,255}));
  connect(sorptionDehumidifier.port_b1, waterSink.ports[1]) annotation (Line(
        points={{10,-10},{22,-10},{22,-50},{42,-50}}, color={0,127,255}));
  connect(senTemWaterOut.port, sorptionDehumidifier.port_b1) annotation (Line(
        points={{42,-32},{22,-32},{22,-12},{22,-10},{10,-10}}, color={0,127,255}));
  connect(m_flow_water.y, waterSource.m_flow_in) annotation (Line(points={{
          -34.8,-88},{-8,-88},{-8,-78},{-8,-70}}, color={0,0,127}));
  connect(T_water.y, waterSource.T_in)
    annotation (Line(points={{14.8,-88},{-4,-88},{-4,-72}}, color={0,0,127}));
  connect(senTemAirOut.T, fromKelvin.Kelvin)
    annotation (Line(points={{49,30},{54,30}}, color={0,0,127}));
  connect(fromKelvin.Celsius, realValue.numberPort) annotation (Line(points={{
          77,30},{84,30},{84,50},{48,50},{48,62},{61.3,62}}, color={0,0,127}));
  connect(senTemWaterOut.T, fromKelvin1.Kelvin)
    annotation (Line(points={{49,-22},{54,-22}}, color={0,0,127}));
  connect(fromKelvin1.Celsius, realValue1.numberPort) annotation (Line(points={
          {77,-22},{84,-22},{84,-68},{56,-68},{56,-76},{63.45,-76}}, color={0,0,
          127}));
  connect(m_flow_air.y, freshAirSource.m_flow_in) annotation (Line(points={{
          -72.7,51},{-60,51},{-60,20},{-72,20},{-72,8},{-60,8}}, color={0,0,127}));
  connect(senMasFraOut.X, realValue2.numberPort) annotation (Line(points={{25,
          30},{28,30},{28,76},{61.3,76}}, color={0,0,127}));
  annotation (experiment(StopTime=86400, Interval=10));
end SorptionDehumidifier;
