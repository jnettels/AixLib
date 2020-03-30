within AixLib.Utilities.Sources.InternalGains.Examples.InternalGains.BaseClasses;
model Humans "Base class with bounday conditions for humans' examples"
  extends Modelica.Icons.Example;
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature varTempRoom annotation(Placement(transformation(extent={{-84,42},{-64,62}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0; 28740,0; 28800,1; 43200,1; 43260,0; 46800,0; 46860,1; 64800,1; 64860,0; 86400,0])             annotation(Placement(transformation(extent = {{-82, -26}, {-62, -6}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=2,
    freqHz=1/(24*3600),
    offset=273.15 + 20,
    phase(displayUnit="deg") = -3.1415926535898)                                                                                                  annotation(Placement(transformation(extent={{-70,18},{-82,30}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensorConv annotation (Placement(transformation(extent={{38,12},{52,26}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemp(T=293.15)   annotation(Placement(transformation(extent={{80,4},{60,24}})));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensorRad annotation (Placement(transformation(extent={{18,-16},{34,0}})));
  Modelica.Blocks.Math.MultiSum sumQ_flows(nu=2) annotation (Placement(transformation(extent={{34,-70},{46,-58}})));
  Modelica.Blocks.Interfaces.RealOutput HeatOut annotation(Placement(transformation(extent = {{58, -74}, {78, -54}})));
  replaceable AixLib.Utilities.Sources.InternalGains.Humans.BaseClasses.PartialHuman partialHuman
  constrainedby AixLib.Utilities.Sources.InternalGains.Humans.BaseClasses.PartialHuman(roomArea=20) annotation (Placement(transformation(extent={{-16,-12},{10,14}})), __Dymola_choicesAllMatching=true);
equation
  connect(sine.y,varTempRoom. T) annotation(Line(points={{-82.6,24},{-92,24},{-92,52},{-86,52}},          color = {0, 0, 127}));
  connect(heatFlowSensorConv.port_b,fixedTemp. port) annotation (Line(points={{52,19},{56,19},{56,14},{60,14}}, color={191,0,0}));
  connect(fixedTemp.port,heatFlowSensorRad. port_b) annotation (Line(points={{60,14},{56,14},{56,-8},{34,-8}},
                                                                                                             color={191,0,0}));
  connect(heatFlowSensorConv.Q_flow,sumQ_flows. u[1]) annotation (Line(points={{45,12},{46,12},{46,-50},{30,-50},{30,-61.9},{34,-61.9}}, color={0,0,127}));
  connect(heatFlowSensorRad.Q_flow,sumQ_flows. u[2]) annotation (Line(points={{26,-16},{26,-66.1},{34,-66.1}},                          color={0,0,127}));
  connect(sumQ_flows.y,HeatOut)  annotation (Line(points={{47.02,-64},{68,-64}}, color={0,0,127}));
  connect(varTempRoom.port, partialHuman.TRoom) annotation (Line(points={{-64,52},{-40,52},{-40,12.7},{-14.7,12.7}}, color={191,0,0}));
  connect(combiTimeTable.y[1], partialHuman.schedule) annotation (Line(points={{-61,-16},{-40,-16},{-40,1},{-16,1}}, color={0,0,127}));
  connect(heatFlowSensorConv.port_a, partialHuman.convHeat) annotation (Line(points={{38,19},{24,19},{24,8.8},{8.7,8.8}}, color={191,0,0}));
  connect(heatFlowSensorRad.port_a, partialHuman.radHeat) annotation (Line(points={{18,-8},{18,-6.8},{8.7,-6.8}}, color={191,0,0}));
end Humans;
