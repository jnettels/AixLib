within AixLib.Airflow.PhysicalAirHandlingUnit.BaseClasses;
model AdvancedHumidifierBaseClass
  "Base class for advanced humidifiers or dehumidifiers"
  extends AixLib.Fluid.Interfaces.PartialTwoPortInterface(redeclare package
      Medium =                                                                       MediumAir);

  replaceable package MediumAir = AixLib.Media.Air;


  parameter Medium.Temperature T_start=Medium.T_default
    "Start value of temperature";

  Fluid.MassExchangers.Humidifier_u dehumidifier(
    redeclare package Medium = MediumAir,
    dp_nominal=50,
    m_flow_nominal=m_flow_nominal,
    T_start=T_start,
    T=293.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={0,0})));
  Modelica.Blocks.Interfaces.BooleanInput onOff "true=on" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));
equation
  connect(port_a, dehumidifier.port_a)
    annotation (Line(points={{-100,0},{-56,0},{-10,0}}, color={0,127,255}));
  connect(dehumidifier.port_b, port_b)
    annotation (Line(points={{10,0},{100,0}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-96,5},{105,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-70,80},{70,-80}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end AdvancedHumidifierBaseClass;
