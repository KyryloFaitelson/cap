sap.ui.define(["./BaseController","sap/ui/model/json/JSONModel","sap/ui/core/routing/History","../model/formatter","sap/m/MessageBox","sap/m/MessageToast"],function(e,t,i,o,r,s){"use strict";return e.extend("com.nttdata.fiorifreestyleapp.controller.Create",{formatter:o,onInit:function(){var e=new t({busy:true,delay:0,id:""});this.getRouter().getRoute("create").attachPatternMatched(this._onObjectMatched,this);this.setModel(e,"createView");var i=this.getView().byId("ObjectPageLayout"),o=i.getShowFooter();i.setShowFooter(!o)},_onObjectMatched:function(e){var t=e.getParameter("arguments").objectId;this.getModel("createView").setProperty("/id","/Products"+t);this._bindView("/Products"+t)},_bindView:function(e){var t=this.getModel("createView");this.getView().bindElement({path:e,events:{change:this._onBindingChange.bind(this),dataRequested:function(){t.setProperty("/busy",true)},dataReceived:function(){t.setProperty("/busy",false)}}})},_onBindingChange:function(){var e=this.getView(),t=this.getModel("createView"),i=e.getElementBinding();if(!i.getBoundContext()){this.getRouter().getTargets().display("objectNotFound");return}var o=this.getResourceBundle(),r=e.getBindingContext().getObject(),s=r.ID,a=r.Products;t.setProperty("/busy",false);t.setProperty("/shareSendEmailSubject",o.getText("shareSendEmailObjectSubject",[s]));t.setProperty("/shareSendEmailMessage",o.getText("shareSendEmailObjectMessage",[a,s,location.href]))}})});