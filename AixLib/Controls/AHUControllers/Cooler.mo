within AixLib.Controls.AHUControllers;
model Cooler "Controller for a cooler including dehumidification"

  Utilities.Psychrometrics.X_pTphi calcActualFraction
    "calculates the actual mass fraction of water"
    annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  Utilities.Psychrometrics.X_pTphi calcSetFraction
    "calculates the set point mass fraction of water"
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
  Modelica.Blocks.Interfaces.RealInput phiMeas(final unit="1", min=0)
    "Relative humidity measurement at cooler inlet"
    annotation (Placement(transformation(extent={{-116,-106},{-84,-74}})));
  Modelica.Blocks.Interfaces.RealInput phiSet(final unit="1", min=0)
    "Relative humidity set point"
    annotation (Placement(transformation(extent={{-114,14},{-86,42}})));
  Modelica.Blocks.Interfaces.RealInput pCooler(
    final quantity="Pressure",
    final unit="Pa",
    min=0) "Pressure at entrance of cooler"
    annotation (Placement(transformation(extent={{-116,-46},{-84,-14}})));
  Modelica.Blocks.Interfaces.RealInput pSupply(
    final quantity="Pressure",
    final unit="Pa",
    min=0) "Pressure at supply point"
    annotation (Placement(transformation(extent={{-114,76},{-84,106}})));
  Modelica.Blocks.Interfaces.RealInput TMeas(
    final quantity="ThermodynamicTemperature",
    final unit="K",
    displayUnit="degC",
    min=0) "Temperature at cooler outlet" annotation (Placement(
        transformation(
        origin={-100,-60},
        extent={{16,16},{-16,-16}},
        rotation=180)));
  Modelica.Blocks.Interfaces.RealInput TSetSupply(
    final quantity="ThermodynamicTemperature",
    final unit="K",
    displayUnit="degC",
    min=0) "Supply temperature set point" annotation (Placement(
        transformation(
        origin={-99,59},
        extent={{15,15},{-15,-15}},
        rotation=180)));
  Continuous.LimPID coolingController(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=100,
    reverseAction=true)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Continuous.LimPID dehumidificationController(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=100,
    reverseAction=true) "Controls dehumidification"
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Blocks.Interfaces.RealInput TSetCooler(
    final quantity="ThermodynamicTemperature",
    final unit="K",
    displayUnit="degC",
    min=0) "Cooler temperature set point" annotation (Placement(
        transformation(
        origin={-99,0},
        extent={{15,15},{-15,-15}},
        rotation=180)));
  Modelica.Blocks.Math.Max max
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Interfaces.RealOutput valveOpening "CoolerValveOpening"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(pSupply, calcSetFraction.p_in) annotation (Line(points={{-99,91},{-78,
          91},{-78,66},{-62,66}}, color={0,0,127}));
  connect(TSetSupply, calcSetFraction.T)
    annotation (Line(points={{-99,59},{-78,60},{-62,60}}, color={0,0,127}));
  connect(phiSet, calcSetFraction.phi) annotation (Line(points={{-100,28},{-78,28},
          {-78,54},{-62,54}}, color={0,0,127}));
  connect(pCooler, calcActualFraction.p_in) annotation (Line(points={{-100,-30},
          {-100,-30},{-78,-30},{-78,-54},{-62,-54}}, color={0,0,127}));
  connect(TMeas, calcActualFraction.T) annotation (Line(points={{-100,-60},{-82,
          -60},{-62,-60}}, color={0,0,127}));
  connect(phiMeas, calcActualFraction.phi) annotation (Line(points={{-100,-90},{
          -78,-90},{-78,-66},{-62,-66}}, color={0,0,127}));
  connect(calcActualFraction.X[1], dehumidificationController.u_m) annotation (
      Line(points={{-39,-60},{-32,-60},{-32,-80},{-10,-80},{-10,-72}}, color={0,
          0,127}));
  connect(calcSetFraction.X[1], dehumidificationController.u_s) annotation (
      Line(points={{-39,60},{-30,60},{-30,-60},{-22,-60}}, color={0,0,127}));
  connect(TSetCooler, coolingController.u_s)
    annotation (Line(points={{-99,0},{-2,0}}, color={0,0,127}));
  connect(coolingController.y, max.u1)
    annotation (Line(points={{21,0},{34,0},{34,6},{48,6}}, color={0,0,127}));
  connect(dehumidificationController.y, max.u2) annotation (Line(points={{1,-60},
          {18,-60},{40,-60},{40,-12},{40,-6},{48,-6}}, color={0,0,127}));
  connect(max.y, valveOpening)
    annotation (Line(points={{71,0},{100,0}}, color={0,0,127}));
  connect(TMeas, coolingController.u_m) annotation (Line(points={{-100,-60},{-72,
          -60},{-72,-24},{10,-24},{10,-12}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This model controls both the steam mass fraction and the moist air temperature at the outlet of a cooler.</p>
</html>"));
end Cooler;
