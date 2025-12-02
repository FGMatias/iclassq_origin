Ext.ns('SirepManager');
SirepManager={
		goToComponent:function(actionComponent,title){
			console.log(actionComponent);
			switch (actionComponent) {
			case 'usuarios':				
				var config={
	                 title: title,
	                 autoScroll:true,
	                 width: 800,
	                 id:'winAdminUsuarios',
	                 height: 400,
	                 maximizable:true,
	                 layout: {
					        type: 'vbox',
					        align: 'stretch',    
					        padding: 0
					    },
	                 defaultType: 'container',
	                 bodyStyle:'padding:0px;',
	                 items:[
	                        {
	                        	xtype:'listUsers'
	                        	,id:'listUsers'
	                        	,layout:'fit'	
	                        }
	                        ]
	             };
				SirepManager.begin(config);
				break;
			
					
			case 'roles':
				
				var config={
	                 title: title,
	                 width: 550,
	                 id:'winRoles',
	                 height: 350,
	                 autoScroll:true,
	                 maximizable:true,
	                 layout: {
					        type: 'vbox',
					        align: 'stretch',    
					        padding: 0
					    },
	                 defaultType: 'container',
	                 bodyStyle:'background:#fff;padding:0px;'
	                	 ,items:[
	                        {
	                        	xtype:'listRoles'
	                        	,id:'listRoles'
	                        	,layout:'fit'	
	                        }
	                        ]
	             };
				SirepManager.begin(config);
				break;	
				
				case 'registrodeopciones':
				
				var config={
	                 title: title,
	                 width: 800,
	                 id:'winOpciones',
	                 height: 350,
	                 autoScroll:true,
	                 maximizable:true,
	                 layout: {
					        type: 'vbox',
					        align: 'stretch',    
					        padding: 0
					    },
	                 defaultType: 'container',
	                 bodyStyle:'background:#fff;padding:0px;'
	                	 ,items:[
	                        {
	                        	xtype:'listOpciones'
	                        	,id:'listOpciones'
	                        	,layout:'fit'	
	                        }
	                        ]
	             };
				SirepManager.begin(config);
				break;
				
				case 'opcionesporrol':
				
					  var storetree = Ext.create('Ext.data.TreeStore', {
					        proxy: {
					            type: 'ajax',
					            url: 'rolopciontree.app'
					        },
					        sorters: [{
					            property: 'leaf',
					            direction: 'ASC'
					        }, {
					            property: 'text',
					            direction: 'ASC'
					        }]
					    });
					  
					var config={
		                 title: title,
		                 width: 500,
		                 id:'winRolOpciones',
		                 height:450,
		                 autoScroll:true,
		                 maximizable:true,
		                 layout: {
						        type: 'vbox',
						        align: 'stretch',    
						        padding: 0
						    },
		                 defaultType: 'container',
		                 bodyStyle:'background:#fff;padding:0px;'
		                	 ,items:[
										Ext.create('Ext.tree.Panel', {
										    store: storetree,
										    rootVisible: false,
										    border:false,
										    buscarAllParents:function(parentNode,checked){
										    	var me=this;
										    	parentNode.set('checked', checked);
										    	
										    	if(parentNode.parentNode){
										    		me.buscarAllParents(parentNode.parentNode,checked);
										    	}
										    	
										    },
										    useArrows: true,
										    id:'tree',
											listeners : {
												'checkchange' : function(node, checked) {
													var me=this;
													var parentNode=node.parentNode;
													
													
													if(checked){
														me.buscarAllParents(parentNode,checked);
													}else{
														//console.log(parentNode);
														if(parentNode){
															//node.cascadeBy(function(n){n.set('checked', checked);} );
															var c=0;
															Ext.each(parentNode.childNodes,function(item){
																
																if(item.data.checked){
																	c++;
																}
															});
															
															if(c==0){
																parentNode.set('checked', false);
															}
															
														}
														//me.buscarAllParents(parentNode,checked);
													}
													
													node.cascadeBy(function(n){n.set('checked', checked);} );
													
												}},
										    dockedItems: [{
										        xtype: 'toolbar',
										        items:[ {
										            text: 'Grabar',
										            iconCls:'save_16',
										            id:'btnGrabarRolOpcion',
										            disabled:true,
										            handler: function(){
										            	var tree=Ext.getCmp('tree');
										                var records = tree.getView().getChecked();
										                var param=new Object();
										                param['iRolId']=Ext.getCmp('iRolIdCbx').getValue();
										                Ext.Array.each(records, function(rec,i){
										                	if(rec.raw.idOpcion){
										                		param['opcionesPorRol['+i+'].iRolxopcionOpcionId']=rec.raw.idOpcion;
										                	}
										                });
										                console.log(param);
										                
										                Ext.getCmp('winRolOpciones').body.mask('Espere un momento por favor.');
									            		  new Util.Ajax.runAjax({
									          				url : 'insertopcionxrol.app',
									          				method : 'POST',
									          				async : true,
									          				params : param
									          				,success:function(result){
									          					var response=Ext.decode(result.responseText);
									          					Ext.getCmp('winRolOpciones').body.unmask();
									          					if(response.success){
									          						var msg=response.message;
									          						Util.UiMessageBox({msg:msg,title:'Mensaje'});
									          					}else{
									          						Util.UiMessageBox({msg:response.message,title:'Error',iconClsAceptar:'cancel_24'});
									          					}
									          				}
									          			});
										                
										            }
										        },
										        '->'
										        ,
										        {
													xtype : 'ComboCustomized',
													parametros : {
														url : 'findallrol.app',
														params : {
														},
														record : {
															fields : [
																	{name : "iRolId"},
																	{name : "vRolNombre"}
															]
														}
													},
													displayField : 'vRolNombre',
													forceSelection : true,
													valueField : 'iRolId',
													id:'iRolIdCbx',
													width:250,
													enableKeyEvents : true,
													blankText : 'Seleccione un Rol',
													queryMode : 'local',
													listeners : {
														select : function(field,record,c) {
															Ext.getCmp('btnGrabarRolOpcion').setDisabled(false);
															var tree=Ext.getCmp('tree');
															tree.store.load({params:{idRol:field.getValue()}});
														},
														change:function(field){
															if(!field.getValue()){
																Ext.getCmp('btnGrabarRolOpcion').setDisabled(true);
															}else{
																Ext.getCmp('btnGrabarRolOpcion').setDisabled(false);
															}
														}
													},
													listConfig : {
														getInnerTpl : function() {
															return '<div style="padding:2px;">{vRolNombre}</div>';
														}
													}
										        	
										        }
										        ]
										    }]
										})
		                        ]
		             };
					SirepManager.begin(config);
					break;
					
					
				case 'gom':				
					var config={
		                 title: title,
		                 autoScroll:true,
		                 width: 800,
		                 id:'winAdminGom',
		                 height: 400,
		                 maximizable:true,
		                 layout: {
						        type: 'vbox',
						        align: 'stretch',    
						        padding: 0
						    },
		                 defaultType: 'container',
		                 bodyStyle:'padding:0px;',
		                 items:[
		                        {
		                        	xtype:'listGom'
		                        	,id:'listGom'
		                        	,layout:'fit'	
		                        }
		                        ]
		             };
					SirepManager.begin(config);
					break;
			default:
				break;
			}
			
		}
	,
	begin : function(config) {
		if (Ext.getCmp(config.id)) {
			Ext.getCmp(config.id).show();
		} else {
			var idBoton = Ext.id();
			config.animateTarget = idBoton;
			var btn = {
				xtype : 'button',
				text : config.title,
				id : idBoton,
				scale : 'medium',
				iconCls : 'iconWin24',
				handler : function() {
					Ext.getCmp(config.id).show();
				},
				listeners : {
					afterrender : function() {
						Ext.get(this.id).on('contextmenu',
										function(e, b) {
											e.preventDefault();
											var contextMenu = new Ext.menu.Menu(
													{
														items : [
																{
																	text : 'Restaurar',
																	handler : function() {
																		Ext.getCmp(config.id).show();
																	}
																},
																{
																	text : 'Minimizar',
																	handler : function() {
																		Ext.getCmp(config.id).hide();
																	}
																},
																{
																	text : 'Cerrar',
																	handler : function() {
																		Ext.getCmp(config.id).close();
																	}
																} ]
													});

											contextMenu.showAt(e.getPageX(), e.getPageY() - 65);

										});
					}
				}
			}

			Ext.getCmp(APP_ID_SIREP_JS + '_buttomBar').insert(0, btn);

			var elementWindow = Ext.widget('sirepWindow', config);

			elementWindow.on('beforeclose', function(panel, eOpts) {
				Ext.getCmp(idBoton).destroy();

			});

			elementWindow.on('minimize', function(thisWin, eOpts) {
				thisWin.hide();
			});

			elementWindow.show();
		}

	}

};
