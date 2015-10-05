within AixLib.Fluid.MixingVolumes.BaseClasses;
partial model PartialMixingVolume
  "Partial mixing volume with inlet and outlet ports (flow reversal is allowed)"

  extends AixLib.Fluid.Interfaces.LumpedVolumeDeclarations;
  constant Boolean initialize_p = not Medium.singleState
    "= true to set up initial equations for pressure"
    annotation(HideResult=true);

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal(min=0)
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  // Port definitions
  parameter Integer nPorts=0 "Number of ports"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Modelica.SIunits.MassFlowRate m_flow_small(min=0) = 1E-4*abs(m_flow_nominal)
    "Small mass flow rate for regularization of zero flow"
    annotation(Dialog(tab = "Advanced"));
  parameter Boolean allowFlowReversal = true
    "= true to allow flow reversal in medium, false restricts to design direction (ports[1] -> ports[2]). Used only if model has two ports."
    annotation(Dialog(tab="Assumptions"), Evaluate=true);
  parameter Modelica.SIunits.Volume V "Volume";
  parameter Boolean prescribedHeatFlowRate=false
    "Set to true if the model has a prescribed heat flow at its heatPort. If the heat flow rate at the heatPort is only based on temperature difference, then set to false."
   annotation(Evaluate=true,
     Dialog(tab="Assumptions",
      group="Heat transfer"));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nPorts](
      redeclare each package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},
      origin={0,-100})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
    "Heat port for sensible heat input"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.SIunits.Temperature T "Temperature of the fluid";
  Modelica.SIunits.Pressure p "Pressure of the fluid";
  Modelica.SIunits.MassFraction Xi[Medium.nXi]
    "Species concentration of the fluid";
  Medium.ExtraProperty C[Medium.nC](nominal=C_nominal)
    "Trace substance mixture content";
   // Models for the steady-state and dynamic energy balance.
protected
  AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation steBal(
    sensibleOnly = true,
    redeclare final package Medium=Medium,
    final m_flow_nominal = m_flow_nominal,
    final allowFlowReversal = allowFlowReversal,
    final m_flow_small = m_flow_small) if
        useSteadyStateTwoPort "Model for steady-state balance if nPorts=2"
        annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  AixLib.Fluid.Interfaces.ConservationEquation dynBal(
    redeclare final package Medium = Medium,
    final energyDynamics=energyDynamics,
    final massDynamics=massDynamics,
    final p_start=p_start,
    final T_start=T_start,
    final X_start=X_start,
    final C_start=C_start,
    final C_nominal=C_nominal,
    final fluidVolume = V,
    final initialize_p = initialize_p,
    m(start=V*rho_start),
    nPorts=nPorts,
    final mSenFac=mSenFac) if
        not useSteadyStateTwoPort "Model for dynamic energy balance"
    annotation (Placement(transformation(extent={{40,0},{60,20}})));

  // Density at start values, used to compute initial values and start guesses
  parameter Modelica.SIunits.Density rho_start=Medium.density(
   state=state_start) "Density, used to compute start and guess values";
  final parameter Medium.ThermodynamicState state_default = Medium.setState_pTX(
      T=Medium.T_default,
      p=Medium.p_default,
      X=Medium.X_default[1:Medium.nXi]) "Medium state at default values";
  // Density at medium default values, used to compute the size of control volumes
  final parameter Modelica.SIunits.Density rho_default=Medium.density(
    state=state_default) "Density, used to compute fluid mass";
  final parameter Medium.ThermodynamicState state_start = Medium.setState_pTX(
      T=T_start,
      p=p_start,
      X=X_start[1:Medium.nXi]) "Medium state at start values";
  // See info section for why prescribedHeatFlowRate is used here.
  final parameter Boolean useSteadyStateTwoPort=(nPorts == 2) and
      (prescribedHeatFlowRate or (not allowFlowReversal)) and (
      energyDynamics == Modelica.Fluid.Types.Dynamics.SteadyState) and (
      massDynamics == Modelica.Fluid.Types.Dynamics.SteadyState) and (
      substanceDynamics == Modelica.Fluid.Types.Dynamics.SteadyState) and (
      traceDynamics == Modelica.Fluid.Types.Dynamics.SteadyState)
    "Flag, true if the model has two ports only and uses a steady state balance"
    annotation (Evaluate=true);
  // Outputs that are needed to assign the medium properties
  Modelica.Blocks.Interfaces.RealOutput hOut_internal(unit="J/kg")
    "Internal connector for leaving temperature of the component";
  Modelica.Blocks.Interfaces.RealOutput XiOut_internal[Medium.nXi](each unit="1")
    "Internal connector for leaving species concentration of the component";
  Modelica.Blocks.Interfaces.RealOutput COut_internal[Medium.nC](each unit="1")
    "Internal connector for leaving trace substances of the component";

  Modelica.Blocks.Sources.RealExpression QSen_flow(y=heatPort.Q_flow)
    "Block to set sensible heat input into volume"
    annotation (Placement(transformation(extent={{-60,78},{-40,98}})));

equation
  ///////////////////////////////////////////////////////////////////////////
  // asserts
  if not allowFlowReversal then
    assert(ports[1].m_flow > -m_flow_small,
"Model has flow reversal, but the parameter allowFlowReversal is set to false.
  m_flow_small    = " + String(m_flow_small) + "
  ports[1].m_flow = " + String(ports[1].m_flow) + "
");
  end if;
  // Actual definition of port variables.
  //
  // If the model computes the energy and mass balances as steady-state,
  // and if it has only two ports,
  // then we use the same base class as for all other steady state models.
  if useSteadyStateTwoPort then
  connect(steBal.port_a, ports[1]) annotation (Line(
      points={{-20,10},{-22,10},{-22,-60},{0,-60},{0,-100}},
      color={0,127,255}));

  connect(steBal.port_b, ports[2]) annotation (Line(
      points={{5.55112e-16,10},{8,10},{8,-88},{0,-88},{0,-100}},
      color={0,127,255}));

    connect(hOut_internal,  steBal.hOut);
    connect(XiOut_internal, steBal.XiOut);
    connect(COut_internal,  steBal.COut);
  else
      connect(dynBal.ports, ports) annotation (Line(
      points={{50,-5.55112e-16},{50,-34},{2.22045e-15,-34},{2.22045e-15,-100}},
      color={0,127,255}));

    connect(hOut_internal,  dynBal.hOut);
    connect(XiOut_internal, dynBal.XiOut);
    connect(COut_internal,  dynBal.COut);
  end if;
  // Medium properties
  p = if nPorts > 0 then ports[1].p else p_start;
  T = Medium.temperature_phX(p=p, h=hOut_internal, X=cat(1,Xi,{1-sum(Xi)}));
  Xi = XiOut_internal;
  C = COut_internal;
  // Port properties
  heatPort.T = T;

  annotation (
defaultComponentName="vol",
Documentation(info="<html>
<p>
This is a partial model of an instantaneously mixed volume.
It is used as the base class for all fluid volumes of the package
<a href=\"modelica://AixLib.Fluid.MixingVolumes\">
AixLib.Fluid.MixingVolumes</a>.
</p>
<p>
To increase the numerical robustness of the model, the parameter
<code>prescribedHeatFlowRate</code> can be set by the user.
This parameter only has an effect if the model has exactly two fluid ports connected,
and if it is used as a steady-state model.
Use the following settings:
</p>
<ul>
<li>Set <code>prescribedHeatFlowRate=true</code> if the <i>only</i> means of heat transfer
at the <code>heatPort</code> is a prescribed heat flow rate that
is <i>not</i> a function of the temperature difference
between the medium and an ambient temperature. Examples include an ideal electrical heater,
a pump that rejects heat into the fluid stream, or a chiller that removes heat based on a performance curve.
If the <code>heatPort</code> is not connected, then set <code>prescribedHeatFlowRate=true</code> as
in this case, <code>heatPort.Q_flow=0</code>.
</li>
<li>Set <code>prescribedHeatFlowRate=false</code> if there is heat flow at the <code>heatPort</code>
computed as <i>K * (T-heatPort.T)</i>, for some temperature <i>T</i> and some conductance <i>K</i>,
which may itself be a function of temperature or mass flow rate.<br/>
If there is a combination of <i>K * (T-heatPort.T)</i> and a prescribed heat flow rate,
for example a solar collector that dissipates heat to the ambient and receives heat from
the solar radiation, then set <code>prescribedHeatFlowRate=false</code>.
</li>
</ul>
<h4>Implementation</h4>
<p>
If the model is (i) operated in steady-state,
(ii) has two fluid ports connected, and
(iii) <code>prescribedHeatFlowRate=true</code>, then
the model uses
<a href=\"modelica://AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation\">
AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation</a>
in order to use
the same energy and mass balance implementation as is used as in
steady-state component models.
In this situation, the functions <code>inStream</code> are used for the two
flow directions rather than the function
<code>actualStream</code>, which is less efficient.
However, the use of <code>inStream</code> has the disadvantage
that <code>hOut</code> has to be computed, in
<a href=\"modelica://AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation\">
AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation</a>,
using
</p>
<pre>
if allowFlowReversal then
  hOut = AixLib.Utilities.Math.Functions.spliceFunction(pos=port_b.h_outflow,
                                                           neg=port_a.h_outflow,
                                                           x=port_a.m_flow,
                                                           deltax=m_flow_small/1E3);
else
  hOut = port_b.h_outflow;
end if;
</pre>
<p>
Hence, for <code>allowFlowReversal=true</code>, if <code>hOut</code>
were to be used to compute the temperature that
drives heat transfer such as by conduction,
then the heat transfer would depend on upstream and the <i>downstream</i>
temperatures for small mass flow rates.
This can give wrong results. Consider for example a mass flow rate that is positive
but very close to zero. Suppose the upstream temperature is <i>20</i>&circ;C,
the downstream temperature is <i>10</i>&circ;C, and the heat port is
connected through a heat conductor to a boundary condition of <i>20</i>&circ;C.
Then, <code>hOut = (port_b.h_outflow + port_a.h_outflow)/2</code> and hence
the temperature <code>heatPort.T</code>
is <i>15</i>&circ;C. Therefore, heat is added to the component.
As the mass flow rate is by assumption very small, the fluid that leaves the component
will have a very high temperature, violating the 2nd law.
To avoid this situation, if
<code>prescribedHeatFlowRate=false</code>, then the model
<a href=\"modelica://AixLib.Fluid.Interfaces.ConservationEquation\">
AixLib.Fluid.Interfaces.ConservationEquation</a>
is used instead of
<a href=\"modelica://AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation\">
AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation</a>.
</p>
<p>
For simple models that uses this model, see
<a href=\"modelica://AixLib.Fluid.MixingVolumes\">
AixLib.Fluid.MixingVolumes</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
June 5, 2015, by Michael Wetter:<br/>
Moved assignment of <code>dynBal.U.start</code>
from instance <code>dynBal</code> to the actual model implementation.
This is required for a pedantic model check in Dymola 2016.
It addresses
<a href=\"https://github.com/iea-annex60/modelica-annex60/issues/266\">
issue 266</a>.
</li>
<li>
May 6, 2015, by Michael Wetter:<br/>
Improved documentation and changed the test
<pre>
 final parameter Boolean useSteadyStateTwoPort=(nPorts == 2) and
 prescribedHeatFlowRate and ...
</pre>
to
<pre>
 final parameter Boolean useSteadyStateTwoPort=(nPorts == 2) and
 (prescribedHeatFlowRate or (not allowFlowReversal)) and ...
</pre>
The reason is that if there is no flow reversal, then
<a href=\"modelica://AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation\">
AixLib.Fluid.Interfaces.StaticTwoPortConservationEquation</a>
computes <code>hOut =  port_b.h_outflow;</code>, and hence
it is correct to use <code>hOut</code> to compute
temperature-driven heat flow, such as by conduction or convection.
See also the model documentation.<br/>
This is for issue
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/412\">
#412</a>.
</li>
<li>
February 5, 2015, by Michael Wetter:<br/>
Changed <code>initalize_p</code> from a <code>parameter</code> to a
<code>constant</code>. This is only required in finite volume models
of heat exchangers (to avoid consistent but redundant initial conditions)
and hence it should be set as a <code>constant</code>.
</li>
<li>
October 29, 2014, by Michael Wetter:<br/>
Made assignment of <code>mFactor</code> final, and changed computation of
density to use default medium states as are also used to compute the
specific heat capacity.
</li>
<li>
October 21, 2014, by Filip Jorissen:<br/>
Added parameter <code>mFactor</code> to increase the thermal capacity.
</li>
<li>
July 3, 2014, by Michael Wetter:<br/>
Added parameter <code>initialize_p</code>. This is required
to enable the coil models to initialize the pressure in the first
volume, but not in the downstream volumes. Otherwise,
the initial equations will be overdetermined, but consistent.
This change was done to avoid a long information message that appears
when translating models.
</li>
<li>
May 29, 2014, by Michael Wetter:<br/>
Removed undesirable annotation <code>Evaluate=true</code>.
</li>
<li>
February 11, 2014 by Michael Wetter:<br/>
Removed <code>Q_flow</code> and added <code>QSen_flow</code>.
This was done to clarify what is sensible and total heat flow rate
as part of the correction of issue
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/197\">#197</a>.
</li>
<li>
October 8, 2013 by Michael Wetter:<br/>
Removed propagation of <code>show_V_flow</code>
to instance <code>steBal</code> as it has no longer this parameter.
</li>
<li>
September 13, 2013 by Michael Wetter:<br/>
Renamed <code>rho_nominal</code> to <code>rho_start</code>
because this quantity is computed using start values and not
nominal values.
</li>
<li>
April 18, 2013 by Michael Wetter:<br/>
Removed the check of multiple connections to the same element
of a fluid port, as this check required the use of the deprecated
<code>cardinality</code> function.
</li>
<li>
February 7, 2012 by Michael Wetter:<br/>
Revised base classes for conservation equations in <code>AixLib.Fluid.Interfaces</code>.
</li>
<li>
September 17, 2011 by Michael Wetter:<br/>
Removed instance <code>medium</code> as this is already used in <code>dynBal</code>.
Removing the base properties led to 30% faster computing time for a solar thermal system
that contains many fluid volumes.
</li>
<li>
September 13, 2011 by Michael Wetter:<br/>
Changed in declaration of <code>medium</code> the parameter assignment
<code>preferredMediumStates=true</code> to
<code>preferredMediumStates= not (energyDynamics == Modelica.Fluid.Types.Dynamics.SteadyState)</code>.
Otherwise, for a steady-state model, Dymola 2012 may differentiate the model to obtain <code>T</code>
as a state. See ticket Dynasim #13596.
</li>
<li>
July 26, 2011 by Michael Wetter:<br/>
Revised model to use new declarations from
<a href=\"AixLib.Fluid.Interfaces.LumpedVolumeDeclarations\">
AixLib.Fluid.Interfaces.LumpedVolumeDeclarations</a>.
</li>
<li>
July 14, 2011 by Michael Wetter:<br/>
Added start values for mass and internal energy of dynamic balance
model.
</li>
<li>
May 25, 2011 by Michael Wetter:<br/>
<ul>
<li>
Changed implementation of balance equation. The new implementation uses a different model if
exactly two fluid ports are connected, and in addition, the model is used as a steady-state
component. For this model configuration, the same balance equations are used as were used
for steady-state component models, i.e., instead of <code>actualStream(...)</code>, the
<code>inStream(...)</code> formulation is used.
This changed required the introduction of a new parameter <code>m_flow_nominal</code> which
is used for smoothing in the steady-state balance equations of the model with two fluid ports.
This implementation also simplifies the implementation of
<a href=\"modelica://AixLib.Fluid.MixingVolumes.BaseClasses.PartialMixingVolumeWaterPort\">
AixLib.Fluid.MixingVolumes.BaseClasses.PartialMixingVolumeWaterPort</a>,
which now uses the same equations as this model.
</li>
<li>
Another revision was the removal of the parameter <code>use_HeatTransfer</code> as there is
no noticable overhead in always having the <code>heatPort</code> connector present.
</li>
</ul>
</li>
<li>
July 30, 2010 by Michael Wetter:<br/>
Added nominal value for <code>mC</code> to avoid wrong trajectory
when concentration is around 1E-7.
See also <a href=\"https://trac.modelica.org/Modelica/ticket/393\">
https://trac.modelica.org/Modelica/ticket/393</a>.
</li>
<li>
February 7, 2010 by Michael Wetter:<br/>
Simplified model and its base classes by removing the port data
and the vessel area.
Eliminated the base class <code>PartialLumpedVessel</code>.
</li>
<li>
October 12, 2009 by Michael Wetter:<br/>
Changed base class to
<a href=\"modelica://AixLib.Fluid.MixingVolumes.BaseClasses.ClosedVolume\">
AixLib.Fluid.MixingVolumes.BaseClasses.ClosedVolume</a>.
</li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(
          extent={{-100,98},{100,-102}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,213,255}), Text(
          extent={{-58,14},{58,-18}},
          lineColor={0,0,0},
          textString="V=%V"),         Text(
          extent={{-152,100},{148,140}},
          textString="%name",
          lineColor={0,0,255})}));
end PartialMixingVolume;