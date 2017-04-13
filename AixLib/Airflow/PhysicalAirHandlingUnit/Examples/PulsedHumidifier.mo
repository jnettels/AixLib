within AixLib.Airflow.PhysicalAirHandlingUnit.Examples;
model PulsedHumidifier "Example of pulsed humidifier"
  extends Modelica.Icons.Example;

    replaceable package MediumAir = AixLib.Media.Air;
  replaceable package MediumWater = AixLib.Media.Water;

  BaseClasses.PulsedLiquidHumidifier pulsedHumidifier(
    T_start=T_air.k,
    redeclare package MediumAir = MediumAir,
    m_flow_nominal=m_flow_air.k,
    mWat_flow_nominal=0.001,
    exponent=-0.001)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Fluid.Sources.MassFlowSource_T      freshAirSource(
    redeclare package Medium = MediumAir,
    m_flow=0.3,
    use_X_in=true,
    use_T_in=true,
    use_m_flow_in=true,
    nPorts=1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Fluid.Sources.Boundary_pT airSink(redeclare package Medium = MediumAir,
      nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,0})));
  Fluid.Sensors.RelativeHumidity senHumOut(redeclare package Medium = MediumAir)
    annotation (Placement(transformation(extent={{4,20},{24,40}})));
  Fluid.Sensors.Temperature senTemAirOut(redeclare package Medium = MediumAir)
    annotation (Placement(transformation(extent={{32,20},{52,40}})));
  Modelica.Blocks.Sources.Constant T_air(k=273.15 + 20)
    annotation (Placement(transformation(extent={{-100,-8},{-76,16}})));
  Modelica.Blocks.Sources.Constant X[2](k={0.005,0.995})
    annotation (Placement(transformation(extent={{-100,-52},{-76,-28}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Sources.Constant m_flow_air(k=1200*1.2/3600)
    annotation (Placement(transformation(extent={{-100,38},{-74,64}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits=4)
    annotation (Placement(transformation(extent={{64,52},{100,72}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin
    annotation (Placement(transformation(extent={{56,20},{76,40}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue2(significantDigits=4)
    annotation (Placement(transformation(extent={{64,66},{100,86}})));
  Modelica.Blocks.Sources.SawTooth sawTooth(amplitude=2700, period=2700)
    annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  Modelica.Blocks.Sources.Constant const(k=2700)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{0,-80},{20,-60}})));
equation
  connect(X.y, freshAirSource.X_in) annotation (Line(points={{-74.8,-40},{-70,-40},
          {-70,-4},{-62,-4}}, color={0,0,127}));
  connect(T_air.y, freshAirSource.T_in)
    annotation (Line(points={{-74.8,4},{-74.8,4},{-62,4}}, color={0,0,127}));
  connect(senTemAirOut.T, fromKelvin.Kelvin)
    annotation (Line(points={{49,30},{54,30}}, color={0,0,127}));
  connect(fromKelvin.Celsius, realValue.numberPort) annotation (Line(points={{77,
          30},{84,30},{84,50},{48,50},{48,62},{61.3,62}}, color={0,0,127}));
  connect(m_flow_air.y, freshAirSource.m_flow_in) annotation (Line(points={{-72.7,
          51},{-60,51},{-60,20},{-72,20},{-72,8},{-60,8}}, color={0,0,127}));
  connect(senHumOut.phi, realValue2.numberPort) annotation (Line(points={{25,30},
          {26,30},{26,76},{61.3,76}}, color={0,0,127}));
  connect(pulsedHumidifier.port_b, airSink.ports[1])
    annotation (Line(points={{10,0},{46,0},{80,0}}, color={0,127,255}));
  connect(pulsedHumidifier.port_b, senTemAirOut.port) annotation (Line(points={
          {10,0},{42,0},{42,12},{42,20}}, color={0,127,255}));
  connect(pulsedHumidifier.port_b, senHumOut.port)
    annotation (Line(points={{10,0},{14,0},{14,20}}, color={0,127,255}));
  connect(booleanConstant.y, pulsedHumidifier.onOff) annotation (Line(points={{
          -19,50},{-10,50},{0,50},{0,10}}, color={255,0,255}));
  connect(freshAirSource.ports[1], pulsedHumidifier.port_a)
    annotation (Line(points={{-40,0},{-25,0},{-10,0}}, color={0,127,255}));
  connect(const.y, add.u1) annotation (Line(points={{-19,-50},{-10,-50},{-10,
          -64},{-2,-64}}, color={0,0,127}));
  connect(sawTooth.y, add.u2) annotation (Line(points={{-19,-90},{-10,-90},{-10,
          -76},{-2,-76}}, color={0,0,127}));
  connect(add.y, pulsedHumidifier.u1) annotation (Line(points={{21,-70},{32,-70},
          {32,-40},{0,-40},{0,-10}}, color={0,0,127}));
  annotation (experiment(StopTime=86400, Interval=10));
end PulsedHumidifier;
