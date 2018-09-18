within AixLib.Controls.HeatPump.BaseClasses;
partial model partialTSetToNSet
  "Partial model to convert set temperature to compressor speed of heat pump"

  parameter Boolean use_secHeaGen "True to choose a bivalent system" annotation(choices(checkBox=true));
  parameter Boolean use_bivPar "Switch between bivalent parallel and bivalent alternative control" annotation (Dialog(enable=use_secHeaGen), choices(choice=true "Parallel",
      choice=false "Alternativ",
      radioButtons=true));

  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal
    "Nominal heat flow rate of second heat generator. Used to calculate input singal y";
 Utilities.Logical.SmoothSwitch swiNullHP "If HP is off, zero is passed"
    annotation (Placement(transformation(extent={{66,-10},{86,10}})));
  Modelica.Blocks.Sources.Constant conZer(k=0) "If an error occurs, the compressor speed is set to zero"
    annotation (Placement(transformation(extent={{38,-24},{50,-12}})));
  Modelica.Blocks.Interfaces.RealInput TSet "Set temperature"
    annotation (Placement(transformation(extent={{-132,44},{-100,76}})));
  Modelica.Blocks.Interfaces.RealOutput nOut "Relative speed of compressor. From 0 to 1"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Controls.Interfaces.HeatPumpControlBus sigBusHP
    annotation (Placement(transformation(extent={{-124,-42},{-90,-12}})));
  Modelica.Blocks.Interfaces.RealOutput ySecHeaGen if use_secHeaGen
                                                   "Relative power of second heat generator, from 0 to 1"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={0,110})));
  Modelica.Blocks.Interfaces.RealInput TAct "Actual temperature, control variable"
    annotation (Placement(transformation(
        extent={{16,16},{-16,-16}},
        rotation=180,
        origin={-116,-80})));
  Utilities.Logical.SmoothSwitch swiNullsecHeaGen if use_secHeaGen
    "If second heater is off, zero is passed" annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={0,86})));
  Modelica.Blocks.Math.Gain gain(final k=1/Q_flow_nominal) if
                                    use_secHeaGen
    annotation (Placement(transformation(extent={{-26,62},{-14,74}})));
 Modelica.Blocks.Sources.RealExpression calcQHeat(final y=sigBusHP.m_flow_co*(
        sigBusHP.T_ret_co - sigBusHP.T_flow_co)*4180) if use_secHeaGen
    annotation (Placement(transformation(extent={{-80,64},{-38,100}})));
equation
  connect(conZer.y, swiNullHP.u3) annotation (Line(points={{50.6,-18},{58,-18},
          {58,-8},{64,-8}}, color={0,0,127}));
  connect(swiNullHP.y, nOut)
    annotation (Line(points={{87,0},{110,0}}, color={0,0,127}));
  connect(swiNullsecHeaGen.y, ySecHeaGen)
    annotation (Line(points={{0,94.8},{0,110}},   color={0,0,127}));
  connect(conZer.y, swiNullsecHeaGen.u3) annotation (Line(points={{50.6,-18},{
          58,-18},{58,76.4},{6.4,76.4}},  color={0,0,127}));
  connect(gain.y, swiNullsecHeaGen.u1) annotation (Line(points={{-13.4,68},{-6,
          68},{-6,76.4},{-6.4,76.4}},
                                color={0,0,127}));
  connect(gain.u, calcQHeat.y) annotation (Line(points={{-27.2,68},{-32,68},{
          -32,82},{-35.9,82}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                            Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={175,175,175},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          fillColor={255,255,170}), Text(
          extent={{-98,30},{100,-16}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),      Diagram(coordinateSystem(preserveAspectRatio=false)));
end partialTSetToNSet;
