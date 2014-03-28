/**
 * InstanceManagementPortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.apache.www.ode.pmapi;

public interface InstanceManagementPortType extends java.rmi.Remote {
    public org.apache.www.ode.pmapi.types.TInstanceInfo[] listInstances(java.lang.String filter, java.lang.String order, int limit) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo[] queryInstances(java.lang.String payload) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo[] listAllInstances() throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo[] listAllInstancesWithLimit(int payload) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo getInstanceInfo(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TScopeInfo getScopeInfo(long siid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TScopeInfo getScopeInfoWithActivity(long sid, boolean activityInfo) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TVariableInfo getVariableInfo(java.lang.String sid, java.lang.String varName) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TEventInfo[] listEvents(java.lang.String instanceFilter, java.lang.String eventFilter, int maxCount) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.ListType getEventTimeline(java.lang.String instanceFilter, java.lang.String eventFilter) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo suspend(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo resume(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo terminate(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo fault(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.ListType delete(java.lang.String filter) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TInstanceInfo recoverActivity(long iid, long aid, java.lang.String action) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
}
