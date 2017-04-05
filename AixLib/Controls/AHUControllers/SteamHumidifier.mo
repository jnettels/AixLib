within AixLib.Controls.AHUControllers;
model SteamHumidifier "Controller for a steam humidifier"

  Utilities.Psychrometrics.X_pTphi calcActualFraction
    "calculates the actual mass fraction of water"
    annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  Utilities.Psychrometrics.X_pTphi calcSetFraction
    "calculates the set point mass fraction of water"
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
  Modelica.Blocks.Interfaces.RealInput phiMeas(final unit="1", min=0)
    "Relative humidity measurement at humidifier outlet"
    annotation (Placement(transformation(extent={{-116,-106},{-84,-74}})));
  Modelica.Blocks.Interfaces.RealInput phiSet(final unit="1", min=0)
    "Relative humidity set point"
    annotation (Placement(transformation(extent={{-114,14},{-86,42}})));
  Modelica.Blocks.Interfaces.RealInput pMeas(
    final quantity="Pressure",
    final unit="Pa",
    min=0) "Pressure at humidifier outlet"
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
    min=0) "Temperature at humidifier outlet" annotation (Placement(
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
  Continuous.LimPID humidificationController(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=100,
    reverseAction=false) "Controls humidification"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput steamProduction
    "Relative steam production"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  connect(pSupply, calcSetFraction.p_in) annotation (Line(points={{-99,91},{-78,
          91},{-78,66},{-62,66}}, color={0,0,127}));
  connect(TSetSupply, calcSetFraction.T)
    annotation (Line(points={{-99,59},{-78,60},{-62,60}}, color={0,0,127}));
  connect(phiSet, calcSetFraction.phi) annotation (Line(points={{-100,28},{-78,28},
          {-78,54},{-62,54}}, color={0,0,127}));
  connect(pMeas, calcActualFraction.p_in) annotation (Line(points={{-100,-30},{-100,
          -30},{-78,-30},{-78,-54},{-62,-54}}, color={0,0,127}));
  connect(TMeas, calcActualFraction.T) annotation (Line(points={{-100,-60},{-82,
          -60},{-62,-60}}, color={0,0,127}));
  connect(phiMeas, calcActualFraction.phi) annotation (Line(points={{-100,-90},{
          -78,-90},{-78,-66},{-62,-66}}, color={0,0,127}));
  connect(calcActualFraction.X[1], humidificationController.u_m) annotation (
      Line(points={{-39,-60},{-34,-60},{0,-60},{0,-12}}, color={0,0,127}));
  connect(calcSetFraction.X[1], humidificationController.u_s) annotation (Line(
        points={{-39,60},{-30,60},{-30,0},{-12,0}}, color={0,0,127}));
  connect(humidificationController.y, steamProduction)
    annotation (Line(points={{11,0},{100,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This model controls both the steam mass flow rate of a steam humidifier.</p>
</html>"));
end SteamHumidifier;
