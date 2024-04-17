sap.ui.define(["./BaseController","sap/ui/model/json/JSONModel","sap/ui/core/routing/History","../model/formatter","sap/m/MessageBox","sap/m/MessageToast"],function(e,t,n,i,s,o){"use strict";return e.extend("com.nttdata.fiorifreestyleapp.controller.Object",{formatter:i,onInit:function(){var e=new t({busy:true,delay:0,id:""});this.getRouter().getRoute("object").attachPatternMatched(this._onObjectMatched,this);this.setModel(e,"objectView")},onEdit:function(){this.getRouter().navTo("edit",{objectId:this.getView().getBindingContext().getPath().substring("/Products".length)})},onSendEMail:function(){},onDelete:function(){if(!this.oWarningMessageDialog){this.oWarningMessageDialog=new sap.m.Dialog({type:sap.m.DialogType.Message,title:"Delete",state:sap.ui.core.ValueState.Warning,content:new sap.m.Text({text:"Delete this object ("+this.getView().byId("_IDGenTitle1").getText()+")?"}),beginButton:new sap.m.Button({type:sap.m.ButtonType.Emphasized,text:"Delete",press:function(){this.oWarningMessageDialog.close();history.go(-1);var e=this.getView().getBindingContext();e.delete();this.getModel().refresh()}.bind(this)}),endButton:new sap.m.Button({text:"Cancel",press:function(){this.oWarningMessageDialog.close()}.bind(this)})})}this.oWarningMessageDialog.open()},_onObjectMatched:function(e){var t=e.getParameter("arguments").objectId;this.getModel("objectView").setProperty("/id","/Products"+t);this._bindView("/Products"+t)},_bindView:function(e){var t=this.getModel("objectView");this.getView().bindElement({path:e,events:{change:this._onBindingChange.bind(this),dataRequested:function(){t.setProperty("/busy",true)},dataReceived:function(){t.setProperty("/busy",false)}}})},_onBindingChange:function(){var e=this.getView(),t=this.getModel("objectView"),n=e.getElementBinding();if(!n.getBoundContext()){this.getRouter().getTargets().display("objectNotFound");return}var i=this.getResourceBundle(),s=e.getBindingContext().getObject(),o=s.ID,a=s.Products;t.setProperty("/busy",false);t.setProperty("/shareSendEmailSubject",i.getText("shareSendEmailObjectSubject",[o]));t.setProperty("/shareSendEmailMessage",i.getText("shareSendEmailObjectMessage",[a,o,location.href]))}})});