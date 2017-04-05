within AixLib.Controls.AHUControllers;
model LiquidHumidifier "Controller of a liquid water humidifier"

  parameter Modelica.SIunits.Time pulseTime = 300 "Pulse time";
  parameter Modelica.SIunits.Time holdTime = 60 "Hold time";
  parameter Real decreaseParameter = -0.02 "Parameter for tuning the exponential decrease over time";


  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{-56,40},{-36,60}})));
  Modelica.Blocks.Logical.GreaterEqual less
    annotation (Placement(transformation(extent={{-38,-80},{-58,-60}})));
  Modelica.Blocks.Interfaces.BooleanInput switchingSignal "true = switch on"
    annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
  Modelica.Blocks.Sources.Constant OutputSignalBase(k=1)
    annotation (Placement(transformation(extent={{0,80},{20,100}})));
  Modelica.Blocks.Logical.Less          lessThreshold
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Blocks.Logical.Switch ConstantDecreaseSwitch
    annotation (Placement(transformation(extent={{66,40},{86,60}})));
  Modelica.Blocks.Logical.Switch OnOfflineSwitch
    annotation (Placement(transformation(extent={{74,-12},{94,8}})));
  Modelica.Blocks.Sources.Constant OutputSignalOffline(k=0)
    annotation (Placement(transformation(extent={{18,-80},{38,-60}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{94,-46},{114,-26}})));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop
    annotation (Placement(transformation(extent={{-88,34},{-68,54}})));
  Modelica.Blocks.Logical.Pre pre1
    annotation (Placement(transformation(extent={{-72,-80},{-92,-60}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Sources.RealExpression pulseTimeSource(y=pulseTime)
    "Outputs the pulse time" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-5,-79})));
  Modelica.Blocks.Sources.RealExpression holdTimeSource(y=holdTime)
    "Outputs the hold time" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-49,24})));
  Modelica.Blocks.Math.Exp exp
    annotation (Placement(transformation(extent={{38,-40},{58,-20}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{4,-40},{24,-20}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{34,10},{54,30}})));
  Modelica.Blocks.Sources.RealExpression decreaseParameterSource(y=
        decreaseParameter) "Outputs the decreaseParameter" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-13,-36})));
equation
  connect(timer.y, less.u1) annotation (Line(points={{-35,50},{-30,50},{-30,-70},
          {-36,-70}},      color={0,0,127}));
  connect(lessThreshold.y, ConstantDecreaseSwitch.u2)
    annotation (Line(points={{21,50},{21,50},{64,50}},
                                               color={255,0,255}));
  connect(OutputSignalBase.y, ConstantDecreaseSwitch.u1) annotation (Line(
        points={{21,90},{40,90},{40,58},{64,58}}, color={0,0,127}));
  connect(rSFlipFlop.Q, timer.u) annotation (Line(points={{-67,50},{-67,50},{-58,
          50}},       color={255,0,255}));
  connect(less.y, pre1.u)
    annotation (Line(points={{-59,-70},{-66,-70},{-70,-70}},
                                                     color={255,0,255}));
  connect(pre1.y, and1.u2) annotation (Line(points={{-93,-70},{-93,-70},{-100,-70},
          {-100,-38},{-82,-38}},            color={255,0,255}));
  connect(timer.y, lessThreshold.u1)
    annotation (Line(points={{-35,50},{-2,50}}, color={0,0,127}));
  connect(pulseTimeSource.y, less.u2)
    annotation (Line(points={{-16,-79},{-36,-79},{-36,-78}}, color={0,0,127}));
  connect(switchingSignal, rSFlipFlop.S) annotation (Line(points={{-120,50},{-120,
          50},{-90,50}},  color={255,0,255}));
  connect(switchingSignal, and1.u1) annotation (Line(points={{-120,50},{-100,50},
          {-100,-30},{-82,-30}},  color={255,0,255}));

  connect(OutputSignalOffline.y, OnOfflineSwitch.u3) annotation (Line(points={{39,
          -70},{68,-70},{68,-11},{72,-11},{72,-10}}, color={0,0,127}));
  connect(ConstantDecreaseSwitch.y, OnOfflineSwitch.u1) annotation (Line(points=
         {{87,50},{98,50},{98,32},{68,32},{68,6},{72,6}}, color={0,0,127}));
  connect(rSFlipFlop.Q, OnOfflineSwitch.u2) annotation (Line(points={{-67,50},{-64,
          50},{-64,28},{-64,10},{-64,-2},{72,-2}}, color={255,0,255}));
  connect(and1.y, rSFlipFlop.R) annotation (Line(points={{-59,-30},{-38,-30},{-38,
          -6},{-96,-6},{-96,38},{-90,38}}, color={255,0,255}));
  connect(OnOfflineSwitch.y, y) annotation (Line(points={{95,-2},{100,-2},{100,-18},
          {88,-18},{88,-36},{104,-36}}, color={0,0,127}));
  connect(product.y, exp.u)
    annotation (Line(points={{25,-30},{36,-30}}, color={0,0,127}));
  connect(timer.y, product.u1) annotation (Line(points={{-35,50},{-30,50},{-30,-24},
          {2,-24}}, color={0,0,127}));
  connect(product.u2, decreaseParameterSource.y)
    annotation (Line(points={{2,-36},{-2,-36}}, color={0,0,127}));
  connect(exp.y, product1.u2) annotation (Line(points={{59,-30},{62,-30},{62,-10},
          {18,-10},{18,14},{32,14}}, color={0,0,127}));
  connect(product1.y, ConstantDecreaseSwitch.u3) annotation (Line(points={{55,20},
          {58,20},{58,42},{64,42}}, color={0,0,127}));
  connect(holdTimeSource.y, lessThreshold.u2) annotation (Line(points={{-38,24},
          {-22,24},{-22,42},{-2,42}}, color={0,0,127}));
  connect(OutputSignalBase.y, product1.u1) annotation (Line(points={{21,90},{28,
          90},{28,26},{32,26}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>With this block, a humidifier can be pulsed in various time intervals.</p>
<p>This block will turn the humidifier on at full power for the duration specified in hold time when the input signal is greater than or equal to 0.5 and then decrease the amount of evaporated water exponentially until the pulse time runs out. If the input is still equal to or greater than 0.5, the process is repeated.</p>
<p>If the input changes to 0 at any point during one pulse time, the pulse is executed until the pulse time runs out and then NOT repeated.</p>
<p>If the input changes again to turn the pulse on at any time after the pulse time has expired, the pulse immedeately starts again.</p>
</html>"));
end LiquidHumidifier;
