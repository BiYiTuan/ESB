/**
 * ProcessManagementPortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.apache.www.ode.pmapi;

public interface ProcessManagementPortType extends java.rmi.Remote {
    public org.apache.www.ode.pmapi.types.TProcessInfo[] listProcesses(java.lang.String filter, java.lang.String orderKeys) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo[] listAllProcesses() throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo[] listProcessesCustom(java.lang.String filter, java.lang.String orderKeys, java.lang.String customizer) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo getProcessInfo(javax.xml.namespace.QName pid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo getProcessInfoCustom(javax.xml.namespace.QName pid, java.lang.String customizer) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo setProcessProperty(javax.xml.namespace.QName pid, javax.xml.namespace.QName propertyName, java.lang.String propertyValue) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo setProcessPropertyNode(javax.xml.namespace.QName pid, javax.xml.namespace.QName propertyName, java.lang.Object propertyValue) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo getExtensibilityElements(javax.xml.namespace.QName pid, org.apache.www.ode.pmapi.AidsType aids) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo activate(javax.xml.namespace.QName pid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
    public org.apache.www.ode.pmapi.types.TProcessInfo setRetired(javax.xml.namespace.QName pid, boolean retired) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault;
}
