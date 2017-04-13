within AixLib.Airflow.PhysicalAirHandlingUnit.BaseClasses;
model PulsedLiquidHumidifier
  "Model of a liquid water humidifier with storage that water slowly evaporates from"
  extends AixLib.Airflow.PhysicalAirHandlingUnit.BaseClasses.AdvancedHumidifierBaseClass(
      dehumidifier(mWat_flow_nominal=mWat_flow_nominal));

  parameter Modelica.SIunits.MassFlowRate mWat_flow_nominal=0.02 "Nominal water mass flow rate";
  parameter Real exponent = 0.01 "Exponent of exp function";


  Modelica.Blocks.Math.Exp exp
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=0)
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  Modelica.Blocks.Math.Gain gain(k=exponent)
                                          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,-70})));
  Modelica.Blocks.Interfaces.RealInput u1
                         "Input signal connector" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-100})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-50,-24},{-30,-4}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-80,8},{-60,28}})));
equation
  connect(exp.y, limiter.u)
    annotation (Line(points={{-59,-40},{-56,-40},{-52,-40}},
                                                   color={0,0,127}));
  connect(gain.y, exp.u) annotation (Line(points={{-81,-70},{-90,-70},{-90,-40},
          {-82,-40}}, color={0,0,127}));
  connect(gain.u, u1)
    annotation (Line(points={{-58,-70},{0,-70},{0,-100}}, color={0,0,127}));
  connect(dehumidifier.u, add.y) annotation (Line(points={{-12,-6},{-20,-6},{-20,
          -14},{-29,-14}}, color={0,0,127}));
  connect(limiter.y, add.u2) annotation (Line(points={{-29,-40},{-20,-40},{-20,-26},
          {-60,-26},{-60,-20},{-52,-20}}, color={0,0,127}));
  connect(const.y, add.u1) annotation (Line(points={{-59,18},{-56,18},{-56,-8},{
          -52,-8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PulsedLiquidHumidifier;
