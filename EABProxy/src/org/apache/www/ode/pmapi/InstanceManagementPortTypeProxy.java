package org.apache.www.ode.pmapi;

public class InstanceManagementPortTypeProxy implements
		org.apache.www.ode.pmapi.InstanceManagementPortType {
	private String _endpoint = null;
	private org.apache.www.ode.pmapi.InstanceManagementPortType instanceManagementPortType = null;

	public InstanceManagementPortTypeProxy() {
		_initInstanceManagementPortTypeProxy();
	}

	public InstanceManagementPortTypeProxy(String endpoint) {
		_endpoint = endpoint;
		_initInstanceManagementPortTypeProxy();
	}

	private void _initInstanceManagementPortTypeProxy() {
		try {
			instanceManagementPortType = (new org.apache.www.ode.pmapi.InstanceManagementServiceLocator())
					.getInstanceManagementPort();
			if (instanceManagementPortType != null) {
				if (_endpoint != null)
					((javax.xml.rpc.Stub) instanceManagementPortType)
							._setProperty(
									"javax.xml.rpc.service.endpoint.address",
									_endpoint);
				else
					_endpoint = (String) ((javax.xml.rpc.Stub) instanceManagementPortType)
							._getProperty("javax.xml.rpc.service.endpoint.address");
			}

		} catch (javax.xml.rpc.ServiceException serviceException) {
		}
	}

	public String getEndpoint() {
		return _endpoint;
	}

	public void setEndpoint(String endpoint) {
		_endpoint = endpoint;
		if (instanceManagementPortType != null)
			((javax.xml.rpc.Stub) instanceManagementPortType)._setProperty(
					"javax.xml.rpc.service.endpoint.address", _endpoint);

	}

	public org.apache.www.ode.pmapi.InstanceManagementPortType getInstanceManagementPortType() {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType;
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo[] listInstances(
			java.lang.String filter, java.lang.String order, int limit)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.listInstances(filter, order, limit);
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo[] queryInstances(
			java.lang.String payload) throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.queryInstances(payload);
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo[] listAllInstances()
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.listAllInstances();
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo[] listAllInstancesWithLimit(
			int payload) throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.listAllInstancesWithLimit(payload);
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo getInstanceInfo(long iid)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.getInstanceInfo(iid);
	}

	public org.apache.www.ode.pmapi.types.TScopeInfo getScopeInfo(long siid)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.getScopeInfo(siid);
	}

	public org.apache.www.ode.pmapi.types.TScopeInfo getScopeInfoWithActivity(
			long sid, boolean activityInfo) throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.getScopeInfoWithActivity(sid,
				activityInfo);
	}

	public org.apache.www.ode.pmapi.types.TVariableInfo getVariableInfo(
			java.lang.String sid, java.lang.String varName)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.getVariableInfo(sid, varName);
	}

	public org.apache.www.ode.pmapi.types.TEventInfo[] listEvents(
			java.lang.String instanceFilter, java.lang.String eventFilter,
			int maxCount) throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.listEvents(instanceFilter,
				eventFilter, maxCount);
	}

	public org.apache.www.ode.pmapi.ListType getEventTimeline(
			java.lang.String instanceFilter, java.lang.String eventFilter)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.getEventTimeline(instanceFilter,
				eventFilter);
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo suspend(long iid)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.suspend(iid);
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo resume(long iid)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.resume(iid);
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo terminate(long iid)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.terminate(iid);
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo fault(long iid)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.fault(iid);
	}

	public org.apache.www.ode.pmapi.ListType delete(java.lang.String filter)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.delete(filter);
	}

	public org.apache.www.ode.pmapi.types.TInstanceInfo recoverActivity(
			long iid, long aid, java.lang.String action)
			throws java.rmi.RemoteException,
			org.apache.www.ode.pmapi.ManagementFault {
		if (instanceManagementPortType == null)
			_initInstanceManagementPortTypeProxy();
		return instanceManagementPortType.recoverActivity(iid, aid, action);
	}

}