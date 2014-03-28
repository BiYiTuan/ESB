package eab.proxy.test;

import java.rmi.RemoteException;

import org.apache.axis.message.MessageElement;
import org.apache.www.ode.pmapi.InstanceManagementPortTypeProxy;
import org.apache.www.ode.pmapi.ManagementFault;
import org.apache.www.ode.pmapi.types.TInstanceInfo;
import org.apache.www.ode.pmapi.types.TInstanceStatus;
import org.apache.www.ode.pmapi.types.TScopeInfo;
import org.apache.www.ode.pmapi.types.TScopeRef;
import org.apache.www.ode.pmapi.types.TVariableInfo;
import org.apache.www.ode.pmapi.types.TVariableInfoValue;
import org.apache.www.ode.pmapi.types.TVariableRef;

public class TestMain {

	public static void MonitorScope(InstanceManagementPortTypeProxy proxy,
			TScopeRef tRef) {
		TScopeInfo tInfo;
		try {
			tInfo = proxy.getScopeInfo(Long.parseLong(tRef.getSiid()));
			if (tInfo == null)
				return;

			System.out.println(tInfo.getName() + ":\t"
					+ tInfo.getStatus().toString());

			for (TScopeRef tChildRef : tInfo.getChildren()) {
				MonitorScope(proxy, tChildRef);
			}
		} catch (ManagementFault e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public static void TraceScope(InstanceManagementPortTypeProxy proxy,
			TScopeRef tRef) {
		try {
			TScopeInfo tInfo = proxy.getScopeInfo(Long
					.parseLong(tRef.getSiid()));
			if (tInfo == null)
				return;

			System.out.println(tInfo.getName() + ":\t"
					+ tInfo.getStatus().toString());

			for (TVariableRef tvr : tInfo.getVariables()) {
				TVariableInfo tvi = proxy.getVariableInfo(tInfo.getSiid(), tvr
						.getName());
				TVariableInfoValue tvivInfoValue = tvi.getValue();
				if (tvivInfoValue == null)
					continue;
				MessageElement[] vi = tvivInfoValue.get_any();
				for (MessageElement messageElement : vi) {
					try {
						MessageElement cdElement = (MessageElement)messageElement.getChildren().get(0);
						cdElement = (MessageElement)cdElement.getChildren().get(0);
						System.out.println(cdElement.getAsString());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

			for (TScopeRef tChildRef : tInfo.getChildren()) {
				TraceScope(proxy, tChildRef);
			}
		} catch (ManagementFault e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		InstanceManagementPortTypeProxy proxy = new InstanceManagementPortTypeProxy(
				"http://172.19.52.164:807/Workflow/InstanceManagement/");
		// ProcessManagementPortTypeProxy proxy2 = new
		// ProcessManagementPortTypeProxy
		// ("http://172.19.52.164:807/Workflow/ProcessManagement/");

		// String mm = proxy.getEndpoint();

		try {
			// TProcessInfo[] ins = proxy2.listAllProcesses();
			TInstanceInfo[] info2 = proxy.listAllInstancesWithLimit(100);
//			TInstanceInfo[] info2 = proxy.listAllInstances();

			for (TInstanceInfo tInfo : info2) {
				TInstanceInfo tDetail = proxy.getInstanceInfo(Long
						.valueOf(tInfo.getIid()));
				TScopeRef ref = tDetail.getRootScope();
				TraceScope(proxy, ref);
			}

			long iid = Long.valueOf(info2[info2.length - 1].getIid());
			TInstanceInfo tMonitor = proxy.getInstanceInfo(iid);
			while (tMonitor.getStatus() == TInstanceStatus.ACTIVE) {
				MonitorScope(proxy, tMonitor.getRootScope());
				try {
					Thread.sleep(5000);
					tMonitor = proxy.getInstanceInfo(iid);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		} catch (ManagementFault e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}

}
