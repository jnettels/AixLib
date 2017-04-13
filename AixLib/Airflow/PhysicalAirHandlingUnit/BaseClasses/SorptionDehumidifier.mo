within AixLib.Airflow.PhysicalAirHandlingUnit.BaseClasses;
model SorptionDehumidifier
  "Simple model of a sorption-based dehumidifier including regeneration"
  extends AdvancedHumidifierBaseClass(dehumidifier(mWat_flow_nominal=
          mWat_flow_nominal));

    replaceable package MediumWater = AixLib.Media.Water;

  parameter Real deltaX=0.002 "Maximum dehumidification in kg/kg_moistAir";
  parameter Real suppliedGainedHeatRatio=1 "Heat flow rate that has to be supplied to regenerate divided
by heat flow rate gained in adsorption";


  parameter Modelica.SIunits.MassFlowRate mWat_flow_nominal=-m_flow_nominal*
      deltaX "Nominal water mass flow rate";

        parameter Modelica.SIunits.Time period(
    final min=Modelica.Constants.small,
    start=1) = 3600 "Period of regenration cycle";
  parameter Real width(
    final min=Modelica.Constants.small,
    final max=100) = 50 "Width of pulse in % of period";


  Modelica.Blocks.Sources.Constant zero(k=0)
    annotation (Placement(transformation(extent={{-94,-58},{-80,-44}})));
  Modelica.Blocks.Sources.Constant one(k=1)
    annotation (Placement(transformation(extent={{-94,-29},{-80,-15}})));
  Modelica.Blocks.Logical.Switch switchOnDehumidification
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Logical.Switch switchOnRegeneration
    annotation (Placement(transformation(extent={{-60,-60},{-40,-80}})));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium =
        MediumWater,
    T_start=T_start,
    use_portsData=false,
    use_HeatTransfer=true,
    V=0.01,
    nPorts=2) annotation (Placement(transformation(extent={{36,-64},{56,-44}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(extent={{8,-64},{28,-44}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(
    redeclare final package Medium = MediumWater,
     m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0),
     h_outflow(start = Medium.h_default))
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(
    redeclare final package Medium = MediumWater,
    m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0),
     h_outflow(start = Medium.h_default))
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{110,-110},{90,-90}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=
        suppliedGainedHeatRatio*dehumidifier.mWat_flow_nominal*2500000)
    annotation (Placement(transformation(extent={{-71,-13},{71,13}},
        rotation=180,
        origin={39,65})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-68,71})));
  Modelica.Blocks.Sources.Pulse pulse(width=width, period=period)
    annotation (Placement(transformation(extent={{-7,7},{7,-7}},
        rotation=180,
        origin={-25,92})));
equation
  connect(switchOnDehumidification.y, dehumidifier.u) annotation (Line(points={{-39,-30},
          {-26,-30},{-26,-6},{-12,-6}},          color={0,0,127}));
  connect(switchOnDehumidification.u1,one. y) annotation (Line(points={{-62,-22},
          {-68,-22},{-79.3,-22}}, color={0,0,127}));
  connect(zero.y,switchOnDehumidification. u3) annotation (Line(points={{-79.3,-51},
          {-68,-51},{-68,-38},{-62,-38}}, color={0,0,127}));
  connect(zero.y,switchOnRegeneration. u3) annotation (Line(points={{-79.3,-51},
          {-68,-51},{-68,-62},{-62,-62}}, color={0,0,127}));
  connect(switchOnDehumidification.u2, onOff) annotation (Line(points={{-62,-30},
          {-72,-30},{-72,40},{0,40},{0,100}}, color={255,0,255}));
  connect(switchOnRegeneration.u2, onOff) annotation (Line(points={{-62,-70},{-72,
          -70},{-72,40},{0,40},{0,100}}, color={255,0,255}));
  connect(port_a1,volume. ports[1]) annotation (Line(points={{0,-100},{0,-100},{
          0,-76},{0,-74},{44,-74},{44,-64}}, color={0,127,255}));
  connect(volume.heatPort,prescribedHeatFlow. port)
    annotation (Line(points={{36,-54},{28,-54}}, color={191,0,0}));
  connect(product.y, switchOnRegeneration.u1) annotation (Line(points={{-79,71},
          {-96,71},{-96,-78},{-62,-78}}, color={0,0,127}));
  connect(switchOnRegeneration.y, prescribedHeatFlow.Q_flow) annotation (Line(
        points={{-39,-70},{-10,-70},{-10,-54},{8,-54}}, color={0,0,127}));
  connect(realExpression.y, product.u1)
    annotation (Line(points={{-39.1,65},{-48,65},{-56,65}}, color={0,0,127}));
  connect(volume.ports[2], port_b1) annotation (Line(points={{48,-64},{48,-64},{
          48,-74},{100,-74},{100,-100}}, color={0,127,255}));
  connect(pulse.y, product.u2) annotation (Line(points={{-32.7,92},{-46,92},{-46,
          77},{-56,77}}, color={0,0,127}));
end SorptionDehumidifier;
