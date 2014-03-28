/**
 * InstanceManagementBindingStub.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package org.apache.www.ode.pmapi;

public class InstanceManagementBindingStub extends org.apache.axis.client.Stub implements org.apache.www.ode.pmapi.InstanceManagementPortType {
    private java.util.Vector cachedSerClasses = new java.util.Vector();
    private java.util.Vector cachedSerQNames = new java.util.Vector();
    private java.util.Vector cachedSerFactories = new java.util.Vector();
    private java.util.Vector cachedDeserFactories = new java.util.Vector();

    static org.apache.axis.description.OperationDesc [] _operations;

    static {
        _operations = new org.apache.axis.description.OperationDesc[16];
        _initOperationDesc1();
        _initOperationDesc2();
    }

    private static void _initOperationDesc1(){
        org.apache.axis.description.OperationDesc oper;
        org.apache.axis.description.ParameterDesc param;
        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("listInstances");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "filter"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "order"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "limit"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"), int.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfoList"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo[].class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info-list"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[0] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("queryInstances");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "payload"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfoList"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo[].class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info-list"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[1] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("listAllInstances");
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfoList"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo[].class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info-list"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[2] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("listAllInstancesWithLimit");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "payload"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"), int.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfoList"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo[].class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info-list"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[3] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("getInstanceInfo");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "iid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[4] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("getScopeInfo");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "siid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tScopeInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TScopeInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "scope-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[5] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("getScopeInfoWithActivity");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "sid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "activityInfo"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"), boolean.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tScopeInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TScopeInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "scope-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[6] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("getVariableInfo");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "sid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "varName"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tVariableInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TVariableInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "scope-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[7] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("listEvents");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "instanceFilter"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "eventFilter"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "maxCount"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"), int.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tEventInfoList"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TEventInfo[].class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "bpel-event-list"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[8] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("getEventTimeline");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "instanceFilter"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "eventFilter"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "listType"));
        oper.setReturnClass(org.apache.www.ode.pmapi.ListType.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "dates"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[9] = oper;

    }

    private static void _initOperationDesc2(){
        org.apache.axis.description.OperationDesc oper;
        org.apache.axis.description.ParameterDesc param;
        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("suspend");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "iid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[10] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("resume");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "iid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[11] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("terminate");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "iid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[12] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("fault");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "iid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[13] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("delete");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "filter"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "listType"));
        oper.setReturnClass(org.apache.www.ode.pmapi.ListType.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "list"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[14] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("recoverActivity");
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "iid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "aid"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"), long.class, false, false);
        oper.addParameter(param);
        param = new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "action"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false);
        oper.addParameter(param);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfo"));
        oper.setReturnClass(org.apache.www.ode.pmapi.types.TInstanceInfo.class);
        oper.setReturnQName(new javax.xml.namespace.QName("", "instance-info"));
        oper.setStyle(org.apache.axis.constants.Style.RPC);
        oper.setUse(org.apache.axis.constants.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "ManagementFault"),
                      "org.apache.www.ode.pmapi.ManagementFault",
                      new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), 
                      false
                     ));
        _operations[15] = oper;

    }

    public InstanceManagementBindingStub() throws org.apache.axis.AxisFault {
         this(null);
    }

    public InstanceManagementBindingStub(java.net.URL endpointURL, javax.xml.rpc.Service service) throws org.apache.axis.AxisFault {
         this(service);
         super.cachedEndpoint = endpointURL;
    }

    public InstanceManagementBindingStub(javax.xml.rpc.Service service) throws org.apache.axis.AxisFault {
        if (service == null) {
            super.service = new org.apache.axis.client.Service();
        } else {
            super.service = service;
        }
        ((org.apache.axis.client.Service)super.service).setTypeMappingVersion("1.2");
            java.lang.Class cls;
            javax.xml.namespace.QName qName;
            javax.xml.namespace.QName qName2;
            java.lang.Class beansf = org.apache.axis.encoding.ser.BeanSerializerFactory.class;
            java.lang.Class beandf = org.apache.axis.encoding.ser.BeanDeserializerFactory.class;
            java.lang.Class enumsf = org.apache.axis.encoding.ser.EnumSerializerFactory.class;
            java.lang.Class enumdf = org.apache.axis.encoding.ser.EnumDeserializerFactory.class;
            java.lang.Class arraysf = org.apache.axis.encoding.ser.ArraySerializerFactory.class;
            java.lang.Class arraydf = org.apache.axis.encoding.ser.ArrayDeserializerFactory.class;
            java.lang.Class simplesf = org.apache.axis.encoding.ser.SimpleSerializerFactory.class;
            java.lang.Class simpledf = org.apache.axis.encoding.ser.SimpleDeserializerFactory.class;
            java.lang.Class simplelistsf = org.apache.axis.encoding.ser.SimpleListSerializerFactory.class;
            java.lang.Class simplelistdf = org.apache.axis.encoding.ser.SimpleListDeserializerFactory.class;
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">>tScopeInfo>correlation-sets>correlation-set");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TCorrelationProperty[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tCorrelationProperty");
            qName2 = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "correlation-property");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tEndpointReferences>endpoint-ref");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TEndpointReferencesEndpointRef.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tFaultInfo>data");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TFaultInfoData.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tInstanceInfo>correlation-properties");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TCorrelationProperty[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tCorrelationProperty");
            qName2 = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "correlation-property");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tInstanceInfo>event-info");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TInstanceInfoEventInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tInstanceSummary>instances");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TInstanceSummaryInstances.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tProcessInfo>documents");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TDocumentInfo[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tDocumentInfo");
            qName2 = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "document");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tProcessProperties>property");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TProcessPropertiesProperty.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tScopeInfo>activities");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TActivityInfo[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "activity-info");
            qName2 = null;
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tScopeInfo>children");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TScopeRef[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tScopeRef");
            qName2 = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "child-ref");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tScopeInfo>correlation-sets");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TCorrelationProperty[][].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">>tScopeInfo>correlation-sets>correlation-set");
            qName2 = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "correlation-set");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tScopeInfo>variables");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TVariableRef[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tVariableRef");
            qName2 = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "variable-ref");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tVariableInfo>value");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TVariableInfoValue.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tActivityExtInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TActivityExtInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tActivityInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TActivityInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tActivityStatus");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TActivityStatus.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(enumsf);
            cachedDeserFactories.add(enumdf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tActivitytExtInfoList");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TActivityExtInfo[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "activity-ext-info");
            qName2 = null;
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tCorrelationProperty");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TCorrelationProperty.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(org.apache.axis.encoding.ser.BaseSerializerFactory.createFactory(org.apache.axis.encoding.ser.SimpleSerializerFactory.class, cls, qName));
            cachedDeserFactories.add(org.apache.axis.encoding.ser.BaseDeserializerFactory.createFactory(org.apache.axis.encoding.ser.SimpleDeserializerFactory.class, cls, qName));

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tDefinitionInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TDefinitionInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tDeploymentInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TDeploymentInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tDocumentInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TDocumentInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tEndpointReferences");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TEndpointReferencesEndpointRef[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tEndpointReferences>endpoint-ref");
            qName2 = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "endpoint-ref");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tEventInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TEventInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tEventInfoList");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TEventInfo[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "event-info");
            qName2 = null;
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tFailureInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TFailureInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tFailuresInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TFailuresInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tFaultInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TFaultInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TInstanceInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceInfoList");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TInstanceInfo[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "instance-info");
            qName2 = null;
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceStatus");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TInstanceStatus.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(enumsf);
            cachedDeserFactories.add(enumdf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tInstanceSummary");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TInstanceSummary.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tProcessInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TProcessInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tProcessInfoList");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TProcessInfo[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "process-info");
            qName2 = null;
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tProcessProperties");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TProcessPropertiesProperty[].class;
            cachedSerClasses.add(cls);
            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", ">tProcessProperties>property");
            qName2 = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "property");
            cachedSerFactories.add(new org.apache.axis.encoding.ser.ArraySerializerFactory(qName, qName2));
            cachedDeserFactories.add(new org.apache.axis.encoding.ser.ArrayDeserializerFactory());

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tProcessStatus");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TProcessStatus.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(enumsf);
            cachedDeserFactories.add(enumdf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tScopeInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TScopeInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tScopeRef");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TScopeRef.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tScopeStatus");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TScopeStatus.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(enumsf);
            cachedDeserFactories.add(enumdf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tVariableInfo");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TVariableInfo.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi/types/2006/08/02/", "tVariableRef");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.types.TVariableRef.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "aidsType");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.AidsType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "listType");
            cachedSerQNames.add(qName);
            cls = org.apache.www.ode.pmapi.ListType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

    }

    protected org.apache.axis.client.Call createCall() throws java.rmi.RemoteException {
        try {
            org.apache.axis.client.Call _call = super._createCall();
            if (super.maintainSessionSet) {
                _call.setMaintainSession(super.maintainSession);
            }
            if (super.cachedUsername != null) {
                _call.setUsername(super.cachedUsername);
            }
            if (super.cachedPassword != null) {
                _call.setPassword(super.cachedPassword);
            }
            if (super.cachedEndpoint != null) {
                _call.setTargetEndpointAddress(super.cachedEndpoint);
            }
            if (super.cachedTimeout != null) {
                _call.setTimeout(super.cachedTimeout);
            }
            if (super.cachedPortName != null) {
                _call.setPortName(super.cachedPortName);
            }
            java.util.Enumeration keys = super.cachedProperties.keys();
            while (keys.hasMoreElements()) {
                java.lang.String key = (java.lang.String) keys.nextElement();
                _call.setProperty(key, super.cachedProperties.get(key));
            }
            // All the type mapping information is registered
            // when the first call is made.
            // The type mapping information is actually registered in
            // the TypeMappingRegistry of the service, which
            // is the reason why registration is only needed for the first call.
            synchronized (this) {
                if (firstCall()) {
                    // must set encoding style before registering serializers
                    _call.setEncodingStyle(null);
                    for (int i = 0; i < cachedSerFactories.size(); ++i) {
                        java.lang.Class cls = (java.lang.Class) cachedSerClasses.get(i);
                        javax.xml.namespace.QName qName =
                                (javax.xml.namespace.QName) cachedSerQNames.get(i);
                        java.lang.Object x = cachedSerFactories.get(i);
                        if (x instanceof Class) {
                            java.lang.Class sf = (java.lang.Class)
                                 cachedSerFactories.get(i);
                            java.lang.Class df = (java.lang.Class)
                                 cachedDeserFactories.get(i);
                            _call.registerTypeMapping(cls, qName, sf, df, false);
                        }
                        else if (x instanceof javax.xml.rpc.encoding.SerializerFactory) {
                            org.apache.axis.encoding.SerializerFactory sf = (org.apache.axis.encoding.SerializerFactory)
                                 cachedSerFactories.get(i);
                            org.apache.axis.encoding.DeserializerFactory df = (org.apache.axis.encoding.DeserializerFactory)
                                 cachedDeserFactories.get(i);
                            _call.registerTypeMapping(cls, qName, sf, df, false);
                        }
                    }
                }
            }
            return _call;
        }
        catch (java.lang.Throwable _t) {
            throw new org.apache.axis.AxisFault("Failure trying to get the Call object", _t);
        }
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo[] listInstances(java.lang.String filter, java.lang.String order, int limit) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[0]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "listInstances"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {filter, order, new java.lang.Integer(limit)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo[]) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo[]) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo[].class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo[] queryInstances(java.lang.String payload) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[1]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "queryInstances"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {payload});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo[]) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo[]) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo[].class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo[] listAllInstances() throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[2]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "listAllInstances"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo[]) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo[]) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo[].class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo[] listAllInstancesWithLimit(int payload) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[3]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "listAllInstancesWithLimit"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Integer(payload)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo[]) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo[]) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo[].class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo getInstanceInfo(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[4]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "getInstanceInfo"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Long(iid)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TScopeInfo getScopeInfo(long siid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[5]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "getScopeInfo"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Long(siid)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TScopeInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TScopeInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TScopeInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TScopeInfo getScopeInfoWithActivity(long sid, boolean activityInfo) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[6]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "getScopeInfoWithActivity"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Long(sid), new java.lang.Boolean(activityInfo)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TScopeInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TScopeInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TScopeInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TVariableInfo getVariableInfo(java.lang.String sid, java.lang.String varName) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[7]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "getVariableInfo"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {sid, varName});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TVariableInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TVariableInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TVariableInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TEventInfo[] listEvents(java.lang.String instanceFilter, java.lang.String eventFilter, int maxCount) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[8]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "listEvents"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {instanceFilter, eventFilter, new java.lang.Integer(maxCount)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TEventInfo[]) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TEventInfo[]) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TEventInfo[].class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.ListType getEventTimeline(java.lang.String instanceFilter, java.lang.String eventFilter) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[9]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "getEventTimeline"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {instanceFilter, eventFilter});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.ListType) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.ListType) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.ListType.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo suspend(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[10]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "suspend"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Long(iid)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo resume(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[11]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "resume"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Long(iid)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo terminate(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[12]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "terminate"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Long(iid)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo fault(long iid) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[13]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "fault"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Long(iid)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.ListType delete(java.lang.String filter) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[14]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "delete"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {filter});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.ListType) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.ListType) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.ListType.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

    public org.apache.www.ode.pmapi.types.TInstanceInfo recoverActivity(long iid, long aid, java.lang.String action) throws java.rmi.RemoteException, org.apache.www.ode.pmapi.ManagementFault {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[15]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.apache.org/ode/pmapi", "recoverActivity"));

        setRequestHeaders(_call);
        setAttachments(_call);
 try {        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {new java.lang.Long(iid), new java.lang.Long(aid), action});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.apache.www.ode.pmapi.types.TInstanceInfo) org.apache.axis.utils.JavaUtils.convert(_resp, org.apache.www.ode.pmapi.types.TInstanceInfo.class);
            }
        }
  } catch (org.apache.axis.AxisFault axisFaultException) {
    if (axisFaultException.detail != null) {
        if (axisFaultException.detail instanceof java.rmi.RemoteException) {
              throw (java.rmi.RemoteException) axisFaultException.detail;
         }
        if (axisFaultException.detail instanceof org.apache.www.ode.pmapi.ManagementFault) {
              throw (org.apache.www.ode.pmapi.ManagementFault) axisFaultException.detail;
         }
   }
  throw axisFaultException;
}
    }

}
